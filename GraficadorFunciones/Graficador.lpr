program Graficador;

uses
    MyFunction;
var
  ingreso:string;
  a:TMyFunction;

begin
  writeln('Ingrese una Funcion: ');
  readln(ingreso);
  a:=TMyFunction.crear;
  a.fomrula:=ingreso;
  writeln(a.evalF(1.2));
  writeln(a.evalDerivF(1.2));
end.

