unit bisectionform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  StdCtrls,class_errors,class_close_methods;

type

  { TFormBisection }

  TFormBisection = class(TForm)
    ButtonCalculate: TButton;
    EditGreaterInterval: TEdit;
    EditMinorInterval: TEdit;
    EditError: TEdit;
    Label1: TLabel;
    LabelResults: TLabel;
    LabelMinorInterval: TLabel;
    LabelError: TLabel;
    StringGridResults: TStringGrid;
    procedure ButtonCalculateClick(Sender: TObject);
  private

  public

  end;

var
  FormBisection: TFormBisection;

implementation

{$R *.lfm}

{ TFormBisection }

procedure TFormBisection.ButtonCalculateClick(Sender: TObject);
var a,b,Error: Real;
    methods: TCloseMethods;
    res: TStringList;
    n: Integer;
    nums: TStringList;
begin
  a:= StrToFloat(EditMinorInterval.Text);
  b:= StrToFloat(EditGreaterInterval.Text);
  Error:= StrToFloat(EditError.Text);
  methods:= TCloseMethods.create();
  nums:= TStringList.Create;
  methods.Error:=Error;
  res:= methods.bisection(a,b);
  for n:=0 to res.Count do begin
    nums.Add(IntToStr(n+1));
  end;
  StringGridResults.RowCount:=res.Count;
  StringGridResults.Cols[0].Assign( nums );
  StringGridResults.Cols[1].Assign( res );

end;


end.

