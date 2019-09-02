program programa;

function potencia(numero:integer; expo:integer):longint;
var
     i:integer;
begin
     if expo<>0 then
        begin
             for i:=2 to expo do
                 numero:=numero*numero;
        end
     else
         numero:=1;
     potencia:= numero;
end;
function corte(numero:string; t:byte):string;
   var
        p:byte;
        cad:string;
   begin
        p:=pos('x',numero);
        cad:=copy(numero,p,length(numero));
        delete(numero,3+t,length(numero));
        corte:=numero+cad;
   end;
function suma_ponderada(numero:string; base:byte):real;
var
     number,n,p,i,c:byte;
     nue2,nue:real;

begin
     p:= pos('.',numero);
     nue:=0;
     nue2:=0;
     n:=length(numero)-p;
     for i:= 1 to n do
         begin
             if numero[i] in ['A'..'F'] then
                case numero[i] of
                   'A': nue:= nue + 10*potencia(base,-i);
                   'B': nue:= nue + 11*potencia(base,-i);
                   'C': nue:= nue + 12*potencia(base,-i);
                   'D': nue:= nue + 13*potencia(base,-i);
                   'E': nue:= nue + 14*potencia(base,-i);
                   'F': nue:= nue + 15*potencia(base,-i);
                end
             else
                begin
                     val(numero[i],number,c);
                     nue:= nue + number*potencia(base,-i);
                end;
         end;
     for i:=1 to p-1 do
       begin
            if numero[i] in ['A'..'F'] then
                case numero[i] of
                   'A': nue2:= nue2 + 10*potencia(base,(p-1)-i);
                   'B': nue2:= nue2 + 11*potencia(base,(p-1)-i);
                   'C': nue2:= nue2 + 12*potencia(base,(p-1)-i);
                   'D': nue2:= nue2 + 13*potencia(base,(p-1)-i);
                   'E': nue2:= nue2 + 14*potencia(base,(p-1)-i);
                   'F': nue2:= nue2 + 15*potencia(base,(p-1)-i);
                end
             else
                begin
                     val(numero[i],number,c);
                     nue2:= nue2 + number*potencia(base,(p-1)-i);
                end;
       end;
     suma_ponderada:= nue2+nue;
end;
function cotesimetrico(numero:string;t,base:byte):string;
   var
       ac,a,digito,d:integer;
       c:char;
       cad,cadena,l:string;
       t1,p:byte;
   begin
        c:= numero[t+3];
        if((c='A')or(c='B')or(c='C')or(c='D')or(c='E')or(c='F'))then
           begin
           case c of
                       'A': digito:=10;
                       'B': digito:=11;
                       'C': digito:=12;
                       'D': digito:=13;
                       'E': digito:=14;
                       'F': digito:=15;
                   end;
           end
        else
        begin
        val(c,digito,a);
       end;
        ac:=1;
        p:=pos('x',numero);
        cad:=copy(numero,p,length(numero));
        if(t<=length(numero))then
           begin
                          if(digito>=base/2)then
                                             begin
                                                  c:=numero[t+2];

                                                  if((c='A')or(c='B')or(c='C')or(c='D')or(c='E')or(c='F'))then
                                                   begin
                                                   case c of
                                                     'A': d:=10;
                                                       'B': d:=11;
                                                       'C': d:=12;
                                                       'D': d:=13;
                                                        'E': d:=14;
                                                        'F': d:=15;
                                                     end;
                                                   d:=d+1;
                                                  end
                                                 else
                                                 begin val(c,d,a);

                                                  d:=d+1;
                                                  end;
                                                  if(d=base)then
                                                             begin

                                                                 str(d,l);
                                                                 c:=l[1];
                                                                 l:='';
                                                                 numero[t+2]:=c;
                                                                 t:=t-1;
                                                                 ac:=1;
                                                                while((ac=1) and (t<>0))do
                                                                               begin
                                                                                   c:=numero[t+2];
                                                                                   if((c='A')or(c='B')or(c='C')or(c='D')or(c='E')or(c='F'))then
                                                                              begin
                                                                                case c of
                                                                                'A': d:=10;
                                                                                'B': d:=11;
                                                                                'C': d:=12;
                                                                                'D': d:=13;
                                                                                'E': d:=14;
                                                                                'F': d:=15;
                                                                                end;
                                                                                 d:=d+1;
                                                                              end
                                                                                 else
                                                                                 begin val(c,d,a);
                                                                                   d:=d+1;
                                                                                   end;
                                                                               if(d=base)then
                                                                                          begin
                                                                                              d:=0;
                                                                                              str(d,l);
                                                                                               c:=l[1];
                                                                                               l:='';
                                                                                              numero[t+2]:=c;
                                                                                              t:=t-1;
                                                                                              ac:=1;
                                                                                            end
                                                                              else
                                                                                   begin
                                                                                     if(d>=10)then
                                                                                       begin
                                                                                         case d of
                                                                                               10: c:='A';
                                                                                               11: c:='B';
                                                                                                12: c:='C';
                                                                                                 13: c:='D';
                                                                                                14: c:='E';
                                                                                                15: c:='F';
                                                                                              end;
                                                                                        end
                                                                                     else begin
                                                                                       str(d,l);
                                                                                     c:=l[1];
                                                                                     l:='';end;
                                                                                     numero[t+2]:=c;
                                                                                      t:=t-1;
                                                                                      ac:=0;

                                                                                    end
                                                                              end;
                                                            if(numero[3]='0')then
                                                                       begin cadena:=copy(numero,3,t1+3);
                                                                          delete(cadena,t+1,length(numero));
                                                                          p:=pos('^',cad);
                                                                          c:=cad[p+1]; val(c,d,a); d:=d+1;  str(d,l); c:=l[1]; l:=''; cad[p+1]:=c;
                                                                          cotesimetrico:='0'+','+'1'+cadena+cad;
                                                                       end
                                                            else begin
                                                            delete(numero,3+t,length(numero));
                                                                   cotesimetrico:=numero;
                                                                 end;
                                                           end
                                                  else
                                                     begin
                                                      str(d,l);
                                                      c:=l[1];
                                                      numero[t+2]:=c;
                                                      delete(numero,3+t,length(numero));
                                                      cotesimetrico:=numero+cad;
                                                     end;
                                          end

                         else
                            begin
                            cotesimetrico:=corte(numero,t);
                           end;
           end
           else
            begin
             cotesimetrico:=corte(numero,t);
           end;
   end;
