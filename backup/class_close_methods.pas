unit class_close_methods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math,class_bonsano,class_errors;

type
  TCloseMethods = class
    x: Real;
    function bisection(a: Real; b: Real): TStringList;
    private

    public
      Error: Real;
      constructor create();
      destructor Destroy; override;
  end;

implementation
constructor TCloseMethods.create();
begin
     Error := 0.1;
end;

destructor TCloseMethods.Destroy;
begin
     //
end;

function TCloseMethods.bisection(a: Real; b: Real): TStringList;
var Bonsano: TBonsano;
    Values: TStringList;
    ErrorType: TErrors;
    resA,resX,xn,xnn,NewError: Real;
begin
     Values:= TStringList.Create;
     Bonsano:= TBonsano.create();
     ErrorType:= TErrors.create();
     resA:= power(a,2) - ln(a) - sin(a) - a;
     xnn:= (a+b)/2;
     resX:= power(xnn,2) - ln(xnn) - sin(xnn) - xnn;
     if(Bonsano.verified(a,xnn)) then
       begin
            b:= xnn;
       end;
     repeat
       resA:= power(a,2) - ln(a) - sin(a) - a;
       xn:= (a+b)/2;
       resX:= power(xn,2) - ln(xn) - sin(xn) - xn;
       if(Bonsano.verified(resA,resX)) then
         begin
           b:= xn;
         end
       else
         begin
           a:= xn;
         end;
       NewError:= ErrorType.AbsoluteAproxError(xnn,xn);
       xnn:= xn;
       Values.Add(FloatToStr(xnn));
     until ( NewError<=Error );
     Result:=Values;
end;

end.

