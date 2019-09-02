unit complejos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
  complejo=class
    private
      re,im:double;
    public
      constructor crear;overload;
      constructor crear(r,i:double);overload;

      procedure setReal(r:double);  //seter parte real (procedimiento)
      procedure setImg(i:double);   //seter parte imaginaria (procedimiento)
      function getReal():double;    //geter parte real    (funcion:double)
      function getImg():double;     //geter parte imaginaria  (funcion:double)
      function sumar(otro:complejo):complejo;

      function mostrar():string;
      destructor destruir;
  end;

implementation
constructor complejo.crear;
begin
  re:=0;
  im:=0;
end;

constructor complejo.crear(r,i:double);
begin
  re:=r;
  im:=i;
end;


procedure complejo.setReal(r:double);
begin
  re:=r;
end;

procedure complejo.setImg(i:double);
begin
  im:=i;
end;


function complejo.getReal():double;
begin
  result:=re;
end;

function complejo.getImg:double;
begin
  result:=im;
end;

function complejo.sumar(otro:complejo):complejo;
var
  aux:complejo;
begin
  aux:=complejo.crear;
  aux.setReal(getReal+otro.getReal());
  aux.setImg(getImg+otro.getImg());
  result:=aux;
end;



function complejo.mostrar:string;
begin
  result:=floattostr(getReal)+' + '+floattostr(getImg)+' i';
end;


destructor complejo.destruir;
begin
  inherited destroy;
end;

end.

