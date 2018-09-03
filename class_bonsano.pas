unit class_bonsano;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

type
  TBonsano = class
    function verified(a,b: Real): Boolean;
    private
      //
    public
      constructor create();
      destructor Destroy; override;
  end;

implementation
constructor TBonsano.create();
begin
  //
end;

destructor TBonsano.Destroy;
begin
  //
end;

function TBonsano.verified(a,b: Real): Boolean;
begin
  Result:= (a*b)<0;
end;

end.

