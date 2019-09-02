program project1;

uses
  SysUtils,Math,
  Unit1 in 'Unit1.pas';

var
   Sistema:Sistemas;
   mx,n,op:integer;
   norma,aprox:real;
begin
  write('Tamaño de la matriz A: ');
  readln(n);
  Sistema:=Sistemas.create(n);
  Sistema.carga_sist(n);
  repeat
       writeln('1-Gauss con Pivoteo Parcial:');
       writeln('2-Gauss con Pivoteo Completo:');
       writeln('3-Gauss Jordan:');
       writeln('4-Cholesky:');
       writeln('5-Crout:');
       writeln('6-gauss Seidel:');
       writeln('7-Jacobi:');
       writeln('8-Relajamiento:');
       writeln('9-Cargar de otro sistema: ');
       writeln('10-Norma de la matriz: ');
       writeln('11-Salir...');
       readln(op);
       case op of
          1: Sistema.Gauss_PP;
          2: Sistema.Gauss_PC;
          3: Sistema.Gauss_Jordan;
          4: Sistema.Cholesky;
          5: Sistema.Crout;
          6: begin
                 write('error: ');
                 readln(aprox);
                 write('Cantidad maxima de iteraciones: ');
                 readln(mx);
                 Sistema.Gauss_Seidel(aprox,mx);
             end;
          7: begin
                 write('error: ');
                 readln(aprox);
                 write('Cantidad maxima de iteraciones: ');
                 readln(mx);
                 Sistema.Jacobi(aprox,mx);
             end;
          8: begin
                 write('error: ');
                 readln(aprox);
                 write('Cantidad maxima de iteraciones: ');
                 readln(mx);
                 Sistema.Relajamiento(aprox,mx);
             end;
          9: begin
                 write('Tamaño de la matriz: ');
                 readln(n);
                 Sistema.carga_sist(n);
             end;
          10:begin
                 norma:= Sistema.Norma_Matriz();
                 writeln('Norma es: ',norma);
             end;
       end;
  until (op=11);
end.