function menu():byte;
var
    resp:byte;
    begin
         resp:=-1;
         while((resp<0) or (resp>2))do
             begin writeln();
             writeln('por que metodo desea aplicar redondeo? ');
             writeln('1-Redondeo Simetrico ');
             writeln('2-Redondeo por Corte ');
             readln(resp);
             end;
             menu:=resp;
    end;
function conversion(base:byte; numero:integer):string;
  var
        resto2:string;
        iter,resto:integer;

  begin
       conversion:='';
       while (numero>=base)do
         begin
            resto:= numero mod base;
            numero:=numero div base;
            if resto in [10..16] then
               begin
                   case resto of
                       10: resto2:='A';
                       11: resto2:='B';
                       12: resto2:='C';
                       13: resto2:='D';
                       14: resto2:='E';
                       15: resto2:='F';
                   end;
               end
            else
               str(resto,resto2);
            conversion:=resto2+conversion;
         end;
         if numero in [10..16] then
            begin
              case numero of
                 10: resto2:='A';
                 11: resto2:='B';
                 12: resto2:='C';
                 13: resto2:='D';
                 14: resto2:='E';
                 15: resto2:='F';
              end;
            end
         else
            str(numero,resto2);
       conversion:=resto2+conversion;
  end;
function mult_reiterada(numero:real; base:byte):string;
  var
       pent:string;
       partent,iter:byte;

  begin
       mult_reiterada:='';
       iter:=0;
       while (iter<=9) and (numero<>0) do
        begin
             numero:= numero*base;
             partent:=trunc(numero);
             numero:= numero-partent;
             if partent in [10..16] then
             begin
               case partent of
                  10: pent:='A';
                  11: pent:='B';
                  12: pent:='C';
                  13: pent:='D';
                  14: pent:='E';
                  15: pent:='F';
               end;
             end
             else
               str(partent,pent);
             mult_reiterada:=mult_reiterada+pent;
             iter:=iter+1;
        end;
  end;
function normalizar(pe,pd:string; base:byte; s:byte):string;
  var
       norm,base2,ex:string;
       j,i,cd,k:byte;
  begin
       str(base,base2);
       if (pe[1]<>'0') then
         begin
          cd:= length(pe);
          str(cd,ex);
          norm:= '0.'+pe+pd+'x'+base2+'^'+ex;
         end
       else
          if pd[1]<>'0' then
             norm:='0.'+pd+'x'+base2+'^'+'0'
          else
            begin
             i:=1;
             k:=1;
             while (pd[1]='0') do
               begin
                   for j:=i to length(pd)-1 do
                     pd[j]:=pd[j+1];
                     delete(pd,length(pd),1);
                 k:=k+1;
               end;
             i:=k-1;
             str(i,ex);
             norm:='0.'+pd+'x'+base2+'^'+'-'+ex;
            end;
         normalizar:= norm;
  end;

var
     cort,normalizado,NS2,PFS,PES,NS:STRING;
     PF,NR:REAL;
     resp,B,t,base,C:BYTE;
     PE:integer;
begin
 resp:=1;
 while(resp<>0)do
    begin
 Write(' Ingrese el numero: ');
 readln(NS);
 val(NS,NR,C);
 B:=0;
 IF NR<0 THEN
   BEGIN
        B:=1;
        NR:=NR*-1
   end;
 if (C<>0) then
     writeln('error.')
 else
     begin
       repeat
       Write('Ingrese la base de llegada (2<=Base<=16): ');
       readln(base);
       until base in [2..16];
       PE:= trunc(NR);
       PF:= NR-PE;
       PES:=conversion(base,PE);
       PFS:= mult_reiterada(PF,base);
     NS2:= PES+ '.'+PFS;
    normalizado:= normalizar(PES,PFS,base,B);
    writeln();
    writeln('conversion entera');
    WRITELN(PES);
    writeln();
    writeln('conversion decimal');
    writeln(PFS);
    writeln();
    writeln('numero completo');
    if(b=1)then
    writeln('-',NS2)
    else
    writeln(NS2);
    writeln();
    writeln('normalizado');
    if (b=1) then
         begin
         writeln('-',normalizado);
         end
    else
         writeln(normalizado);

    resp:=menu();
    writeln();
    write('Ingrese la cantidad de digitos para la mantisa: ');
    readln(t);
    if(resp=1)then
      begin
       writeln('Redondeo Simetrico con t=',t);
      cort:= cotesimetrico(normalizado,t,base);
      end
   else begin
     writeln('Redondeo por Corte con t=',t);
      cort:= corte(normalizado,t);
    end;
   writeln(cort);
   writeln();
   writeln('0-Salir ');
   writeln('1-Ingresar otro numero ');
   readln(resp);
   end;
    end;
 writeln('Creado y compilado por:');
 writeln('Benicio Nahuel');
 writeln('Villatarco Miguel');
 writeln('Sequeira Alvaro');
 writeln('Tapia Maximiliano');
 writeln('Zalasar Alejandro');
 readln();
end.



