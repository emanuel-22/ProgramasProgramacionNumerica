unit uAproximacion;

interface

type
  tVector = array of double;
  tMatriz = array of tVector;

  TAproximacion = class
    private
      vectorX : tVector;
      vectorY : tVector;
      cantPuntos : Integer;
    public
      constructor crear();
      destructor destruir();

      procedure setCantPuntos(puntos: integer);       // INDICAR LA CANTIDAD DE PUNTOS CON LA QUE SE TRABAJARA
      function getCantPuntos(): Integer;               // DEVUELVE LA CANTIDAD DE PUNTOS

      procedure setVectorX(vectX : tVector);          // CARGAR EL VECTOR CON LOS VALORES DE X
      function getVectorX(): tVector;                  // DEVUELVE EL VECTOR DE LAS X

      procedure setVectorY( vectY : tVector);          // CARGAR EL VECTOR Y
      function getVectorY(): tVector;                  // DEVULVE EL VECTOR DE LAS Y

      function getVectorY1(pos : Integer) :double;     // DEVUELVE EL VALOR Y DE LA POSICION POS
      function getVectorX1(pos: Integer) : double;    // DEVUELVE EL VALOR X DE LA POSICION POS

       procedure CopiarVector (VectorOrigen , VectorDestino : tVector);        // Copia el tVector en otro polinomio que se le pasa por paramatro

      procedure extraerCoeficientes(Q : tVector);      // METODO QUE DEVUELVE EN Q LOS COEFICIENTES DE LA PRODUCTORIA PARA LAGRANGE
      function ruffini_Ad(Q : tVector; a : double; C : tVector): double; // RUFINI ADICIONAL QUE SE UTILIZA EN LAGRANGE
      function Matriz_Lagrange(): tMatriz;             // METODO QUE CALCULA Y DEVUELVE LA MATRIZ DE LAGRANGE
      function Colocacion_Lagrange() : tVector;        // METODO DE UTILIZA LA MATRIZ DE LAGRANGE Y DEVUELVE EL POLINOMIO RESULTANTE DE LA COLOCACION

      function DiferenciaDividida(): tVector;          // Calcula y Devuelve el vector con los valores necesarios de la tabla de diferencias divididas para calcular el Polinomio
      procedure Distributiva (cantidad : integer ; Q : tVector);   // calcula y devuelve un tVector de los resultados que el multiplicar con la variable "x" : (x-xi)*(x-xi+1)*...
      function Colocacion_Newton ( ai : tVector ) : tVector;   // Calcula y devuelve el Polinomio de tipo tVector
      procedure Metodo_Newton2 ( ai : tVector );       // NO devuelve nada solo muestra por consola como es el proceso para conseguir el Polinomio
      procedure Mostrar_Polinomio (Pol : tVector);     // Muestra de forma mas visual el vector que contiene los coeficiente del Polinomio resultante
      procedure Mostrar_Vector (vec : tVector);        // Muestra cualquier vector mientras y cuando sea del mismo tama�o que la cantidad de Puntos
    end;

implementation

constructor TAproximacion.crear;
begin
  cantPuntos := 0;
end;

destructor TAproximacion.destruir();
begin
  inherited Destroy;
end;

procedure TAproximacion.setCantPuntos(puntos : integer);
begin
  self.cantPuntos := puntos;
end;

function TAproximacion.getCantPuntos(): Integer;
begin
  result := self.CantPuntos;
end;

procedure TAproximacion.setVectorX(vectX: tVector);
begin
  SetLength(self.vectorX , getCantPuntos());
  self.vectorX := vectX;
end;

function TAproximacion.getVectorX() : tVector;
begin
  result := self.vectorX;
end;

procedure TAproximacion.setVectorY( vectY : tVector);
begin
  SetLength(self.vectorY, getCantPuntos);
  self.vectorY := vectY;
end;

