program Proyecto;

uses
    Unitone, DiffExpress, MyFunc;

function Menu():byte;
var
   i:byte;
begin
  repeat
    writeln('Elija uno de los metodos para encontrar la raiz de la funcion:');
    writeln('1-Metodo de Biseccion.');
    writeln('2-Metodo de Regula Falsi o Secante.');
    writeln('3-Metodo de Regula Falsi Modificada.');
    writeln('4-Metodo de Newton.');
    writeln('5-Metodo de Punto Fijo.');
    writeln('6-Ingresar nueva funcion.');
    writeln('7-Terminar.');
    write('Ingrese Una Opcion: ');
    readln(i);
  until((i>=1)and(i<=7));
  Menu:=i;
end;

var
   g,f,dpfx,dpfy,dpgx,dpgy,fnc,fnc2: TFuncion;
   funcion:string;
   opcion:byte;
   xini,yini,raiz,x0,einf,esup,error:double;
   resp:char;
begin
   fnc:=TFuncion.Crear;
   repeat
     writeln('Ingrese la funcion para encontrar su raiz: ');
     write('f(x)= ');
     readln(funcion);
     fnc.Formula:=funcion;
     writeln('f'+char(39)+'(x)= ',fnc.Derivada);
     repeat
           opcion:=Menu();
           case(opcion)of
           1:begin
               writeln('Ingrese el intervalo (a,b):');
               write('Ingrese a: ');
               readln(einf);
               write('Ingrese b: ');
               readln(esup);
               write('Ingrese el Error(Epsilon): ');
               readln(error);
               raiz:=biseccion(fnc,einf,esup,error);
               writeln('Raiz(Aprox.)= ',raiz);
               writeln;
             end;
           2:begin
               writeln('Ingrese el intervalo (a,b):');
               write('Ingrese a: ');
               readln(einf);
               write('Ingrese b: ');
               readln(esup);
               write('Ingrese el error(Epsilon): ');
               readln(error);
               raiz:=regula_falsi(fnc,einf,esup,error);
               writeln('Raiz= ',raiz);
               writeln;
             end;
           3:begin
               writeln('Ingrese el intervalo (a,b):');
               write('Ingrese a: ');
               readln(einf);
               write('Ingrese b: ');
               readln(esup);
               write('Ingrese el error(Epsilon): ');
               readln(error);
               raiz:=regula_falsi_modific(fnc,einf,esup,error);
               writeln('Raiz= ',raiz);
               writeln;
             end;
           4:begin
               write('Ingrese el valor del x0: ');
               readln(x0);
               write('Ingrese el error: ');
               readln(error);
               raiz:=newton(fnc,x0,error);
               writeln('Raiz= ',raiz);
               writeln;
             end;
           5:begin
               fnc2:=TFuncion.Crear;
               writeln('Ingrese la funcion g para aplicar el metodo: ');
               write('g(x)= ');
               readln(funcion);
               fnc2.Formula:=funcion;
               write('Ingrese el valor del x0: ');
               readln(x0);
               write('Ingrese el error: ');
               readln(error);
               raiz:=punto_fijo(fnc2,x0,error);
               writeln('Raiz= ',raiz);
               writeln;
             end;
           end;
     until((opcion=6)or(opcion=7));
   until(opcion=7);
   write('Quiere usar Newton para sistemas: S/N?????');
   readln(resp);
   if resp in ['S','s'] then
       begin
       writeln('Sistema Ingresado por defecto: ');
       writeln('F(x,y)=x^2+y^2-5*x=0');
       writeln('G(x,y)=2*x^4+y^4-9*y=0');
       write('Ingrese xo:');
       readln(xini);
       write('Ingrese yo:');
       readln(yini);
       g:=TFuncion.crear;
       f:=TFuncion.crear;
       f.Formula:='x^2+y^2-5*x';
       g.Formula:='2*x^4+y^4-9*y';
       dpfx:= TFuncion.Crear;
       dpfy:= TFuncion.Crear;
       dpgx:= TFuncion.Crear;
       dpgy:= TFuncion.Crear;
       dpfx.Formula:='2*x-5';
       dpfy.Formula:='2*y';
       dpgx.Formula:='8*x^3';
       dpgy.Formula:='4*y^3-9';
       Newton_Sistemas(xini,yini,dpfx,dpfy,dpgx,dpgy,g,f);
       writeln('aproximacion de la solucion: (',xini,',',yini,')');
       readln();
       end;
end.

