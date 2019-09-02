unit MyFunc;

interface

uses Funcion, DiffExpress;

type
  TFuncion = class
  private
    fFormula: string;
    fDerivada: string;
    DerivFun: TDiffExpress;

    procedure SetFormula(const Valor: string);
    procedure SetDerivada(const Valor: string);

  public
    constructor Crear;
    destructor Listo;

    function F(x: double): double;
    function dF(x: double): double;
    function F2(x, y: double): double;

    property Formula: string read fFormula write SetFormula;
    property Derivada: string read fDerivada write SetDerivada;
  end;

implementation

constructor TFuncion.Crear;
begin
  inherited Create;
  fFormula := '';
  fDerivada := '';
  DerivFun := TDiffExpress.Create;
end;

destructor TFuncion.Listo;
begin
  DerivFun.Free;
end;


function TFuncion.F(x: double): double;
begin
  Result := _f(fFormula, x);
end;

{----------------------------------------}
function TFuncion.F2(x, y: double): double;
begin
  Result := _f2(fFormula, x, y);
end;

{----------------------------------------}
function TFuncion.dF(x: double): double;
begin
  Result := _f(fDerivada, x);
end;

procedure TFuncion.SetFormula(const Valor: string);
begin
  fFormula := Valor;
  Derivada := Valor;
end;

procedure TFuncion.SetDerivada(const Valor: string);
begin
  DerivFun.Formula := Valor;
  fDerivada := DerivFun.diff('x');
end;

end.
