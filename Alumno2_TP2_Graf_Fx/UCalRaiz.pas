unit UCalRaiz;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics,
    Controls, Forms, Dialogs, GrafFuncion;

type
    TCalRaiz = class
    private
         { Atributos }
         nroIter : byte;     // Numero de Iteraciones
         nroIterMax : byte;  // Numero Maximo de Iteraciones
         IInf : extended;    // Valor Infimo
         ISup : extended;    // Valor Supremo
         raiz : extended;    // Raiz Aproximada
         error : extended;   // Error(epsilon)
         x_0 : extended;     // Punto x0
         
         { Métodos Privados }
         procedure setNroIteraciones(Const Valor: byte);
         procedure setIInf(Const Valor:extended);
         procedure setISup(Const Valor:extended);
         procedure setRaiz(Const Valor:extended);
         procedure setError(Const Valor:extended);
         procedure setX0(Const Valor:extended);
         procedure setNroIterMax(Const Valor:byte);
    public
         { Constructores }
         constructor Create;
         { Métodos Publicos }
         procedure biseccion(F:TGraficador);
         procedure secante(F:TGraficador);
         procedure newton(F:TGraficador);
         procedure regulaFalsiModificada(F:TGraficador);
         procedure regulaFalsi(Func:TGraficador);
         destructor Destroy; override;

         Property NroInteraciones: byte read nroIter write setNroIteraciones;
         Property Infimo: Extended read IInf write setIInf;
         Property Supremo: Extended read ISup write setISup;
         Property RaizAproxmida: Extended read raiz write setRaiz;
         Property ErrorRaiz: Extended read error write setError;
         Property PtoXO: extended read x_0 write setX0;
         Property NroIteracionesMax: byte read nroIterMax write setNroIterMax;
    end;

implementation

{ Constructor de la Clase}
constructor TCalRaiz.Create;
begin
     nroIter := 0;
     nroIterMax := 200;
     inherited Create;
end;

destructor TCalRaiz.Destroy;
begin
  inherited;
end;

{ Cambia el valor del atributo "nroIter" por el que tiene "Valor" }
procedure TCalRaiz.setNroIteraciones(Const Valor: byte);
begin
     nroIter:=Valor;
end;

{ Cambia el valor del atributo "IInf" por el que tiene "Valor" }
procedure TCalRaiz.setIInf(Const Valor:extended);
begin
     IInf:=Valor;
end;

{ Cambia el valor del Atributo "ISup" por el que tiene "Valor"}
procedure TCalRaiz.setISup(Const Valor:extended);
begin
     ISup:=Valor;
end;

{ Cambia el valor del Atributo "raiz" por el que tiene "Valor"}
procedure TCalRaiz.setRaiz(Const Valor:extended);
begin
     raiz:=Valor;
end;

{ Cambia el valor del Atributo "error" por el que tiene "Valor"}
procedure TCalRaiz.setError(Const Valor:extended);
begin
     error:=Valor;
end;

{ Cambia el valor del Atributo "x0" por el que tiene "Valor"}
procedure TCalRaiz.setX0(Const Valor:extended);
begin
  x_0:=Valor;
end;

{ Cambia el valor del Atributo "nroIterMax" por el que tiene "Valor"}
procedure TCalRaiz.setNroIterMax(Const Valor: byte);
begin
  nroIterMax := Valor;
end;

{F :parametro de tipo TFuncion donde pasamos la funcion a determinar una posible raiz por el Metodo de la Biseccion}
procedure TCalRaiz.biseccion(F:TGraficador);
var
   a,b,c:extended;   //variable que almacenara el valor del Xi=(a+b)/2
   i:integer;       // variable que alamacenara la cantidad de iteraciones para encontrar la raiz aprox.
