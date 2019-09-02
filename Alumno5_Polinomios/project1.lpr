program project1;

{$APPTYPE CONSOLE}

uses
  Unit1;
function Menu():byte;
var
   i:byte;
begin
  repeat
    writeln('Elija una opcion: ');
    writeln('1-Calcular el valor del polinomio .');
    writeln('2-Dividir el polinomio por un polinomio de grado 1.');
    writeln('3-Dividir el polinomio por x^2+px+q.');
    writeln('4-Determinar las posibles raices enteras.');
    writeln('5-Determinar posibles raices racionales.');
    writeln('6-Determinar cotas positivas y negativas por lagrague.');
    writeln('7-Determinar cotas positivas y negativas por lagruerre');
    writeln('8-Encontar raices por newton');
    writeln('9-Encontar raices por Bairstow.');
    writeln('0-Salir.');
    write('Ingrese opcion: ');
    readln(i);
  until((i>=0)and(i<=10));
  Menu:=i;
end;

var
    poli,p:POLINOMIO;
    x,re,im:list;
    opcion:byte;
    e,r,s,a,b,c,d:extended;
    maxiter,gr,i:integer;
begin
     writeln('ingrese el grado del Polinomio: ');
     read(gr);
     writeln('ingrese los coeficientes del Polinomio: ');
     for i:=gr downto 0 do
        begin
          write('a[',i,']:= ');
          readln(x[i]);
        end;
      poli:=POLINOMIO.Crear(gr,x);
      writeln('Polinomio :');
      for i:=0 to gr do
         begin
           write(x[i],'x^',i);
         end;

      repeat
            writeln();
           opcion:=Menu();
           case(opcion)of
               1: begin
               write('ingrese punto: ');readln(a);
               write('f(',a,')=',poli.evaluar_fun(poli,a));
               end;
               2:begin
                   writeln('ingrese alfa: ');readln(a);
                   p:=poli.Horner_Simple(poli,a);
                   p.mostrar(p);
                 end;
               3: begin
                     writeln('ingrese p ');readln(a);
                     writeln('ingrese q ');readln(b);
                     p:=poli.Horner_Double(poli,a,b);

                  end;
               4: poli.pos_raiz_enteras(poli);
               5: poli.pos_raiz_racionales(poli);
               6: begin
                     writeln();
                     writeln('Lagrague ');
                     a:=0;b:=0;c:=0;d:=0;
                     poli.lagrague(poli,a,b,c,d);
                     writeln('cota superior positiva ', a);
                     writeln('cota inferior positiva ', b);
                     writeln('cota superior negativa ', c);
                     writeln('cota inferior negativa ', d);
                      writeln();
                    end;
               7: begin
                      writeln('laguerre ');
                       a:=0;b:=0;c:=0;d:=0;
                     poli.laguerre(poli,a,b,c,d);
                     writeln('cota superior positiva ', a);
                     writeln('cota inferior positiva ', b);
                     writeln('cota superior negativa ', c);
                     writeln('cota inferior negativa ', d);
                    end;
               8: begin
                     writeln('ingrese x1: ');readln(a);
                     writeln('ingrese epcilon: ');readln(b);
                     c:=poli.newton_p_poli(poli,a,b);
                     writeln('raiz ',c);
                 end;
               10: begin
                     write('Ingrese el errror de aproximacion: ');
                     readln(e);
                     writeln('Ingrese el valores x^2+rx+s: ');
                     write('ingrese r ');readln(r);
                     write('ingrese s ');readln(s);
                     write('Ingrese cantidd maxima de iteraciones: ');
                     readln(maxiter);
                     poli.Bairstow(poli,e,r,s,re,im,maxiter);
                     poli.mostrar_Bairstow(poli,re,im);
                 end;
          end;
     until(opcion=0);
     {poli.carga_polinomio;
     poli.mostrar;}
     readln;

end.

