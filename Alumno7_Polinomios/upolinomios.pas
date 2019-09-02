unit UPolinomios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TPolinomio = class
    private
      grado_polinomio : Byte;
      TListCoef : Array of Real;
      procedure CargarPolinomio(P:String;Gr:Byte);
      function EsPositivo():Boolean;

    public
      constructor CrearPolinomio(G:Byte);overload;
      constructor CrearPolinomio(NuevoP:String;G:Byte);overload;
      destructor Borrar();overload;
      function MostrarPolinomio():String;
      function EvaluarPolinomio(num:Real):Real;
      procedure SetGrado(Gr:Byte);
      function GetGrado():Byte;
      procedure SetListCoef(elem:Real;N:Byte);
      function GetListCoef(N:Byte):Real;
      procedure HornerSimple(var Q,R:TPolinomio;b:Real);
      procedure HornerCuadratico(var Q,R:TPolinomio;a,b:Real);
      function RaicesReales():String;
      function RaicesRacionales():String;

      function deter_cotaposi_Lagrage():String;
      function deter_cotaposi_Laguerre():String;
      function deter_cotamenor_negativa ():Real;
      function deter_cotamenor_positiva():Real;

      property grado:Byte read GetGrado write SetGrado;

end;

implementation

// Toma el Polinomio que esta como String en P y va a separar
// cada elemento del mismo para guardarlo en una Lista.
// Tendremos una bandera para ver si ya tomo el primer signo (+ o -) del Polinomio ingresado.
// En la variable C se va a asignar el valor del Coeficiente y en N el Exponente.
// Luego e1 y e2 son los Codigos de Error para La Funcion Val().
procedure TPolinomio.CargarPolinomio(P:String;Gr:Byte);
var
  S : String;
  C, N, e1, e2: Integer;
  band : Boolean;
begin
  band := false;
  grado:=Gr;                      // Seteo el grado del Polinomio.
  SetLength(TListCoef,grado+1);   // Actualizo el tamaño del vector.
  while (Length(P) <> 0) do       // Controlamos el tamaño del String.
  begin
       if (P[1] = '-') then
          begin
            if (Length(P) = 2) then
               begin
                   S := Copy(P,1,2);     // Copiamos el coeficiente.
                   Val(S,C,e1);          // Convierto el String a un valor numerico y lo guardo en C (coeficieinte).
                   TListCoef[0] := C;    // Termino Independiente.
                   Delete(P,1,2);        // Dejamos el String vacio ''.
               end
            else
               begin
                   S := Copy(P,1,2);   // Copiamos el coeficiente.
                   Val(S,C,e1);        // Convierto el String a un valor numerico y lo guardo en C (coeficieinte).
                   Delete(P,1,4);
                   S := Copy(P,1,1);   // Copiamos el exponente.
                   Val(S,N,e1);        // Convierto el String a un valor numerico y lo guardo en N (exponente).
                   TListCoef[N] := C;  // Ya tenemos los dos datos, solo asignamos.
                   Delete(P,1,1);      // Boramos el exponente.
               end;
            band := true;
          end    // Fin if
       else
          begin
               if (band = true) then    // Si no es el primer caracter leido.
                  Delete(P,1,1);        // Borro el signo mas '+'.
               if (Length(P) = 1) then
                  begin
                       S := Copy(P,1,1);     // No copiamos el signo mas, solo el coeficiente.
                       Val(S,C,e1);          // Convertimos el String a un valor numerico y lo guardo en C (coeficieinte).
                       TListCoef[0] := C;     // Asigno el termino independiente.
                       Delete(P,1,1);        // Dejamos el String vacio ''.
                  end
               else
                  begin
                      S := Copy(P,1,1);    // No copiamos el signo mas, solo el coeficiente.
                      Val(S,C,e1);        // Convertimos el String a un valor numerico y lo guardo en C (coeficieinte).
                      Delete(P,1,3);
                      S := Copy(P,1,1);   // Copiamos el exponente
                      Val(S,N,e1);        // Convierto el String a un valor numerico y lo guardo en N (exponente).
                      TListCoef[N] := C;  // Ya tenemos los dos datos, solo asignamos.
                      Delete(P,1,1);      // Boramos el exponente.
                  end;
               band := true;
          end;   // Fin else
  end;
end;

// El Constructor va a recibir P que es un String donde esta escrito el polinomio
// de la forma : a(n)x^(n)+a(n-1)x^(n-1)+...+ax+a
constructor TPolinomio.CrearPolinomio(NuevoP:String;G:Byte);
begin
  CargarPolinomio(NuevoP,G);
end;

constructor TPolinomio.CrearPolinomio(G:Byte);
begin
  grado:=G;
  SetLength(TListCoef,grado+1);
end;

// Libera la memoria utilizada por el Objeto.
destructor TPolinomio.Borrar();
begin
  inherited Destroy;
end;

// Solo devuelve el valor del Grado del Polinomio.
function TPolinomio.GetGrado():Byte;
begin
  Result := grado_polinomio;
end;

// Solo remplaza el valor del grado del polinomio por Gr
procedure TPolinomio.SetGrado(Gr:Byte);
begin
  grado_polinomio:=Gr;
