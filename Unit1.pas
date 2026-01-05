unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.MPlayer, Vcl.ComCtrls,
  PythonEngine;

type
  TForm1 = class(TForm)
    PnTop: TPanel;
    Image1: TImage;
    EdtFilePath: TEdit;
    BtnFindFile: TButton;
    PnContainer: TPanel;
    PnLeft: TPanel;
    Image2: TImage;
    PnButtom: TPanel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    RichEdit1: TRichEdit;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    GroupBox3: TGroupBox;
    PnRight: TPanel;
    Image3: TImage;
    GroupBox4: TGroupBox;
    OpenDialog1: TOpenDialog;
    PythonEngine1: TPythonEngine;
    PythonModule1: TPythonModule;
    PythonInputOutput1: TPythonInputOutput;
    procedure FormCreate(Sender: TObject);
    procedure BtnFindFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnFindFileClick(Sender: TObject);
var
  Inpath, OutPath : string;
begin
  // 버튼 클릭 시 영상 파일 찾아보기
  if opendialog1.Execute() then
  begin
    InPath := OpenDialog1.filename;

    EdtFilePath.Text := InPath;
    // 파일 업로드 하면 이미지 파일을 원본 에 보여주기
    Image2.Picture.LoadFromFile(INPATH);
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //20260105 AI 영상 분석
  PnTop.color       := $10202020; // $00333333 다크그레이
  PnContainer.color := $10202020; // $00333333 다크그레이
  PnLeft.color      := $10202020; // $00333333 다크그레이
  PnRight.color     := $10202020; // $00333333 다크그레이
  PnButtom.color    := $002B2B2B; // 어두운 회색 코드.

  // BOTTOM RICHEDIT COLOR CHANGE.
  RICHEDIT1.Color       := $001E1E1E;
  RICHEDIT1.FONT.Color  := clWhite;
  RICHEDIT1.BorderStyle := bsNone;

end;

end.
