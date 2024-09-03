inherited FrmHome: TFrmHome
  BorderStyle = bsNone
  ClientHeight = 600
  ClientWidth = 800
  TextHeight = 15
  object Label1: TLabel
    Left = 168
    Top = 86
    Width = 463
    Height = 28
    Anchors = []
    Caption = 'Bem-vindo ao meu Projeto com RESTRequest4D!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 113
    Top = 145
    Width = 575
    Height = 257
    Anchors = []
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      
        'Ele foi desenvolvido usando heran'#231'a entre os formul'#225'rios e as Un' +
        'its '
      
        'de servi'#231'o, com isso o c'#243'digo ficou organizado e com desenvolvim' +
        'ento '
      'r'#225'pido. '
      ''
      'Ele utiliza duas aplica'#231#245'es REST API com Horse para fazer o '
      'CRUD com o banco de dados e a autentica'#231#227'o do Token do usu'#225'rio.'
      ''
      
        'Esse projeto tamb'#233'm realiza a atualiza'#231#227'o do token de forma auto' +
        'm'#225'tica, '
      'sem a necessidade do usu'#225'rio realizar o login a cada hora.  ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 48
    ExplicitTop = 31
    ExplicitWidth = 185
    object lblTitle: TLabel
      AlignWithMargins = True
      Left = 20
      Top = 5
      Width = 54
      Height = 25
      Caption = 'Home'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
