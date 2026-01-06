unit AI_processing;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.MPlayer, Vcl.ComCtrls, System.StrUtils, System.IOUtils,
  PythonEngine, Vcl.PythonGUIInputOutput, Varpyth; //python 스크립트 이용 하려면 이게 추가 되어야함. Varpyth;

type
  TMain_Form = class(TForm)
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
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    MediaPlayer1: TMediaPlayer;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnFindFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

{$R *.dfm}

procedure TMain_Form.BtnFindFileClick(Sender: TObject);
var
  Inpath, OutPath : string;
  PyFunc : variant;
  Ext : String;
begin
  // 버튼 클릭 시 영상 파일 찾아보기
  if opendialog1.Execute() then
  begin
    InPath := OpenDialog1.filename;

    EdtFilePath.Text := InPath;
    // 파일 업로드 하면 이미지 파일을 원본 에 보여주기
    //Image2.Picture.LoadFromFile(INPATH);

    Outpath := Inpath;

    Ext := LowerCase(ExtractFileExt(OpenDialog1.FileName)); // 확장자만 추출해서 소문자로 변환
    // 여기서 파일 확장자가 image 와 vedio일시? 구분
    if MatchStr(Ext, ['.png', '.jpg', '.mp4', '.avi']) then
    begin

      if MatchStr(Ext, ['.mp4', '.avi']) then
      begin

        MediaPlayer1.FileName := OpenDialog1.FileName;
        MediaPlayer1.open;

        // 영상 크기를 패널에 맞게 조정 (일부 버전에서는 자동으로 조절됨)
        MediaPlayer1.DisplayRect := PnLeft.ClientRect;

        MediaPlayer1.Play;
        StatusBar1.Panels[0].Text := '▶ 영상 재생 중...';


        try
          // Python 파일 내의 함수를 직접 가져옵니다.
          PyFunc := Import('image'); // image.py import.

          // 함수 실행 및 결과값 받기
          if PyFunc.process_video_frame(InPath, OutPath) = 'Success' then
          begin
            // 4. 결과가 성공이면 Delphi Image 컴포넌트에 로드
            image3.Picture.LoadFromFile(OutPath);
            ShowMessage('AI 분석 완료!');
          end;
        except
          on E: Exception do
            ShowMessage('에러 발생: ' + E.Message);
        end;


          // 영상 처리 함수 호출
      end else
      begin
        try
          // Python 파일 내의 함수를 직접 가져옵니다.
          PyFunc := Import('image'); // image.py import.

          // 함수 실행 및 결과값 받기
          if PyFunc.process_gray(InPath, OutPath) = 'Success' then
          begin
            // 4. 결과가 성공이면 Delphi Image 컴포넌트에 로드
            image3.Picture.LoadFromFile(OutPath);
            ShowMessage('AI 이미지 변환 완료!');
          end;
        except
        on E: Exception do
          ShowMessage('에러 발생: ' + E.Message);
        end;

      end;

    end;

  end;

end;

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  //20260105 AI 영상 분석
  PnTop.color       := $10202020; // $00333333 다크그레이
  PnContainer.color := $10202020; // $00333333 다크그레이
  PnLeft.color      := $10202020; // $00333333 다크그레이
  PnRight.color     := $10202020; // $00333333 다크그레이
  PnButtom.color    := $002B2B2B; // 어두운 회색 코드.

  // BOTTOM RICHEDIT COLOR CHANGE.
//  RICHEDIT1.Color       := $001E1E1E;
//  RICHEDIT1.FONT.Color  := clWhite;
//  RICHEDIT1.BorderStyle := bsNone;

end;

end.