end;

// Solo reemplaza en la Lista de Coeficientes en valor de elem en la posicion N.
procedure TPolinomio.SetListCoef(elem:Real;N:Byte);
begin
  TListCoef[N] := elem;
end;

// Devuelve el valor del Coeficiente ubicado en el Exponente N.
function TPolinomio.GetListCoef(N:Byte):Real;
begin
  Result := TListCoef[N];
end;

// Devuelve en un String el Polinomio almacenado en el Array de dicho Objeto
// ordenado de mayor exponente a menor exponente.
// En S y E almacenamos el coeficiente y exponente transformados en String.
function TPolinomio.MostrarPolinomio():String;
var
  Num: Real;
  Cad, E, S : String;
  i : Byte;
begin
  Cad := '';
  for i := grado downto 0 do
  begin
    if (i = 0) then                          // Para el termino independiente trabajamos aparte.
       begin
            Num := TListCoef[i];
            S := FloatToStr(Num);            // Convierto a String los valores.
            if (Num > 0) then                // Si es positivo imprimo '+'
               Cad := Cad+'+'+S;
            if (Num < 0) then                // Sino el numero.
               Cad := Cad+S;
       end
    else
       begin
            Num := TListCoef[i];
            S := FloatToStr(Num);Str(i,E);   // Convierto a String los valores.
            if (Num > 0) then
               if (i = grado) then           // Si es el primer coeficiente y positivo entonces no imprimo '+'.
                  Cad := Cad+S+'x^'+E
               else
                  Cad := Cad+'+'+S+'x^'+E;   // Para todos los otros casos lo muestro al signo.
            if (Num < 0) then                // Si es negativo solo imprimo el numero.
               Cad := Cad+S+'x^'+E;
       end;
  end;
  Result := Cad;
end;

// Evalua el valor de num en el Polinomio ingresado con la siguiente formula:
// [ ((a(n)x+a(n-1)*x+a(n-2))....)*x+a1)*x+a0 , con x = num.
function TPolinomio.EvaluarPolinomio(num:Real):Real;
var
  i : Byte;
  X : Real;
begin
  X := TListCoef[grado];  // Le Asignamos a X el coeficiente de mayor grado de ListaCoef.
  for i := (grado-1) downto 0 do
  begin
       X := ( X * num ) + TListCoef[i];
  end;
  Result := X;
end;

// Aplica un Horner (Ruffini) simple con un Polinomio Q(x) de Grado 1 a un P(x) de Grado n.
// Q y R son Objetos de TPolinomio que contienen las Listas de Coeficientes para el Cociente y el Resto,
// b es el termino independiente del Polinomio Q(x).
procedure TPolinomio.HornerSimple(var Q,R:TPolinomio;b:Real);
var
  i : Byte;
begin
  // Asignamos al Primer Coeficiente de la Lista de Cocientes (por def de Horner)
  Q.SetListCoef(TListCoef[grado],Q.grado);
  for i := (Q.grado) downto 0 do
  begin
      if (i = 0) then
         // Si es el ultimo termino, al resultado lo agregamos al resto.
         // El resto para Horner Simple es de Grado 0.
         R.SetListCoef(TListCoef[i] + ( (-b) * Q.GetListCoef(i)),0)
      else
         // Caso contrario vamos agregando los coeficientes a la Lista de Cociente.
         Q.SetListCoef(TListCoef[i] + ( (-b) * Q.GetListCoef(i) ) , (i-1) );
  end;
end;

// Aplica Horner Cuadratico a P(x) con un Q(x) = x^2+ax^1+b.
// Cociente es un Objeto de TPolinomio que contiene la Lista de Coeficientes y
// a , b son los coeficinetes del termino cuadratico.
procedure TPolinomio.HornerCuadratico(var Q,R:TPolinomio;a,b:Real);
var
   i : Byte;
begin
   // Asignamos al Primer Coeficiente de la Lista de Coeficientes
   Q.SetListCoef(TListCoef[grado],Q.grado);
   // Ahora, asignamos al Segundo Coeficiente de la Lista de Coeficientes (por def Horner Cuad).
   Q.SetListCoef( ((-a)*Q.GetListCoef(Q.grado)) + TListCoef[grado-1],Q.grado-1);
   // Para todos los otros coeficientes hacemos un "Horner Simple".
   for i := (Q.grado-1) downto 1 do
       Q.SetListCoef( (Q.GetListCoef(i)*(-a)) + (Q.GetListCoef(i+1)*(-b)) + TListCoef[i+1],i-1);
   // En este caso el Resto es un Polinomio de Grado 1, por eso lo guardamos de esta manera (segun Def.).
   R.SetListCoef( ((Q.GetListCoef(0)*(-a)) + (Q.GetListCoef(1)*(-b)) + TListCoef[1]),1); // Para el Exp 1.
   R.SetListCoef( (Q.GetListCoef(0)*(-b)) + TListCoef[0],0);                             // Para el Exp 2.
end;

function TPolinomio.EsPositivo():Boolean;
var
   i : Byte;
   Flag : Boolean;
