unit uformulario;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,mates;

type

  { TForm1 }

  TForm1 = class(TForm)
    botoncito: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure botoncitoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.botoncitoClick(Sender: TObject);
var
  r,a,x,y:double;

begin
   r:=strtofloat(edit1.Text);
   a:=strtofloat(edit2.Text);
   pasarAcartesianas(r,a,x,y);
   edit3.Text:=formatfloat('0.########',x)+' , '+formatfloat('0.########',y);

   //showmessage('Hola mundo!!');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  decimalseparator:='.';
end;

end.

