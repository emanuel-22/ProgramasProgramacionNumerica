program prin;

{$mode objfpc}{$H+}

uses
   Unitone;
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this };
var
    fnc:Metodos;
begin
    fnc.crea();
end.

