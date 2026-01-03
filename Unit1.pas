unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PythonEngine,
  Vcl.PythonGUIInputOutput, Vcl.ExtCtrls, VarPyth, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    PythonEngine1: TPythonEngine;
    Memo1: TMemo;
    Memo2: TMemo;
    Label1: TLabel;
    Button1: TButton;
    Image1: TImage;
    Image2: TImage;
    Button2: TButton;
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    PythonModule1: TPythonModule;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
var
  PyFunc: variant;
  InPath, OutPath: string;
begin
  // 1. 경로 설정 (이미지 파일이 있는 경로)
  InPath := 'C:\Users\master1212\Desktop\DelphiAI\minion.jpg';
  OutPath := 'C:\Users\master1212\Desktop\DelphiAI\minion.jpg';

  // 2. Python 스크립트 파일 로드 및 실행
  // PythonEngine1.ExecStrings(memo1.Lines); // 혹은 아래처럼 직접 호출
  image1.Stretch := True;

  //  image1.Picture.LoadFromFile('C:\Users\master1212\Desktop\DelphiAI\minion.jpg');
  // 3. PythonModule을 통해 함수 호출 (Mask 활용)
  try
    // Python 파일 내의 함수를 직접 가져옵니다.
    PyFunc := Import('image'); // vision_core.py 임포트

    // 함수 실행 및 결과값 받기
    if PyFunc.process_gray(InPath, OutPath) = 'Success' then
    begin
      // 4. 결과가 성공이면 Delphi Image 컴포넌트에 로드
      image1.Picture.LoadFromFile(OutPath);
      ShowMessage('AI 이미지 변환 완료!');
    end;
  except
    on E: Exception do
      ShowMessage('에러 발생: ' + E.Message);
  end;

end;

end.
