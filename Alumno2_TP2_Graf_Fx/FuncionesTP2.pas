unit FuncionesTP2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, GrafFuncion, uFuncion, DiffExpress, UCalRaiz;

type
  TFormMainFunciones = class(TForm)
    PanelMetBiseccion: TPanel;
    LabelFuncionBis: TLabel;
    EditFuncionBis: TEdit;
    ButtonGraficarBis: TButton;
    ButtonZoomInBis: TButton;
    LabelTitleBis1: TLabel;
    ButtonCancelarBis: TButton;
    LabelActGraficador: TLabel;
    LabeMaxXBis: TLabel;
    LabelMaxYBis: TLabel;
    LabelMinXBis: TLabel;
    LabelMinYBis: TLabel;
    EditMaxXBis: TEdit;
    EditMaxYBis: TEdit;
    EditMinXBis: TEdit;
    EditMinYBis: TEdit;
    ButtonActualizarGraficadorBis: TButton;
    ButtonZoomOutBis: TButton;
    LabelTitleRaizBis: TLabel;
    LabelIntervaloBis: TLabel;
    LabelErrorBis: TLabel;
    EditInfBiseccion: TEdit;
    EditErrorBis: TEdit;
    PanelDatosRaizBiseccion: TPanel;
    ButtonCalRaizBis: TButton;
    ButtonLimpiarBis: TButton;
    PanelMuestraResultBiseccion: TPanel;
    LabelMuestraResultBis: TLabel;
    LabelIntervaloBiseccion: TLabel;
    LabelShowRaizBis: TLabel;
    LabelDerivadaBis: TLabel;
    LabelShowDerivadaBis: TLabel;
    LabelCantIterBis: TLabel;
    LabelShowCantIterBis: TLabel;
    LabelInfBiseccion: TLabel;
    LabelSupBiseccion: TLabel;
    EditSupBiseccion: TEdit;
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
    LabelIntervaloSecante: TLabel;
    LabelIngIntSecante: TLabel;
    EditInfSecante: TEdit;
    LabelInfSecante: TLabel;
    LabelSupSecante: TLabel;
    EditSupSecante: TEdit;
    PanelMetNewton: TPanel;
    LabelIngFuncionNewton: TLabel;
    LabelTitleNewton1: TLabel;
    LabelActGrafNewton: TLabel;
    LabelMaxXNewton: TLabel;
    LabelMaxYNewton: TLabel;
    LabelMinXNewton: TLabel;
    LabelMinYNewton: TLabel;
    EditFuncionNewton: TEdit;
    ButtonGraficarFuncNewton: TButton;
    ButtonZoomInNewton: TButton;
    ButtonCancelarNewton: TButton;
    EditMaxXNewton: TEdit;
    EditMaxYNewton: TEdit;
    EditMinXNewton: TEdit;
    EditMinYNewton: TEdit;
    ButtonActGrafNewton: TButton;
    ButtonZoomOut: TButton;
    PanelDatosRaizNewton: TPanel;
    LabelTilteNewton2: TLabel;
    Label10: TLabel;
    EditErrorNewton: TEdit;
    ButtonCalRaizNewton: TButton;
    ButtonLimpiarNewton: TButton;
    PanelMuestraResultNewton: TPanel;
    LabelTitleNewton3: TLabel;
    LabelRaizAproxNewton: TLabel;
    LabelDerivadaNewton: TLabel;
    LabelShowDerivadaNewton: TLabel;
    LabelCantIterNewton: TLabel;
    LabelShowCantIterNewton: TLabel;
    PanelMetRegFalsiMod: TPanel;
    LabelIngFuncRegFalsiMod: TLabel;
    LabelTitleRegFalsiMod1: TLabel;
    LabelActGrafRegFalsiMod: TLabel;
    LabelMaxXRegFalsiMod: TLabel;
    LabelMaxYRegFalsiMod: TLabel;
    LabelMinXRegFalsiMod: TLabel;
    LabelMinYRegFalsiMod: TLabel;
    EditFuncionRegFalsiMod: TEdit;
    ButtonGraficarRegFalsiMod: TButton;
    ButtonZoomInRegFalsiMod: TButton;
    ButtonCancelarRegFalsiMod: TButton;
    EditMaxXRegFalsiMod: TEdit;
    EditMaxYRegFalsiMod: TEdit;
    EditMinXRegFalsiMod: TEdit;
    EditMinYRegFalsiMod: TEdit;
    ButtonActDatosRegFalsiMod: TButton;
    ButtonZoomOutRegFalsiMod: TButton;
    PanelDatosRaizRegFalsiMod: TPanel;
    LabelTitleRegFalsiMod2: TLabel;
    LabelErrorRegFalsiMod: TLabel;
    LabelIntervaloRegFalsiMod: TLabel;
    LabelInfRegFalsiMod: TLabel;
    LabelSupRegFalsiMod: TLabel;
    EditErrorRegFalsiMod: TEdit;
    ButtonCalRaizRegFalsiMod: TButton;
    ButtonLimpiarRegFalsiMod: TButton;
    EditInfRegFalsiMod: TEdit;
    EditSupRegFalsiMod: TEdit;
    PanelMuestraResultRegFalsiMod: TPanel;
    LabelTitleRegFalsiMod3: TLabel;
    LabelRaizAproxRegFalsiMod: TLabel;
    LabelDerivada: TLabel;
    LabelShowDerivadaRegFalsiMod: TLabel;
    LabelCantIterRegFalsiMod: TLabel;
    LabelShowCantIterRegFalsiMod: TLabel;
    LabelShowErrorRegFalsiMod: TLabel;
    LabelShowIntervaloRegFalsiMod: TLabel;
    LabelRaizInicialNewton: TLabel;
    EditRaizInicialNewton: TEdit;
    LabelShowEstimacionNewton: TLabel;
    MainMenu: TMainMenu;
    MenuArchivo: TMenuItem;
    MenuItemBiseccion: TMenuItem;
    MenuItemSecante: TMenuItem;
    MenuItemNewton: TMenuItem;
    MenuAyuda: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemRegFalsiMod: TMenuItem;
    MenuItemSalir: TMenuItem;
    PanelMetRegFalsi: TPanel;
    LabelIngFuncionRegFalsi: TLabel;
    LabelTitleRegFalsi1: TLabel;
    LabelActGrafRegFalsi: TLabel;
    LabelMaxXRegFalsi: TLabel;
    LabelMaxYRegFalsi: TLabel;
    LabelMinXRegFalsi: TLabel;
    LabelMinYRegFalsi: TLabel;
    EditFuncionRegFalsi: TEdit;
    ButtonGraficarRegFalsi: TButton;
    ButtonZoomInRegFalse: TButton;
    EditMaxXRegFalsi: TEdit;
    EditMaxYRegFalsi: TEdit;
    EditMinXRegFalsi: TEdit;
    EditMinYRegFalsi: TEdit;
    ButtonActualizarGraficadorRegFalsi: TButton;
    ButtonZoomOutRegFalsi: TButton;
    PanelDatosRaizRegFalsi: TPanel;
    LabelTitleRegFalsi2: TLabel;
    LabelIngErrorRegFalsi: TLabel;
    LabelIngIntervaloRegFalsi: TLabel;
    LabelInfRegFalsi: TLabel;
    LabelSupRegFalsi: TLabel;
    EditErrorRegFalsi: TEdit;
    ButtonCalRaizRegFalsi: TButton;
    ButtonLimpiarRegFalsi: TButton;
    EditInfRegFalsi: TEdit;
    EditSupRegFalsi: TEdit;
    PanelMuestraResultRegFalsi: TPanel;
    LabelTitleRegFalsi3: TLabel;
    LabelRaizAproxRegFalsi: TLabel;
    LabelDerivadaRegFalsi: TLabel;
    LabelShowDerivadaRegFalsi: TLabel;
    LabelCantIterRegFalsi: TLabel;
    LabelShowCantIterRegFalsi: TLabel;
    LabelShowErrorRegFalsi: TLabel;
    LabelShowIntervaloRegFalsi: TLabel;
    ButtonCancelarRegFalsi: TButton;
    MenuItemRegulaFalsi: TMenuItem;
    GraficadorBiseccion: TGraficador;
    GraficadorSecante: TGraficador;
    GraficadorRegFalsi: TGraficador;
    GraficadorRegFalsiMod: TGraficador;
    GraficadorNewton: TGraficador;

    procedure MenuItemBiseccionClick(Sender: TObject);
    procedure ButtonGraficarBisClick(Sender: TObject);
    procedure ButtonZoomInBisClick(Sender: TObject);
    procedure ButtonActualizarGraficadorBisClick(Sender: TObject);
    procedure ButtonCancelarBisClick(Sender: TObject);
    procedure ButtonZoomOutBisClick(Sender: TObject);
    procedure MenuItemSalirClick(Sender: TObject);
    procedure ButtonCalRaizBisClick(Sender: TObject);
    procedure MenuItemSecanteClick(Sender: TObject);
    procedure ButtonGraficarFuncSecClick(Sender: TObject);
    procedure ButtonCalcularRaizSecanteClick(Sender: TObject);
    procedure ButtonZoomInGrafSecClick(Sender: TObject);
    procedure ButtonZoomOutGrafSecClick(Sender: TObject);
    procedure ButtonActDatosGrafSecClick(Sender: TObject);
    procedure EditFuncionSecanteKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCancelarSecClick(Sender: TObject);
    procedure ButtonGraficarFuncNewtonClick(Sender: TObject);
    procedure ButtonCalRaizNewtonClick(Sender: TObject);
    procedure MenuItemNewtonClick(Sender: TObject);
    procedure ButtonCancelarNewtonClick(Sender: TObject);
    procedure ButtonActGrafNewtonClick(Sender: TObject);
    procedure ButtonZoomInNewtonClick(Sender: TObject);
    procedure ButtonZoomOutClick(Sender: TObject);
    procedure ButtonLimpiarNewtonClick(Sender: TObject);
    procedure ButtonGraficarRegFalsiModClick(Sender: TObject);
    procedure ButtonCancelarRegFalsiModClick(Sender: TObject);
    procedure ButtonActDatosRegFalsiModClick(Sender: TObject);
    procedure ButtonZoomInRegFalsiModClick(Sender: TObject);
    procedure ButtonZoomOutRegFalsiModClick(Sender: TObject);
    procedure ButtonCalRaizRegFalsiModClick(Sender: TObject);
    procedure MenuItemRegFalsiModClick(Sender: TObject);
    procedure ButtonGraficarRegFalsiClick(Sender: TObject);
    procedure ButtonCancelarRegFalsiClick(Sender: TObject);
    procedure ButtonActualizarGraficadorRegFalsiClick(Sender: TObject);
    procedure ButtonZoomInRegFalseClick(Sender: TObject);
    procedure ButtonZoomOutRegFalsiClick(Sender: TObject);
    procedure ButtonCalRaizRegFalsiClick(Sender: TObject);
    procedure MenuItemRegulaFalsiClick(Sender: TObject);
    procedure EditFuncionRegFalsiModKeyPress(Sender: TObject;
      var Key: Char);
    procedure EditFuncionNewtonKeyPress(Sender: TObject; var Key: Char);
    procedure EditFuncionBisKeyPress(Sender: TObject; var Key: Char);
    procedure EditFuncionRegFalsiKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMainFunciones: TFormMainFunciones;
  Funcion1,Funcion2,Funcion3,Funcion4,Funcion5:TCalRaiz;