begin
   Flag := True; // Todos los Coeficientes son Positivos
   for i := grado downto 0 do
   begin
       if (TListCoef[i] < 0) then
          Flag := False; // Hay un Coeficiente Negativo
   end;
   Result := Flag;

end;

function TPolinomio.RaicesReales():String;
var
   pos_div : String;
   x : Real;
   i : Integer;
begin
  // Primero vemos si P(x) tiene todos sus coeficientes Positivos
  pos_div:='';
  if ( EsPositivo() ) then
     begin
          // Si el Termino Independiente es b=0, entonces 0 es raiz
          if (TListCoef[0] = 0) then
             pos_div := '0 es RAIZ y (+/-) 1 Posibles Raices.'
          else
             pos_div := 'No hay Raices Reales.'
     end
  else
     begin
         // Si el Termino Independiente es b=0, entonces
         if (TListCoef[0] = 0) then
            pos_div := '0 es RAIZ y (+/-) 1 Posibles Raices.'
         else
            begin
                 x := abs(TListCoef[0]);
                 for i := 1 to trunc(x/2) do
                 begin
                     if ( (trunc(x) - (trunc(x) div i) * i) = 0) then
                        pos_div:=pos_div+'(+/-)'+FloatToStr(i)+';';
                 end;
            end;
     end;
    Result:=pos_div+'(+/-)'+FloatToStr(x);
end;

function TPolinomio.RaicesRacionales:String;
var
   pos_div : String;
begin

end;


function TPolinomio.deter_cotaposi_Lagrange():Real;
var
 cota :Real;
 lanta2posi: Real;
 k,i:Integer;
 B:Real;
begin
  cota:=0;
  k:=0;
  if(TListCoef[grado_polinomio]>0)then                 //  primero pregunto si el grado del an es mayor que cero porque sino es no puedo hacer metodo
     while((k<=grado_polinomio)&(TlistCoef[k]>0))do
     begin
           k++;
     end;
     B:=abs(TlistCoef[k]);
     while((i<=grado_polinomio)do
     begin
     if ((abs(TlistCoef[i])>B)&&(TlistCoef[i]<0))then //determino el mayor negativo en valor absoluto
     B:=abs(TlistCoef[i]);
     i++;
     end
     cota:= 1+ exp((1/k)*ln(B/Tpolinomio[grado_polinomio]));    //uso propiedad matematica para sacar la raiz k-esima de B/an

end;
function TPolinomio.deter_cotaposi_Laguerre():Real;
var
 Q,R:TPolinomio;
 n,i,r,band:Integer;
 cota:Real;
begin
  cota:=0;
  n:=10;                //doy una cantidad maxma yo de posibles raices positiva hasta 10 creo que es suficiente porque es la mayor pero tiene que ser chica
  i:=1;
  band:=0;
  while(i<=n)do
  begin
  HornerSimple(Q,R,i);        //aplico Horner mandandole Q y R  e i es decir el termino independiente de Q
  while(r<=Q.grado)&&(band=0)    //tengo una bandera para ver qu si encuentra el primer negativo ya deje de analizarlo.y siga con el otro
  if(Q.TListCoef[r]>0)then
  r++                             //todos los coeficientes de Q deben ser Positivos sino es uno, sigo con otro num 2.3.4.5...
  else
  band:=1;

  i++;
  end;

  cota:=i;

end;

function TPolinomio.deter_cotamenor_positiva():Real;
var
 P:TPolinomio;
 i,j:Integer;
 cota:Real
begin
  cota:=0;
  for i:0 to grado_polinomio do              //intercambio los coeficientes de los polinomiosy les cambio de signo para despues calcular su cota
  begin                                      //positivia y luego calcular la cota menor negativa
    for j:grado_polinomio downto 0 do
    begin
        (-P.TListCoef[j]):=TListCoef[i];
    end;
  end;

  cota:=1/P.deter_cotaposiLagrage();


end;
function TPolinomio.deter_cotamenor_negativa ():Real;
var
 P:TPolinomio;                                         //creo otro polinomio
 i:Integer;
 cota:Real;
begin
  cota:=0;
   for i:0 to grado_polinomio do
   begin
     if(i%2==0)then                                //en caso de que el coeficiente sea par hay que cambiarle de signo sino no.
      (-P.TListCoef[i]):=TListCoef[i]
     else
       P.TListCoef[i]:=TListCoef[i];
   end;

   cota:=(-P.deter_cotamenor_negativa());


end;
function TPolinomio.deter_cotamayor_negativa ():Real  ;
 var
   P:TPolinomio;
   i,j:Integer;
   cota:Real;
 begin
   cota:=0;
  for i:0 to grado_polinomio do              //intercambio los coeficientes de los polinomiosy les cambio de signo para despues calcular su cota
  begin                                      //positivia y luego calcular la cota menor negativa
    for j:grado_polinomio downto 0 do
    begin
        if(i%2==0) then
         P.TListCoef[j]:=TListCoef[i]
        else
        (-P.TListCoef[j]):=TListCoef[i];
    end;
  end;
  cota:=(-1/P.deter_cotaposiLagrage());

 end;

end.

