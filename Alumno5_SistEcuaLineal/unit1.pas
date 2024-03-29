unit Unit1;

interface
      uses MATH;
      type
        matrizA=array[1..10,1..10]of real;
        columB=array[1..10]of real;
        Sistemas= class
            private
               mat:matrizA;
               b:columB;
               t:integer;
               s:columB;
            public
                procedure carga_sist(tam:integer);
                procedure ampliar_sist(var a:matrizA);
                procedure intercambio_fila(var a:matriza; f1,f2:integer);
                procedure intercambio_col(var a:matrizA; c1,c2:integer);
                procedure pivoteo_p(var a:matrizA; ind:integer);
                procedure pivoteo_c(var a:matrizA; ind:integer);
                procedure sust_regresiva(a:matrizA);
                procedure most_sol();
                procedure Gauss_PP();
                procedure Gauss_PC();
                procedure Gauss_Jordan();
                procedure Crout();
                procedure Cholesky();
                function norma(x:columB):real;
                procedure Jacobi(error:real; maxiter:integer);
                procedure Gauss_Seidel(error:real; maxiter:integer);
                procedure resto(xo:columB; var r:columB);
                function mayor(r:columB):integer;
                procedure Relajamiento(error:real; maxiter:integer);
                constructor create(tam:integer);
                procedure mostrar_Sistema();
                procedure inicializar_sol();
                function Norma_Matriz():real;
           end;

