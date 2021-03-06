unit uCadFuncionarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  System.Actions, Vcl.ActnList, uControllerFuncionarios, uPersistFuncionarios,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Buttons;

type
  TfrmFuncionarios = class(TForm)
    pgcFuncionarios: TPageControl;
    Cadastro: TTabSheet;
    tsPesquisar: TTabSheet;
    CadastroGroupBox: TGroupBox;
    lblNomeFuncionario: TLabel;
    lblCPF: TLabel;
    lblSalario: TLabel;
    edtNomeFuncionario: TMaskEdit;
    edtCPF: TMaskEdit;
    edtSalario: TMaskEdit;
    CadastroActionList: TActionList;
    NovoAction: TAction;
    SalvarAction: TAction;
    EditarAction: TAction;
    ExcluirAction: TAction;
    PesquisarAction: TAction;
    SairAction: TAction;
    cbPesquisa: TComboBox;
    edtCodigoFuncionario: TMaskEdit;
    lbListaPesquisa: TListBox;
    edtINSS: TMaskEdit;
    edtIR: TMaskEdit;
    lblINSS: TLabel;
    lblIR: TLabel;
    gbDependentes: TGroupBox;
    lblNomeDependente: TLabel;
    edtNomeDependente: TMaskEdit;
    lblCalculaIR: TLabel;
    cbCalculaIR: TComboBox;
    lblCalculaINSS: TLabel;
    cbCalculaINSS: TComboBox;
    btnAdicionar: TButton;
    lbDependentes: TListBox;
    pnlBotoes: TPanel;
    btnNovo: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCalculaImposto: TSpeedButton;
    btnSair: TSpeedButton;
    btnCancelar: TSpeedButton;
    procedure Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SaveExecute(Sender: TObject);
    procedure CloseExecute(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure edtCodigoFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure lbListaPesquisaDblClick(Sender: TObject);
    procedure btnCalculaImpostoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure HabilitaBotoes(pValue: Boolean);
  private
    { Private declarations }
    FFuncionarioController: TFuncionarioController;
    procedure LimparControls;
    procedure PopulateControls;
  public
    { Public declarations }
  end;

var
  frmFuncionarios: TfrmFuncionarios;

implementation

{$R *.dfm}

uses LibUtils;

procedure TfrmFuncionarios.FormCreate(Sender: TObject);
begin
  try
    Self.FFuncionarioController := TFuncionarioController.Create(Self, TDGRSQLConnection.getInstance);
    Self.LimparControls;

    pgcFuncionarios.ActivePageIndex := 0;
    HabilitaBotoes(False);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.FormCreate' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.btnCalculaImpostoClick(Sender: TObject);
begin
  try
    edtINSS.Text := CurrToStr(Self.FFuncionarioController.Funcionario.INSS);
    edtIR.Text := CurrToStr(Self.FFuncionarioController.Funcionario.IR);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.btnCalculaImpostoClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.btnCancelarClick(Sender: TObject);
begin
  try
    Self.FFuncionarioController.CancelEdit;
    HabilitaBotoes(False);
    Self.LimparControls;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.btnCancelarClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    Self.FFuncionarioController.Free;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.FormClose' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.btnAdicionarClick(Sender: TObject);
begin
  try
    if (edtNomeDependente.Text = EmptyStr) then
    begin
      ShowMessage('Para adicionar dependentes ? necess?rio preencher os dados.');
      edtNomeDependente.SetFocus;
      Exit;
    end;

    Self.FFuncionarioController.Funcionario.Dependentes.Insert;
    Self.FFuncionarioController.Funcionario.Dependentes.Nome := edtNomeDependente.Text;
    Self.FFuncionarioController.Funcionario.Dependentes.IsCalculaIR := cbCalculaIR.ItemIndex.ToBoolean;
    Self.FFuncionarioController.Funcionario.Dependentes.IsCalculaINSS := cbCalculaINSS.ItemIndex.ToBoolean;
    Self.FFuncionarioController.Funcionario.Dependentes.IDFuncionario := Self.FFuncionarioController.Funcionario.ID;
    Self.FFuncionarioController.Funcionario.Dependentes.Post;
    lbDependentes.AddItem(edtNomeDependente.Text, TObject(Self.FFuncionarioController.Funcionario.Dependentes.ID));
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.btnAdicionarClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.LimparControls;
begin
  try
    edtNomeFuncionario.Clear;
    edtCPF.Clear;
    edtSalario.Clear;

    edtNomeDependente.Clear;
    cbCalculaIR.ItemIndex := 0;
    cbCalculaINSS.ItemIndex := 0;
    lbDependentes.Clear;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.LimparControls' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.edtCodigoFuncionarioKeyPress(Sender: TObject; var Key: Char);

begin
  try
    if (Key = Chr(VK_Return)) then
    begin
      lbListaPesquisa.Clear;
      if (cbPesquisa.ItemIndex = 0) then
      begin
        if (Self.FFuncionarioController.LoadByIdFuncionario(StrToIntDef(edtCodigoFuncionario.Text, 0))) then
        begin
          lbListaPesquisa.AddItem(Self.FFuncionarioController.Funcionario.Nome, TObject(Self.FFuncionarioController.Funcionario.ID));
        end;
      end
      else
      begin
        if (Self.FFuncionarioController.LoadByNomeFuncionario(edtCodigoFuncionario.Text)) then
        begin
          Self.FFuncionarioController.Funcionario.First;
          while not ( Self.FFuncionarioController.Funcionario.Eof) do
          begin
            lbListaPesquisa.AddItem('ID: '
                                     + IntToStr(Self.FFuncionarioController.Funcionario.ID)
                                     + StringOfChar(' ', 5)
                                     + Self.FFuncionarioController.Funcionario.Nome,
                                    TObject(Self.FFuncionarioController.Funcionario.ID));

            Self.FFuncionarioController.Funcionario.Next;
          end;
        end;
      end;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.CodigoEditKeyPress' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.PopulateControls;
begin
  try
    Self.LimparControls;

    edtNomeFuncionario.Text := Self.FFuncionarioController.Funcionario.Nome;
    edtCPF.Text := Self.FFuncionarioController.Funcionario.CPF;
    edtSalario.Text := CurrToStr(Self.FFuncionarioController.Funcionario.Salario);

    Self.FFuncionarioController.Funcionario.Dependentes.First;
    while (not Self.FFuncionarioController.Funcionario.Dependentes.Eof) do
    begin
      lbDependentes.AddItem(Self.FFuncionarioController.Funcionario.Dependentes.Nome,
                            TObject(Self.FFuncionarioController.Funcionario.Dependentes.ID));
      Self.FFuncionarioController.Funcionario.Dependentes.Next;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.CodigoEditKeyPress' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.Execute(Sender: TObject);
begin
  try
    Self.LimparControls;
    HabilitaBotoes(True);
    if (edtNomeFuncionario.CanFocus) then
    begin
      edtNomeFuncionario.SetFocus;
    end;

    Self.FFuncionarioController.Funcionario.LoadById(-1);
    Self.FFuncionarioController.Funcionario.Dependentes.LoadById(-1);
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.NovoActionExecute' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.CloseExecute(Sender: TObject);
begin
  try
    Close;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.SairActionExecute' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.SaveExecute(Sender: TObject);
begin
  try
    Self.FFuncionarioController.Funcionario.Edit;
    Self.FFuncionarioController.Funcionario.Nome := edtNomeFuncionario.Text;
    if (TLibUtils.OnlyNumbers(edtCPF.Text).Length > 0) then
    begin
      Self.FFuncionarioController.Funcionario.CPF := TLibUtils.OnlyNumbers(edtCPF.Text);
    end;
    Self.FFuncionarioController.Funcionario.Salario := StrToCurrDef(edtSalario.Text, 0);
    Self.FFuncionarioController.Funcionario.Post;

    Self.FFuncionarioController.Save;

    ShowMessage('Cadastro salvo com sucesso.');
    HabilitaBotoes(False);
  except
    on E: Exception do
    begin
      Self.FFuncionarioController.CancelEdit;
      ShowMessage('TfrmFuncionarios.CodigoEditKeyPress' + #13 + E.Message);
      raise;
    end;
  end;
end;

procedure TfrmFuncionarios.lbListaPesquisaDblClick(Sender: TObject);
begin
  try
    pgcFuncionarios.ActivePageIndex := 0;
    HabilitaBotoes(True);
    Self.PopulateControls;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.lbxPesquisaDblClick' + #13 + E.Message);
    end;
  end;
end;

procedure TfrmFuncionarios.HabilitaBotoes(pValue: Boolean);
begin
  try
    CadastroGroupBox.Enabled := pValue;
    btnNovo.Enabled := not pValue;
    btnSair.Enabled := not pValue;
    btnCalculaImposto.Enabled := not pValue;
    btnCancelar.Enabled := pValue;
    btnSalvar.Enabled := pValue;
  except
    on E: Exception do
    begin
      ShowMessage('TfrmFuncionarios.HabilitaBotoes' + #13 + E.Message);
    end;
  end;
end;

end.
