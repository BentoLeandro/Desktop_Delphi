unit Views_Usuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views_Base_Cadastro, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.WinXPanels,
  Services_Usuarios, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmUsuarios = class(TFrmBaseCadastro)
    lblFiltroCodigo: TLabel;
    lblFiltroNome: TLabel;
    edtFiltroCodigo: TEdit;
    edtFiltroNome: TEdit;
    lblCodigo: TLabel;
    lblNome: TLabel;
    dbEdtCodigo: TDBEdit;
    dbEdtNome: TDBEdit;
    dbCkbStatus: TDBCheckBox;
    lblLogin: TLabel;
    dbEdtLogin: TDBEdit;
    lblSenha: TLabel;
    dbEdtSenha: TDBEdit;
    lblTelefone: TLabel;
    dbEdtTelefone: TDBEdit;
    lblSexo: TLabel;
    cmbSexo: TComboBox;
    btnAlterarFotoPerfil: TButton;
    btnLimparFotoPerfil: TButton;
    OpenDialog: TOpenDialog;
    pnlImageFotoPerfil: TPanel;
    imgFotoPerfil: TImage;
    procedure dsCadastroStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAlterarFotoPerfilClick(Sender: TObject);
    procedure btnLimparFotoPerfilClick(Sender: TObject);
  private
    { Private declarations }
    function GetStreamFotoUsuario : TMemoryStream;
    procedure CarregarFotoUsuario;
  public
    { Public declarations }
  protected
    procedure DoBeforeList; override;
  end;

implementation

uses jpeg;

{$R *.dfm}

{ TFrmBaseCadastro1 }

procedure TFrmUsuarios.btnAlterarFotoPerfilClick(Sender: TObject);
begin
  inherited;
  if OpenDialog.Execute then
    imgFotoPerfil.Picture.LoadFromFile(OpenDialog.FileName);

end;

procedure TFrmUsuarios.btnConfirmarClick(Sender: TObject);
begin
  if (dsCadastro.DataSet.State in dsEditModes) then
    TServicesUsuarios(FService).mtCadastrosexo.AsInteger := cmbSexo.ItemIndex;
  inherited;
  TServicesUsuarios(FService).SalvarFotoUsuario(GetStreamFotoUsuario);
end;

procedure TFrmUsuarios.btnLimparFotoPerfilClick(Sender: TObject);
begin
  inherited;
  imgFotoPerfil.Picture := nil;
end;

procedure TFrmUsuarios.CarregarFotoUsuario;
var
  LFoto : TMemoryStream;
  LJPEGImage : TJPEGImage;
begin
  LFoto := TServicesUsuarios(FService).DownloadFotoUsuario;
  try
    if (LFoto.Size = 0) then
    begin
      imgFotoPerfil.Picture := nil;
      Exit;
    end;

    LJPEGImage := TJPEGImage.Create;
    try
      LJPEGImage.LoadFromStream(LFoto);
      imgFotoPerfil.Picture.Assign(LJPEGImage);
    finally
      LJPEGImage.Free;
    end;
  finally
    LFoto.Free;
  end;

end;

procedure TFrmUsuarios.DoBeforeList;
begin
  inherited;
  FService.Request
      .ClearParams
      .AddParam('id', edtFiltroCodigo.Text)
      .AddParam('nome', edtFiltroNome.Text);
end;

procedure TFrmUsuarios.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in dsEditModes) then
  begin
    cmbSexo.ItemIndex := TServicesUsuarios(FService).mtCadastrosexo.AsInteger;

    if (dsCadastro.DataSet.State = dsInsert) then
      imgFotoPerfil.Picture := nil
    else
      CarregarFotoUsuario;

    dbEdtNome.SetFocus;
  end;
end;

procedure TFrmUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  FService := TServicesUsuarios.Create(Self);
end;

procedure TFrmUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  edtFiltroCodigo.SetFocus;
end;

function TFrmUsuarios.GetStreamFotoUsuario: TMemoryStream;
begin
  Result := TMemoryStream.Create;
  imgFotoPerfil.Picture.SaveToStream(Result);
end;

end.
