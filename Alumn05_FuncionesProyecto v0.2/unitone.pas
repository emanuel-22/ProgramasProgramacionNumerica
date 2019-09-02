unit Unitone;

interface

uses
  MyFunc;
      function biseccion(obj:TFuncion; a,b,e:real): real;
      function regula_falsi(obj:TFuncion; a,b,e:real):real;
      function regula_falsi_modific(obj:TFuncion; a,b,e:real):real;
      function punto_fijo(obj:TFuncion; xn1,e:real):real;
      function newton(obj:TFuncion; xn1,e:real):real;
      procedure Newton_Sistemas(var xo,yo:double;fx,fy,gx,gy,g,f:TFuncion);
type
    matriz=array[1..2,1..2]of double;
var
     obj:TFuncion;
implementation


       function biseccion(obj:TFuncion; a,b,e:real):real;
       var
          c:real;
          i:integer;
       begin
            i:=0;
            if (obj.F(a)* obj.F(b) < 0) then
            begin
                c:=(a+b)/2;
                while (abs(obj.F(c))>e) do
                  begin
                      if  (obj.F(a)* obj.F(c) < 0) then
                           b:=c
                      else
                           a:=c;
                      c:=(a+b)/2;
                      i:=i+1;
                  end;
                writeln('Cantidad de iteraciones: ',i);
                result:= c;
            end
            else
                writeln('error');
       end;


       function regula_falsi(obj:TFuncion; a,b,e:real):real;
       var
         c:real;
         i:integer;
       begin
           if (obj.F(a)* obj.F(b) < 0) then
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

      function punto_fijo(obj:TFuncion; xn1,e:real):real;
      var
       xn:real;
       i:integer;
      begin
           i:=0;
           repeat
                 xn:= xn1;
                 xn1:= obj.F(xn);
                 i:=i+1;
           until (abs(xn1-xn)<e);
           writeln('Cantidad de iteraciones: ',i);
           result:= xn1;
      end;

    function newton(obj:TFuncion; xn1,e:real):real;
    var
     xn:real;
     i:integer;
    begin
         i:=0;
         repeat
               xn:=xn1;
               xn1:=xn-obj.F(xn)/obj.dF(xn);
               i:=i+1;
         until (abs(xn1-xn)<e);
         writeln('Cantidad de iteraciones: ',i);
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
           y2:=b2/m[2,2];
           y1:=(b1-m[1,2]*b2)/m[1,1];
      end;

    procedure Newton_Sistemas(var xo,yo:double;fx,fy,gx,gy,g,f:TFuncion);
    var
        mj:matriz;
        tolerancia,ec,b1,b2,y1,y2,x1,x2:double;
        itermax,iter:integer;
    begin
         itermax:=50;
         ec:=1000;
         iter:=1;
         tolerancia:= 0.0001;
         while (iter<itermax) and (tolerancia>ec) do
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

