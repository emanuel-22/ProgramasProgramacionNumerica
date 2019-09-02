unit FuncionesTP2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, GrafFuncion, uFuncion, DiffExpress, UCalRaiz;

type
  TFormMainFunciones = class(TForm)
    MainMenu: TMainMenu;
    MenuArchivo: TMenuItem;
    MenuAyuda: TMenuItem;
    MenuItemBiseccion: TMenuItem;
    PanelMetBiseccion: TPanel;
    LabelFuncion: TLabel;
    EditFuncion: TEdit;
    Graficador1: TGraficador;
    ButtonGraficarBis: TButton;
    ButtonZoomInBis: TButton;
    LabelTitle: TLabel;
    ButtonCancelarBis: TButton;
    LabelActGraficador: TLabel;
    LabeMaxX: TLabel;
    LabelMaxY: TLabel;
    LabelMinX: TLabel;
    LabelMinY: TLabel;
    EditMaxX: TEdit;
    EditMaxY: TEdit;
    EditMinX: TEdit;
    EditMinY: TEdit;
    ButtonActualizarGraficadorBis: TButton;
    ButtonZoomOutBis: TButton;
    LabelTitleRaiz: TLabel;
    LabelIntervalo: TLabel;
    LabelError: TLabel;
    EditInfBiseccion: TEdit;
    EditError: TEdit;
    PanelDatosRaiz: TPanel;
    ButtonCalRaizBis: TButton;
    ButtonLimpiarBis: TButton;
    PanelMuestraResult: TPanel;
    LabelMuestraResult: TLabel;
    LabelShowIntervalo: TLabel;
    LabelShowRaiz: TLabel;
    MenuItemSalir: TMenuItem;
    LabelDerivada: TLabel;
    LabelShowDerivada: TLabel;
    LabelCantIter: TLabel;
    LabelShowCantIter: TLabel;
    LabelFuncEval: TLabel;
    ButtonEvaluarPto: TButton;
    EditFuncEval: TEdit;
    LabelShowPtoEval: TLabel;
    LabelInfBiseccion: TLabel;
    LabelSupBiseccion: TLabel;
    EditSupBiseccion: TEdit;
    procedure MenuItemBiseccionClick(Sender: TObject);
    procedure ButtonGraficarBisClick(Sender: TObject);
    procedure ButtonZoomInBisClick(Sender: TObject);
    procedure ButtonActualizarGraficadorBisClick(Sender: TObject);
    procedure ButtonCancelarBisClick(Sender: TObject);
    procedure ButtonZoomOutBisClick(Sender: TObject);
    procedure MenuItemSalirClick(Sender: TObject);
    procedure ButtonCalRaizBisClick(Sender: TObject);
    procedure ButtonEvaluarPtoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainFunciones: TFormMainFunciones;
  FuncionRaiz:TCalRaiz;
  Funcion:TFuncion;
  sIntervalo,sError: string;
  a,b:extended;
  e:integer;
implementation

{$R *.dfm}

{ Hacemos Visibles los paneles para que podamos trabajar con el Método de Bisección. }
procedure TFormMainFunciones.MenuItemBiseccionClick(Sender: TObject);
begin
     PanelMetBiseccion.Visible:=true;
     PanelDatosRaiz.Visible:=true;
     PanelMuestraResult.Visible:=true;
end;

{======================= BOTON "GRAFICAR" =======================}
procedure TFormMainFunciones.ButtonGraficarBisClick(Sender: TObject);
var
   sFuncion:string;
begin
     sFuncion:=EditFuncion.Text;
     Graficador1.formula:=sFuncion;
     Funcion:=TFuncion.Crear;
     Funcion.Formula:=Graficador1.formula;
end;
{======================= BOTON "GRAFICAR" =======================}

{ ====================== BOTON "ZOOM (+)" ===========================}
procedure TFormMainFunciones.ButtonZoomInBisClick(Sender: TObject);
begin
     Graficador1.zoomOut;
