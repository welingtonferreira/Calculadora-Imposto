unit uPersistFuncionarios;

interface

Uses  Data.DB, Data.SqlExpr, System.Classes, System.SysUtils, Datasnap.DBClient,
      SimpleDS, Data.DBXFirebird, Vcl.Dialogs;

type

  TDGRSQLConnection = class (TSQLConnection)
  private
    procedure DBSQLConnectionBeforeConnect(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    class function getInstance: TDGRSQLConnection;
  end;

  TDGRSimpleDataSet = class (TSimpleDataSet)
  private
    const
      SQL = 'SELECT * FROM %s WHERE Id = :Id';
      SQLNome = 'SELECT * FROM %s WHERE NOME LIKE :Nome';
      //SELECT * FROM FUNCIONARIO WHERE NOME LIKE '%WELINGTON%'
      SQLFK = 'SELECT * FROM %s WHERE %s = :%s';
    function GetId: Integer;
    procedure SetId(const pValue: Integer);
  protected
    FTableName: string;
    procedure DoBeforePost; override;
  public
    constructor Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection); reintroduce; virtual;
    function LoadById(const pID: Integer): Boolean; virtual;
    function LoadByNome(const pNome: String): Boolean; virtual;
    function LoadByFK(const pFKID: Integer; const pFKName: String): Boolean; virtual;
    procedure SetFieldValueAsString(const pFieldName: String; pValue: String);
    procedure SetFieldValueAsInteger(const pFieldName: String; pValue: Integer);
    procedure SetFieldValueAsBoolean(const pFieldName: String; pValue: Boolean);
    procedure SetFieldValueAsCurrency(const pFieldName: String; pValue: Currency);
    procedure CheckEditDataSet;
    function GetNextId: Integer;
    property ID: Integer read GetId write SetId;

  end;

implementation

var
  _DGRSQLConnection : TDGRSQLConnection;

{ TDGRSQLConnection }

constructor TDGRSQLConnection.Create(AOwner: TComponent);
begin
  try
    inherited;
    Self.BeforeConnect := DBSQLConnectionBeforeConnect;
    Self.LoginPrompt := False;
    Self.Params.Text :=
      'DriverUnit=Data.DBXFirebird' + #13#10 +
      'GetDriverFunc=getSQLDriverINTERBASE' + #13#10 +
      'LibraryName=fbclient.dll' + #13#10 +
      'VendorLib=gds32.dll' + #13#10 +
      'VendorLibWin64=gds32.dll' + #13#10 +
      'User_Name=SYSDBA' + #13#10 +
      'Password=masterkey' + #13#10 +
      'Role=RoleName' + #13#10 +
      'MaxBlobSize=-1' + #13#10 +
      'LocaleCode=0000' + #13#10 +
      'IsolationLevel=ReadCommitted' + #13#10 +
      'SQLDialect=3' + #13#10 +
      'CommitRetain=False' + #13#10 +
      'WaitOnLocks=True' + #13#10 +
      'TrimChar=False' + #13#10 +
      'BlobSize=-1' + #13#10 +
      'ErrorResourceFile=' + #13#10 +
      'RoleName=RoleName' + #13#10 +
      'ServerCharSet=' + #13#10 +
      'Trim Char=False';
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSQLConnection.Create' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSQLConnection.DBSQLConnectionBeforeConnect(Sender: TObject);
var
  vIniParams: TStringList;
  vI: integer;
begin
  try
    vIniParams := TStringList.Create;
    try
      vIniParams.LoadFromFile(ExtractFilePath(ParamStr(0) ) + 'Parametros.ini');
      for vI := 0 to vIniParams.Count - 1 do
        Self.Params.Values[vIniParams.Names[vI]] := vIniParams.ValueFromIndex[vI];
    finally
      vIniParams.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSQLConnection.DBSQLConnectionBeforeConnect' + #13 + E.Message);
    end;
  end;
end;

class function TDGRSQLConnection.getInstance: TDGRSQLConnection;
begin
  try
    Result := _DGRSQLConnection;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSQLConnection.getInstance' + #13 + E.Message);
    end;
  end;
end;

{ TDGRSimpleDataSet }

procedure TDGRSimpleDataSet.CheckEditDataSet;
begin
  try
    if (not (Self.State in dsEditModes)) then
    begin
      Self.Edit;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.CheckEditDataSet' + #13 + E.Message);
    end;
  end;
end;

