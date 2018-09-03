unit class_series_taylor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math,class_errors;

type
  TTaylor = class
    x: Real;
    y: Integer;
    function seno(): Real;
    function coseno(): Real;
    function arcseno(): Real;
    function arctan(): Real;
    function sinh(): Real;
    function test(): Real;
    private

    public
      Error: Real;
      constructor create();
      destructor Destroy; override;
  end;

implementation

function factorial( n: Integer ): Real;
var i:Integer;
begin
   Result:=1;
   if (n<>0) and (n<>1) then
   begin
    for i:=n downto 2 do
    begin
     Result:= Result * i
    end;
   end;
end;

constructor TTaylor.create();
begin
   Error := 0.1;
   x := 0.0;
   y := 0;
end;

destructor TTaylor.Destroy;
begin
   //
end;

function TTaylor.seno(): Real;
var n: Integer = 0;
    ErrorType: TErrors;
    NewError,
    xn, xnn : Real;
begin
   ErrorType := TErrors.create();
   x:=x-floor(x/(2*pi))*2*pi;
   Result:= 0;
   Result:= Result + (power(-1,n)/factorial(2*n+1)) * power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (power(-1,n)/factorial(2*n+1)) * power(x,2*n+1);
     xnn := Result;
     NewError:= ErrorType.AbsoluteAproxError(xnn,xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ));
end;

function TTaylor.coseno(): Real;
var n: Integer = 0;
    ErrorType: TErrors;
    NewError,
    xn, xnn : Real;
begin
   ErrorType := TErrors.create();
   x:=x-floor(x/(2*pi))*2*pi;
   Result:= 0;
   Result:= Result + (power(-1,n)/factorial(2*n))*power(x,2*n);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (power(-1,n)/factorial(2*n))*power(x,2*n);
     xnn := Result;
     NewError:= ErrorType.AbsoluteAproxError(xnn,xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) );
end;

function TTaylor.arcseno(): Real;
var n: Integer = 0;
    ErrorType: TErrors;
    NewError,
    xn, xnn : Real;
begin
   ErrorType := TErrors.create();
   Result:= 0;
   Result:= Result + (factorial(2*n)/(power(4,n)*power(factorial(n),2)*(2*n+1)))*power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (factorial(2*n)/(power(4,n)*power(factorial(n),2)*(2*n+1)))*power(x,2*n+1);
     xnn := Result;
     NewError:= ErrorType.AbsoluteAproxError(xnn,xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) );
end;

function TTaylor.arctan(): Real;
var n: Integer = 0;
    ErrorType: TErrors;
    NewError,
    xn, xnn : Real;
begin
   ErrorType := TErrors.create();
   Result:= 0;
   Result:= Result + (power(-1,n)/(2*n+1))*power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (power(-1,n)/(2*n+1))*power(x,2*n+1);
     xnn := Result;
     NewError:= ErrorType.AbsoluteAproxError(xnn,xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) );
end;

function TTaylor.sinh(): Real;
var n: Integer = 0;
    ErrorType: TErrors;
    NewError,
    xn, xnn : Real;
begin
   ErrorType := TErrors.create();
   Result:= 0;
   Result:= Result + (1/factorial(2*n+1)) * power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (1/factorial(2*n+1)) * power(x,2*n+1);
     xnn := Result;
     NewError:= ErrorType.AbsoluteAproxError(xnn,xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) );
end;

function TTaylor.test(): Real;
begin
   Result := factorial(y);
end;

end.

