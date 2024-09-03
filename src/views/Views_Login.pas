unit Views_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Services_Login, Views_Base;

type
  TFrmLogin = class(TFrmBase)
    pnlBackground: TPanel;
    imgLogo: TImage;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    lblSenha: TLabel;
    edtSenha: TEdit;
    btnEntrar: TButton;
    btnCancelar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    FService : TServicesLogin;
  end;


implementation

uses Providers_Session;

{$R *.dfm}

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
  FService.Login(edtUsuario.Text, edtSenha.Text);

  {ShowMessage(Format('Access.: %s' + sLineBreak +
                     'Refresh.: %s', [TSession.GetInstance.Token.Access,
                                      TSession.GetInstance.Token.Refresh]));}
  Close;
  ModalResult := mrOk;
end;

procedure TFrmLogin.FormCreate(Sender: TObject);
begin
  FService := TServicesLogin.Create(Self);
end;

procedure TFrmLogin.FormDestroy(Sender: TObject);
begin
  FService.Free;
end;

end.