implementation

{$R *.dfm}

{************************************** Método de Bisección ************************************************************}
{ Hacemos Visibles los paneles para que podamos trabajar con el Método de Bisección. }
procedure TFormMainFunciones.MenuItemBiseccionClick(Sender: TObject);
begin
     FormMainFunciones.ButtonCancelarSecClick(Sender);
     FormMainFunciones.ButtonCancelarNewtonClick(Sender);
     FormMainFunciones.ButtonCancelarRegFalsiModClick(Sender);
     PanelMetBiseccion.Visible:=true;
     PanelDatosRaizBiseccion.Visible:=true;
     PanelMuestraResultBiseccion.Visible:=true;
end;

{======================= BOTON "GRAFICAR" =======================}
{ Para visuliar la Grafica solo asignamos una Formula y seteamos  }
procedure TFormMainFunciones.ButtonGraficarBisClick(Sender: TObject);
begin
     { Asignamos la Formula de la Funcion a la Propiedad del Objeto  }
     GraficadorBiseccion.formula:=EditFuncionBis.Text;
end;
{======================= BOTON "GRAFICAR" =======================}

{ ====================== BOTON "ZOOM (+)" ===========================}
procedure TFormMainFunciones.ButtonZoomInBisClick(Sender: TObject);
begin
     GraficadorBiseccion.zoomOut;
