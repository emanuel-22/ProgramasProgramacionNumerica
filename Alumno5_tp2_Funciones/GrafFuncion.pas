unit GrafFuncion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, uFuncion, DiffExpress;

type
  TGraficador = class(TGraphicControl)
  private
    Mformula:String;
    FDerivada: String;

    FOnChange: TNotifyEvent;
    Calc_dFunc: TDiffExpress;
    FFunc: TFuncion;
    dFunc: TFuncion;

    fx,fy,tx,ty:double;
    fStep:double;
    fpen:TPen;
    fBackColor, fGridColor : TColor;
    fEtiqColor, fEjesColor : TColor;
    fCurvaColor : TColor;

    procedure setFormula(value: String);
    procedure SetDerivada(Value: String);

    procedure setMinX(value: double);
    procedure setMinY(value: double);
    procedure setMaxX(value: double);
    procedure setMaxY(value: double);
    procedure setStep(value: double);
    Function coordX(x:double):integer;
    Function coordY(y:double):integer;
    procedure SetPen(Value: TPen);

    procedure SetBackColor(const Value: TColor);
    procedure SetGridColor(const Value: TColor);
    procedure SetEtiqColor(const Value: TColor);
    procedure SetEjesColor(const Value: TColor);
    procedure SetCurvaColor(const Value: TColor);

  protected
    procedure Paint; override;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure zoomIn;
    procedure zoomOut;
    procedure translate(dx,dy:integer);
    procedure centerIn(x,y:integer);
    procedure DrawGrid;
    function f(x: Extended):Extended;
    function df(x: Extended):Extended;

  published
    property Height default 65;
    property Width default 65;
    property formula:String read Mformula write setFormula;
    property Derivada:String read FDerivada;
    property minX:double read fx write setMinX;
    property minY:double read fy write setMinY;
    property maxX:double read tx write setMaxX;
    property maxY:double read ty write setMaxY;
    property step:double read fStep write setStep;
    property pen:TPen read fpen write setPen;

    property ColorBack:TColor read fBackColor write SetBackColor Default clBlack;
    property ColorGrid:TColor read fGridColor write SetGridColor Default $00282828;
    property ColorEtiq:TColor read fEtiqColor write SetEtiqColor Default clYellow;
    property ColorEjes:TColor read fEjesColor write SetEjesColor Default clOlive;
    property ColorCurva: TColor read fCurvaColor write SetCurvaColor Default clLime;

    property OnChange:TNotifyEvent read FOnChange write FOnChange;
    property OnClick;
    property OnDblClick;
    property Align;
    property Anchors;
    property DragCursor;
    property DragMode;
    property OnDragDrop;
    property OnDragOver;
    property OnEndDrag;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CalNum', [TGraficador]);
end;

constructor TGraficador.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Width := 65;
  Height := 65;
  fX:=-3;
  fY:=-3;
  tX:=3;
  ty:=3;
  fstep:=0.002;

  fFunc:= TFuncion.Create;
  dFunc:= TFuncion.Create;
  Calc_dFunc := TDiffExpress.Create;

  fPen:=TPen.Create;
  fBackColor := clBlack;
  fGridColor := $00282828;
  fEtiqColor := clYellow;
  fEjesColor := clOlive;
  fCurvaColor:= clLime;
end;

destructor TGraficador.Destroy;

begin
  FFunc.Free;
  dFunc.Free;
  Calc_dFunc.Free;
  inherited Destroy;
end;

procedure TGraficador.SetFormula(Value: String);
begin
  if MFormula <> Value then
  begin
    MFormula := Lowercase(Value);
    FFunc.Setup(MFormula);
    SetDerivada(MFormula);
    Invalidate;
    if assigned(FOnChange) then FOnChange(self);
  end;
end;

procedure TGraficador.SetMinX(Value: Double);

begin
  if fx <> Value then
  begin
    fx := Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetMinY(Value: Double);

begin
  if fy <> Value then
  begin
    fy := Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetMaxX(Value: Double);

begin
  if tx <> Value then
  begin
    tx := Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetMaxY(Value: Double);

begin
  if ty <> Value then
  begin
    ty := Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetStep(Value: Double);

begin
  if fStep <> Value then
  begin
    fStep := Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetPen(Value: TPen);

begin
  FPen.Assign(Value);
  Invalidate;
end;

procedure TGraficador.zoomIn;
var
   mx,my:double;
begin
     mx:=(minX+maxX)/2;
     my:=(miny+maxY)/2;
     minx:=mX+3*(minX-mX)/2;
     maxx:=mX+3*(maxX-mX)/2;
     miny:=my+3*(miny-my)/2;
     maxy:=my+3*(maxy-my)/2;
     step:=3*step/2;
end;

procedure TGraficador.zoomOut;
var
   mx,my:double;
begin
     mx:=(minX+maxX)/2;
     my:=(miny+maxY)/2;
     minx:=mX+2*(minX-mX)/3;
     maxx:=mX+2*(maxX-mX)/3;
     miny:=my+2*(miny-my)/3;
     maxy:=my+2*(maxy-my)/3;
     step:=2*step/3;
end;

procedure TGraficador.translate(dx,dy:integer);
var
   ddx,ddy:double;
