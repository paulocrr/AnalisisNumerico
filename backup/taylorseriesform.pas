unit TaylorSeriesForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type
  TFormTaylorSeries = class(TForm)
    ButtonCalculate: TButton;
    EditValor: TEdit;
    EditError: TEdit;
    LabelError: TLabel;
    LabelValor: TLabel;
    MainMenu1: TMainMenu;
    MemoAnswer: TMemo;
    RadioButtonSinH: TRadioButton;
    RadioButtonSin: TRadioButton;
    RadioButtonCos: TRadioButton;
    RadioButtonArcSin: TRadioButton;
    RadioButtonArcTan: TRadioButton;
    RadioGroupOT: TRadioGroup;
    procedure ButtonCalculateClick(Sender: TObject);
  private

  public

  end;

var
  FormTaylorSeries: TFormTaylorSeries;

implementation

{$R *.lfm}
procedure TFormTaylorSeries.ButtonCalculateClick(Sender: TObject);
var Taylor: TTaylor;
begin
  Taylor := TTaylor.create();
  Taylor.Error := StrToFloat(EditError.Text);
  Taylor.x:=StrToFloat(EditValor.Text);

  if(RadioButtonSin.Checked) then
  begin
       MemoAnswer.Lines.Add('Sen('+EditValor.Text+') = '+FloatToStr(Taylor.seno()));
  end;

  if(RadioButtonCos.Checked) then
  begin
       MemoAnswer.Lines.Add('Cos('+EditValor.Text+') = '+FloatToStr(Taylor.coseno()));
  end;

  if(RadioButtonArcSin.Checked) then
  begin
     if( abs(StrToFloat(EditValor.Text))<=1 ) then
     begin
          MemoAnswer.Lines.Add('ArcSin('+EditValor.Text+') = '+FloatToStr(Taylor.arcseno()));
     end
     else MemoAnswer.Lines.Add('Valor fuera del rango de la funcion ArcSin');
  end;

  if(RadioButtonArcTan.Checked) then
  begin
     if(abs(StrToFloat(EditValor.Text))<1) then
     begin
          MemoAnswer.Lines.Add('ArcTan('+EditValor.Text+') = '+FloatToStr(Taylor.arctan()));
     end
     else MemoAnswer.Lines.Add('Valor fuera del rango de la funcion ArcTan');
  end;

  if(RadioButtonSinH.Checked) then
  begin
     MemoAnswer.Lines.Add('Senh('+EditValor.Text+') = '+FloatToStr(Taylor.sinh()));
  end;

  Taylor.Destroy;
end;

end.