end;
{ ====================== BOTON "ZOOM (+)" ===========================}

{ ====================== BOTON "ZOOM (-)" ===========================}
procedure TFormMainFunciones.ButtonZoomOutBisClick(Sender: TObject);
begin
     GraficadorBiseccion.zoomIn;
end;
{ ====================== BOTON "ZOOM (-)" ===========================}

{ ====================== BOTON "CALCULAR RAIZ" ===========================}
procedure TFormMainFunciones.ButtonCalRaizBisClick(Sender: TObject);
begin
     Funcion1.Free;
     { Instaciamos un Objeto de la Clase TCalRaiz }
     Funcion1 := TCalRaiz.Create;
     { Asignamos los valores de los intervalos }
     Funcion1.Infimo := StrToFloat(EditInfBiseccion.Text);
     Funcion1.Supremo := StrToFloat(EditSupBiseccion.Text);
     { Asignamos el valor del error  }
     Funcion1.ErrorRaiz := StrToFloat(EditErrorBis.Text);
     { Calculamos la Raiz de la Funcion creada con sus datos }
     { Graficado1 contiene la Formula de la Función Ingresada }
     Funcion1.biseccion(GraficadorBiseccion);
     { Mostramos los datos en el panel de Resultados}
     LabelIntervaloBiseccion.Caption:='Intervalo = ('+FloatToStrF( Funcion1.Infimo, ffNumber, 2, 2 )+','+FloatToStrF( Funcion1.Supremo, ffNumber, 2, 2 )+')';
     LabelShowRaizBis.Caption:='Raiz Aproximada = '+FloatToStrF( Funcion1.RaizAproxmida, ffNumber, 4, 7 );
     LabelShowCantIterBis.Caption:=IntToStr(Funcion1.NroInteraciones);
     { Mostramos el contenido Derivada }
     LabelShowDerivadaBis.Caption:=GraficadorBiseccion.Derivada;
