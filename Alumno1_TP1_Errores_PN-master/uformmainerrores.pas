unit UFormMainErrores;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, UNumero;

type

  { TFormMainErroes }

  TFormMainErroes = class(TForm)
    ButtonClean: TButton;
    ButtonConvert: TButton;
    ComboBoxBase: TComboBox;
    EditTDigit: TEdit;
    EditNumber: TEdit;
    LabelTitleNumber: TLabel;
    LabelShowNumberCutS: TLabel;
    LabelShowNumberCut: TLabel;
    LabelCutS: TLabel;
    LabelTitleFormat: TLabel;
    LabelCut: TLabel;
    LabelDigit: TLabel;
    LabelShowNormalized: TLabel;
    LabelNormalized: TLabel;
    LabelShowPFN: TLabel;
    LabelPFN: TLabel;
    LabelNumberConvert: TLabel;
    LabelShowBase: TLabel;
    LabelShowNumber: TLabel;
    LabelBaseConvert: TLabel;
    LabelEnterNumber: TLabel;
    PanelShowRepresents: TPanel;
    PanelNumberConvert: TPanel;
    procedure ButtonConvertClick(Sender: TObject);
    procedure ComboBoxBaseChange(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FormMainErroes: TFormMainErroes;
  Numero: TNumero;           {Objeto de la clase TNumero}
  sNumero, sNumeroConv, sBase : string; {Numero en String, Convertido y Base}
  parteEnteraConv ,parteDecimalConv : string;
  sNumeroNormalizado : string;
  baseLlegada, e : byte;  {Base B´ y "e" es el error para Val()}
  parteEntera : integer;
  parteDecimal, dNumero : real; { dNumero es el Numero en real}

implementation

{$R *.lfm}

{ TFormMainErroes }

procedure TFormMainErroes.ButtonConvertClick(Sender: TObject);
begin
  { Instanciamos el Objeto }
  Numero := TNumero.create();
  { Recibimos el numero del TEdit }
  sNumero:=EditNumber.Text;
  { Luego la base de llegada }
  Val(sBase,baseLlegada,e);
  { Convertimos el numero de String a Double }
  Val(sNumero,dNumero,e);
  if (e <> 0) then
     ShowMessage('Error en la conversion del String')
  else
    begin
      { Truncamos para asignar la parte entera del Numero ingresado }
      parteEntera := Trunc(dNumero);
      { Restamos para obtener solo la parte Decimal del Numero }
      parteDecimal:= (dNumero - parteEntera);
      {}
      parteEnteraConv:=Numero.conversion(baseLlegada,parteEntera);
      {}
      parteDecimalConv:=Numero.multReiterada(parteDecimal,baseLlegada);
      {}
      sNumeroConv:=parteEnteraConv+','+parteDecimalConv;
      { Normalizamos el Numero Convertido y lo guardamos como un String }
      sNumeroNormalizado:=Numero.normalizar(parteEnteraConv,parteDecimalConv,baseLlegada);


    end;

    // Muestas en la Interfaz
    LabelNumberConvert.Caption:=sNumeroConv;
    LabelShowBase.Caption:=sBase+') =';
    LabelShowPFN.Caption:=sNumeroNormalizado;
end;

procedure TFormMainErroes.ComboBoxBaseChange(Sender: TObject);
begin
  { Asignamos el valor de la Base del ComboBox }
  case ComboBoxBase.ItemIndex of
       0 : sBase:='2';
       1 : sBase:='3';
       2 : sBase:='4';
       3 : sBase:='5';
       4 : sBase:='6';
       5 : sBase:='7';
       6 : sBase:='8';
       7 : sBase:='9';
       8 : sBase:='10';
       9 : sBase:='11';
       10 : sBase:='12';
       11 : sBase:='13';
       12 : sBase:='14';
       13 : sBase:='15';
       14 : sBase:='16';
  end;
end;

end.