function TAproximacion.getVectorY(): tVector;
begin
  result := self.vectorY;
end;

function TAproximacion.getVectorX1( pos: Integer) : double;
begin
  result := self.vectorX[pos];
end;

function TAproximacion.getVectorY1(pos : integer) :double;
begin
  result := self.vectorY[pos];
end;

procedure TAproximacion.CopiarVector (VectorOrigen , VectorDestino : tVector);        // Copia el tVector en otro polinomio que se le pasa por paramatro
            var
              i : integer;
            begin
              for i:=0 to getCantPuntos()-1 do
                VectorDestino[i] := VectorOrigen[i]
            end;

procedure TAproximacion.extraerCoeficientes(Q : tVector);
var
  i, j : Integer;
begin
  Q[0] := - getVectorX1(0);
  for i:= 1 to getCantPuntos() do
    Q[i] := 1;
  for i := 1 to getCantPuntos()-1 do begin
    for j := i downto 1 do
      Q[j] := Q[j-1] - Q[j] * getVectorX1(i);
    Q[0] := -Q[0] * getVectorX1(i);
  end;
end;

function TAproximacion.ruffini_Ad(Q : tVector; a : double; C : tVector): double;
var
  dQ: double;
  i: integer;
begin
  dQ := 0;
  C[getCantPuntos()] := Q[getCantPuntos()];
  for i:= getCantPuntos()-1 downto 0 do begin
    dQ := C[i+1] + a * dQ;
    C[i] := Q[i] + a * C[i+1];
  end;
  result := dQ;
end;

function TAproximacion.Matriz_Lagrange(): tMatriz;
var
  dQ : double;
  i, j : Integer;
  Q, C : tVector;
  L : tMatriz;
begin

  SetLength(Q, getCantPuntos() +1);
  SetLength(C, getCantPuntos() +1);
  SetLength(L, getCantPuntos(), getCantPuntos());
  extraerCoeficientes(Q);

  for i:= 0 to getCantPuntos()-1 do begin
    dQ := ruffini_Ad(Q, getVectorX1(i), C);
    for j:= 0 to getCantPuntos()-1 do
      L[j, i] := C[j+1]/dQ;
    end;

  SetLength(Q, 0);
  SetLength(C, 0);
  result := L;
end;

function TAproximacion.Colocacion_Lagrange() : tVector;
var
  i, j : integer;
  pol : tVector;
  aux : double;
  G : tMatriz;
begin
  SetLength(pol, getCantPuntos());
  SetLength(G, getCantPuntos(), getCantPuntos());
  G := Matriz_Lagrange();
  for i:=0 to getCantPuntos()-1 do begin
    aux :=0;
    for j:=0 to getCantPuntos()-1 do
      aux:= aux + G[i][j] * getVectorY1(j);
    pol[i] := aux;
  end;

  SetLength(G,0,0);
  result := pol;
end;