end;
{ ====================== BOTON "CALCULAR RAIZ" ===========================}

{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}
procedure TFormMainFunciones.ButtonActualizarGraficadorBisClick(Sender: TObject);
begin
     GraficadorBiseccion.maxX:=StrToFloat(EditMaxXBis.Text);
     GraficadorBiseccion.maxY:=StrToFloat(EditMaxYBis.Text);
     GraficadorBiseccion.minX:=StrToFloat(EditMinXBis.Text);
     GraficadorBiseccion.minY:=StrToFloat(EditMinYBis.Text);
end;
{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}

{ ====================== BOTON "CANCELAR" ===========================}
procedure TFormMainFunciones.ButtonCancelarBisClick(Sender: TObject);
begin
     { Al cancelar solo cerramos el panel haciendolo no visible }
     PanelMetBiseccion.Visible:=false;
     PanelDatosRaizBiseccion.Visible:=false;
     PanelMuestraResultBiseccion.Visible:=false;
     { Liberamos la Memoria }
     Funcion1.Free;
end;
{ ====================== BOTON "CANCELAR" ===========================}

procedure TFormMainFunciones.EditFuncionBisKeyPress(Sender: TObject;var Key: Char);
begin
  if (Key = #13) then  {#13 "Enter"}
    FormMainFunciones.ButtonGraficarBisClick(Sender);
end;

{************************************** Método de Bisección ************************************************************}


{************************************** Método de la Secante ************************************************************}
{ Hacemos Visibles los paneles para que podamos trabajar con el Método de la Secante. }
procedure TFormMainFunciones.MenuItemSecanteClick(Sender: TObject);
begin
     FormMainFunciones.ButtonCancelarBisClick(Sender);
     FormMainFunciones.ButtonCancelarNewtonClick(Sender);
     FormMainFunciones.ButtonCancelarRegFalsiModClick(Sender);
     PanelMetSecante.Visible:=true;
     PanelCalRaizSecante.Visible:=true;
     PanelResultSecante.Visible:=true;
end;

{======================= BOTON "GRAFICAR" =======================}
procedure TFormMainFunciones.ButtonGraficarFuncSecClick(Sender: TObject);
begin
     { Asignamos la Funcion al Graficador}
     GraficadorSecante.formula := EditFuncionSecante.Text;
end;
{======================= BOTON "GRAFICAR" =======================}

{ ====================== BOTON "ZOOM (+)" ===========================}
procedure TFormMainFunciones.ButtonZoomInGrafSecClick(Sender: TObject);
begin
  GraficadorSecante.zoomOut;
end;
{ ====================== BOTON "ZOOM (+)" ===========================}

{ ====================== BOTON "ZOOM (-)" ===========================}
procedure TFormMainFunciones.ButtonZoomOutGrafSecClick(Sender: TObject);
begin
  GraficadorSecante.zoomIn;
end;
{ ====================== BOTON "ZOOM (-)" ===========================}

{ ====================== BOTON "CALCULAR RAIZ" ===========================}
procedure TFormMainFunciones.ButtonCalcularRaizSecanteClick(Sender: TObject);
begin
     Funcion2.Free;
     { Instaciamos un Objeto de la Clase TCalRaiz }
     Funcion2 := TCalRaiz.Create;
     { Asignamos los valores de los intervalos }
     Funcion2.Infimo := StrToFloat(EditInfSecante.Text);
     Funcion2.Supremo := StrToFloat(EditSupSecante.Text);
     { Asignamos el valor del error  }
     Funcion2.ErrorRaiz := StrToFloat(EditErrorSecante.Text);
     Funcion2.PtoXO := StrToFloat(EditPtoX0Secante.Text);
     { Calculamos la Raiz de la Funcion creada con sus datos }
     { GraficadorSecante contiene la Formula de la Función Ingresada }
     Funcion2.secante(GraficadorSecante);
     { Mostramos los datos en el panel de Resultados}
     LabelIntervaloSecante.Caption:='Intervalo = ( '+FloatToStrF( Funcion2.Infimo, ffNumber, 2, 2 )+','+FloatToStrF( Funcion2.Supremo, ffNumber, 2, 2 )+')';
     LabelShowPtoX0Secante.Caption:='Punto x0 = '+FloatToStr(Funcion2.PtoXO);
     LabelRaizAproxSecante.Caption:='Raiz Aproximada = '+FloatToStrF( Funcion2.RaizAproxmida, ffNumber, 4, 7 );
     LabelShowCantIterSecante.Caption:=IntToStr(Funcion2.NroInteraciones);
     { Mostramos el contenido Derivada }
     LabelShowDerivadaSecante.Caption:=GraficadorSecante.Derivada;
end;
{ ====================== BOTON "CALCULAR RAIZ" ===========================}

{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}
procedure TFormMainFunciones.ButtonActDatosGrafSecClick(Sender: TObject);
begin
     { Tomamos los datos de los Edit y actulizamos los atributos del Graficador }
     { Ahora seteamos los valores dados}
     GraficadorSecante.maxX:=StrToFloat(EditMaxXGrafSec.Text);
     GraficadorSecante.maxY:=StrToFloat(EditMaxYGrafSec.Text);
     GraficadorSecante.minX:=StrToFloat(EditMinXGrafSec.Text);
     GraficadorSecante.minY:=StrToFloat(EditMinYGrafSec.Text);
end;
{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}

{ ====================== BOTON "CANCELAR" ===========================}
procedure TFormMainFunciones.ButtonCancelarSecClick(Sender: TObject);
begin
  PanelMetSecante.Visible:=false;
  PanelCalRaizSecante.Visible:=false;
  PanelResultSecante.Visible:=false;
  Funcion2.Free;
end;
{ ====================== BOTON "CANCELAR" ===========================}

{ ====================== BOTON "LIMPIAR" ===========================}

{ ====================== BOTON "LIMPIAR" ===========================}

procedure TFormMainFunciones.EditFuncionSecanteKeyPress(Sender: TObject;var Key: Char);
begin
  if (Key = #13) then  {#13 "Enter"}
    FormMainFunciones.ButtonGraficarFuncSecClick(Sender);
end;

{************************************** Método de la Secante ************************************************************}


{************************************** Método de la Newton ************************************************************}
{ Hacemos Visibles los paneles para que podamos trabajar con el Método de Newton. }
procedure TFormMainFunciones.MenuItemNewtonClick(Sender: TObject);
begin
  FormMainFunciones.ButtonCancelarBisClick(Sender);
  FormMainFunciones.ButtonCancelarSecClick(Sender);
  FormMainFunciones.ButtonCancelarRegFalsiModClick(Sender);
  PanelMetNewton.Visible:=true;
  PanelDatosRaizNewton.Visible:=true;
  PanelMuestraResultNewton.Visible:=true;
end;
{======================= BOTON "GRAFICAR" =======================}
procedure TFormMainFunciones.ButtonGraficarFuncNewtonClick(
  Sender: TObject);
begin
  { Asignamos la Funcion al Graficador}
  GraficadorNewton.formula:=EditFuncionNewton.Text;
end;
{======================= BOTON "GRAFICAR" =======================}

{ ====================== BOTON "ZOOM (+)" ===========================}
procedure TFormMainFunciones.ButtonZoomInNewtonClick(Sender: TObject);
begin
  GraficadorNewton.zoomOut;
end;
{ ====================== BOTON "ZOOM (+)" ===========================}

{ ====================== BOTON "ZOOM (-)" ===========================}
 procedure TFormMainFunciones.ButtonZoomOutClick(Sender: TObject);
begin
  GraficadorNewton.zoomIn;
end;
{ ====================== BOTON "ZOOM (-)" ===========================}

{ ====================== BOTON "CALCULAR RAIZ" ===========================}
procedure TFormMainFunciones.ButtonCalRaizNewtonClick(Sender: TObject);
begin
  Funcion3.Destroy;
  { Instaciamos un Objeto de la Clase TCalRaiz }
  Funcion3 := TCalRaiz.Create;
  { Asignamos el valor del error  }
  Funcion3.ErrorRaiz := StrToFloat(EditErrorNewton.Text);
  { Asignamoso la Estimacion inicial de la Raiz}
  Funcion3.PtoXO := StrToFloat(EditRaizInicialNewton.Text);
  { Calculamos la Raiz de la Funcion creada con sus datos }
  { GraficadorSecante contiene la Formula de la Función Ingresada }
  Funcion3.newton(GraficadorNewton);
  { Mostramos los datos en el panel de Resultados};
  LabelShowEstimacionNewton.Caption:='Estimación Inicial de la Raiz = '+FloatToStr(Funcion3.PtoXO);
  LabelRaizAproxNewton.Caption:='Raiz Aproximada = '+FloatToStrF( Funcion3.RaizAproxmida, ffNumber, 4, 7 );
  LabelShowCantIterNewton.Caption:=IntToStr(Funcion3.NroInteraciones);
  { Mostramos el contenido Derivada }
  LabelShowDerivadaNewton.Caption:=GraficadorNewton.Derivada;
end;
{ ====================== BOTON "CALCULAR RAIZ" ===========================}

{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}
procedure TFormMainFunciones.ButtonActGrafNewtonClick(Sender: TObject);
begin
   { Tomamos los datos de los Edit y actulizamos los atributos del Graficador }
   { Ahora seteamos los valores dados}
   GraficadorNewton.maxX:=StrToFloat(EditMaxXNewton.Text);
   GraficadorNewton.maxY:=StrToFloat(EditMaxYNewton.Text);
   GraficadorNewton.minX:=StrToFloat(EditMinXNewton.Text);
   GraficadorNewton.minY:=StrToFloat(EditMinYNewton.Text);
end;
{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}

{ ====================== BOTON "CANCELAR" ===========================}
procedure TFormMainFunciones.ButtonCancelarNewtonClick(Sender: TObject);
begin
  PanelMetNewton.Visible:=false;
  PanelDatosRaizNewton.Visible:=false;
  PanelMuestraResultNewton.Visible:=false;
  Funcion3.Free;
end;
{ ====================== BOTON "CANCELAR" ===========================}

{ ====================== BOTON "LIMPIAR" ===========================}
procedure TFormMainFunciones.ButtonLimpiarNewtonClick(Sender: TObject);
begin
  { Limpiamos los datos de los paneles}
  EditErrorNewton.Text:='';
  EditRaizInicialNewton.Text:='';
  LabelRaizInicialNewton.Caption:='Estimación Inical de la Raiz = ';
  LabelRaizAproxNewton.Caption:='Raíz Aproximada = ';
  LabelShowCantIterNewton.Caption:='';
  LabelShowDerivadaNewton.Caption:='';
end;
{ ====================== BOTON "LIMPIAR" ===========================}

procedure TFormMainFunciones.EditFuncionNewtonKeyPress(Sender: TObject;var Key: Char);
begin
  if (Key = #13) then  {#13 "Enter"}
    FormMainFunciones.ButtonGraficarFuncNewtonClick(Sender);
end;
{************************************** Método de la Newton ************************************************************}


{************************************** Método Regula Falsi Modificado ************************************************************}
procedure TFormMainFunciones.MenuItemRegFalsiModClick(Sender: TObject);
begin
  FormMainFunciones.ButtonCancelarBisClick(Sender);
  FormMainFunciones.ButtonCancelarSecClick(Sender);
  FormMainFunciones.ButtonCancelarNewtonClick(Sender);
  PanelMetRegFalsiMod.Visible:=true;
  PanelDatosRaizRegFalsiMod.Visible:=true;
  PanelMuestraResultRegFalsiMod.Visible:=true;
end;

{======================= BOTON "GRAFICAR" =======================}
procedure TFormMainFunciones.ButtonGraficarRegFalsiModClick(Sender: TObject);
begin
  GraficadorRegFalsiMod.formula:=EditFuncionRegFalsiMod.Text;
end;
{======================= BOTON "GRAFICAR" =======================}

{ ====================== BOTON "ZOOM (+)" ===========================}
procedure TFormMainFunciones.ButtonZoomInRegFalsiModClick(Sender: TObject);
begin
  GraficadorRegFalsiMod.zoomOut;
end;
{ ====================== BOTON "ZOOM (+)" ===========================}

{ ====================== BOTON "ZOOM (-)" ===========================}
procedure TFormMainFunciones.ButtonZoomOutRegFalsiModClick(Sender: TObject);
begin
  GraficadorRegFalsiMod.zoomIn;
end;
{ ====================== BOTON "ZOOM (-)" ===========================}

{ ====================== BOTON "CALCULAR RAIZ" ===========================}
procedure TFormMainFunciones.ButtonCalRaizRegFalsiModClick(Sender: TObject);
begin
  Funcion4.Free;
  { Instaciamos un Objeto de la Clase TCalRaiz }
  Funcion4 := TCalRaiz.Create;
  { Asignamos los valores de los intervalos }
  Funcion4.Infimo := StrToFloat(EditInfRegFalsiMod.Text);
  Funcion4.Supremo := StrToFloat(EditSupRegFalsiMod.Text);
  { Asignamos el valor del error  }
  Funcion4.ErrorRaiz := StrToFloat(EditErrorRegFalsiMod.Text);
  { Calculamos la Raiz de la Funcion creada con sus datos }
  { GraficadorSecante contiene la Formula de la Función Ingresada }
  Funcion4.regulaFalsiModificada(GraficadorRegFalsiMod);
  { Mostramos los datos en el panel de Resultados}
  LabelIntervaloSecante.Caption:='Intervalo = ( '+FloatToStrF( Funcion4.Infimo, ffNumber, 2, 2 )+','+FloatToStrF( Funcion4.Supremo, ffNumber, 2, 2 )+')';
  LabelShowErrorRegFalsiMod.Caption:='Error = '+FloatToStr( Funcion4.ErrorRaiz);
  LabelRaizAproxSecante.Caption:='Raiz Aproximada = '+FloatToStrF( Funcion4.RaizAproxmida, ffNumber, 4, 7 );
  LabelShowCantIterSecante.Caption:=IntToStr(Funcion4.NroInteraciones);
  { Mostramos el contenido Derivada }
  LabelShowDerivadaSecante.Caption:=GraficadorSecante.Derivada;
end;
{ ====================== BOTON "CALCULAR RAIZ" ===========================}

{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}
procedure TFormMainFunciones.ButtonActDatosRegFalsiModClick(Sender: TObject);
begin
   { Tomamos los datos de los Edit y actulizamos los atributos del Graficador }
   { Ahora seteamos los valores dados}
   GraficadorRegFalsiMod.maxX:=StrToFloat(EditMaxXRegFalsiMod.Text);
   GraficadorRegFalsiMod.maxY:=StrToFloat(EditMaxYRegFalsiMod.Text);
   GraficadorRegFalsiMod.minX:=StrToFloat(EditMinXRegFalsiMod.Text);
   GraficadorRegFalsiMod.minY:=StrToFloat(EditMinYRegFalsiMod.Text);
end;
{ ====================== BOTON "ACTUALIZAR GRAFICADOR" ===========================}

{ ====================== BOTON "CANCELAR" ===========================}
procedure TFormMainFunciones.ButtonCancelarRegFalsiModClick(Sender: TObject);
begin
  PanelMetRegFalsiMod.Visible:=false;
  PanelDatosRaizRegFalsiMod.Visible:=false;
  PanelMuestraResultRegFalsiMod.Visible:=false;
  Funcion4.Free;
end;
{ ====================== BOTON "CANCELAR" ===========================}

procedure TFormMainFunciones.EditFuncionRegFalsiModKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then  {#13 "Enter"}
    FormMainFunciones.ButtonGraficarRegFalsiClick(Sender);
end;
{************************************** Método Regula Falsi Modificado ************************************************************}


{************************************** Método Regula Falsi ************************************************************}
procedure TFormMainFunciones.MenuItemRegulaFalsiClick(Sender: TObject);
begin
  { Liberamos la memoria}
  Funcion5.Free;
  { Limpiamos los paneles }
  FormMainFunciones.ButtonCancelarBisClick(Sender);
  FormMainFunciones.ButtonCancelarSecClick(Sender);
  FormMainFunciones.ButtonCancelarNewtonClick(Sender);
  FormMainFunciones.ButtonCancelarRegFalsiModClick(Sender);
  { Mostramos el panel del Metodo a trabajar }
  PanelMetRegFalsi.Visible:=true;
  PanelDatosRaizRegFalsi.Visible:=true;
  PanelMuestraResultRegFalsi.Visible:=true;
end;

{======================= BOTON "GRAFICAR" =======================}
procedure TFormMainFunciones.ButtonGraficarRegFalsiClick(Sender: TObject);
begin
  { Obtenemos la funcion para Graficarla  }
  GraficadorRegFalsi.formula:=EditFuncionRegFalsi.Text;
end;
{======================= BOTON "GRAFICAR" =======================}

procedure TFormMainFunciones.ButtonZoomInRegFalseClick(Sender: TObject);
begin
  GraficadorRegFalsi.zoomOut;
end;

procedure TFormMainFunciones.ButtonZoomOutRegFalsiClick(Sender: TObject);
begin
  GraficadorRegFalsi.zoomIn;
end;

procedure TFormMainFunciones.ButtonCalRaizRegFalsiClick(Sender: TObject);
begin
  Funcion5.Free;
  { Instaciamos un Objeto de la Clase TCalRaiz }
  Funcion5 := TCalRaiz.Create;
  { Asignamos los valores de los intervalos }
  Funcion5.Infimo := StrToFloat(EditInfRegFalsi.Text);
  Funcion5.Supremo := StrToFloat(EditSupRegFalsi.Text);
  { Asignamos el valor del error  }
  Funcion5.ErrorRaiz := StrToFloat(EditErrorRegFalsi.Text);
  { Calculamos la Raiz de la Funcion creada con sus datos }
  { GraficadorSecante contiene la Formula de la Función Ingresada }
  Funcion5.regulaFalsi(GraficadorRegFalsi);
  { Mostramos los datos en el panel de Resultados}
  LabelShowIntervaloRegFalsi.Caption:='Intervalo = ( '+FloatToStrF( Funcion5.Infimo, ffNumber, 2, 1 )+','+FloatToStrF( Funcion5.Supremo, ffNumber, 2, 1 )+')';
  LabelShowErrorRegFalsi.Caption:='Error = '+FloatToStr( Funcion5.ErrorRaiz);
  LabelRaizAproxRegFalsi.Caption:='Raiz Aproximada = '+FloatToStrF( Funcion5.RaizAproxmida, ffNumber, 4, 7 );
  LabelShowCantIterRegFalsi.Caption:=IntToStr(Funcion5.NroInteraciones);
  { Mostramos el contenido Derivada }
  LabelShowDerivadaRegFalsi.Caption:=GraficadorRegFalsi.Derivada;
end;

{ Sale de la Opcion del Menu para dejar la ventana en blanco }
procedure TFormMainFunciones.ButtonCancelarRegFalsiClick(Sender: TObject);
begin
  { Hacemos a todos los paneles del metodo como no visible }
  PanelMetRegFalsi.Visible:=false;
  PanelDatosRaizRegFalsi.Visible:=false;
  PanelMuestraResultRegFalsi.Visible:=false;
  Funcion5.Free;
end;

procedure TFormMainFunciones.ButtonActualizarGraficadorRegFalsiClick(Sender: TObject);
begin
  { Tomamos los datos de los Edit y actulizamos los atributos del Graficador }
   { Ahora seteamos los valores dados}
   GraficadorRegFalsi.maxX:=StrToFloat(EditMaxXRegFalsi.Text);
   GraficadorRegFalsi.maxY:=StrToFloat(EditMaxYRegFalsi.Text);
   GraficadorRegFalsi.minX:=StrToFloat(EditMinXRegFalsi.Text);
   GraficadorRegFalsi.minY:=StrToFloat(EditMinYRegFalsi.Text);
end;

procedure TFormMainFunciones.EditFuncionRegFalsiKeyPress(Sender: TObject;var Key: Char);
begin
  if (Key = #13) then  {#13 "Enter"}
    FormMainFunciones.ButtonGraficarRegFalsiClick(Sender);
end;
{************************************** Método Regula Falsi ************************************************************}

{ ========================================= "MENU SALIR ============================================="}
{ Al salir de programa principal, destruimos todos los objetos del graficador y cerramos. }
procedure TFormMainFunciones.MenuItemSalirClick(Sender: TObject);
begin
     { Liberamos la Memoria}
     Funcion1.Free;Funcion2.Free;Funcion3.Free;Funcion4.Free;Funcion5.Free;
     FormMainFunciones.Close;
end;
{ ========================================= "MENU SALIR ============================================="}

end.
