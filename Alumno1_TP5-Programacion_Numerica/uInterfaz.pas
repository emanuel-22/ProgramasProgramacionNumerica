unit uInterfaz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Menus, uAproximacion;

type
  TForm1 = class(TForm)
    sgridPuntos: TStringGrid;
    Label1: TLabel;
    edtPuntos: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    edtFuncionAproximada: TEdit;
    btnColocacionLagrange: TButton;
    btnColocacionNewton: TButton;
    btnOsculacionNewton: TButton;
    menu: TMainMenu;
    mItemMatrizLagrange: TMenuItem;
    procedure edtPuntosChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnColocacionLagrangeClick(Sender: TObject);
    procedure btnColocacionNewtonClick(Sender: TObject);
  private
    { Private declarations }
    function vectorPuntosX(): tVector;
    function vectorPuntosY(): tVector;
    function formatoPolinomio(vector: tVector): string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  tabla: TAproximacion;

implementation

{$R *.dfm}

function TForm1.vectorPuntosX(): tVector;
var
  i, k: integer;
  aux: tVector;
begin
  k := 0;
  setLength(aux, sgridPuntos.RowCount - 1);
  for i := 1 to sgridPuntos.RowCount - 1 do begin
    aux[k] := StrToFloat(SgridPuntos.Cells[0, i]);
    k := k + 1;
  end;
  result := aux;
end;

function TForm1.vectorPuntosY(): tVector;
var
  i, k: integer;
  aux: tVector;
begin
  k := 0;
  setLength(aux, sgridPuntos.RowCount - 1);
  for i := 1 to sgridPuntos.RowCount - 1 do begin
    aux[k] := StrToFloat(SgridPuntos.Cells[1, i]);
    k := k + 1;
  end;
  result := aux;
end;

function TForm1.formatoPolinomio(vector: tVector): string;
var
  i: integer;
  aux: string;
begin
  aux := '';
  for i := High(vector) downto 0 do begin
    case i of
      0: aux := aux + FloatToStr(vector[i]);
      else aux := aux + FloatToStr(vector[i]) + '*X^' + inttostr(i) + ' + ';
    end;
  end;
  result := aux;
end;

procedure TForm1.btnColocacionLagrangeClick(Sender: TObject);
var
  puntosX, puntosY: tVector;
  fAproximada: tVector;
  i: integer;
begin
  try

    tabla.setCantPuntos(sgridPuntos.RowCount - 1);
    tabla.setVectorX(vectorPuntosX());
    tabla.setVectorY(vectorPuntosY());
    SetLength(fAproximada, sgridPuntos.RowCount - 1);
    fAproximada := tabla.Colocacion_Lagrange();

    edtFuncionAproximada.Text := formatoPolinomio(fAproximada);

  except
    ShowMessage('Se produjo un error al intentar obtener la funcion aproximada.');
  end;

end;

{
 function tformSistemas.crearVectorX0(): tVector;
var
  j, k: integer;
  vector: tVector;
begin
  SetLength(vector, sgridSistema.RowCount - 1);
  k := 0;
  // Recorro la columna del vector inicial X0
  for j := 0 to sgridVectorX0.RowCount - 1 do begin
    vector[k] := StrToFloat(sgridVectorX0.Cells[0, j]);
  end;
  result := vector;
end;

}

procedure TForm1.btnColocacionNewtonClick(Sender: TObject);
var
  puntosX, puntosY: tVector;
  fAproximada: tVector;
  i: integer;
begin
  try

    tabla.setCantPuntos(sgridPuntos.RowCount - 1);
    tabla.setVectorX(vectorPuntosX());
    tabla.setVectorY(vectorPuntosY());
    SetLength(fAproximada, sgridPuntos.RowCount - 1);
    fAproximada := tabla.Colocacion_Newton(tabla.DiferenciaDividida);

    edtFuncionAproximada.Text := formatoPolinomio(fAproximada);

  except
    ShowMessage('Se produjo un error al intentar obtener la funcion aproximada.');
  end;
end;

procedure TForm1.edtPuntosChange(Sender: TObject);
var
  i: integer;
  nroIncognitas: integer;
begin

  try
    nroIncognitas := StrToInt(edtPuntos.Text);
    if((nroIncognitas = 1) or (nroIncognitas = 0)) then begin
      nroIncognitas := 2;
    end;
  except
    on Exception do begin
      nroIncognitas := 2;
    end;
  end;

  sgridPuntos.RowCount := nroIncognitas + 1;

end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tabla.destruir();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  sgridPuntos.Cells[0, 0] := 'X';
  sgridPuntos.Cells[1, 0] := 'F(X)';
  tabla := TAproximacion.crear;
end;

end.
