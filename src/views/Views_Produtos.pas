unit Views_Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views_Base_Cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels,
  Services_Produtos, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmProdutos = class(TFrmBaseCadastro)
    lblFiltroCodigo: TLabel;
    edtFiltroCodigo: TEdit;
    lblFiltroNome: TLabel;
    edtFiltroNome: TEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    dbEdtCodigo: TDBEdit;
    dbEdtNome: TDBEdit;
    dbCkbStatus: TDBCheckBox;
    lblValor: TLabel;
    dbEdtValor: TDBEdit;
    lblEstoque: TLabel;
    dbEdtEstoque: TDBEdit;
    procedure dsCadastroStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure DoBeforeList; override;
  end;

implementation

{$R *.dfm}

{ TFrmProdutos }

procedure TFrmProdutos.DoBeforeList;
begin
  inherited;
  FService.Request
      .ClearParams
      .AddParam('id', edtFiltroCodigo.Text)
      .AddParam('nome', edtFiltroNome.Text);
end;

procedure TFrmProdutos.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in dsEditModes) then
    dbEdtNome.SetFocus;
end;

procedure TFrmProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  FService := TServicesProdutos.Create(Self);
end;

procedure TFrmProdutos.FormShow(Sender: TObject);
begin
  inherited;
  edtFiltroCodigo.SetFocus;
end;

end.
