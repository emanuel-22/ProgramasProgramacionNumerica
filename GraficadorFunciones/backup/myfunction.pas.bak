unit MyFunction;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, UFuncion, DiffExpress;

type
  TMyFunction = class
    private
      originalFunction:TFuncion;
      fDerivada:TFuncion;
      derivFuncion:TDiffExpress;
      procedure setFormula(valor:string);
      procedure setDerivada(valor:string);
      function getFormula():string;
      function getDerivada():string;
    public
      constructor crear;
      destructor borrar;
      function evalF(x:double):double;
      function evalDerivF(x:double);double;
    property   formula:string read getFormula write setFormula;
    property   derivada:string read getDerivada write setDerivada;
  end;

implementation

//Creo un Objeto para poder armar mi funcion.
constructor TMyFunction.crear;
begin
    inherited create;
    originalFunction:=TFuncion.Crear;
    ffDerivada:=TFuncion.Crear;
    derivFuncion:=TDiffExpress.Create;
end;

procedure TMyFunction.setFormula(valor:string);
begin
    originalFunction.Setup(valor);
    derivada:=valor;
end;

procedure TMyFunction.setDerivada(valor:string);
begin
    derivFuncion.Formula:=valor;
    ffDerivada.Setup(derivFuncion.diff('x'));
end;

function TMyFunction.evalF(x:double):double;
begin
    result:=originalFunction.f(x);
end;

function TMyFunction.evalDerivF(x:double):double;
begin
    result:=ffDerivada.f(x);
end;

function TMyFunction.getFormula():string;
begin
    result:=originalFunction.Formula;
end;

function TMyFunction.getDerivada():string;
begin
    resutl:=ffDerivada.Formula;
end;

destructor TMyFunction.borrar;
begin
    inherited destroy;
    originalFunction.Destroy;
    ffDerivada.Destroy;
    derivFuncion.Free;
end;









end.

