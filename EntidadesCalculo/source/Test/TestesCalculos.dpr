program TestesCalculos;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  uTesteFuncionario in 'uTesteFuncionario.pas',
  LibUtils in '..\LibUtils.pas',
  uFuncionarios in '..\uFuncionarios.pas',
  uPersistFuncionarios in '..\uPersistFuncionarios.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

