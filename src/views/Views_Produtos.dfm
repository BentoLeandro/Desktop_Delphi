inherited FrmProdutos: TFrmProdutos
  ClientWidth = 781
  OnCreate = FormCreate
  ExplicitLeft = 3
  ExplicitTop = 3
  ExplicitWidth = 781
  TextHeight = 15
  inherited pnlHeader: TPanel
    Width = 781
    ExplicitWidth = 781
    inherited lblTitle: TLabel
      Width = 194
      Caption = 'Cadastro de Produtos'
      ExplicitWidth = 194
    end
  end
  inherited CardPanel: TCardPanel
    Width = 781
    ExplicitWidth = 781
    inherited cardVisualizar: TCard
      Width = 779
      ExplicitWidth = 779
      inherited Shape1: TShape
        Width = 779
        ExplicitWidth = 779
      end
      inherited Shape2: TShape
        Width = 779
        ExplicitWidth = 779
      end
      inherited pnlButtons: TPanel
        Width = 779
        ExplicitWidth = 779
      end
      inherited pnlFooter: TPanel
        Width = 779
        ExplicitWidth = 779
      end
      inherited dbgRegistro: TDBGrid
        Width = 779
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
            Width = 350
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Caption = 'Valor'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'status'
            Title.Caption = 'Status'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'estoque'
            Title.Caption = 'Estoque'
            Width = 100
            Visible = True
          end>
      end
      inherited pnlFiltros: TPanel
        Width = 779
        ExplicitWidth = 779
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
          Width = 525
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
      end
    end
    inherited cardCadastro: TCard
      Width = 779
      ExplicitWidth = 779
      inherited pnlCadastro: TPanel
        Width = 779
        ExplicitWidth = 779
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
        object lblValor: TLabel
          Left = 10
          Top = 62
          Width = 29
          Height = 15
          Caption = 'Valor:'
        end
        object lblEstoque: TLabel
          Left = 130
          Top = 62
          Width = 45
          Height = 15
          Caption = 'Estoque:'
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
          Width = 586
          Height = 23
          Anchors = [akLeft, akTop, akRight]
          DataField = 'nome'
          DataSource = dsCadastro
          TabOrder = 1
        end
        object dbCkbStatus: TDBCheckBox
          Left = 698
          Top = 34
          Width = 62
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'Ativo ?'
          DataField = 'status'
          DataSource = dsCadastro
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbEdtValor: TDBEdit
          Left = 10
          Top = 83
          Width = 100
          Height = 23
          DataField = 'valor'
          DataSource = dsCadastro
          TabOrder = 3
        end
        object dbEdtEstoque: TDBEdit
          Left = 130
          Top = 83
          Width = 100
          Height = 23
          Hint = 'Duplo clique para Alterar o Registro!'
          DataField = 'estoque'
          DataSource = dsCadastro
          TabOrder = 4
        end
      end
      inherited pnlFooterCadastro: TPanel
        Width = 779
        ExplicitWidth = 779
        inherited btnCancelar: TSpeedButton
          Left = 623
          ExplicitLeft = 623
        end
        inherited btnConfirmar: TSpeedButton
          Left = 461
          ExplicitLeft = 461
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = ServicesProdutos.mtPesquisa
  end
end
