program Ema;

function control_malla(t:integer):boolean;
var
  b:boolean;
begin
  if(t>0)
  b:=true
  else
  b:=false;
end;


function control_string(numero:string):boolean;
var
c,cont,i,k:integer;
bandera:boolean;

begin
  i:=0;
  cont:=0;
  k:=0;

  while((i<= length(numero))and(cont=0)and(k=0))do
  begin
    c:=Integer(numero[i]);
    if(c>=0)then
    begin
    if(numero[i]=',')then
    cont:=1
     else
    k:=1;
    end;
    i:=i+1;
  end;
  if ((cont=1)and(k=0)and(i<=length(numero)))then
  bandera:=true
  else
  bandera:=false;


end;

function control_base(base:Integer):boolean;
var
  b:boolean;
begin

  if((base>=2)and(base<=16))then
  b:=true
  else
  b:=false;

end;


function menu():byte;
var
  t,base:integer;
  a,b,c:boolean;
  numero:string[100];

begin
   repeat
    write('Ingrese t');
    readln(t);
    a:=control_malla(t);
   until(a=false) ;

    repeat
      Write('Ingrese un numero=');
     read(numero);
     b:=control_string(numero);
   until(b=false) ;

    repeat
     write('Ingrese base=');
     readln(base);
     c:=control_base(base);
   until(c=false) ;


end;
readln();

end.
