unit class_open_methods;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math,class_errors;

type
  TOpenMethods = class
    x: Real;
    function bisection(): Real;
    private

    public
      Error: Real;
      constructor create();
      destructor Destroy; override;
  end;

implementation
constructor TOpenMethods.create();
begin
     Error := 0.1;
     x := 0.0;
end;

end.