begin
     i:=0;
     a := Infimo;
     b := Supremo;
     if ((F.f(a)*F.f(b)) < 0 ) then //Verifica una d las cond del teorema de Bolzano f(a)*f(b)<0,para asegurar que f(x) tiene al menos una raiz en el intervalo
     begin
          c:=(a+b)/2;// Xi=a+b/2
          while ( abs(F.f(c)) > ErrorRaiz ) and ( i <= NroIteracionesMax ) do //Mientras F(c)=F(Xi)>e(criterio de parada)
          begin
               //Determino mi nuevo intervalo
               if  ((F.f(a)* F.f(c)) < 0) then
                   b:=c
               else
                   a:=c;
               c:=(a+b)/2;
               i:=i+1;
          end;
          NroInteraciones:=i; // Actualizamos el Nro de Iteraciones
          RaizAproxmida:= c;  // Asignamos el cero de la funcion aproximado
     end
     else
         ShowMessage('Error al calcular la Raiz.'+#13#10+'No cumple con las Condiciones de Bolzano.');
     if ( i > NroIteracionesMax ) then
      ShowMessage('En Número de Iteraciones Máximo fue superado : '+IntToStr(NroIteracionesMax));
end;


procedure TCalRaiz.secante(F:TGraficador);
var
   x_n,x_n1,x_n2:extended; {x_n es Xn y x_n1 es Xn+1 respectivamente}
   cont:integer;
begin
     {Contador}
     cont := 0;
     {Asignamos a x_n = x_0}
     x_n := Infimo;
     x_n1 := Supremo;
     repeat
           x_n2 := x_n;
           x_n := x_n1;
           {Ahora calculamos el valor de la Funcion evaluada en los ptos}
           x_n1 := x_n2 - ((F.f(x_n2)*(x_n-x_n2))/(F.f(x_n)-F.f(x_n2)));
           inc(cont);
     until abs(x_n1-x_n) < ErrorRaiz;
     {Por ultimo asignamos el valor de la raiz aproximada}
     RaizAproxmida := x_n1;
     NroInteraciones := cont;
end;

procedure TCalRaiz.newton(F:TGraficador);
var
  Xn,Xn1:extended; {Xn es lo que es y Xn1 va a ser Xn+1}
  Iter: integer;
Begin
  Iter := 0;
  Xn1:= PtoXO; // xo es la estimacion inicial de la raiz
  Repeat
    Xn := Xn1;
    Xn1 := Xn - ( (F.f(Xn)) / (F.df(Xn)));
    inc(Iter);
  Until ( (abs(Xn1 - Xn) < ErrorRaiz) and (Iter <= NroIteracionesMax) );
  NroInteraciones := Iter;
  RaizAproxmida := Xn1;
end;

procedure TCalRaiz.regulaFalsiModificada(F:TGraficador);
var
  G,H,a,b,w,c : extended;
  n : integer;
begin
  a:=Infimo;
  b:=Supremo;
  n:=0;
  if ( (( F.f(a) )*( (F.f(b)) )) < 0 ) then
  begin
    G:=F.f(a);
    H:=F.f(b);
    w:=F.f(b);
    c:=( ( (a*G) - (b*H) ) / (G-H) );
    while ( abs(F.f(c))  > ErrorRaiz ) and ( n <= NroIteracionesMax ) do
    begin
      if ( (F.f(a)*F.f(b)) < 0 ) then
      begin
        b:=c;
        H:=F.f(c);
        if ( (w*H) > 0 ) then G:=(G/2);
      end
      else
      begin
        a:=c;
        G:=F.f(c);
        if ( (w*G) > 0 ) then H:=(H/2);
      end;
      //w:=F.f(c);
      c:= ( ( (a*H) - (b*G) ) / (H-G) );
      inc(n);
    end;
    NroInteraciones:=n; //numero de iteraciones realizadas
    if (n>NroIteracionesMax) then ShowMessage('maximo de iteraciones superadas');
    RaizAproxmida:= c;
  end
  else
    ShowMessage('Error al calcular la Raiz.'+#13#10+'No cumple con las Condiciones de Bolzano.');
end;

procedure TCalRaiz.regulaFalsi(Func:TGraficador);
var
  a,b,c:extended;  // VARIABLE C=(B*F(A)-A*F(B))/(F(A)-F(B))
  i:integer;      // CONTADOR DE ITERACIONES
begin
  i:=0;
  a:=Infimo;
  b:=Supremo;
  if (((Func.f(a))* Func.f(b)) < 0) then
  begin
    c:=( ( ( a * (Func.f(b)) ) - ( b * (Func.f(a)) ) ) ) / ( (Func.f(b)) - (Func.f(a)) );
    while ( abs(Func.f(c)) > ErrorRaiz ) and ( i <= NroIteracionesMax ) do
    begin
      if ( (Func.f(a)) * (Func.f(c)) < 0) then
        b:=c
      else
        a:=c;
      c:=( ( ( a * (Func.f(b)) ) - ( b * (Func.f(a)) ) ) ) / ( (Func.f(b)) - (Func.f(a)) );
      i:=i+1;
    end;
    if( i <= NroIteracionesMax) then
      c := RaizAproxmida
    else
      ShowMessage('Error. Se supero la cantidad de iteraciones maxima.');
    nroIter:=i;
  end
  else
    ShowMessage('Error al calcular la raiz');
 	end;
end.


end.