implementation
          constructor Sistemas.create(tam:integer);
          begin
            t:=tam;
          end;

          procedure Sistemas.ampliar_sist(var a:matrizA);
          var
              i:integer;
          begin
               a:= mat;
               for i:=1 to t do
                   a[i,t+1]:= b[i];
          end;

          procedure Sistemas.mostrar_Sistema();
            var
                a:matrizA;
                i,j:integer;
            begin
                ampliar_sist(a);
                writeln('La matriz ampliada es: ');
                for i:=1 to t do
                  begin
                    for j:=1 to t+1 do
                      write(a[i,j]:4:1,' ');
                    writeln;
                  end;
            end;

          procedure Sistemas.carga_sist(tam:integer);
          var
              i,j:integer;
          begin
             t:=tam;
             writeln('carga de matriz: ');
             for i:=1 to t do
               for j:=1 to t do
                 begin
                   writeln('Coeficiente [',i,',',j,']:');
                   readln(mat[i,j]);
                 end;
             writeln('carga de terminos independientes: ');
             for i:=1 to t do
                begin
                   writeln('termino independiente b[',i,']:');
                   readln(b[i]);
                 end;
             mostrar_Sistema();
          end;

          procedure Sistemas.intercambio_fila(var a:matrizA; f1,f2:integer);
          var
              i:integer;
              aux:real;
          begin
                for i:=1 to t+1 do
                  begin
                    aux:=a[f1,i];
                    a[f1,i]:= a[f2,i];
                    a[f2,i]:= aux;
                  end;
          end;

          procedure Sistemas.intercambio_col(var a:matrizA; c1,c2:integer);
          var
              i:integer;
              aux:real;
          begin
               for i:=1 to t do
                  begin
                    aux:=a[i,c1];
                    a[i,c1]:= a[i,c2];
                    a[i,c2]:= aux;
                  end;
          end;
          procedure Sistemas.pivoteo_p(var a:matrizA; ind:integer);
          var
               may:real;
               j,i:integer;
          begin
               may:=a[ind,ind];
               j:=ind;
               for i:=ind+1 to t do
                  if abs(a[i,ind])>abs(may) then
                     begin
                       may:=a[i,ind];
                       j:=i;
                     end;
               intercambio_fila(a,ind,j);
          end;

          procedure Sistemas.pivoteo_c(var a:matrizA; ind:integer);
          var
               may:real;
               fil,col,j,i:integer;
          begin
               may:= a[ind,ind];
               fil:=ind;
               col:=ind;
               for i:=ind to t do
                 for j:=ind to t do
                  if abs(a[i,j])>abs(may) then
                     begin
                       may:=a[i,j];
                       fil:=i;
                       col:=j;
                     end;
               intercambio_fila(a,ind,fil);
               intercambio_col(a,ind,col);
          end;

          procedure Sistemas.sust_regresiva(a:matrizA);
          var
              i,j:integer;
          begin
               for i:=t downto 1 do
                begin
                    s[i]:=a[i,t+1];
                    for j:=i+1 to t do
                      s[i]:=s[i]- a[i,j]*s[j];
                    s[i]:=s[i]/a[i,i];
                end;
          end;

          procedure Sistemas.most_sol();
          var
              i:integer;
          begin
              writeln('solucion: ');
              for i:=1 to t do
                writeln(s[i]:12:12);
          end;

          procedure Sistemas.Gauss_PP();
          var
              a:matrizA;
              k,i,j:integer;
              m:real;
          begin
              ampliar_sist(a);
              for k:=1 to t-1 do
                begin
                  pivoteo_p(a,k);
                  for i:=k+1 to t do
                   begin
                     m:= a[i,k]/a[k,k];
                     a[i,k]:=0;
                     for j:=k+1 to t+1 do
                       a[i,j]:=a[i,j]-m*a[k,j]
                   end;
                end;
              sust_regresiva(a);
              most_sol();
          end;

          procedure Sistemas.Gauss_PC();
          var
             a:matrizA;
             k,i,j:integer;
             m:real;
          begin
             ampliar_sist(a);
             for k:=1 to t-1 do
               begin
                 pivoteo_c(a,k);
                 for i:=k+1 to t do
                 begin
                   m:= a[i,k]/a[k,k];
                   a[i,k]:=0;
                   for j:=k+1 to t+1 do
                      a[i,j]:=a[i,j]-m*a[k,j];
                 end;
               end;
              sust_regresiva(a);
              most_sol();
          end;

          procedure Sistemas.Gauss_Jordan();
          var
             a:matrizA;
             k,i,j:integer;
             m:real;
          begin
              ampliar_sist(a);
              for k:=1 to t do
                begin
                   pivoteo_p(a,k);
                   for i:=1 to t do
                     if i<>k then
                       begin
                          m:= a[i,k]/a[k,k];
                          for j:=1 to t+1 do
                             a[i,j]:=a[i,j]-(m*a[k,j]);
                       end;
                end;
              for i:=1 to t do
                  s[i]:= a[i,t+1]/a[i,i];
              most_sol();
          end;

          procedure Sistemas.Crout();
          var
             a:matrizA;
             k,i,j,p:integer;
          begin
               ampliar_sist(a);
               for k:=1 to t do
                begin
                 for j:=k to t+1 do
                   begin
                    for p:=1 to k-1 do
                       a[k,j]:=a[k,j]-a[k,p]*a[p,j];
                   end;
                 for i:=k+1 to t do
                   begin
                    for p:=1 to k-1 do
                       a[i,k]:=a[i,k]-a[i,p]*a[p,k];
                    a[i,k]:= a[i,k]/a[k,k];
                   end;
                end;
               sust_regresiva(a);
               most_sol();
          end;

          procedure Sistemas.Cholesky();
          var
             a:matrizA;
             k,i,j:integer;
             m:real;
          begin
              ampliar_sist(a);
              for k:=1 to t do
                begin
                  m:=0;
                  for i:=1 to k-1 do
                    m:=m+power(a[i,k],2);
                  m:= a[k,k]-m;
                  a[k,k]:=sqrt(m);
                  for j:=k+1 to t+1 do
                    begin
                      m:=0;
                      for i:=1 to k-1 do
                        m:=m+a[i,k]*a[i,j];
                      a[k,j]:= (a[k,j]-m)/a[k,k];
                    end;
                end;
              sust_regresiva(a);
              most_sol();
          end;

          function Sistemas.norma(x:columB):real;
          var
              m:real;
              i:integer;
          begin
              m:=0;
              for i:=1 to t do
                  m:= m+power(x[i],2);
              m:=sqrt(m);
              result:= m;
          end;

          procedure Sistemas.inicializar_sol();
          var
              i:integer;
          begin
               for i:=1 to t do
                  s[i]:=0;
          end;
          procedure Sistemas.Jacobi(error:real; maxiter:integer);
          var
              a:matrizA;
              nb,x,xo:columB;
              d:real;
              j,i,iter:integer;
              {--------------------
              p:real;
              k:integer;
              --------------------}
          begin
               a:=mat;
               for i:=1 to t do
                begin
                  d:= 1/a[i,i];
                  nb[i]:= d*b[i];
                  for j:=1 to t do
                     a[i,j]:=d*a[i,j];
                end;
               iter:=0;
               inicializar_sol();
               repeat
                   iter:=iter+1;
                   xo:=s;
                   {------------------------------
                   write('X[0]=(');
                   for k:=1 to t do
                      write(xo[k],', ');
                   writeln(')');
                   ------------------------------}
                   for i:=1 to t do
                     begin
                       s[i]:=nb[i];
                       for j:=1 to t do
                         if i<>j then
                           s[i]:=s[i]-a[i,j]*xo[j];
                     end;

                   {-------------------------------
                   write('X[1]:');
                   for k:=1 to t do
                      write(s[k],', ');
                   writeln(')');
                   -------------------------------}
                   for i:=1 to t do
                      x[i]:= s[i]-xo[i];
                   {-------------------------------
                   p:= norma(x);
                   writeln('Norma= ',p);
                   -------------------------------}
               until (norma(x)<error) or (iter>maxiter);
               most_sol();
          end;

          procedure Sistemas.Gauss_Seidel(error:real; maxiter:integer);
          var
              x,xo:columB;
              i,j,iter:integer;
              {--------------------
              p:real;
              k:integer;
              --------------------}
          begin
              iter:=0;
              inicializar_sol();
              repeat
                 iter:=iter+1;
                 xo:=s;
                 {------------------------------
                   write('X[0]=(');
                   for k:=1 to t do
                      write(xo[k],', ');
                   writeln(')');
                 ------------------------------}
                 for i:=1 to t do
                   begin
                     s[i]:=b[i];
                     for j:=i+1 to t do
                       s[i]:=s[i]-mat[i,j]*xo[j];
                     for j:=1 to i-1 do
                       s[i]:=s[i]-mat[i,j]*s[j];
                     s[i]:=s[i]/mat[i,i];
                   end;
                 {-------------------------------
                   write('X[1]:');
                   for k:=1 to t do
                      write(s[k],', ');
                   writeln(')');
                 -------------------------------}
                 for i:=1 to t do
                   x[i]:= s[i]-xo[i];
                 {-------------------------------
                   p:= norma(x);
                   writeln('Norma= ',p);
                 -------------------------------}
              until (norma(x)<error) or (iter>maxiter);
              most_sol();
          end;

          procedure Sistemas.resto(xo:columB; var r:columB);
          var
               i,j:integer;
          begin
               for i:=1 to t do
                begin
                  r[i]:=0;
                  for j:=1 to t do
                    r[i]:= r[i]+mat[i,j]*xo[j];
                  r[i]:= b[i]-r[i];
                end;
          end;

          function Sistemas.mayor(r:columB):Integer;
          var
              posmay,i:integer;
              may:real;
          begin
              may:=r[1];
              posmay:=1;
              for i:=2 to t do
                if abs(r[i])>abs(may) then
                 begin
                   may:=r[i];
                   posmay:=i;
                 end;
              result:=posmay;
          end;

          procedure Sistemas.Relajamiento(error:real; maxiter:integer);
          var
              r:columB;
              m:integer;
              {--------------------
              p:real;
              k,i:integer;
              --------------------}
              i:integer;
          begin
              inicializar_sol();
              resto(s,r);
              i:=0;
              {-----------
              writeln('norma',norma(r));
              ------------}
              while (norma(r)>error) do
               begin
                 m:=mayor(r);
                 s[m]:= s[m]+(r[m]/mat[m,m]);
                 {------------------------------
                   write('X[',i,']=(');
                   for k:=1 to t do
                      write(s[k],', ');
                   writeln(')');
                  ------------------------------}
                 resto(s,r);
                 {------------------------------
                   write('resto[',i,']=(');
                   for k:=1 to t do
                      write(r[k],', ');
                   writeln(')');
                  ------------------------------}
                 {-------------------------------
                   p:= norma(r);
                   writeln('Norma residual= ',p);
                 -------------------------------}
                  i:=i+1;
               end;
               most_sol();
          end;
          function Sistemas.Norma_Matriz():real;
          var
              sum:columB;
              may:real;
              i,j:integer;
          begin
              for i:=1 to t do
                begin
                  for j:=1 to t do
                     sum[i]:= sum[i]+abs(mat[j,i]);
                end;
              may:= 0;
              for i:=1 to t do
                  if sum[i]>may then
                     may:=sum[i];
              result:= may;
          end;
end.


