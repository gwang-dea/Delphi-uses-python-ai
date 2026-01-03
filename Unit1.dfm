object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 1194
  ClientWidth = 1161
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 76
    Width = 347
    Height = 54
    Caption = 'PYTHON '#50616#50612' '#49324#50857' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 8
    Top = 584
    Width = 769
    Height = 569
  end
  object Image2: TImage
    Left = 960
    Top = 608
    Width = 571
    Height = 569
  end
  object Label2: TLabel
    Left = 8
    Top = 508
    Width = 201
    Height = 54
    Caption = 'Image '#48373#49324
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
    Width = 481
    Height = 265
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 536
    Top = 136
    Width = 482
    Height = 265
    TabOrder = 1
  end
  object Button1: TButton
    Left = 1040
    Top = 135
    Width = 75
    Height = 25
    Caption = #51201#50857
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1040
    Top = 584
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 3
    OnClick = Button2Click
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
  object OpenDialog1: TOpenDialog
    Left = 1032
    Top = 520
  end
  object PythonModule1: TPythonModule
    Engine = PythonEngine1
    MultInterpretersSupport = mmiSupported
    Errors = <>
    Left = 680
    Top = 64
  end
end
