program Resolucion_de_Sistemas_de_Ecuaciones_Lineales;

uses
  Forms,
  uInterfazSistemas in 'uInterfazSistemas.pas' {formSistemas},
  uSistemasLineales in 'uSistemasLineales.pas',
  uInterfazResultados in 'uInterfazResultados.pas' {formResultados};

{$R *.res}

begin
  Application.Initialize;
  //Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformSistemas, formSistemas);
  Application.Run;
end.
