program Aproximacion_de_Funciones;

uses
  Forms,
  uInterfaz in 'uInterfaz.pas' {Form1},
  uAproximacion in 'uAproximacion.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
