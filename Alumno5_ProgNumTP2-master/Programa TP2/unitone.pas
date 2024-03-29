unit Unitone;

interface

uses
  MyFunc;
      function biseccion(obj:TFuncion; a,b,e:double): double;
      function regula_falsi(obj:TFuncion; a,b,e:real):real;
      function regula_falsi_modific(obj:TFuncion; a,b,e:real):real;
      function punto_fijo(obj:TFuncion; xn1,e:double):double;
      function newton(obj:TFuncion; xn1,e:real):real;
      procedure Newton_Sistemas(var xo,yo:double;fx,fy,gx,gy,g,f:TFuncion);
type
    matriz=array[1..2,1..2]of double;
var
     obj:TFuncion;
implementation

//METODO DE LA BISECCION
       function biseccion(obj:TFuncion; a,b,e:double):double;
       //obj:parametro de tipo TFuncion donde pasamos la funcion a determinar una posible raiz por el Metodo de la Biseccion
       // (a,b) :Valor del intervalo donde se analizara la posible raiz de la funcion ,ingresados por teclado por el usuario
       // e : valor del epsilon o error que se considera de referencia para la aprox. de la raiz de la funcion
       var
          c:double;   //variable que almacenara el valor del Xi=(a+b)/2
          i:integer;  // variable que alamacenara la cantidad de iteraciones para encontrar la raiz aprox.
       begin
            i:=0;
            // writeln('F(A): ',obj.F(a));
              //writeln('F(A): ',obj.F(b));
            if (obj.F(a)* obj.F(b) < 0) then //Verifica una d las cond del teorema de Bolzano f(a)*f(b)<0,para asegurar que f(x) tiene al menos una raiz en el intervalo
            begin
                c:=(a+b)/2;// Xi=a+b/2
                while (abs(obj.F(c))>e) do //Mientras F(c)=F(Xi)>e(criterio de parada)
                  begin
                       //Determino mi nuevo intervalo
                      if  (obj.F(a)* obj.F(c) < 0) then
                           b:=c
                      else
                           a:=c;
                      c:=(a+b)/2;
                      i:=i+1;
                  end;
                writeln('Cantidad de iteraciones: ',i);
                result:= c;  //cero de la funcion aproximado
            end
            else
                writeln('error');
       end;

//METODO DE REGULA FALSI(FALSA POSICION)
       function regula_falsi(obj:TFuncion; a,b,e:real):real;
       var
         c:real;
         i:integer;
       begin
           if (obj.F(a)* obj.F(b

           ) < 0) then
            begin
                i:=0;
                c:=(a*obj.F(b)-b*obj.F(a))/(obj.F(b)-obj.F(a));
                while (abs(obj.F(c))>e) do
                  begin
                      if  (obj.F(a)* obj.F(c) < 0) then
                           b:=c
                      else
                           a:=c;
                      c:=(a*obj.F(b)-b*obj.F(a))/(obj.F(b)-obj.F(a));
                      i:=i+1;
                  end;
                writeln('Cantidad de iteraciones: ',i);
                result:= c;
            end
            else
                writeln('error');
       end;
