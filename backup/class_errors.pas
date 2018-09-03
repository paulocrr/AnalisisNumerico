unit class_errors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;
type
  TErrors=class

    function AbsoluteAproxError(xnn: Real; xn: Real): Real;
    private
       //
    public
      constructor create();
      destructor Destroy; override;
  end;
implementation

constructor TErrors.create();
begin
  //
end;

destructor TTaylor.Destroy;
begin
   //
end;

function TErrors.AbsoluteAproxError(xnn: Real; xn: Real): Real;
begin
  Result:= abs(xnn-xn);
end;

end.

