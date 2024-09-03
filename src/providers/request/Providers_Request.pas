unit Providers_Request;

interface

uses Providers_Request_Intf, RESTRequest4D, System.JSON, System.Classes,
  Providers_Session, System.SysUtils, REST.Types;

type
  IRequest = Providers_Request_Intf.IRequest;
  IResponse = RESTRequest4D.IResponse;

  TRequest = class(TInterfacedObject, IRequest)
  private
    FRequest: RESTRequest4D.IRequest;
    function BaseURL(const AValue: string): IRequest;
    function Resource(const AValue: string): IRequest;
    function ResourceSuffix(const AValue: string): IRequest;
    function AddParam(const AKey, AValue  : string): IRequest;
    function ContentType(const AValue: string): IRequest;
    function ClearBody: IRequest;
    function ClearParams: IRequest;
    function AddBody(const ABody: TJSONObject; const AOwns: Boolean = True): IRequest; overload;
    function AddBody(const ABody: TMemoryStream; const AOwns: Boolean = True): IRequest; overload;
    function Get: IResponse;
    function Post: IResponse;
    function Delete: IResponse;
    function Put: IResponse;
    function RenovarToken: Boolean;
    function ExecuteMethod(const AMethod: TRESTRequestMethod): IResponse;
    procedure DoBeforeExecute;
    constructor Create;
  public
    class function New: IRequest;
    destructor Destroy; override;
  end;

implementation

{ TRequest }

function TRequest.AddBody(const ABody: TMemoryStream;
  const AOwns: Boolean): IRequest;
begin
  FRequest.AddBody(ABody, AOwns);
  Result := Self;
end;

function TRequest.AddBody(const ABody: TJSONObject;
  const AOwns: Boolean): IRequest;
begin
  FRequest.AddBody(ABody, AOwns);
  Result := Self;
end;

function TRequest.AddParam(const AKey, AValue: string): IRequest;
begin
  FRequest.AddParam(AKey, AValue);
  Result := Self;
end;

function TRequest.BaseURL(const AValue: string): IRequest;
begin
  FRequest.BaseURL(AValue);
  Result := Self;
end;

function TRequest.ClearBody: IRequest;
begin
  FRequest.ClearBody;
  Result := Self;
end;

function TRequest.ClearParams: IRequest;
begin
  FRequest.ClearParams;
  Result := Self;
end;

function TRequest.ContentType(const AValue: string): IRequest;
begin
  FRequest.ContentType(AValue);
  Result := Self;
end;

constructor TRequest.Create;
begin
  FRequest := RESTRequest4D.TRequest.New;
end;

function TRequest.Delete: IResponse;
begin
  Result := ExecuteMethod(TRESTRequestMethod.rmDELETE);
end;

destructor TRequest.Destroy;
begin
  FRequest := nil;
  inherited;
end;

procedure TRequest.DoBeforeExecute;
begin
  if not TSession.GetInstance.Token.Access.Trim.IsEmpty then
    FRequest.Token('bearer ' + TSession.GetInstance.Token.Access);
end;

function TRequest.ExecuteMethod(const AMethod: TRESTRequestMethod): IResponse;
begin
  DoBeforeExecute;
  case AMethod of
    TRESTRequestMethod.rmPOST: Result := FRequest.Post;
    TRESTRequestMethod.rmPUT: Result := FRequest.Put;
    TRESTRequestMethod.rmGET: Result := FRequest.Get;
  else
    Result := FRequest.Delete;
  end;

  if (Result.StatusCode = 401) then
  begin
    if RenovarToken then
      Result := ExecuteMethod(AMethod);
  end;
end;

function TRequest.Get: IResponse;
begin
  Result := ExecuteMethod(TRESTRequestMethod.rmGET);
end;

class function TRequest.New: IRequest;
begin
  Result := TRequest.Create;
end;

function TRequest.Post: IResponse;
begin
  Result := ExecuteMethod(TRESTRequestMethod.rmPOST);
end;

function TRequest.Put: IResponse;
begin
  Result := ExecuteMethod(TRESTRequestMethod.rmPUT);
end;

function TRequest.RenovarToken: Boolean;
var
  LResponse : IResponse;
begin
  LResponse := RESTRequest4D.TRequest.New
                  .Token('bearer ' + TSession.GetInstance.Token.Refresh)
                  .BaseURL('http://localhost:8000')
                  .Resource('refresh')
                  .Get;

  Result := (LResponse.StatusCode = 200);
  if Result then
    TSession.GetInstance.Token.Access := LResponse.JSONValue.GetValue<string>('access');
end;

function TRequest.Resource(const AValue: string): IRequest;
begin
  FRequest.Resource(AValue);
  Result := Self;
end;

function TRequest.ResourceSuffix(const AValue: string): IRequest;
begin
  FRequest.ResourceSuffix(AValue);
  Result := Self;
end;

end.
