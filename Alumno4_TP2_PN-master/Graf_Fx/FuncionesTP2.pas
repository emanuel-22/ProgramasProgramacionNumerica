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
    LabelIntervaloBiseccion: TLabel;
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
    MenuItemRFMod: TMenuItem;
    MenuItemSecante: TMenuItem;
    PanelMetSecante: TPanel;
    LabelIngFuncSecante: TLabel;
    LabelTitleSecante: TLabel;
    LabelActGrafSec: TLabel;
    LabelMaxXGrafSec: TLabel;
    LabelMaxYGrafSec: TLabel;
    LabelMinXGrafSec: TLabel;
    LabelMinYGrafSec: TLabel;
    EditFuncionSecante: TEdit;
    ButtonGraficarFuncSec: TButton;
    ButtonZoomInGrafSec: TButton;
    ButtonCancelarSec: TButton;
    EditMaxXGrafSec: TEdit;
    EditMaxYGrafSec: TEdit;
    EditMinXGrafSec: TEdit;
    EditMinYGrafSec: TEdit;
    ButtonActDatosGrafSec: TButton;
    ButtonZoomOutGrafSec: TButton;
    PanelCalRaizSecante: TPanel;
    LabelTitle2Secante: TLabel;
    LabelIngErrorSecante: TLabel;
    EditErrorSecante: TEdit;
    ButtonCalcularRaizSecante: TButton;
    ButtonLimpiarSecante: TButton;
    PanelResultSecante: TPanel;
    LabelTitle3Secante: TLabel;
    LabelRaizAproxSecante: TLabel;
    LabelDerivadaSecante: TLabel;
    LabelShowDerivadaSecante: TLabel;
    LabelCantIterSecante: TLabel;
    LabelShowCantIterSecante: TLabel;
    LabelPtoX0Secante: TLabel;
    EditPtoX0Secante: TEdit;
    LabelShowPtoX0Secante: TLabel;
    GraficadorSecante: TGraficador;
    Graficador1: TGraficador;
    LabelIntervaloSecante: TLabel;
    LabelIngIntSecante: TLabel;
    EditInfSecante: TEdit;
    LabelInfSecante: TLabel;
    LabelSupSecante: TLabel;
    EditSupSecante: TEdit;
    Label1: TLabel;

    procedure MenuItemBiseccionClick(Sender: TObject);
    procedure ButtonGraficarBisClick(Sender: TObject);
    procedure ButtonZoomInBisClick(Sender: TObject);
    procedure ButtonActualizarGraficadorBisClick(Sender: TObject);
    procedure ButtonCancelarBisClick(Sender: TObject);
    procedure ButtonZoomOutBisClick(Sender: TObject);
    procedure MenuItemSalirClick(Sender: TObject);
    procedure ButtonCalRaizBisClick(Sender: TObject);
    procedure ButtonEvaluarPtoClick(Sender: TObject);
    procedure MenuItemSecanteClick(Sender: TObject);
    procedure ButtonGraficarFuncSecClick(Sender: TObject);
    procedure ButtonCalcularRaizSecanteClick(Sender: TObject);
    procedure ButtonZoomInGrafSecClick(Sender: TObject);
    procedure ButtonZoomOutGrafSecClick(Sender: TObject);
    procedure ButtonActDatosGrafSecClick(Sender: TObject);
    procedure EditFuncionSecanteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainFunciones: TFormMainFunciones;
  FuncionRaiz:TCalRaiz;
  sIntervalo: string;
implementation

{$R *.dfm}

{************************************** Método de Bisección ************************************************************}
{ Hacemos Visibles los paneles para que podamos trabajar con el Método de Bisección. }
procedure TFormMainFunciones.MenuItemBiseccionClick(Sender: TObject);
begin
     PanelMetBiseccion.Visible:=true;
     PanelDatosRaiz.Visible:=true;
     PanelMuestraResult.Visible:=true;
end;

{======================= BOTON "GRAFICAR" =======================}
{ Para visuliar la Grafica solo asignamos una Formula y seteamos  }
procedure TFormMainFunciones.ButtonGraficarBisClick(Sender: TObject);
begin
     { Asignamos la Formula de la Funcion a la Propiedad del Objeto  }
     Graficador1.formula:=EditFuncion.Text;
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
begin
     Graficador1.maxX:=StrToFloat(EditMaxX.Text);
     Graficador1.maxY:=StrToFloat(EditMaxY.Text);
     Graficador1.minX:=StrToFloat(EditMinX.Text);
     Graficador1.minY:=StrToFloat(EditMinY.Text);
end;

procedure TFormMainFunciones.ButtonCancelarBisClick(Sender: TObject);
begin
     { Al cancelar solo cerramos el panel haciendolo no visible }
     PanelMetBiseccion.Visible:=false;
     PanelDatosRaiz.Visible:=false;
     PanelMuestraResult.Visible:=false;
     { Liberamos la Memoria }
     FuncionRaiz.Free;
end;

{ Al salir de programa principal, destruimos todos los objetos del graficador y cerramos. }
procedure TFormMainFunciones.MenuItemSalirClick(Sender: TObject);
begin
     { Liberamos la Memoria}
     FuncionRaiz.Free;
     FuncionRaiz.Destroy;
     FormMainFunciones.Close;
