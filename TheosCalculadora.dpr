program TheosCalculadora;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmCalculadora},
  uCalculadora in 'uCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  AApplication.CreateForm(TfrmCalculadora, frmCalculadora);
  pplication.Run;
end.
