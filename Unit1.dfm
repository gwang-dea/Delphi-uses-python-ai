object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 96
    Top = 48
    Width = 116
    Height = 54
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 136
    Width = 185
    Height = 265
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 240
    Top = 136
    Width = 185
    Height = 265
    TabOrder = 1
  end
  object Button1: TButton
    Left = 496
    Top = 135
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object PythonGUIInputOutput1: TPythonGUIInputOutput
    UnicodeIO = True
    RawOutput = False
    Output = Memo2
    Left = 536
    Top = 64
  end
  object PythonEngine1: TPythonEngine
    IO = PythonGUIInputOutput1
    Left = 424
    Top = 64
  end
end
