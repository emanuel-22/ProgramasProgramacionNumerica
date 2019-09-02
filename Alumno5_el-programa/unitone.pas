unit Unitone;

{$mode objfpc}{$H+}

interface

uses
  MyFunc;

type
  Metodos = class
  private
      fx: string;
  public
      constructor crea();
      {destructor destruir();}
      function biseccion(obj:TFuncion; a,b,e:real): real;
      function regula_falsi(obj:TFuncion; a,b,e:real):real;
      function regula_falsi_modific(obj:TFuncion; a,b,e:real):real;
      function punto_fijo(obj:TFuncion; xn1,e:real):real;
      function newton(obj,obj2:TFuncion; xn1,e:real):real;

  end;

var
     obj:TFuncion;
implementation
       constructor Metodos.crea();
          begin
               obj.crear();
          end;
       {destructor Metodos.destruir();
          begin
               TFuncion.listo();
          end;}

       function Metodos.biseccion(obj:TFuncion; a,b,e:real):real;
       var
          c:real;
       begin
            if (obj.F(a)* obj.F(b) < 0) then
            begin
                c:=(a+b)/2;
                while (obj.F(c)<e) do
                  begin
                      if  (obj.F(a)* obj.F(b) < 0) then
                           b:=c
                      else
                           a:=c;
                      c:=(a+b)/2;
                  end;
                result:= c;
            end
            else
                writeln('error');
       end;

{$R *.lfm}
       function Metodos.regula_falsi(obj:TFuncion; a,b,e:real):real;
       var
         c:real;
       begin
           if (obj.F(a)* obj.F(b) < 0) then
            begin
                c:=(a*obj.F(b)-b*obj.F(a))/(obj.F(b))-(obj.F(a));
                while (obj.F(c)<e) do
                  begin
                      if  (obj.F(a)* obj.F(b) < 0) then
                           b:=c
                      else
                           a:=c;
                      c:=(a*obj.F(b)-b*obj.F(a))/(obj.F(b)-obj.F(a));
                  end;
                result:= c;
            end
            else
                writeln('error');
       end;
    function Metodos.regula_falsi_modific(obj:TFuncion; a,b,e:real):real;
    var
     F,G,w,c:real;
    begin
         if (obj.F(a)* obj.F(b) < 0) then
            begin
                F:= obj.F(a);
                G:= obj.F(b);
                w:= obj.F(a);
                c:=(a*obj.F(b)-b*obj.F(a))/(obj.F(b)-obj.F(a));
                while (obj.F(c)<e) do
                  begin
                      if  (obj.F(a)* obj.F(b) < 0) then
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
                  end;
                result:= c;
            end
            else
                writeln('error');
    end;

      function Metodos.punto_fijo(obj:TFuncion; xn1,e:real):real;
      var
       xn:real;
      begin
           repeat
                 xn:= xn1;
                 xn1:= obj.F(xn);
           until (abs(xn1-xn)<e);
           result:= xn1;
      end;

    function Metodos.newton(obj,obj2:TFuncion; xn1,e:real):real;
    var
     xn:real;
    begin
         repeat
               xn:=xn1;
               xn1:=xn-obj.F(xn)/obj.dF(xn);
         until (abs(xn1-xn)<e);
         result:= xn1;
    end;
end.

