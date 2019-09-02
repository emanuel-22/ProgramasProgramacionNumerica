program ProjectTP2;

uses
  Forms,
  FuncionesTP2 in 'FuncionesTP2.pas' {FormMainFunciones},
  UCalRaiz in 'UCalRaiz.pas',
  UPolinomios in '..\..\..\..\..\UPolinomios.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMainFunciones, FormMainFunciones);
  Application.Run;
end.
