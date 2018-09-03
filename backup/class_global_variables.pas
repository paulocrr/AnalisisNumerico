unit class_global_variables;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Math;

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

end.

