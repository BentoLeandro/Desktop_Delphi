unit Views_Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views_Base_Cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels, Vcl.StdCtrls,
  Services_Clientes, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmClientes = class(TFrmBaseCadastro)
    lblCodigo: TLabel;
    dbEdtCodigo: TDBEdit;
    lblNome: TLabel;
    dbEdtNome: TDBEdit;
    dbCkbStatus: TDBCheckBox;
    lblFiltroCodigo: TLabel;
    edtFiltroCodigo: TEdit;
    lblFiltroNome: TLabel;
    edtFiltroNome: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
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

procedure TFrmClientes.DoBeforeList;
begin
  inherited;
  FService.Request
      .ClearParams
      .AddParam('id', edtFiltroCodigo.Text)
      .AddParam('nome', edtFiltroNome.Text);
end;

procedure TFrmClientes.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in dsEditModes) then
    dbEdtNome.SetFocus;
end;

procedure TFrmClientes.FormCreate(Sender: TObject);
begin
  inherited;
  FService := TServicesClientes.Create(Self);
end;

procedure TFrmClientes.FormShow(Sender: TObject);
begin
  inherited;
  edtFiltroCodigo.SetFocus;
end;

end.