constructor TDGRSimpleDataSet.Create(AOwner: TComponent; ASqlConnection: TDGRSQLConnection);
begin
  try
    inherited Create(AOwner);
    Self.SetConnection(ASqlConnection);
    Self.LoadById(-1);
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.Create' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSimpleDataSet.DoBeforePost;
begin
  try
    inherited;
    if (Self.State = dsInsert) then
    begin
      Self.FieldByName('ID').AsInteger := Self.GetNextId;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.DoBeforePost' + #13 + E.Message);
    end;
  end;
end;

function TDGRSimpleDataSet.GetId: Integer;
begin
  try
    Result := Self.FieldByName('Id').AsInteger;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.GetId' + #13 + E.Message);
    end;
  end;
end;

function TDGRSimpleDataSet.GetNextId: Integer;
var
  vQry: TSQLDataSet;
begin
  try
    vQry := TSQLDataSet.Create(Self);
    try
      vQry.SQLConnection := Self.DataSet.SQLConnection;
      vQry.CommandText := Format('SELECT GEN_ID( %s, 1 ) FROM RDB$DATABASE;', ['GEN_' + Self.FTableName]);
      vQry.Open;
      Result := vQry.Fields[0].AsInteger;
    finally
      vQry.Free;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.GetNextId' + #13 + E.Message);
    end;
  end;;

end;

function TDGRSimpleDataSet.LoadByFK(const pFKID: Integer; const pFKName: String): Boolean;
begin
  try
    Self.Close;
    Self.DataSet.CommandText := Format(SQLFK, [Self.FTableName, pFKName, pFKName]);
    Self.DataSet.ParamByName(pFKName).AsInteger := pFKID;
    Self.Open;
    Result := Self.Active and (not Self.IsEmpty);
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.LoadByFK' + #13 + E.Message);
    end;
  end;
end;

function TDGRSimpleDataSet.LoadById(const pID: Integer): Boolean;
begin
  try
    Self.Close;
    Self.DataSet.CommandText := Format(SQL, [Self.FTableName]);
    Self.DataSet.ParamByName('id').AsInteger := pID;
    Self.Open;
    Result := Self.Active and (not Self.IsEmpty);
  except
    on E: Exception do
    begin
      ShowMessage('TTDGRSimpleDataSet.LoadById' + #13 + E.Message);
    end;
  end;
end;

function TDGRSimpleDataSet.LoadByNome(const pNome: String): Boolean;
begin
  try
    Self.Close;
    Self.DataSet.CommandText := Format(SQLNome, [Self.FTableName]);
    Self.DataSet.ParamByName('nome').AsString := '%' + pNome + '%';;
    Self.Open;
    Result := Self.Active and (not Self.IsEmpty);
  except
    on E: Exception do
    begin
      ShowMessage('TTDGRSimpleDataSet.LoadByNome' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsBoolean(const pFieldName: String; pValue: Boolean);
begin
  try
    Self.CheckEditDataSet;
    Self.FieldByName(pFieldName).asBoolean := pValue;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.SetFieldValueAsBoolean' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsCurrency(const pFieldName: String; pValue: Currency);
begin
  try
    Self.CheckEditDataSet;
    Self.FieldByName(pFieldName).asCurrency := pValue;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.SetFieldValueAsCurrency' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsInteger(const pFieldName: String; pValue: Integer);
begin
  try
    Self.CheckEditDataSet;
    Self.FieldByName(pFieldName).asInteger := pValue;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.SetFieldValueAsInteger' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSimpleDataSet.SetFieldValueAsString(const pFieldName: String; pValue: String);
begin
  try
    Self.CheckEditDataSet;
    Self.FieldByName(pFieldName).AsString := pValue;
  except
    on E: Exception do
    begin
      ShowMessage('TDGRSimpleDataSet.SetFieldValueAsString' + #13 + E.Message);
    end;
  end;
end;

procedure TDGRSimpleDataSet.SetId(const pValue: Integer);
begin
  try
    Self.FieldByName('Id').AsInteger := pValue;
  except
    on E: Exception do
    begin
      ShowMessage('DGRSimpleDataSet.SetId' + #13 + E.Message);
    end;
  end;
end;

initialization
  _DGRSQLConnection := TDGRSQLConnection.Create(nil);
  _DGRSQLConnection.DriverName := 'Firebird';
  _DGRSQLConnection.Connected := True;

finalization
  _DGRSQLConnection.Free;
  _DGRSQLConnection := nil;


end.
