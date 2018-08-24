unit class_series_taylor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type
  TTaylor = class
    x: Real;
    y: Integer;
    function seno(): Real;
    function coseno(): Real;
    function arcseno(): Real;
    function arctan(): Real;
    function test(): LongInt;
    private

    public
      Error: Real;
      constructor create();
      destructor Destroy; override;
  end;

implementation

function factorial( n: Integer ): LongInt;
var i:Integer;
begin
   Result:=1;
   if (n<>0) or (n<>1) then
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
    NewError,
    xn, xnn : Real;
begin
   Result:= 0;
   Result:= Result + (power(-1,n)/factorial(2*n+1))*power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (power(-1,n)/factorial(2*n+1))*power(x,2*n+1);
     xnn := Result;
     NewError:= abs(xnn-xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) or ( n > 8 ) );
end;

function TTaylor.coseno(): Real;
var n: Integer = 0;
    NewError,
    xn, xnn : Real;
begin
   Result:= 0;
   Result:= Result + (power(-1,n)/factorial(2*n))*power(x,2*n);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (power(-1,n)/factorial(2*n))*power(x,2*n);
     xnn := Result;
     NewError:= abs(xnn-xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) or ( n > 9 ) );
end;

function TTaylor.arcseno(): Real;
var n: Integer = 0;
    NewError,
    xn, xnn : Real;
begin
   Result:= 0;
   Result:= Result + (factorial(2*n)/(power(4,n)*power(factorial(n),2)*(2*n+1)))*power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (factorial(2*n)/(power(4,n)*power(factorial(n),2)*(2*n+1)))*power(x,2*n+1);
     xnn := Result;
     NewError:= abs(xnn-xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) or ( n > 9 ) );
end;

function TTaylor.arctan(): Real;
var n: Integer = 0;
    NewError,
    xn, xnn : Real;
begin
   Result:= 0;
   Result:= Result + (power(-1,n)/(2*n+1))*power(x,2*n+1);
   xn:= Result;
   n:= n + 1;
   repeat
     Result:= Result + (power(-1,n)/(2*n+1))*power(x,2*n+1);
     xnn := Result;
     NewError:= abs(xnn-xn);
     xn:=xnn;
     n:= n + 1;
   until ( ( NewError<=Error ) or ( n > 9 ) );
end;

function TTaylor.test(): LongInt;
begin
   Result := factorial(y);
end;

end.

