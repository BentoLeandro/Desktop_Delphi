inherited FrmUsuarios: TFrmUsuarios
  OnCreate = FormCreate
  TextHeight = 15
  inherited pnlHeader: TPanel
    inherited lblTitle: TLabel
      Width = 188
      Caption = 'Cadastro de Usu'#225'rios'
      ExplicitWidth = 188
    end
  end
  inherited CardPanel: TCardPanel
    ActiveCard = cardCadastro
    inherited cardVisualizar: TCard
      inherited dbgRegistro: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Caption = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'login'
            Title.Caption = 'Login'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = 'Status'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Title.Caption = 'Telefone'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'sexo'
            Title.Caption = 'Sexo'
            Width = 65
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        object lblFiltroCodigo: TLabel
          Left = 10
          Top = 10
          Width = 42
          Height = 15
          Caption = 'C'#243'digo:'
        end
        object lblFiltroNome: TLabel
          Left = 105
          Top = 10
          Width = 42
          Height = 15
          Caption = 'C'#243'digo:'
        end
        object edtFiltroCodigo: TEdit
          Left = 10
          Top = 29
          Width = 80
          Height = 23
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 0
        end
        object edtFiltroNome: TEdit
          Left = 105
          Top = 29
          Width = 544
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    inherited cardCadastro: TCard
      inherited pnlCadastro: TPanel
        ExplicitLeft = -1
        object lblCodigo: TLabel
          Left = 10
          Top = 10
          Width = 42
          Height = 15
          Caption = 'C'#243'digo:'
        end
        object lblNome: TLabel
          Left = 106
          Top = 10
          Width = 36
          Height = 15
          Caption = 'Nome:'
        end
        object lblLogin: TLabel
          Left = 10
          Top = 60
          Width = 33
          Height = 15
          Caption = 'Login:'
        end
        object lblSenha: TLabel
          Left = 175
          Top = 60
          Width = 35
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Senha:'
        end
        object lblTelefone: TLabel
          Left = 339
          Top = 60
          Width = 47
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Telefone:'
        end
        object lblSexo: TLabel
          Left = 507
          Top = 60
          Width = 28
          Height = 15
          Anchors = [akTop, akRight]
          Caption = 'Sexo:'
        end
        object dbEdtCodigo: TDBEdit
          Left = 10
          Top = 31
          Width = 80
          Height = 23
          Color = clBlack
          DataField = 'id'
          DataSource = dsCadastro
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object dbEdtNome: TDBEdit
          Left = 106
          Top = 31
          Width = 605
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'nome'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object dbCkbStatus: TDBCheckBox
          Left = 719
          Top = 34
          Width = 68
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Ativo ?'
          DataField = 'status'
          DataSource = dsCadastro
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbEdtLogin: TDBEdit
          Left = 10
          Top = 81
          Width = 150
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'login'
          DataSource = dsCadastro
          TabOrder = 3
        end
        object dbEdtSenha: TDBEdit
          Left = 175
          Top = 81
          Width = 150
          Height = 23
          Anchors = [akTop, akRight]
          DataField = 'senha'
          DataSource = dsCadastro
          PasswordChar = '*'
          TabOrder = 4
        end
        object dbEdtTelefone: TDBEdit
          Left = 339
          Top = 81
          Width = 150
          Height = 23
          Anchors = [akTop, akRight]
          DataField = 'telefone'
          DataSource = dsCadastro
          TabOrder = 5
        end
        object cmbSexo: TComboBox
          Left = 507
          Top = 81
          Width = 150
          Height = 23
          Style = csDropDownList
          Anchors = [akTop, akRight]
          TabOrder = 6
          Items.Strings = (
            'Masculino'
            'Feminino')
        end
        object btnAlterarFotoPerfil: TButton
          Left = 10
          Top = 336
          Width = 95
          Height = 25
          Caption = 'Alterar Foto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = btnAlterarFotoPerfilClick
        end
        object btnLimparFotoPerfil: TButton
          Left = 115
          Top = 336
          Width = 95
          Height = 25
          Caption = 'Limpar Foto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = btnLimparFotoPerfilClick
        end
        object pnlImageFotoPerfil: TPanel
          Left = 10
          Top = 130
          Width = 200
          Height = 200
          BevelInner = bvLowered
          TabOrder = 9
          object imgFotoPerfil: TImage
            Left = 2
            Top = 2
            Width = 196
            Height = 196
            Align = alClient
            Center = True
            Proportional = True
            ExplicitLeft = 0
            ExplicitWidth = 198
            ExplicitHeight = 198
          end
        end
      end
      inherited pnlFooterCadastro: TPanel
        inherited btnConfirmar: TSpeedButton
          ExplicitLeft = 480
          ExplicitTop = 3
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = ServicesUsuarios.mtPesquisa
  end
  object OpenDialog: TOpenDialog
    Left = 49
    Top = 444
  end
end