end;

procedure TFormMainFunciones.ButtonCalRaizBisClick(Sender: TObject);
begin
     FuncionRaiz.Free;
     { Instaciamos un Objeto de la Clase TCalRaiz }
     FuncionRaiz := TCalRaiz.Create;
     { Asignamos los valores de los intervalos }
     FuncionRaiz.Infimo := StrToFloat(EditInfBiseccion.Text);
     FuncionRaiz.Supremo := StrToFloat(EditSupBiseccion.Text);
     { Asignamos el valor del error  }
     FuncionRaiz.ErrorRaiz := StrToFloat(EditError.Text);
     { Calculamos la Raiz de la Funcion creada con sus datos }
     { Graficado1 contiene la Formula de la Función Ingresada }
     FuncionRaiz.biseccion(Graficador1);
     { Mostramos los datos en el panel de Resultados}
     LabelIntervaloBiseccion.Caption:='Intervalo = ('+FloatToStrF( FuncionRaiz.Infimo, ffNumber, 2, 0 )+','+FloatToStrF( FuncionRaiz.Supremo, ffNumber, 2, 0 )+')';
     LabelShowRaiz.Caption:='Raiz Aproximada = '+FloatToStrF( FuncionRaiz.RaizAproxmida, ffNumber, 4, 7 );
     LabelShowCantIter.Caption:=IntToStr(FuncionRaiz.NroInteraciones);
     { Mostramos el contenido Derivada }
     LabelShowDerivada.Caption:=Graficador1.Derivada;
end;

procedure TFormMainFunciones.ButtonEvaluarPtoClick(Sender: TObject);
begin
     LabelShowPtoEval.Caption:=FloatToStrF( Graficador1.f(StrToFloat(EditFuncEval.Text)), ffNumber, 4, 7 );
end;
{************************************** Método de Bisección ************************************************************}


{************************************** Método de la Secante ************************************************************}
{ Hacemos Visibles los paneles para que podamos trabajar con el Método de la Secante. }
procedure TFormMainFunciones.MenuItemSecanteClick(Sender: TObject);
begin
     PanelMetSecante.Visible:=true;
     PanelCalRaizSecante.Visible:=true;
     PanelResultSecante.Visible:=true;
end;

procedure TFormMainFunciones.ButtonGraficarFuncSecClick(Sender: TObject);
begin
     { Asignamos la Funcion al Graficador}
     GraficadorSecante.formula := EditFuncionSecante.Text;
end;

procedure TFormMainFunciones.ButtonCalcularRaizSecanteClick(Sender: TObject);
begin
     FuncionRaiz.Free;
     { Instaciamos un Objeto de la Clase TCalRaiz }
     FuncionRaiz := TCalRaiz.Create;
     { Asignamos los valores de los intervalos }
     FuncionRaiz.Infimo := StrToFloat(EditInfSecante.Text);
     FuncionRaiz.Supremo := StrToFloat(EditSupSecante.Text);
     { Asignamos el valor del error  }
     FuncionRaiz.ErrorRaiz := StrToFloat(EditErrorSecante.Text);
     FuncionRaiz.PtoXO := StrToFloat(EditPtoX0Secante.Text);
     { Calculamos la Raiz de la Funcion creada con sus datos }
     { GraficadorSecante contiene la Formula de la Función Ingresada }
     FuncionRaiz.secante(GraficadorSecante);
     { Mostramos los datos en el panel de Resultados}
     LabelIntervaloSecante.Caption:='Intervalo = ( '+EditInfSecante.Text+' , '+EditSupSecante.Text+' )';
     LabelShowPtoX0Secante.Caption:='Punto x0 = '+EditPtoX0Secante.Text;
     LabelRaizAproxSecante.Caption:='Raiz Aproximada = '+FloatToStrF( FuncionRaiz.RaizAproxmida, ffNumber, 4, 7 );
     LabelShowCantIterSecante.Caption:=IntToStr(FuncionRaiz.NroInteraciones);
     { Mostramos el contenido Derivada }
     LabelShowDerivadaSecante.Caption:=GraficadorSecante.Derivada;
end;

procedure TFormMainFunciones.ButtonZoomInGrafSecClick(Sender: TObject);
begin
  GraficadorSecante.zoomOut;
end;

procedure TFormMainFunciones.ButtonZoomOutGrafSecClick(Sender: TObject);
begin
  GraficadorSecante.zoomIn;
end;

procedure TFormMainFunciones.ButtonActDatosGrafSecClick(Sender: TObject);
begin
     { Tomamos los datos de los Edit y actulizamos los atributos del Graficador }
     { Ahora seteamos los valores dados}
     GraficadorSecante.maxX:=StrToFloat(EditMaxXGrafSec.Text);
     GraficadorSecante.maxY:=StrToFloat(EditMaxYGrafSec.Text);
     GraficadorSecante.minX:=StrToFloat(EditMinXGrafSec.Text);
     GraficadorSecante.minY:=StrToFloat(EditMinYGrafSec.Text);
end;

procedure TFormMainFunciones.EditFuncionSecanteKeyPress(Sender: TObject;var Key: Char);
begin
  if (Key = #13) then  {#13 "Enter"}
    FormMainFunciones.ButtonGraficarFuncSecClick(Sender);
end;

end.
