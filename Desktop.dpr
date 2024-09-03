program Desktop;

uses
  Vcl.Forms,
  Views_Principal in 'src\views\Views_Principal.pas' {FrmPrincipal},
  Views_Login in 'src\views\Views_Login.pas' {FrmLogin},
  Services_Login in 'src\services\Services_Login.pas' {ServicesLogin: TDataModule},
  Providers_Session in 'src\providers\Providers_Session.pas',
  Providers_Models_Token in 'src\providers\models\Providers_Models_Token.pas',
  Services_Base in 'src\services\Services_Base.pas' {ServicesBase: TDataModule},
  Services_Base_Cadastro in 'src\services\Services_Base_Cadastro.pas' {ServicesBaseCadastro: TDataModule},
  Views_Base in 'src\views\Views_Base.pas' {FrmBase},
  Views_Base_Cadastro in 'src\views\Views_Base_Cadastro.pas' {FrmBaseCadastro},
  Views_Clientes in 'src\views\Views_Clientes.pas' {FrmClientes},
  Services_Clientes in 'src\services\Services_Clientes.pas' {ServicesClientes: TDataModule},
  Services_Produtos in 'src\services\Services_Produtos.pas' {ServicesProdutos: TDataModule},
  Views_Produtos in 'src\views\Views_Produtos.pas' {FrmProdutos},
  Services_Usuarios in 'src\services\Services_Usuarios.pas' {ServicesUsuarios: TDataModule},
  Views_Usuarios in 'src\views\Views_Usuarios.pas' {FrmUsuarios},
  Providers_Request_Intf in 'src\providers\request\Providers_Request_Intf.pas',
  Providers_Request in 'src\providers\request\Providers_Request.pas';

{$R *.res}

var
  FrmPrincipal: TFrmPrincipal;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
