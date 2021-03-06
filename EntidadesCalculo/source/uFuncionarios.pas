unit uFuncionarios;

interface

Uses uPersistFuncionarios, System.Classes, LibUtils, SysUtils, Vcl.Dialogs;

type
  TDependente = class(TDGRSimpleDataSet)
  private
    function GetIsCalculaINSS: Boolean;
    function GetIsCalculaIR: Boolean;
    function GetNome: String;
    procedure SetIsCalculaINSS(const pValue: Boolean);
    procedure SetIsCalculaIR(const pValue: Boolean);
    procedure SetNome(const pValue: String);
    function GetIdFuncionario: Integer;
    procedure SetIdFuncionario(const pValue: Integer);
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    procedure LoadByIdFuncionario(const pIdFuncionario: Integer);
    procedure LoadByNomeFuncionario(const pNomeFuncionario: String);
    property Nome: string read GetNome write SetNome;
    property IsCalculaIR: boolean read GetIsCalculaIR write SetIsCalculaIR;
    property IsCalculaINSS: boolean read GetIsCalculaINSS write SetIsCalculaINSS;
    property IDFuncionario: integer read GetIdFuncionario write SetIdFuncionario;
  end;

  TFuncionario = class(TDGRSimpleDataSet)
  private
    FDependente: TDependente;
    function GetCPF: String;
    function GetNome: String;
    function GetSalario: Currency;
    procedure SetCPF(const pValue: String);
    procedure SetNome(const pValue: String);
    procedure setSalario(const pValue: Currency);
    function GetINSS: Currency;
    function GetIR: Currency;
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); override;
    destructor Destroy; override;
    property Nome: String read GetNome write SetNome;
    property CPF: String read GetCPF write SetCPF;
    property Salario: Currency read GetSalario write setSalario;
    property Dependentes: TDependente read FDependente;
    property INSS: Currency read GetINSS;
    property IR: currency read GetIR;
  end;

implementation

{ TFuncionario }

constructor TFuncionario.Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection);
begin
  try
    Self.FTableName := 'Funcionario';
    Self.FDependente := TDependente.Create(AOwner, ASQLConnection);
    inherited;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.Create' + #13 + E.Message);
    end;
  end;
end;

destructor TFuncionario.Destroy;
begin
  try
    Self.FDependente.Free;
    inherited;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.Destroy' + #13 + E.Message);
    end;
  end;
end;

function TFuncionario.GetCPF: String;
begin
  try
    Result := Self.FieldByName('CPF').AsString;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.GetCPF' + #13 + E.Message);
    end;
  end;
end;

function TFuncionario.GetINSS: Currency;
var
  vCalculaINSS: Boolean;
begin
  try
    Result := 0;
    vCalculaINSS := False;
    Self.Dependentes.First;
    while (not Self.Dependentes.Eof) do
    begin
      if (Self.Dependentes.IsCalculaINSS) then
      begin
        vCalculaINSS := True;
        Break;
      end;

      Self.Dependentes.Next;
    end;

    if (vCalculaINSS) then
    begin
      Result := Self.Salario * 0.08;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.GetINSS' + #13 + E.Message);
    end;
  end;
end;

function TFuncionario.GetIR: Currency;
var
  vCalculaIR: Integer;
begin
  try
    vCalculaIR := 0;
    Result := 0;
    Self.Dependentes.First;
    while (not Self.Dependentes.Eof) do
    begin
      if (Self.Dependentes.IsCalculaIR) then
      begin
        Inc(vCalculaIR);
      end;
      Self.Dependentes.Next;
    end;

    if (vCalculaIR > 0) then
    begin
      Result := (Self.Salario - (2 * 100)) * 0.15;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.GetIR' + #13 + E.Message);
    end;
  end;
end;

function TFuncionario.GetNome: String;
begin
  try
    Result := Self.FieldByName('Nome').AsString;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.GetNome' + #13 + E.Message);
    end;
  end;
