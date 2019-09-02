unit Unit1;

interface

TYPE
       POLINOMIO = class
           private
                 grado: integer;
                 coef: array[0..10]of real;
           public
                 constructor Create();
                 function Horner_Simple(alfa:real):POLINOMIO;
                 function Horner_2(objeto:POLINOMIO;a,b:real):POLINOMIO;
                 function Horner_Double(objeto:POLINOMIO;a,b:real):POLINOMIO; ;
                 procedure pos_raiz_enteras(objeto:POLINOMIO);
                 function es_primo(x:rael):boolean;
                 procedure lagrague(objeto:POLINOMIO;a,b,c,d:real);
                 function cota_sup_lagrague(objeto:POLINOMIO):real;
                 function obt_p1(ob:POLINOMIO):POLINOMIO;
           end;


uses
  Classes, SysUtils;

implementation


             function Horner_Simple(objeto:POLINOMIO;alfa:real);
             begin
                 obj2:=objeto;
                 for i:=(m-1) downto 0 do
                     obj2.coef[i]:= (-1)*alfa*obj2.coef[i+1]+obj.coef[i];
                 result:= obj2;
             end;

             function Horner_2(objeto:POLINOMIO;a,b:real):POLINOMIO;
             begin
                 c:=b/a;
                 obj2:= Horner_Simple(objeto,c);
                 for i:=1 to objeto.grado do
                     obj2.coef[i]:=obj2/a;
                 result:= obj2
             end;

             function Horner_double(objeto:POLINOMIO;a,b:real):POLINOMIO;
             begin
                 obj2:= objeto;
                 obj2.coef[n-1]:=(-1)*a*obj2.coef[n]+objeto.coef[n-1];
                 for i:=objeto.grado-1 downto 1 do
                     obj2.coef[i]:= obj2.coef[i+1]*(-1)*a+obj2[i+2]*(-1)*b+objeto.coef[i];
                 obj2.coef[0]:=obj2.coef[1]*(-1)*a+objeto.coef[0];
                 result:= obj2;
             end;

             procedure pos_raiz_enteras(objeto:POLINOMIO);
                 begin
                      c:= (abs(objeto.coef[n])/2);
                      for i:=1 to c do
                          if (objeto.coef[n] div i)=0 then
                             write(i,' , ',(-1)*i,' , ');
                 end;

             procedure pos_raiz_racionales(objeto:POLINOMIO);
                 begin
                      c:= (abs(objeto.coef[objeto.grado])/2);
                      b:= (abs(objeto.coef[0])/2);
                      for i:=1 to c do
                          begin
                         if objeto.coef[objeto.grado] div i)=0 then
                            p:= objeto.coef[objeto.grado];
                            for j:=1 to b do
                                begin
                               if objeto.coef[0] div i)=0 then
                                  q:= objeto.coef[objeto.grado];
                                  if (p<>0) and (q<>0) then
                                     if es_primo(p) or es_primo(q) then
                                        write(p,'/',q ,' ,');
                                   end;
                            p:=0;1:=0;
                           end;
                 end;
             function es_primo(x:rael);
             var
               p,i,j:byte;
             begin
                  p:=2;
                 for i:=1 to x/2 do
                      if x/i=0 then
                         p=p+1;
                 if p<=x/2 and x<>1 then
                    es_primo:=true;
                 else es_primo:=false;
             end;
             procedure lagrague(objeto:POLINOMIO;a,b,c,d:real);
             begin
                  lamda:=cota_sup_lagrague(objeto:POLINOMIO);
                  p_1:=obt_p1(objeto:POLINOMIO);
                  p1:=cota_sup_lagrague(objeto:POLINOMIO);
              end;
             function cota_sup_lagrague(objeto:POLINOMIO);
             begin
                 k:=0;
                 max:=0;
                 for i:0 to objeto.grado do
                     if objetco.coef[i]<0 then
                        if  abs(objetco.coef[i])>max then
                           max=abs(objetco.coef[i]);
                 while objetco.coef[i]>0 then
                   begin
                         k:=k+1;
                    end;
             a:=1+EXP( 1/k * Ln(max/objeto.coef[0]));
             cota_sup_lagrague:=a;
             end;
            function obt_p1(ob:POLINOMIO);
            begin
                 for i:=0 to ob.potencia do
                     for j:=ob.potencia downto 0 do
                          p1.coef[i]=ob.coef[j];
                 if p1.coef[0]<0 then
                    for i:=0 to p1.potencia do
                    p1.coef[i]:=(-1)*p1.coef[i]
            obt_p1:=p1;
                end;
end.



