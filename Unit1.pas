unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PythonEngine,
  Vcl.PythonGUIInputOutput;

type
  TForm1 = class(TForm)
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    PythonEngine1: TPythonEngine;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // memo2에 작성된 내용이 있다면 지우고 다시
  memo2.lines.clear;
  //memo1에 적힌 파이썬 코드를 실행.
  Pythonengine1.ExecStrings(memo1.Lines);

end;

end.
