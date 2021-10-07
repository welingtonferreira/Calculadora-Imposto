program EntidadesCalculo;

uses
  Vcl.Forms,
  uCadFuncionarios in 'uCadFuncionarios.pas' {frmFuncionarios},
  LibUtils in 'LibUtils.pas',
  uControllerFuncionarios in 'uControllerFuncionarios.pas',
  uFuncionarios in 'uFuncionarios.pas',
  uPersist in 'uPersist.pas',
  uPersistFuncionarios in 'uPersistFuncionarios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.Run;
end.
