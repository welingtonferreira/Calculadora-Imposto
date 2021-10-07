unit uCalculadora;

interface

uses
  SysUtils, Vcl.Dialogs;

type
  TOperacao = (tpNenhuma, tpSoma, tpSubtracao, tpMultiplicacao, tpDivisao, tpZeraCalculadora, tpImpostoA, tpImpostoB, tpImpostoC);

  TCalculadora = class
  private
    FResultado: Double;
  public
    constructor Create;
    function Somar(const pValorA, pValorB: Double): Double;
    function Multiplicar(const pValorA, pValorB: Double): Double;
    function Subtrair(const pValorA, pValorB: Double): Double;
    function Dividir(const pValorA, pValorB: Double): Double;
  end;

  TImpostoCalc = class (TCalculadora)
  public
    function GetImpostoA(const pBaseCalculo: Double): Double;
    function GetImpostoB(const pBaseCalculo: Double): Double;
    function GetImpostoC(const pBaseCalculo: Double): Double;
  end;

  TCalculadoraController = class
  private
    FCalculadora : TImpostoCalc;
  public
    constructor Create;
    destructor Destroy; override;
    function ExecutaOperacao(const aOperacao: TOperacao; const pValorA, pValorB: Double): Double;
  end;

implementation

{ TCalculadora }

constructor TCalculadora.Create;
begin
  try
    Self.FResultado := 0;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadora.Create' + #13 + E.Message);
    end;
  end;
end;

function TCalculadora.Dividir(const pValorA, pValorB: Double): Double;
begin
  try
    Result := pValorA / pValorB;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadora.Dividir' + #13 + E.Message);
    end;
  end;
end;

function TCalculadora.Multiplicar(const pValorA, pValorB: Double): Double;
begin
  try
    Result := pValorA * pValorB;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadora.Multiplicar' + #13 + E.Message);
    end;
  end;
end;

function TCalculadora.Somar(const pValorA, pValorB: Double): Double;
begin
  try
    Result := pValorA + pValorB;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadora.Somar' + #13 + E.Message);
    end;
  end;
end;

function TCalculadora.Subtrair(const pValorA, pValorB: Double): Double;
begin
  try
    Result := pValorA - pValorB;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadora.Subtrair' + #13 + E.Message);
    end;
  end;
end;

{ TCalculadoraController }

constructor TCalculadoraController.Create;
begin
  try
    FCalculadora := TImpostoCalc.Create;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadoraController.Create' + #13 + E.Message);
    end;
  end;
end;

destructor TCalculadoraController.Destroy;
begin
  try
    FCalculadora.Free;
    inherited;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadoraController.Destroy' + #13 + E.Message);
    end;
  end;
end;

function TCalculadoraController.ExecutaOperacao(const aOperacao: TOperacao; const pValorA, pValorB: Double): Double;
begin
  try
    case aOperacao of
      tpSoma: Result := Self.FCalculadora.Somar(pValorA, pValorB);
      tpSubtracao: Result := Self.FCalculadora.Subtrair(pValorA, pValorB);
      tpMultiplicacao: Result := Self.FCalculadora.Multiplicar(pValorA, pValorB);
      tpDivisao: Result := Self.FCalculadora.Dividir(pValorA, pValorB);
      tpImpostoA: Result := Self.FCalculadora.GetImpostoA(pValorA);
      tpImpostoB: Result := Self.FCalculadora.GetImpostoB(pValorA);
      tpImpostoC: Result := Self.FCalculadora.GetImpostoC(pValorA);
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TCalculadoraController.ExecutaOperacao' + #13 + E.Message);
    end;
  end;
end;

{ TImpostoCalc }

function TImpostoCalc.GetImpostoA(const aBaseCalculo: Double): Double;
var
  vPercentual: Double;
begin
  try
    vPercentual := 20 / 100;
    Result := (pBaseCalculo * vPercentual) - 500;
  except
    on E: Exception do
    begin
      ShowMessage('TImpostoCalc.GetImpostoA' + #13 + E.Message);
    end;
  end;
end;

function TImpostoCalc.GetImpostoB(const pBaseCalculo: Double): Double;
begin
  try
    Result := Self.GetImpostoA(pBaseCalculo) - 15;
  except
    on E: Exception do
    begin
      ShowMessage('TImpostoCalc.GetImpostoB' + #13 + E.Message);
    end;
  end;
end;

function TImpostoCalc.GetImpostoC(const pBaseCalculo: Double): Double;
begin
  try
    Result := Self.GetImpostoA(pBaseCalculo) + Self.GetImpostoB(pBaseCalculo);
  except
    on E: Exception do
    begin
      ShowMessage('TImpostoCalc.GetImpostoC' + #13 + E.Message);
    end;
  end;
end;

end.