end;
{ ====================== BOTON "ZOOM (+)" ===========================}

{ ====================== BOTON "ZOOM (-)" ===========================}
procedure TFormMainFunciones.ButtonZoomOutBisClick(Sender: TObject);
begin
     Graficador1.zoomIn;
end;
{ ====================== BOTON "ZOOM (-)" ===========================}

procedure TFormMainFunciones.ButtonActualizarGraficadorBisClick(Sender: TObject);
var
   sMaxX, sMaxy, sMinX, sMinY: string;
   dMaxX, dMaxy, dMinX, dMinY: double;
   e:integer;
begin
     { Tomamos los datos de los Edit y actulizamos los atributos del Graficador }
     { Valores maximos de los ejes x e y }
     sMaxX:=EditMaxX.Text;Val(sMaxX,dMaxX,e);
     sMaxy:=EditMaxY.Text;Val(sMaxy,dMaxy,e);
     { Valores minimos de los ejes x e y }
     sMinX:=EditMinX.Text;Val(sMinX,dMinX,e);
     sMinY:=EditMinY.Text;Val(sMinY,dMinY,e);
     { Ahora seteamos los valores dados}
     Graficador1.maxX:=dMaxX;
     Graficador1.maxY:=dMaxy;
     Graficador1.minX:=dMinX;
     Graficador1.minY:=dMinY;
end;

procedure TFormMainFunciones.ButtonCancelarBisClick(Sender: TObject);
begin
     { Al cancelar solo cerramos el panel haciendolo no visible }
     PanelMetBiseccion.Visible:=false;
     PanelDatosRaiz.Visible:=false;
     PanelMuestraResult.Visible:=false;
     { Liberamos la Memoria }
     Graficador1.Destroy;
     FuncionRaiz.Destroy;
     Funcion.Destroy;
end;

{ Al salir de programa principal, destruimos todos los objetos del graficador y cerramos. }
procedure TFormMainFunciones.MenuItemSalirClick(Sender: TObject);
begin
     Graficador1.Destroy;
     FuncionRaiz.Destroy;
     Funcion.Destroy;
     FormMainFunciones.Close;
end;

procedure TFormMainFunciones.ButtonCalRaizBisClick(Sender: TObject);
var
   eRaiz:extended;
   bIter:byte;
   sIter:string;
begin
     FuncionRaiz := TCalRaiz.Create;
     { Asignamos los valores de los intervalos }
     a := StrToFloat(EditInfBiseccion.Text);
     b := StrToFloat(EditSupBiseccion.Text);
     { Asignamos el valor del error }
     { Calculamos la Raiz de la Funcion creada con sus datos }
     //eRaiz:=FuncionRaiz.biseccion(Funcion,a,b,StrToFloat(EditError.Text));
     { Mostramos los datos en el panel de Resultados}
     LabelShowIntervalo.Caption:='Intervalo = ('+FloatToStrF( a, ffNumber, 2, 2 )+','+FloatToStrF( b, ffNumber, 2, 2 )+')';
     //LabelShowRaiz.Caption:=FloatToStrF( eRaiz, ffNumber, 4, 5 );
     bIter:=FuncionRaiz.NroInteraciones;
     Str(bIter,sIter);
     LabelShowCantIter.Caption:=sIter;
     { Mostramos el contenido Derivada }
     LabelShowDerivada.Caption:=Graficador1.Derivada;
end;

procedure TFormMainFunciones.ButtonEvaluarPtoClick(Sender: TObject);
var
   ePunto, eFuncEval:extended;
   sPunto:string;
begin
     sPunto:=EditFuncEval.Text;
     Val(sPunto,ePunto,e);
     eFuncEval:=Graficador1.f(ePunto);
     LabelShowPtoEval.Caption:=FormatFloat('0.####', eFuncEval);
end;

end.
