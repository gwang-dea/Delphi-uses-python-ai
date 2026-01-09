program Delphi_Ai_Process;

uses
  Vcl.Forms,
  AI_processing in 'AI_processing.pas' {Main_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain_Form, Main_Form);
  Application.Run;
end.