//METODO DE REGULA FALSI MODIFICADA
    function regula_falsi_modific(obj:TFuncion; a,b,e:real):real;
    var
     F,G,w,c:real;
     i:integer;
    begin
         if (obj.F(a)* obj.F(b) < 0) then
            begin
                i:=0;
                F:= obj.F(a);
                G:= obj.F(b);
                w:= obj.F(a);
                c:=(a*G-b*F)/(G-F);
                while (abs(obj.F(c))>e) do
                  begin
                      if  (obj.F(a)* obj.F(c) < 0) then
                         begin
                           b:=c;
                           G:= obj.F(c);
                           if (w*G)>0 then
                              F:= F/2;
                         end
                      else
                         begin
                           a:=c;
                           F:= obj.F(c);
                           if (w*F)>0 then
                              G:= G/2;
                         end;
                      w:= obj.F(c);
                      c:=(a*G-b*F)/(G-F);
                      i:=i+1;
                  end;
                writeln('Cantidad de iteraciones: ',i);
                result:= c;
            end
            else
                writeln('error');
    end;
  {///////////////////////////////////////////////////////}
      function Aitken(x2,x1,xo:double):double;
         begin
              result:= x2-((x2-x1)*(x2-x1))/(x2-2*x1+xo);
         end;

//METODO DE PUNTO FIJO
      function punto_fijo(obj:TFuncion; xn1,e:double):double;
      var
       xn,xo,x1,x2:double;
       cant_iter,i:integer;
      begin
           i:=0;
           cant_iter:=0;
           repeat
                 writeln('-------',cant_iter);
                 xn:= xn1;
                 writeln('xn: ',xn);
                 xn1:= obj.F(xn);
                 case i of
                   0: xo:=xn1;
                   1: x1:=xn1;
                   2: x2:=xn1;
                   3: begin
                        writeln('Se aplico aitken: ',cant_iter);
                        xn1:=Aitken(x2,x1,xo);
                        i:=-1;
                   end;
                 end;
                 writeln('xn+1: ',xn1);
                 inc(i);

                 inc(cant_iter);
                 writeln('error: ',abs(xn1-xn));
           until (abs(xn1-xn)<e);
           writeln('Cantidad de iteraciones: ',cant_iter);
           result:= xn1;
      end;
  {////////////////////////////////////////////////////////}
//METODO DE NEWTON
    function newton(obj:TFuncion; xn1,e:real):real;
    var
     xn,xo,x1,x2:real;
     cant_iter,i:integer;
    begin
         i:=0;
         cant_iter:=0;
         repeat
               {writeln('-------',cant_iter);}
               xn:=xn1;
               {writeln('xn: ',xn);}
               xn1:=xn-obj.F(xn)/obj.dF(xn);
               {case i of
                   0: xo:=xn1;
                   1: x1:=xn1;
                   2: x2:=xn1;
                   3: begin
                        writeln('Se aplico aitken: ',cant_iter);
                        xn1:=Aitken(x2,x1,xo);
                        i:=-1;
                      end;
                 end;
               writeln('xn+1: ',xn1);
               inc(i);}
               inc(cant_iter);
               {writeln('error: ',abs(xn1-xn));}
         until (abs(xn1-xn)<e);
         writeln('Cantidad de iteraciones: ',cant_iter);
         result:= xn1;
    end;

{------------------------------------------------------------------------------}
    procedure evalua_jacobiana(xo,yo:double;fx,fy,gx,gy: TFuncion;var m:matriz);
      begin
           m[1,1]:=fx.F(xo);
           m[2,1]:=gx.F(xo);
           m[1,2]:=fy.F(yo);
           m[2,2]:=gy.F(yo);
        end;

    procedure obtener_b(g,f:TFuncion;xo,yo:double;var b1,b2:double);
      begin
             b1:= (-1)*f.F2(xo,yo);
             b2:= (-1)*g.F2(xo,yo);
      end;

    procedure obtener_y(var m:matriz;b1,b2:double;var y1,y2:double);
      begin
           m[2,2]:=(m[1,1]*m[2,2])-(m[2,1]*m[1,2]);
           b2:= m[1,1]*b2-m[2,1]*b1;
           m[2,1]:=0;
           y2:=b2/(m[2,2]);
           y1:=((-1)*(m[1,2]*y2)+b1)/(m[1,1]);
      end;


//NEWTON PARA SISTEMAS
    procedure Newton_Sistemas(var xo,yo:double;fx,fy,gx,gy,g,f:TFuncion);
    var
        mj:matriz;
        tolerancia,ec,b1,b2,y1,y2,x1,x2:double;
        itermax,iter:integer;
    begin
         itermax:=9;
         ec:=1000;
         iter:=1;
         tolerancia:= 0.0001;
         while (iter<itermax) and (tolerancia<ec) do
            begin
                evalua_jacobiana(xo,yo,fx,fy,gx,gy,mj);
                obtener_b(g,f,xo,yo,b1,b2);
                obtener_y(mj,b1,b2,y1,y2);
                x1:= xo+y1;
                x2:= yo+y2;
                ec:= sqrt((x1-xo)*(x1-xo)+(x2-yo)*(x2-yo));
                xo:=x1;
                yo:=x2;
                inc(iter);
            end;
         xo:=x1;
         yo:=x2;
    end;
{-----------------------------------------------------------------------------}
end.

