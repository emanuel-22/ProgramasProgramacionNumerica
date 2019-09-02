unit UCalRaiz;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics,
    Controls, Forms, Dialogs, uFuncion, GrafFuncion;

type
    TCalRaiz = class
    private
         { Atributos }
         nroIter : byte;
         sIntervalo: String;
         
         { Métodos Privados }
         procedure setIntervalo(Const Valor: String);
         procedure setNroIteraciones(Const Valor: byte);
    public
         { Constructores }
         constructor Create;
         { Métodos Publicos }
         function biseccion(Func:TFuncion; a,b,e:extended):extended;

         Property Intervalo: String read sIntervalo write setIntervalo;
         Property NroInteraciones: byte read nroIter write setNroIteraciones;
    end;

implementation

constructor TCalRaiz.Create;
begin
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

function TCalRaiz.biseccion(Func:TFuncion;a,b,e:extended):extended;
       //obj:parametro de tipo TFuncion donde pasamos la funcion a determinar una posible raiz por el Metodo de la Biseccion
       // (a,b) :Valor del intervalo donde se analizara la posible raiz de la funcion ,ingresados por teclado por el usuario
       // e : valor del epsilon o error que se considera de referencia para la aprox. de la raiz de la funcion
       var
          c:extended;   //variable que almacenara el valor del Xi=(a+b)/2
          i:integer;  // variable que alamacenara la cantidad de iteraciones para encontrar la raiz aprox.
       begin
            i:=0;
            // writeln('F(A): ',obj.F(a));
              //writeln('F(A): ',obj.F(b));
            if ((Func.f(a))* Func.f(b)) < 0) then //Verifica una d las cond del teorema de Bolzano f(a)*f(b)<0,para asegurar que f(x) tiene al menos una raiz en el intervalo
            begin
                c:=(a+b)/2;// Xi=a+b/2
                while (abs(Func.f(c))>e) do //Mientras F(c)=F(Xi)>e(criterio de parada)
                  begin
                       //Determino mi nuevo intervalo
                      if  (Func.f(a)* Func.f(c) < 0) then
                           b:=c
                      else
                           a:=c;
                      c:=(a+b)/2;
                      i:=i+1;
                  end;
                nroIter:=i;
                result:= c;  //cero de la funcion aproximado
            end
            else
                ShowMessage('Error al calcular la Raiz');
       end;

end.
 