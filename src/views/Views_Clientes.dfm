inherited FrmClientes: TFrmClientes
  OnCreate = FormCreate
  ExplicitLeft = 3
  ExplicitTop = 3
  TextHeight = 15
  inherited pnlHeader: TPanel
    inherited lblTitle: TLabel
      Width = 172
      Caption = 'Cadastro de Cliente'
      ExplicitWidth = 172
    end
  end
  inherited CardPanel: TCardPanel
    inherited cardVisualizar: TCard
      inherited dbgRegistro: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            ReadOnly = True
            Title.Caption = 'C'#243'digo'
            Width = 85
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            ReadOnly = True
            Title.Caption = 'Nome'
            Width = 550
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            ReadOnly = True
            Title.Caption = 'Status'
            Width = 100
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
          Left = 717
          Top = 34
          Width = 97
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Ativo ?'
          DataField = 'status'
          DataSource = dsCadastro
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = ServicesClientes.mtPesquisa
  end
  inherited dsCadastro: TDataSource
    DataSet = ServicesClientes.mtCadastro
    Top = 404
  end
end
