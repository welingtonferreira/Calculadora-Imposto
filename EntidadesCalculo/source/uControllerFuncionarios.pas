unit uControllerFuncionarios;

interface

Uses uFuncionarios, uPersistFuncionarios, System.Classes, SysUtils, Data.DBXCommon, Vcl.Dialogs;

Type
  TFuncionarioController = class
  private
    FFuncionario : TFuncionario;
    FDGRSQLConnection: TDGRSQLConnection;
    function GetFuncionario: TFuncionario;
    procedure PopulateFK(const pIDFuncionario: Integer);
  public
    constructor Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
    destructor Destroy; override;
    procedure LoadFuncionarioByID(const pID: Integer);
    property Funcionario: TFuncionario read GetFuncionario;
    function Save: integer;
    procedure CancelEdit;
    function LoadByIdFuncionario(const pIdFuncionario: Integer): Boolean;
    function LoadByNomeFuncionario(const pNomeFuncionario: String): Boolean;
  end;

implementation


{ TFuncionarioController }

procedure TFuncionarioController.CancelEdit;
begin
  try
    Self.FFuncionario.Cancel;
    Self.FFuncionario.CancelUpdates;
    Self.FFuncionario.Dependentes.Cancel;
    Self.FFuncionario.Dependentes.CancelUpdates;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.CancelEdit' + #13 + E.Message);
    end;
  end;
end;

constructor TFuncionarioController.Create(AOwner: TComponent; aSQLConnection: TDGRSQLConnection);
begin
  try
    Self.FFuncionario := TFuncionario.Create(AOwner, aSQLConnection);
    Self.FDGRSQLConnection := aSQLConnection;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.Create' + #13 + E.Message);
    end;
  end;
end;

destructor TFuncionarioController.Destroy;
begin
  try
    FreeAndNil(Self.FFuncionario);
    inherited;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.Destroy' + #13 + E.Message);
    end;
  end;
end;

function TFuncionarioController.GetFuncionario: TFuncionario;
begin
  try
    Result := Self.FFuncionario;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.GetFuncionario' + #13 + E.Message);
    end;
  end;
end;

function TFuncionarioController.LoadByIdFuncionario(const pIdFuncionario: Integer): Boolean;
begin
  try
    Result := Self.FFuncionario.LoadById(pIdFuncionario);
    if (Result) then
    begin
      Self.FFuncionario.Dependentes.LoadByIdFuncionario(pIdFuncionario);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.LoadByIdFuncionario' + #13 + E.Message);
    end;
  end;
end;

//
function TFuncionarioController.LoadByNomeFuncionario(const pNomeFuncionario: String): Boolean;
begin
  try
    Result := Self.FFuncionario.LoadByNome(pNomeFuncionario);
    if (Result) then
    begin
      Self.FFuncionario.Dependentes.LoadByNomeFuncionario(pNomeFuncionario);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.LoadByNomeFuncionario' + #13 + E.Message);
    end;
  end;
end;

procedure TFuncionarioController.LoadFuncionarioByID(const pID: Integer);
begin
  try
    Self.FFuncionario.LoadById(pID);
    Self.FFuncionario.Dependentes.LoadByIdFuncionario(pID);
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.LoadFuncionarioByID' + #13 + E.Message);
    end;
  end;
end;

procedure TFuncionarioController.PopulateFK(const pIDFuncionario: Integer);
begin
  try
    Self.FFuncionario.Dependentes.First;
    while (not Self.FFuncionario.Dependentes.Eof) do
    begin
      Self.FFuncionario.Dependentes.IDFuncionario := pIDFuncionario;
      Self.FFuncionario.Dependentes.Next;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.PopulateFK' + #13 + E.Message);
    end;
  end;
end;

function TFuncionarioController.Save: Integer;
var
  vTransaction: TDBXTransaction;
begin
  try
    vTransaction := Self.FDGRSQLConnection.BeginTransaction;
    try
      Self.PopulateFK(Self.FFuncionario.ID);
      Result := Self.FFuncionario.ApplyUpdates(0);
      Result := Result + Self.FFuncionario.Dependentes.ApplyUpdates(0);
      Self.FDGRSQLConnection.CommitFreeAndNil(vTransaction);
    except
      on E: Exception do
      begin
        Self.FDGRSQLConnection.RollbackIncompleteFreeAndNil(vTransaction);
        Raise;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionarioController.Save' + #13 + E.Message);
    end;
  end;
end;

end.
