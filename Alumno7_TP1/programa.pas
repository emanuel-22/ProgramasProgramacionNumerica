  program programaErrores;




  function corte(numero:string; t:byte):string;
     var
          p:byte;
          cad:string;
     begin
          p:=pos('x',numero);      //halla la primera posicion de la ocurrencia de la cadena
          cad:=copy(numero,p,length(numero));  //copia length caracteres de numero partiendo de p
          delete(numero,3+t,length(numero));  //borra length caracteres de numero partiendo de 3+t.la suma 3+t+length debe ser inferior al numero de caracteresde numero
          corte:=numero+cad;
     end;







  function cortesimetrico(numero:string;t,base:byte):string;
     var
         ac,a,digito,d:integer;
         c:char;
         cad,cadena,l:string;
         t1,p:byte;
     begin
          t1:=0;
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
                                                                            cortesimetrico:='0'+','+'1'+cadena+cad;
                                                                         end
                                                              else begin
                                                              delete(numero,3+t,length(numero));
                                                                     cortesimetrico:=numero;
                                                                   end;
                                                             end
                                                    else
                                                       begin
                                                        str(d,l);
                                                        c:=l[1];
                                                        numero[t+2]:=c;
                                                        delete(numero,3+t,length(numero));
                                                        cortesimetrico:=numero+cad;
                                                       end;
                                            end

                           else
                              begin
                              cortesimetrico:=corte(numero,t);
                             end;
             end
             else
              begin
               cortesimetrico:=corte(numero,t);
             end;
     end;


function menu():byte;
  var
      resp:integer;
      begin
           resp:=(-1);
           while((resp<0) or (resp<=2))do
               begin
               writeln();
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
          resto:integer;

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
                  str(resto,resto2);   //procedimiento  que convierte el numero resto  en cadena
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
              str(numero,resto2);     //procedimiento que convierte el numero en cadena resto 2
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






  function normalizar(pe,pd:string; base:byte):string;
    var
         norm,base2,ex:string;
         j,i,cd,k:byte;
    begin
         str(base,base2);   //convierte el numero en una cadena


         if (pe[1]<>'0') then         //si el primer caracter de la cadena es igual a 0
           begin
            cd:= length(pe);
            str(cd,ex);            //convierte el tamño en una cadena
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
                       d elete(pd,length(pd),1);
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
          val(NS,NR,C);    //procedimiento convierte NS en  un valor entero o real y lo asigna a NR y c es una vble entera que indica si hubo error
          B:=0;

   IF NR<0 THEN
     begin
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

         PE:= trunc(NR);         //trunca la parte decimal de NR el resultado es entero
         PF:= NR-PE;               //PE es parte entera y PF es parte fraccionaria
         PES:=conversion(base,PE);
         PFS:= mult_reiterada(PF,base);
       NS2:= PES+ '.'+PFS;
      normalizado:= normalizar(PES,PFS,base);
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
      writeln('Redondeo Simetrico con t=',t);
      cort:= cortesimetrico(normalizado,t,base);
      writeln('Redondeo por Corte con t=',t);
      cort:= corte(normalizado,t);
     writeln(cort);
     writeln();
     writeln('0-Salir ');
     writeln('1-Ingresar otro numero ');
     readln(resp);
     end;



     end;

   writeln('Creado y compilado por:');
   writeln('Miro Moron Brian');
   writeln('Villatarco Miguel');
   writeln('Benavidez Daniel');
   writeln('Palacio Diego');
   writeln('Guantay Emanuel');
   readln();





   //-------------------------------------------------------------

   procedure controlmaya();
   var
     t:integer;
   begin
     repeat
       Write('Ingrese el tamaño de la malla(t>0):');
       readln(t);
     until(t>0);
   end;

   procedure controlString;
   var
     numero:String;
     c:byte;
     entero:integer
   begin
        Write('Ingrese el numero:');
        readln(numero);
        val(numero,entero,c);

   end;








  end.



