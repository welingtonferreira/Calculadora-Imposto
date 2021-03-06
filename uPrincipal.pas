unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCalculadora;

type
  TfrmCalculadora = class(TForm)
    edtVisor: TEdit;
    edtResultado: TEdit;
    lblInfos: TLabel;
    lblInfos2: TLabel;
    btnImpostoA: TButton;
    btnImpostoB: TButton;
    btnImpostoC: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtVisorKeyPress(Sender: TObject; var Key: Char);
    procedure btnImpostoAClick(Sender: TObject);
    procedure btnImpostoBClick(Sender: TObject);
    procedure btnImpostoCClick(Sender: TObject);
  private
    { Private declarations }
    FCalculadoraController : TCalculadoraController;
    FValorAnterior: String;
    FResultado: Double;
    FUltimaOperacao: TOperacao;
    procedure LimpaCalculadora;
    procedure CheckImposto(const pOperacao: TOperacao);
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}


procedure TfrmCalculadora.FormCreate(Sender: TObject);
begin
  try
    FCalculadoraController := TCalculadoraController.Create;
    Self.LimpaCalculadora;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.FormCreate' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.LimpaCalculadora;
begin
  try
    FValorAnterior := '0';
    FResultado := 0;
    FUltimaOperacao := tpNenhuma;
    edtVisor.Clear;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.LimpaCalculadora' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.CheckImposto(const pOperacao: TOperacao);
begin
  try
    if (String(edtResultado.Text).IsEmpty) then
    begin
      edtResultado.Text := 'Por favor, informe um resultado.'
    end
    else
    begin
      edtResultado.Text := FCalculadoraController.ExecutaOperacao(pOperacao, StrToCurrDef(edtResultado.Text, 0), 0).ToString;
      Self.LimpaCalculadora;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.CheckImposto' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.btnImpostoAClick(Sender: TObject);
begin
  try
    Self.CheckImposto(tpImpostoA);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.btnImpostoAClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.btnImpostoBClick(Sender: TObject);
begin
  try
    Self.CheckImposto(tpImpostoB);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.btnImpostoBClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.btnImpostoCClick(Sender: TObject);
begin
  try
    Self.CheckImposto(tpImpostoC);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.btnImpostoCClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.edtVisorKeyPress(Sender: TObject; var Key: Char);
begin
  try
    if (CharInSet(Key, ['+','-','*','x','/', '=', Chr(VK_RETURN)])) then
    begin
      if (Self.FUltimaOperacao = tpNenhuma) then
      begin
        Self.FResultado := StrToCurrDef(Self.FValorAnterior, 0);
      end
      else
      begin
        FResultado := FCalculadoraController.ExecutaOperacao(Self.FUltimaOperacao, Self.FResultado,  StrToCurrDef(Self.FValorAnterior, 0));
      end;

      edtResultado.Text := Self.FResultado.ToString;
      Self.FValorAnterior := '0';

      if (CharInSet(Key, ['=', Chr(VK_RETURN)])) then
      begin
        Self.LimpaCalculadora;
        Key := #0;
      end;
    end;

    case Key of
      '+': Self.FUltimaOperacao := tpSoma;
      '-': Self.FUltimaOperacao := tpSubtracao;
      '*', 'x': Self.FUltimaOperacao := tpMultiplicacao;
      '/': Self.FUltimaOperacao := tpDivisao;
      '0'..'9', ',': FValorAnterior := FValorAnterior + Key;
    end;
  except
    on E: Exception do
    begin
      edtResultado.Text := 'Opera??o est? inv?lida.';
      Self.LimpaCalculadora;
      ShowMessage('TfrmCalculadora.edtDisplayKeyPress' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmCalculadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    FCalculadoraController.Free;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmCalculadora.FormClose' + #13 + E.Message);
    end;
  end;
end;

end.