function TAproximacion.DiferenciaDividida(): tVector;
            var
              i,j,ind: integer;
              D, DA : tVector;        // en DA almaceno los valores de la Diferencia dividida que estan por arriba osea los valore que necesito para armar mi Polinomio
            begin
              SetLength(D, getCantPuntos() +1);
              SetLength(DA, getCantPuntos() +1);
              ind:=0;
              CopiarVector(getVectorY,D);  // CopiarVector (origen , destino); origen y destino son de tipo tVector
              DA[0] := getVectorY1(0);

              //writeln('DA[0] = ',DA[0]:0:5);
              for j:= 1 to getCantPuntos()-1 do
              begin
                  ind := ind + (getCantPuntos -j) ;
                  for i:= getCantPuntos()-1 downto j do
                    begin
                    D[i]:= (D[i] - D[i-1]) / (getVectorX1(i) - getVectorX1(i-j));
                    //writeln('D[i] = ',D[i]:0:5);   DESCOMENTAR PARA VER CMO TRABAJA CON LA TABLA DE DIFERENCIAS DIVIDIDAS
                    end;

                  DA[j] := D[ind - 1];
              end;

              result := DA ;

            end;

            procedure TAproximacion.Distributiva (cantidad : integer ; Q : tVector);
            var
              i, j : Integer ;
            begin
              Q[0] := - getVectorX1(0);
              for i:= 1 to cantidad do
                Q[i] := 1;
              for i:= 1 to cantidad-1 do begin
                for j:= i downto 1 do
                  Q[j] := Q[j-1] - Q[j] * getVectorX1(i);
                Q[0] := -Q[0] * getVectorX1(i);
              end;
              {
              writeln('');
              writeln('Factor ',cantidad);
              for i:=0 to cantidad do
                writeln('Q[',i,']= ',Q[i]:0:5);
              }                                        // DESCOMENTAR SI QUIEREN VER COMO QUEDAN CUANDO DISTRIBUYEN LOS (X-Xi)*(X-Xi+1)*...
            end;


            function TAproximacion.Colocacion_Newton( ai : tVector): tVector;
            var
              i,j: integer;
              P , aux : tVector;  // P : Polinomio  y  aux : Vector del resultado de las distributivas de (x- xi)*(x-xi+1)*...
            begin
              SetLength ( P ,getCantPuntos() + 1);
              SetLength ( aux ,getCantPuntos() + 1);

              P[0] := ai[0];
              for i:=1 to getCantPuntos()-1 do
              begin
                Distributiva (i,aux);                // REALIZO  la distributiva de los (x-xi)*(x-xi+1)*...
                for j:=0 to i do
                  P[j]:= P[j] + ai[i] * aux[j];      // Aqui en la Posicion del polinomio con respecto al indice "j" suomo el producto del valor de la diferencia dividida con respecto al indice "i" con el valor de la ecuacion que resulta de 'Distributiva' con respecto al indice "j"
              end;

              result:= P;

            end;

            // NO DEVUELVE NADA SOLO MUESTRA POR CONSOLA
            procedure TAproximacion.Metodo_Newton2( ai : tVector);     // Este metodo muestra como va armando el Polinomio de Interpolacion por Newton
            var
              j,k: integer;
            begin
              Write ('P(x) = ',ai[0]:0:2);

                for j:=1 to getCantPuntos()-1 do  // muestra los aj (x - xj) ...
                begin
                  Write (' + ');
                  if ai[j]<0 then                 // signo
                    Write ('(',ai[j]:0:2,')')
                  else
                    Write ('',ai[j]:0:2);

                  for k:=0 to j-1 do             //  va generando los (x - xk)
                  begin
                    write (' * ( x - ');
                    if getVectorX1(k) < 0 then
                        write ('(',getVectorX1(k):0:2,') ) ')
                    else
                        write ('',getVectorX1(k):0:2,' ) ');
                  end;


                end;

            end;

            procedure TAproximacion.Mostrar_Polinomio (Pol : tVector);     // Lo uso para mostrar como queda el vector visto como Polinomio
            var
              i: integer;
            begin
              write ('P(x) =');
              for i:=getCantPuntos()-1 downto 1 do
              begin
                if  i <> getCantPuntos()-1 then
                begin
                  if Pol[i] < 0 then
                    write (' + (',Pol[i]:0:2,') * x ^',i)
                  else
                    write (' +  ',Pol[i]:0:2,' * x ^',i);
                end
                else
                   write (' ',Pol[i]:0:2,' * x ^',i);
              end;
              if Pol[0] < 0 then
                write (' + (',Pol[0]:0:2,')')
              else
                write (' + ',Pol[0]:0:2);
            end;

            procedure TAproximacion.Mostrar_Vector (vec : tVector);
            var
              i: integer;
            begin
              for i:=0 to getCantPuntos()-1 do
                writeln ('V[',i,'] = ',vec[i]:0:2);
            end;

end.
