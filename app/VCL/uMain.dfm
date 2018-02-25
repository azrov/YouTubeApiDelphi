object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'App'
  ClientHeight = 332
  ClientWidth = 443
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 299
    Width = 75
    Height = 25
    Caption = 'Get'
    TabOrder = 0
    TabStop = False
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 427
    Height = 285
    TabStop = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object YT: TazYouTubeApi
    Left = 24
    Top = 24
  end
end
