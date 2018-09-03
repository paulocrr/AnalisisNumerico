unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Menus, class_series_taylor, TaylorSeriesForm, bisectionform;

type

  { TMenuForm }

  TMenuForm = class(TForm)
    ButtonBisectionMethod: TButton;
    ButtonTaylorSeries: TButton;
    procedure ButtonBisectionMethodClick(Sender: TObject);
    procedure ButtonTaylorSeriesClick(Sender: TObject);
  private

  public

  end;

var
  MenuForm: TMenuForm;

implementation

{$R *.lfm}

{ TMenuForm }

procedure TMenuForm.ButtonTaylorSeriesClick(Sender: TObject);
begin
   FormTaylorSeries.ShowModal;
end;

procedure TMenuForm.ButtonBisectionMethodClick(Sender: TObject);
begin
   FormBisection.ShowModal;
end;

end.

