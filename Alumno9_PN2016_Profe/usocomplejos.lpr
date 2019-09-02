program usocomplejos;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, complejos
  { you can add units after this };
var
  c1,c2,c3:complejo;
begin
  c1:=complejo.crear(234.89,-7999.898);  //instanciamos a c1
  writeln(c1.mostrar());

  c2:=complejo.crear(-234.778,79879.099);  //instanciamos a c1
  writeln(c2.mostrar());

  c3:=c1.sumar(c2);
  writeln(c3.mostrar());

  readln;
end.

