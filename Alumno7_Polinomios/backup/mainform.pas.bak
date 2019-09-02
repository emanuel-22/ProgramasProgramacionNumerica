unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, StdCtrls,UPolinomios;

type

  { TMainWindows }

  TMainWindows = class(TForm)
    Button1: TButton;
    ButtonResolverHC: TButton;
    ButtonCancelarHC: TButton;
    ButtonCancelDiv1: TButton;
    ButtonResolverDiv1: TButton;
    ButtonCancelarEvalP: TButton;
    ButtonEvaluarP: TButton;
    EditGradoPRR: TEdit;
    EditPxRR: TEdit;
    EditGrPHC: TEdit;
    EditFormCuad: TEdit;
    EditPxHCuad: TEdit;
    EditGradoP: TEdit;
    EditPolinomioQ: TEdit;
    EditPolinomioP: TEdit;
    EditGr: TEdit;
    EditPtoEvaluar: TEdit;
    EditMostrarResult: TEdit;
    EditPolinomio: TEdit;
    Label1: TLabel;
    LabelMuestraRaices: TLabel;
    LabelIngresePRR: TLabel;
    LabelMuestraRxHC: TLabel;
    LabelMuestraCxHC: TLabel;
    LabelMuestraPxHC: TLabel;
    LabelRxHC: TLabel;
    LabelCxHC: TLabel;
    LabelPxHC: TLabel;
    LabelGrPHC: TLabel;
    LabelFormCuad: TLabel;
    LabelIngPHCuad: TLabel;
    LabelMostrarRx: TLabel;
    LabelMostrarCx: TLabel;
    LabelMostrarPx: TLabel;
    LabelCx: TLabel;
    LabelPx: TLabel;
    LabelGradoP: TLabel;
    LabelIngreseQ: TLabel;
    LabelIngresePx: TLabel;
    LabelIngGrado: TLabel;
    LabelGrado: TLabel;
    LabelMuestraGr: TLabel;
    LabelMuestraP: TLabel;
    LabelP: TLabel;
    LabelPtoEvaluar: TLabel;
    LabelIngreseP: TLabel;
    LabelResult: TLabel;
    MainMenu: TMainMenu;
    MenuArchivo: TMenuItem;
    MenuAcciones: TMenuItem;
    MenuAyuda: TMenuItem;
    MenuItemCalcularRaices: TMenuItem;
    MenuItemHornerCuad: TMenuItem;
    MenuItemAbout: TMenuItem;
    MenuItemDivPGr1: TMenuItem;
    MenuItemSalir: TMenuItem;
    MenuItemCalcularP: TMenuItem;
    PanelRaicesReales: TPanel;
    PanelMuestraHC: TPanel;
    PanelHornerCuad: TPanel;
    PanelResolverDiv1: TPanel;
    PanelDivPGr1: TPanel;
    PanelEvaluarP: TPanel;
    PanelEvaluarPInfo: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure ButtonCancelarEvalPClick(Sender: TObject);
    procedure ButtonCancelarHCClick(Sender: TObject);
    procedure ButtonCancelDiv1Click(Sender: TObject);
    procedure ButtonEvaluarPClick(Sender: TObject);
    procedure ButtonResolverDiv1Click(Sender: TObject);
    procedure ButtonResolverHCClick(Sender: TObject);
    procedure MenuItemCalcularRaicesClick(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemCalcularPClick(Sender: TObject);
    procedure MenuItemDivPGr1Click(Sender: TObject);
    procedure MenuItemHornerCuadClick(Sender: TObject);
    procedure MenuItemSalirClick(Sender: TObject);
  end;

var
  MainWindows: TMainWindows;
  Polinomio, Cociente, Divisor, Resto: TPolinomio;
  P, G, Q, X: String;
  GrP, Gr : Byte;
  e : Integer;
  N, R : Real;

implementation

{$R *.lfm}

  { TMainWindows }

// El PanelEvaluarP inicia en visible=false, cuando entramos al Menu lo hacemos visible.
// El Tag nos sirve para saber si el menu ya fue selecionado para poder borar los datos de los campos
// y dejarlos todos en blanco para un nuevo ingreso.
procedure TMainWindows.MenuItemCalcularPClick(Sender: TObject);
begin
  // Ponemos los Paneles visibles en false
  PanelDivPGr1.Visible:=false;
  // Limpiamos todos los campos.
  EditPolinomio.Caption:='';LabelMuestraP.Caption:='';
  EditPtoEvaluar.Caption:='';LabelMuestraGr.Caption:='';
  EditGr.Caption:='';
  EditMostrarResult.Caption:='';
  PanelEvaluarP.Visible:=true;PanelEvaluarPInfo.Visible:=true;  // Mostramos el Panel con todos los campos en blanco.
end;

procedure TMainWindows.MenuItemDivPGr1Click(Sender: TObject);
begin
  // Ponemos los Paneles visibles en false
  PanelEvaluarP.Visible:=false;PanelEvaluarPInfo.Visible:=false;
  PanelDivPGr1.Visible:=true;PanelResolverDiv1.Visible:=true;
end;

procedure TMainWindows.MenuItemHornerCuadClick(Sender: TObject);
begin
  // Ponemos los Paneles visibles en false
  PanelEvaluarP.Visible:=false;PanelEvaluarPInfo.Visible:=false;
  PanelDivPGr1.Visible:=false;PanelResolverDiv1.Visible:=false;
  PanelHornerCuad.Visible:=true;PanelMuestraHC.Visible:=true;
end;

// Al Salir del Programa solo liberamos la memoria utilizado por los Objetos creados
// y lo cerramos.
procedure TMainWindows.MenuItemSalirClick(Sender: TObject);
begin
  // Liberamos la memoria.
  if (PanelEvaluarP.Tag = 1) then
     Polinomio.Borrar();
  if (PanelDivPGr1.Tag = 1) then
     begin
       Polinomio.Borrar();
       Divisor.Borrar();
       Cociente.Borrar();
       Resto.Borrar();
     end;
  if (PanelHornerCuad.Tag = 1) then
     begin
       Polinomio.Borrar();
       Divisor.Borrar();
       Cociente.Borrar();
       Resto.Borrar();
     end;
  Close;
end;

// Evaluamos el Polinomio ingresado y en el punto x dado, mostrando luego el resultado
// y los datos ingresados.
procedure TMainWindows.ButtonEvaluarPClick(Sender: TObject);
begin
  P := EditPolinomio.Text;
  G := EditGr.Text;Val(G,Gr);
  X := EditPtoEvaluar.Text;Val(X,N,e);
  Polinomio := TPolinomio.CrearPolinomio(P,Gr);             // Instanciamos un Objeto de TPolinomio.
  PanelEvaluarP.Tag:=1;                                     // Tenemos un Objeto, por lo que cambiamos el valor del Tag
  R := Polinomio.EvaluarPolinomio(N);                       // Evaluamos el Polinomio en el punto dado.
  LabelMuestraP.Caption:=Polinomio.MostrarPolinomio();
  LabelMuestraGr.Caption:=G;
  EditMostrarResult.Text := Format('%0:15f',[R]);            //%f –> muestra un string en punto flotante con parte entera y decimal.
end;

procedure TMainWindows.ButtonResolverDiv1Click(Sender: TObject);
begin
  P := EditPolinomioP.Text;  // Asigno a P el Polinomio ingresado.
  G := EditGradoP.Text;  // Asigno a GrP el grado de P ingresado.
  Val(G,Grp,e);
  Q := EditPolinomioQ.Text;  // Asigno a Q el Polinomio de Grado 1 a dividir.
  Polinomio := TPolinomio.CrearPolinomio(P,GrP);   // Instancia un Objeto de la Clase Polnomio.
  Divisor := TPolinomio.CrearPolinomio(Q,1); // Instancio un Objeto de la Clase Polinomio para el Divisor.
  Cociente := TPolinomio.CrearPolinomio(GrP-1); // Instancio un Objeto de la Clase Polinomio para el Cociente.
  Resto := TPolinomio.CrearPolinomio(0);        // Instancio un Objeto de la Clase Polinomio para el Resto.
  Polinomio.HornerSimple(Cociente,Resto,Divisor.GetListCoef(0));
  LabelMostrarPx.Caption := Polinomio.MostrarPolinomio();
  LabelMostrarCx.Caption := Cociente.MostrarPolinomio();
  LabelMostrarRx.Caption := Resto.MostrarPolinomio();
  PanelDivPGr1.Tag:=1;
end;

procedure TMainWindows.ButtonResolverHCClick(Sender: TObject);
begin
  P := EditPxHCuad.Text;  // Asigno a P el Polinomio ingresado.
  G := EditGrPHC.Text;  // Asigno a GrP el grado de P ingresado.
  Val(G,GrP,e);
  Q := EditFormCuad.Text;  // Asigno a Q el Polinomio Cuadratico a Dividir.
  Polinomio := TPolinomio.CrearPolinomio(P,GrP);   // Instancia un Objeto de la Clase Polnomio.
  Divisor := TPolinomio.CrearPolinomio(Q,2); // Instancio un Objeto de la Clase Polinomio para el Divisor.
  Cociente := TPolinomio.CrearPolinomio(GrP-2); // Instancio un Objeto de la Clase Polinomio para el Cociente.
  Resto := TPolinomio.CrearPolinomio(2);        // Instancio un Objeto de la Clase Polinomio para el Resto.
  Polinomio.HornerCuadratico(Cociente,Resto,Divisor.GetListCoef(1),Divisor.GetListCoef(0));
  LabelMuestraPxHC.Caption:=Polinomio.MostrarPolinomio();
  LabelMuestraCxHC.Caption:=Cociente.MostrarPolinomio();
  LabelMuestraRxHC.Caption:=Resto.MostrarPolinomio();
  PanelHornerCuad.Tag:=1;
end;

procedure TMainWindows.MenuItemCalcularRaicesClick(Sender: TObject);
begin
  PanelEvaluarP.Visible:=false;PanelEvaluarPInfo.Visible:=false;
  PanelDivPGr1.Visible:=false;PanelResolverDiv1.Visible:=false;
  PanelHornerCuad.Visible:=false;PanelMuestraHC.Visible:=false;
  PanelRaicesReales.Visible:=true;
end;

procedure TMainWindows.MenuItemAboutClick(Sender: TObject);
begin

end;

// Al cancelar, volvemos al Main Windows (Ventana Principal) para que el Usuario
// pueda seguir realizando otras Acciones del Menu Principal.
procedure TMainWindows.ButtonCancelarEvalPClick(Sender: TObject);
begin
  // Si se creo un Objeto de la clase TPolinomio, liberamos la memoria utilizada.
  if (PanelEvaluarP.Tag = 1) then
     Polinomio.Borrar();
  PanelEvaluarP.Visible:=false;
end;

procedure TMainWindows.Button1Click(Sender: TObject);
begin
  P := EditPxRR.Text;
  G := EditGradoPRR.Text;Val(G,Gr);
  Polinomio := TPolinomio.CrearPolinomio(P,Gr);
  LabelMuestraRaices.Caption:=Polinomio.RaicesReales();
  Polinomio.Borrar();
end;

procedure TMainWindows.ButtonCancelarHCClick(Sender: TObject);
begin
  if (PanelHornerCuad.Tag = 1) then
     begin
       Polinomio.Borrar();
       Divisor.Borrar();
       Cociente.Borrar();
       Resto.Borrar();
     end;
  PanelHornerCuad.Visible:=false;
end;

procedure TMainWindows.ButtonCancelDiv1Click(Sender: TObject);
begin
  if (PanelDivPGr1.Tag = 1) then
     begin
       Polinomio.Borrar();
       Divisor.Borrar();
       Cociente.Borrar();
       Resto.Borrar();
     end;
  PanelDivPGr1.Visible:=false;
end;

end.

