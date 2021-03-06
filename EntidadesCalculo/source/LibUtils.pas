unit LibUtils;

interface

uses StrUtils, SysUtils, Classes, System.RegularExpressions, Vcl.Dialogs;

type
  TLibUtils = class
  public
    class function ValidaCPF(const pCPF: String): Boolean;
    class function OnlyNumbers(const pText: String): String;
  end;

implementation

{ TLibUtils }

class function TLibUtils.ValidaCPF(const pCPF: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  vDigitado, vCalculado: String;
begin
  try
    n1 := StrToInt(pCPF[1]);
    n2 := StrToInt(pCPF[2]);
    n3 := StrToInt(pCPF[3]);
    n4 := StrToInt(pCPF[4]);
    n5 := StrToInt(pCPF[5]);
    n6 := StrToInt(pCPF[6]);
    n7 := StrToInt(pCPF[7]);
    n8 := StrToInt(pCPF[8]);
    n9 := StrToInt(pCPF[9]);
    d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;
    d1 := 11 - (d1 mod 11);
    if (d1 >= 10) then
    begin
      d1 := 0;
    end;
    d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;
    d2 := 11 - (d2 mod 11);
    if (d2 >= 10) then
    begin
      d2 := 0;
    end;
    vCalculado := IntToStr(d1) + IntToStr(d2);
    vDigitado := pCPF[10] + pCPF[11];
    if (vCalculado = vDigitado) then
    begin
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('TLibUtils.ValidaCPF' + #13 + E.Message);
    end;
  end;
end;

class function TLibUtils.OnlyNumbers(const pText: String): String;
begin
  try
    Result :=  TRegEx.Replace(pText, '\D', '');
  except
    on E: Exception do
    begin
      ShowMessage('LibUtils.OnlyNumbers' + #13 + E.Message);
    end;
  end;
end;

end.
