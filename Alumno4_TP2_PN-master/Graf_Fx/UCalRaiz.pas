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
         IInf : extended;    // Valor Infimo
         ISup : extended;    // Valor Supremo
         raiz : extended;    // Raiz Aproximada
         error : extended;    // Error(epsilon)
         x_0 : extended;
         sIntervalo: String; // Intervalo como String
         
         { Métodos Privados }
         procedure setIntervalo(Const Valor: String);
         procedure setNroIteraciones(Const Valor: byte);
         procedure setIInf(Const Valor:extended);
         procedure setISup(Const Valor:extended);
         procedure setRaiz(Const Valor:extended);
         procedure setError(Const Valor:extended);
         procedure setX0(Const Valor:extended);
    public
         { Constructores }
         constructor Create;
         { Métodos Publicos }
         procedure biseccion(F:TGraficador);
         procedure secante(F:TGraficador);

         Property Intervalo: String read sIntervalo write setIntervalo;
         Property NroInteraciones: byte read nroIter write setNroIteraciones;
         Property Infimo: Extended read IInf write setIInf;
         Property Supremo: Extended read ISup write setISup;
         Property RaizAproxmida: Extended read raiz write setRaiz;
         Property ErrorRaiz: Extended read error write setError;
         Property PtoXO: extended read x_0 write setX0;
    end;

implementation

{ Constructor de la Clase}
constructor TCalRaiz.Create;
begin
     //F := TFuncion.Crear;
     nroIter := 0;
     sIntervalo := '';
     inherited Create;
end;

{ Cambia el valor del atributo "fintervalo" por el que tiene "Valor" }
procedure TCalRaiz.setIntervalo(Const Valor: String);
begin
     sIntervalo:=Valor;
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

procedure TCalRaiz.setX0(Const Valor:extended);
begin
  x_0:=Valor;
end;

{F :parametro de tipo TFuncion donde pasamos la funcion a determinar una posible raiz por el Metodo de la Biseccion}
procedure TCalRaiz.biseccion(F:TGraficador);
var
   c:extended;   //variable que almacenara el valor del Xi=(a+b)/2
   i:integer;  // variable que alamacenara la cantidad de iteraciones para encontrar la raiz aprox.
begin
     i:=0;
     if ((F.f(Infimo)*F.f(Supremo)) < 0 ) then //Verifica una d las cond del teorema de Bolzano f(a)*f(b)<0,para asegurar que f(x) tiene al menos una raiz en el intervalo
     begin
          c:=(Infimo+Supremo)/2;// Xi=a+b/2
          while (abs(F.f(c)) > ErrorRaiz ) do //Mientras F(c)=F(Xi)>e(criterio de parada)
          begin
               //Determino mi nuevo intervalo
               if  ((F.f(Infimo)* F.f(c)) < 0) then
                   Supremo:=c
               else
                   Infimo:=c;
               c:=(Infimo+Supremo)/2;
               i:=i+1;
          end;
          NroInteraciones:=i; // Actualizamos el Nro de Iteraciones
          RaizAproxmida:= c;  // Asignamos el cero de la funcion aproximado
     end
     else
         ShowMessage('Error al calcular la Raiz');
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

end.
