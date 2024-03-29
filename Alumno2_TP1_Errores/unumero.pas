  unit UNumero;

  {$mode objfpc}{$H+}

  interface

  uses
    Classes, SysUtils, Math, Dialogs;

  type
      { TNumero }
      TNumero = class
        private
          numero : string; { Numero con parte fraccionaria }
          base : byte;     { Base del numero }
          tMantiza : byte; { Mantiza }

        public
          { El Constructor crea un Nuevo Objeto del TNumero que contiene:
            n : El numero
            b : La base de Partida
            t : Cantidad de Digitos de Precision }
          constructor create(n:string; b:byte; t:byte);

          function calcularPEntera():string;
          function calcularPDecimal():string;
          function corte(n:string; t:byte):string;
          function sumaPonderada(sNumEntrada:string;b:byte):string;
          function corteSimetrico(n:string;t,b:byte):string;
          function divisionReiterada(n:string;b:byte):string;
          function multReiterada(baseLlegada:byte;numeroEntrada:string):string;
          function cambioBaseEntera(basePartida,baseLlegada:byte;numeroEntrada:string):string;
          function cambioBaseFraccion(basePartida,baseLlegada:byte;numeroEntrada:string):string;
          function fraccionADecimal(basePartida:byte;numeroEntrada:string):string;
          function normalizar(pe,pd:string; b:byte):string;
          {Setters y Getters}
          procedure setNumero(newN:string);
          function getNumero():string;
          procedure setBase(newBase:byte);
          function getBase():byte;
          procedure setTMantiza(newT:byte);
          function getTMantiza():byte;
          {Validacion de datos }
          function validarNumero():boolean;
          function validarCampoNumerico():boolean;
          { Destructor }
          destructor destroyObject();
      end;



  implementation

  constructor TNumero.create(n:string; b:byte; t:byte);
  begin
       numero:=n;
       base:=b;
       tMantiza:=t;
  end;

  function TNumero.calcularPEntera():string;
  var
      parteEntera:string;
      i:byte;
  begin
       i:=1;
       while ((getNumero()[i])<>'.') do
       begin
          insert(getNumero()[i],parteEntera,length(parteEntera)+1);
          i:=i+1;
       end;
       result:= parteEntera;
  end;

  //devolvera un string de la forma 0.numero
  //asi lo necesito para la convercion de la aprte decimal
  function TNumero.calcularPDecimal():string;
  var
      parteDecimal:string;
      i,j:byte;
  begin
      i:=1;
      while (getNumero[i]<>'.') and (i<=length(getNumero)) do i:=i+1;
      if i<>length(getNumero) then
      begin
           i:=i+1;
           parteDecimal:='0.';
           for j:=i to length(getNumero) do
            insert(numero[j],parteDecimal,length(parteDecimal)+1);
      end
      else parteDecimal:='0.0';
      result:= parteDecimal;
  end;

  function TNumero.corte(n:string; t:byte):string;
       var
            p:byte;
            cad:string;
       begin
            p:=pos('x',n);
            cad:=copy(n,p,length(n));
            delete(n,3+t,length(n));
            result:=n+cad;
       end;

  function TNumero.corteSimetrico(n:string;t,b:byte):string;
   var
       ac,a,digito,d:integer;
       c:char;
       cad,cadena,l:string;
       t1,p:byte;
   begin
        t1:=0;
        c:= n[t+3];
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
        p:=pos('x',n);
        cad:=copy(n,p,length(n));
        if(t<=length(n))then
        begin
           if(digito>=b/2)then
           begin
                c:=n[t+2];
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
                begin
                  val(c,d,a);
                  d:=d+1;
                end;
                if(d=b)then
                begin
                   str(d,l);
                   c:=l[1];
                   l:='';
                   n[t+2]:=c;
                   t:=t-1;
                   ac:=1;
                   while((ac=1) and (t<>0))do
                   begin
                       c:=n[t+2];
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
                       begin
                         val(c,d,a);
                         d:=d+1;
                       end;
                       if(d=b)then
                       begin
                          d:=0;
                          str(d,l);
                          c:=l[1];
                          l:='';
                          n[t+2]:=c;
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
                           else
                           begin
                               str(d,l);
                               c:=l[1];
                               l:='';
                           end;
                           n[t+2]:=c;
                           t:=t-1;
                           ac:=0;
                       end
                  end;
                  if(n[3]='0')then
                  begin
                       cadena:=copy(n,3,t1+3);
                       delete(cadena,t+1,length(n));
                       p:=pos('^',cad);
                       c:=cad[p+1];
                       val(c,d,a);
                       d:=d+1;
                       str(d,l);
                       c:=l[1];
                       l:='';
                       cad[p+1]:=c;
                       result:='0'+','+'1'+cadena+cad;
                  end
                  else
                  begin
                       delete(n,3+t,length(n));
                       result:=n;
                  end;
              end
              else
              begin
                str(d,l);
                c:=l[1];
                n[t+2]:=c;
                delete(n,3+t,length(n));
                result:=n+cad;
              end;
           end
           else
           begin
                result:=corte(n,t);
           end;
        end
        else
        begin
             result:=corte(n,t);
        end;
  end;

  { Convierte la parte entera de un numero de Base B a Base 10 }
  { sNumEntrada : La parte entera del Numero como "string" }
  { b: Base de Partida del Numero. }
  { La funcion utiliza el metodo "power" de la libreria Math de Object Pascal que nos devuelve un "float" }
  function TNumero.sumaPonderada(sNumEntrada:string;b:byte):string;
  var
    exp,iNumSalida,iNumero:integer;
    c,j: byte;
    dNum:double;
    sNumSalida:string;
  begin
      { Asignamos el tamaño de la parte entera del numero menos 1 a "exp" que sera nuestro exponente a elevar }
      exp:= length(sNumEntrada)-1;
      { Ponemos en 0 al numero donde vamos a sumar el resultado que vayamos obteniendo }
      dNum:=0.0;
      for j:= 1 to length(sNumEntrada) do
      	    begin
                if sNumEntrada[j] in ['A'..'F'] then
                begin
                    case sNumEntrada[j] of
                        'A': dNum:= dNum + (10 * power(b,exp));
                        'B': dNum:= dNum + (11 * power(b,exp));
                        'C': dNum:= dNum + (12 * power(b,exp));
                        'D': dNum:= dNum + (13 * power(b,exp));
                        'E': dNum:= dNum + (14 * power(b,exp));
                        'F': dNum:= dNum + (15 * power(b,exp));
                    end;
                    { Decrementamos el exponente para el siguiente numero }
                    dec(exp);
                end
                else
                begin
                    val(sNumEntrada[j],iNumero,c);
                    dNum:= dNum + iNumero * power(b,exp);
                    { Decrementamos el exponente para el siguiente numero }
                    dec(exp);
                end;
      	    end;
      { Truncamo el numero conseguido para obtener su parte entera }
      iNumSalida:= Trunc(dNum);
      { Lo convertimos a "string" }
      Str(iNumSalida,sNumSalida);
      result := sNumSalida;
  end;

  function TNumero.divisionReiterada(n:string;b:byte):string;
    var
          resto2:string;
          resto, iNum:integer;
          e:byte;
    begin
         Val(n,iNum,e);
         result:='';
         while (iNum>=b)do
           begin
              resto:= (iNum mod b);
              iNum:=iNum div b;
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
              result:=resto2+result;
           end;
           if iNum in [10..16] then
              begin
                case iNum of
                   10: resto2:='A';
                   11: resto2:='B';
                   12: resto2:='C';
                   13: resto2:='D';
                   14: resto2:='E';
                   15: resto2:='F';
                end;
              end
           else
              str(iNum,resto2);
         result:=resto2+result;
    end;

  { Convierte la parte entera de un numero en Base B a otro de base B´ }
  function TNumero.cambioBaseEntera(basePartida,baseLlegada:byte;numeroEntrada:string):string;
  var
        sIntermedio, sNumSalida: string;
        e : byte;
  begin
     if (basePartida = 10) then sNumSalida:=divisionReiterada(numeroEntrada,baseLlegada)
     else
     begin
       if (baseLlegada = 10) then sNumSalida:=sumaPonderada(numeroEntrada,basePartida)
       else
       begin
           sIntermedio := sumaPonderada(numeroEntrada,basePartida);
           sNumSalida := divisionReiterada(sIntermedio,baseLLegada);
       end;
     end;
     result := sNumSalida;
  end;

  function TNumero.multReiterada(baseLlegada:byte;numeroEntrada:string):string; //el decimal a convertir debe de ser de tipo 0.*numeros*
  var
  i,parteEntera,error:integer;
  iter:double;
  b:boolean;
  numeroSalida:string;
  begin
    i:=1;
    { Convertimos en tipo numerico el numero pasado por string }
    val(numeroEntrada,iter,error);
    //iter := numeroEntrada;
    b:=true;
    while (i<10) and (b) do   //el 10 es cuantos digitos despues de la coma vamos a tomar
       begin
          iter:=iter*baseLlegada; //multiplico por la base
          parteEntera:=trunc(iter); //obtengo su parte entera
          if parteEntera<=9 then insert(IntToStr(parteEntera),numeroSalida,length(numeroSalida)+1)//en caso de ser base superior a 10 agrego los caracteres del alfabeto
           else
           begin
           if parteEntera=10 then insert('A',numeroSalida,length(numeroSalida)+1) //inserta el caracter 'A' en el string numeroSalida
           else
           if parteEntera=11 then insert('B',numeroSalida,length(numeroSalida)+1)
            else
           if parteEntera=12 then insert('C',numeroSalida,length(numeroSalida)+1)
           else
           if parteEntera=13 then insert('D',numeroSalida,length(numeroSalida)+1)
           else
           if parteEntera=14 then insert('E',numeroSalida,length(numeroSalida)+1)
           else
               insert('F',numeroSalida,length(numeroSalida)+1);
           end;
          iter:=iter-parteEntera;
          i:=i+1;
          if (iter=0) then b:=false; //para que no queden ceros sin valor al final
       end;
    result := numeroSalida;
  end;

  function TNumero.cambioBaseFraccion(basePartida,baseLlegada:byte;numeroEntrada:string):string;
  var
      sIntermedio, sNumSalida: string;
      e : byte;
  begin
     if basePartida=10 then sNumSalida := multReiterada(baseLLegada,numeroEntrada)
     else
     begin
       if baseLlegada=10 then sNumSalida := fraccionADecimal(basePartida,numeroEntrada)
       else
       begin
           sIntermedio := fraccionADecimal(basePartida,numeroEntrada);
           insert('0.',sIntermedio,1);
           sNumSalida := multReiterada(baseLLegada,sIntermedio);
       end;
     end;
     result := sNumSalida;
  end;

  function TNumero.fraccionADecimal(basePartida:byte;numeroEntrada:string):string;
  var
  i,j,num,error:byte;
  aDecimal:double;
  //sNumSalida,sNumEntrada:string;
  sNumSalida:string;
  parteEntera:integer;
  bandera:boolean;
  begin
    //Str(numeroEntrada,sNumEntrada);
    aDecimal:=0;
    j:=1;
    for i:=3 to length(numeroEntrada) do
       begin
          if numeroEntrada[i]='A' then num:=10
          else
          begin
              if numeroEntrada[i]='B' then num:=11
              else
              begin
                  if numeroEntrada[i]='C' then num:=12
                  else
                  if numeroEntrada[i]='D' then num:=13
                  else
                  if numeroEntrada[i]='E' then num:=14
                  else
                  if numeroEntrada[i]='F' then num:=15
                  else
                  val(numeroEntrada[i],num,error);
              end;
         end;
         aDecimal:=aDecimal+num*1/(basePartida)**j;
         j:=j+1;
       end;
    j:=1;
    bandera:=false;
    while (j<=7) and (bandera=false) do
       begin
         if aDecimal=0 then
         begin
           bandera:=true;
         end
         else
         begin
           aDecimal:=aDecimal*10;
           parteEntera:=trunc(aDecimal);
           insert(IntToStr(parteEntera),sNumSalida,length(sNumSalida)+1);
           aDecimal:=aDecimal-parteEntera;
         end;
       j:=j+1;
       end;
   result := sNumSalida;
  end;

  function TNumero.normalizar(pe,pd:string; b:byte):string;
    var
         sNormalizado,sBase,exp:string;
         j,i,k,lengthNumero:byte;
    begin
         str(b,sBase);
         if (pe[1]<>'0') then
           begin
            lengthNumero:= length(pe);
            str(lengthNumero,exp);
            sNormalizado:= '0,'+pe+pd+'x'+sBase+'^'+exp;
           end
         else
            if pd[1]<>'0' then
               sNormalizado:='0,'+pd+'x'+sBase+'^'+'0'
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
               str(i,exp);
               sNormalizado:='0,'+pd+'x'+sBase+'^'+'-'+exp;
              end;
           result:= sNormalizado;
    end;

  {------------------- Setter & Getters ----------------------------}
  procedure TNumero.setNumero(newN:string);
  begin
    numero := newN;
  end;

  function TNumero.getNumero():string;
  begin
    result := numero;
  end;

  procedure TNumero.setBase(newBase:byte);
  begin
    base := newBase;
  end;

  function TNumero.getBase():byte;
  begin
    result := base;
  end;

  procedure TNumero.setTMantiza(newT:byte);
  begin
    tMantiza := newT;
  end;

  function TNumero.getTMantiza():byte;
  begin
    result := tMantiza;
  end;
  {------------------- Setter & Getters ----------------------------}

  {----------------------- VALIDACION DE ENTRADA DE DATOS ------------------------}
  { Vamos a validar que el numero contenga un (1) solo punto flotante }
  { Si la funcion devuelve "TRUE" entonces es un numero valido con un (1) solo pto flotante }
  function TNumero.validarNumero():boolean;
  var
       cont,j,p:byte;
       sAux:string;
  begin
    cont:=0;
    { Asignamos el Numero en "string" a 'sAux' }
    sAux:=getNumero();
    { Buscamos la primera posicion del "." flotante }
    p:=Pos('.',sAux);
    { Si 'p' contiene una posicion valida (<>0), incrementamos el contador }
    while (p <> 0) do
      begin
       { Incrementamos el contador }
       inc(cont);
       { Borramos el substring hasta la posicion 'p' }
       Delete(sAux,1,p);
       { Buscamos la segunda posicion del "." flotante (si la hay) }
       p:=Pos('.',sAux);
      end;
    if (cont = 1) then
      result:=true
    else
      result:=false;
  end;

  function TNumero.validarCampoNumerico():boolean;
  var
       sAux:string;
       i,bContSigno:byte;
       boolCaracter,boolCaracterFalse:boolean;
  begin
    bContSigno:=0;
    boolCaracter:=false;
    boolCaracterFalse:=false;
    { Asignamos el Numero en "string" a 'sAux' }
    sAux:=getNumero();
    { Leemos cada uno d elos campos del string y nos fijamos en su valor }
    while (not boolCaracter) and (not boolCaracterFalse) do
      begin
       for i:=1 to Length(sAux) do;
         begin

           if (sAux[i] in ['0','1','2','3','4','5','6','7','8','9']) or (sAux[i] in ['A'..'F']) then
              boolCaracter:=false
           else
             begin
                if (sAux[i] = '.') then
                  inc(bContSigno)
                else if (sAux[i] <> '.') then
                  boolCaracterFalse:=true
                  else
                  boolCaracter:=true;
             end;
         end;
      end;
    if (bContSigno = 1) and (not boolCaracterFalse) then
      result:=true
    else
      result:=false;
  end;

  {----------------------- VALIDACION DE ENTRADA DE DATOS ------------------------}

  { Liberamos la Memoria }
  destructor TNumero.destroyObject();
  begin
       inherited Destroy;
  end;

  end.

