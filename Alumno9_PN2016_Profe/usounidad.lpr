program usounidad;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, mates
  { you can add units after this };
var
  radio,angulo,x,y:double;

begin
  writeln('ingrese radio ');
  readln(radio);
  writeln('ingrese angulo ');
  readln(angulo);
  pasarAcartesianas(radio,angulo,x,y);
  writeln('coord cartesianas x y ',x:2:10,' , ',y:2:10);
  readln;
end.

