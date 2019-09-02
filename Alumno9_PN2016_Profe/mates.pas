unit mates;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

const
  PI=3.141592654;

  procedure pasarAcartesianas(r,a:double;var x,y:double);

implementation
  procedure pasarAcartesianas(r,a:double;var x,y:double);
  begin
    x:=r*cos(a*PI/180);
    y:=r*sin(a*PI/180);

  end;

end.

