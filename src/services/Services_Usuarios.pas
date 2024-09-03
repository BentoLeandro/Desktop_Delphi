unit Services_Usuarios;

interface

uses
  System.SysUtils, System.Classes, Services_Base_Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TServicesUsuarios = class(TServicesBaseCadastro)
    mtPesquisaid: TLargeintField;
    mtPesquisanome: TWideStringField;
    mtPesquisalogin: TWideStringField;
    mtPesquisastatus: TSmallintField;
    mtPesquisatelefone: TWideStringField;
    mtPesquisasexo: TSmallintField;
    mtCadastroid: TLargeintField;
    mtCadastronome: TWideStringField;
    mtCadastrologin: TWideStringField;
    mtCadastrosenha: TWideStringField;
    mtCadastrostatus: TSmallintField;
    mtCadastrotelefone: TWideStringField;
    mtCadastrosexo: TSmallintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mtCadastroAfterInsert(DataSet: TDataSet);
    procedure mtPesquisastatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure mtPesquisasexoGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function DownloadFotoUsuario: TMemoryStream;
    procedure SalvarFotoUsuario(const AFoto: TMemoryStream);
    procedure Salvar; override;
  end;

implementation

uses Providers_Request, Providers_Session;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TServicesUsuarios.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Request.BaseURL('http://localhost:9000').Resource('usuarios');
end;

function TServicesUsuarios.DownloadFotoUsuario: TMemoryStream;
var
  LResponse : IResponse;
begin
  //try
    Result := TMemoryStream.Create;
    LResponse := TRequest.New
                    .BaseURL('http://localhost:9000')
                    .Resource('usuarios/' + mtCadastroid.AsString +'/foto' )
                    .ContentType('application/octet-stream')
                    .Get;

    if (LResponse.StatusCode = 200) then
    begin
      if (Length(LResponse.RawBytes) > 0) then
      begin
        Result.WriteBuffer(LResponse.RawBytes[0], length(LResponse.RawBytes));
        Result.Position := 0;
      end;
    end;
  {Except
    on e : Exception do
    begin
        //
    end;
  end;}
end;

procedure TServicesUsuarios.mtCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtCadastrostatus.AsInteger := 1;
  mtCadastrosexo.AsInteger := 0; //Masculino
end;

procedure TServicesUsuarios.mtPesquisasexoGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := 'Feminino';
  if (Sender.AsInteger = 0) then
    Text := 'Masculino';

end;

procedure TServicesUsuarios.mtPesquisastatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := 'Ativo';
  if (Sender.AsInteger = 0) then
    Text := 'Inativo';
end;

procedure TServicesUsuarios.Salvar;
begin
  mtCadastrosenha.Visible := not mtCadastrosenha.AsString.Trim.IsEmpty;
  inherited;
end;

procedure TServicesUsuarios.SalvarFotoUsuario(const AFoto: TMemoryStream);
var
  LResponse : IResponse;
begin
  //Setando o ponteiro no inicio da variavel
  AFoto.Position := 0;
  LResponse := TRequest.New
                  .BaseURL('http://localhost:9000')
                  .Resource('usuarios/' + mtPesquisaid.AsString +'/foto' )
                  .AddBody(AFoto)
                  .ContentType('application/octet-stream')
                  .Post;

  if (LResponse.StatusCode <> 204) then
    raise Exception.Create(LResponse.Content);
end;

end.
