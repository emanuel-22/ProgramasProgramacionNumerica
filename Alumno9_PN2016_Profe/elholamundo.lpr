program elholamundo;
var
  entero,i:integer;
begin
  writeln('hola mundo');
  write('ing  numero ');
  readln(entero);
  writeln('ingreso=',entero);

  for i:=0 to entero do
  begin
    write(i,' ');
  end;

  readln;
end.