end;

function TFuncionario.GetSalario: Currency;
begin
  try
    Result := Self.FieldByName('Salario').AsCurrency;
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.GetSalario' + #13 + E.Message);
    end;
  end;
end;

procedure TFuncionario.SetCPF(const pValue: String);
begin
  try
    if (TLibUtils.ValidaCPF(TLibUtils.OnlyNumbers(pValue))) then
      Self.SetFieldValueAsString('CPF', TLibUtils.OnlyNumbers((pValue)))
    else
      raise Exception.Create('CPF inv?lido');
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.SetCPF(' + #13 + E.Message);
    end;
  end;
end;

procedure TFuncionario.SetNome(const pValue: String);
begin
  try
    Self.SetFieldValueAsString('Nome', pValue);
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.SetNome' + #13 + E.Message);
    end;
  end;
end;

procedure TFuncionario.setSalario(const pValue: Currency);
begin
  try
    Self.SetFieldValueAsCurrency('Salario', pValue);
  except
    on E: Exception do
    begin
      ShowMessage('TFuncionario.setSalario' + #13 + E.Message);
    end;
  end;
end;

{ TDependente }

constructor TDependente.Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection);
begin
  try
    Self.FTableName := 'Dependente';
    inherited;
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.Create' + #13 + E.Message);
    end;
  end;
end;

function TDependente.GetIdFuncionario: Integer;
begin
  try
    Result := Self.FieldByName('IdFuncionario').AsInteger;
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.GetIdFuncionario' + #13 + E.Message);
    end;
  end;
end;

function TDependente.GetIsCalculaINSS: Boolean;
begin
  try
    Result := Self.FieldByName('IsCalculaINSS').asInteger.ToBoolean;
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.GetIsCalculaINSS' + #13 + E.Message);
    end;
  end;
end;

function TDependente.GetIsCalculaIR: Boolean;
begin
  try
    Result := Self.FieldByName('IsCalculaIR').asInteger.ToBoolean;
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.GetIsCalculaIR' + #13 + E.Message);
    end;
  end;
end;

function TDependente.GetNome: String;
begin
  try
    Result := Self.FieldByName('Nome').AsString;
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.GetNome' + #13 + E.Message);
    end;
  end;
end;

procedure TDependente.LoadByIdFuncionario(const pIdFuncionario: Integer);
begin
  try
    Self.LoadByFK(pIdFuncionario, 'IdFuncionario');
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.LoadByIdFuncionario' + #13 + E.Message);
    end;
  end;
end;

//
procedure TDependente.LoadByNomeFuncionario(const pNomeFuncionario: String);
begin
  try
    Self.LoadByNome(pNomeFuncionario);
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.LoadByNomeFuncionario' + #13 + E.Message);
    end;
  end;
end;

procedure TDependente.SetIdFuncionario(const pValue: Integer);
begin
  try
    Self.SetFieldValueAsInteger('IdFuncionario', pValue);
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.SetIdFuncionario' + #13 + E.Message);
    end;
  end;
end;

procedure TDependente.SetIsCalculaINSS(const pValue: Boolean);
begin
  try
    Self.SetFieldValueAsInteger('IsCalculaINSS', pValue.ToInteger);
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.SetIsCalculaINSS' + #13 + E.Message);
    end;
  end;
end;

procedure TDependente.SetIsCalculaIR(const pValue: Boolean);
begin
  try
   Self.SetFieldValueAsInteger('IsCalculaIR', pValue.ToInteger);
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.SetIsCalculaIR' + #13 + E.Message);
    end;
  end;
end;

procedure TDependente.SetNome(const pValue: String);
begin
  try
    Self.SetFieldValueAsString('Nome', pValue);
  except
    on E: Exception do
    begin
      ShowMessage('TDependente.SetNome' + #13 + E.Message);
    end;
  end;
end;

end.
