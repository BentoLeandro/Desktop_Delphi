unit Services_Login;

interface

uses
  System.SysUtils, System.Classes;

type
  TServicesLogin = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Login(const AUsername, APassword : string);
  end;

implementation

uses System.JSON, Providers_Request, Providers_Session;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServicesLogin }

procedure TServicesLogin.Login(const AUsername, APassword: string);
var
  LJSON : TJSONObject;
  LResponse : IResponse;
begin
  if AUsername.Trim.IsEmpty or APassword.Trim.IsEmpty then
    raise Exception.Create('Informe o Usuário e a Senha!');

  LJSON := TJSONObject.Create;
  LJSON.AddPair('username', AUsername);
  LJSON.AddPair('password', APassword);

  LResponse := TRequest.New
                  .BaseURL('http://localhost:8000')
                  .Resource('login')
                  .AddBody(LJSON)
                  .Post;

  if (LResponse.StatusCode <> 200) then
    raise Exception.Create(LResponse.JSONValue.GetValue<string>('error'));

  TSession.GetInstance.Token.Access := LResponse.JSONValue.GetValue<string>('access');
  TSession.GetInstance.Token.Refresh := LResponse.JSONValue.GetValue<string>('refresh');

end;

end.