begin
     ddx:=dx*(maxX-minX)/width;
     ddy:=dy*(maxY-minY)/height;
     minx:=minx-ddx;
     miny:=miny+ddy;
     maxx:=maxx-ddx;
     maxy:=maxy+ddy;
end;

procedure TGraficador.centerIn(x,y:integer);
var
   dx,dy:Integer;
begin
     dx:=CoordX((maxX+minX)/2)-x;
     dy:=CoordY((maxY+minY)/2)-y;
     translate(dx,dy);
end;

Function TGraficador.coordX(x:double):integer;
begin
     coordX:=round((x-fx)/(tx-fx)*width);
end;

Function TGraficador.coordY(y:double):integer;
begin
     coordY:=height-round((y-fy)/(ty-fy)*height);
end;

procedure TGraficador.DrawGrid;
type TposDiv = record v: real; p: integer end;
var
 i,t:integer;
 ldiv, sdiv, nx: integer;
 aX : Array of TposDiv;
 x : real;
 s : string;
 Bmp : TBitmap;

begin
   Bmp := TBitmap.Create;
   Bmp.Width := Width;
   Bmp.Height:= Height;

   ldiv:=10;sdiv:=5;

   Bmp.canvas.Brush.color:=fbackcolor;
   Bmp.Canvas.FillRect(Rect(0,0, Width, Height));
   Bmp.canvas.Pen.color:=fgridcolor;

   nx := 0;
   x := fx;

   i:=coordX(0) mod sdiv;
   t:=10-(coordX(0) div sdiv);
   while i<=width do
     begin
        if (t mod ldiv)=0 then
          Begin
             Bmp.canvas.pen.width := 2;
             Inc(nx); SetLength(aX, nx);
             aX[nx-1].v := x;
             aX[nx-1].p := i;
          End
        else
          Bmp.canvas.pen.width:=1;

        Bmp.canvas.moveto(i, 0);
        Bmp.canvas.lineto(i, height);

        i:=i+ sdiv;
        t:=t+1;

        x:= x + sdiv * ((tx-fx)/(width-1));
     end;

   i:= coordY(0) mod sdiv;
   t:= 10-(coordY(0) div sdiv);
   while i<=height do
     begin
        if (t mod ldiv)=0 then
          Bmp.canvas.pen.width:= 2
        else
          Bmp.canvas.pen.width:= 1;

        Bmp.canvas.moveto(0,     i);
        Bmp.canvas.lineto(width, i);
        i:=i+ sdiv;
        t:=t+1;
     end;

   Bmp.Canvas.Font.Color := fEtiqColor;

   For i:= 0 to (nx-1) do
      Begin
         s := Format('%8.2g', [aX[i].v]);
         Bmp.canvas.TextOut(aX[i].p-15, height-15, s);
      End;

   Canvas.Draw(0, 0, Bmp);
   SetLength(aX, 0);
   Bmp.Free;
end;

procedure TGraficador.Paint;
Var
   x,y, ant:double;

begin
   DrawGrid;
   with Canvas do
   begin
     Pen:=self.Pen;
     Pen.color:= fEjesColor;
     if (fy<0) and (ty>0) then  {draws y-axis}
       begin
            PenPos:=Point(0,coordY(0));
            LineTo(Width,coordY(0));
       end;

     if (fx<0) and (tx>0) then  {draws x-axis}
       begin
            PenPos:=Point(coordX(0),0);
            LineTo(coordX(0),Height);
       end;

     Pen.color:= fCurvaColor;

     if fFunc.Formula = '' then exit;

     x:=fx;
     y:=fFunc.F(x);
     If y < Indefinido then
        PenPos:=Point(coordX(x),coordY(y));

     While x < tx do   {draws lines}
        begin
           ant := y;      // el "y" anterior
           y:=FFunc.F(x);

           If y < Indefinido then
              Begin
                 LineTo(coordX(x),coordY(y));
                 penPos:=Point(coordX(x),coordY(y));
              End
           Else
              LineTo(coordX(x),coordY(ant));

           x:=x+fStep;
        end;
end; {with canvas}
end;

procedure TGraficador.SetBackColor(const Value: TColor);
begin
  if FBackColor <> Value then
  begin
    FBackColor:= Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetGridColor(const Value: TColor);
begin
  if FGridColor <> Value then
  begin
    FGridColor:= Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetEtiqColor(const Value: TColor);
begin
  if FEtiqColor <> Value then
  begin
    FEtiqColor:= Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetEjesColor(const Value: TColor);
begin
  if FEjesColor <> Value then
  begin
    FEjesColor:= Value;
    Invalidate;
  end;
end;

procedure TGraficador.SetCurvaColor(const Value: TColor);
begin
  if FCurvaColor <> Value then
  begin
    FCurvaColor:= Value;
    Invalidate;
  end;
end;

function TGraficador.f(x: Extended):Extended;
Begin
    Result:=FFunc.F(x);
End;

procedure TGraficador.SetDerivada(Value: String);
begin
  if FDerivada <> Value then
  begin
    Calc_dFunc.Formula := Value;
    FDerivada := Calc_dFunc.diff('x');
    dFunc.Setup(FDerivada);
  end;
end;

function TGraficador.dF(x: Extended): Extended;
Begin
    Result:=dFunc.F(x);
End;

end.
