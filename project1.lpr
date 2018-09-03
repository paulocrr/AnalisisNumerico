program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main, class_series_taylor, class_global_variables,
  class_errors, class_bonsano, TaylorSeriesForm, bisectionform
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMenuForm, MenuForm);
  Application.CreateForm(TFormTaylorSeries, FormTaylorSeries);
  Application.CreateForm(TFormBisection, FormBisection);
  Application.Run;
end.

