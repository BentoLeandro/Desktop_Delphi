unit Services_Base_Cadastro;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Providers_Session, Providers_Request, DataSet.Serialize,
  system.JSON, Services_Base;

type
  TServicesBaseCadastro = class(TServicesBase)
    mtPesquisa: TFDMemTable;
    mtCadastro: TFDMemTable;
    procedure DataModuleCreate(Sender: TObject);
  private
    FRecords: integer;
    FLimitRecordPage: Integer;
    FCurrentPage: Integer;
    FTotalPages: Integer;
    function GetResourceSuffix: string;
  public
    procedure ListarRegistro; virtual;
    procedure Incluir; virtual;
    procedure Salvar; virtual;
    procedure Alterar; virtual;
    procedure Excluir; virtual;
    property Records: Integer read FRecords write FRecords;
    property LimitRecordPage: Integer read FLimitRecordPage write FLimitRecordPage;
    property CurrentPage: Integer read FCurrentPage write FCurrentPage;
    property TotalPages: Integer read FTotalPages write FTotalPages;
  end;

implementation


{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServicesBaseCadastro }

procedure TServicesBaseCadastro.Alterar;
var
  LResponse : IResponse;
begin
  if (not mtPesquisa.Active) or (mtPesquisa.IsEmpty) then
    raise Exception.Create('Selecione um registro para Alterar!');

  LResponse := Request
                  .ResourceSuffix(GetResourceSuffix)
                  .Get;

  if (LResponse.StatusCode <> 200) then
    raise Exception.Create(LResponse.Content);

  //Limpa a tabela temporária
  if mtCadastro.Active then
    mtPesquisa.EmptyDataSet;

  mtCadastro.LoadFromJSON(LResponse.Content);
  mtCadastro.Edit;
end;

procedure TServicesBaseCadastro.DataModuleCreate(Sender: TObject);
begin
  inherited;
  FRecords := 0;
  FLimitRecordPage := 50;
  FCurrentPage := 1;
  FTotalPages := 1;
end;

procedure TServicesBaseCadastro.Excluir;
var
  LResponse : IResponse;
begin
  if (not mtPesquisa.Active) or (mtPesquisa.IsEmpty) then
    raise Exception.Create('Selecione um registro para Excluir!');

  LResponse := Request
                  .ResourceSuffix(GetResourceSuffix)
                  .Delete;

  if (LResponse.StatusCode <> 204) then
    raise Exception.Create(LResponse.Content);

  mtPesquisa.Delete;
end;

function TServicesBaseCadastro.GetResourceSuffix: string;
var
  LFied : TField;
begin
  for LFied in mtPesquisa.Fields do
  begin
    if (pfInKey in LFied.ProviderFlags) then
      Exit(LFied.AsString);
  end;
end;

procedure TServicesBaseCadastro.Incluir;
begin
  if not mtCadastro.Active then
    mtCadastro.Open;

  mtCadastro.Append;
end;

procedure TServicesBaseCadastro.ListarRegistro;
var
  LResponse : IResponse;
begin
  mtPesquisa.DisableControls;
  try
    LResponse := Request
                    .ResourceSuffix(EmptyStr)
                    .AddParam('limit', LimitRecordPage.ToString)
                    .AddParam('offset', (Pred(CurrentPage) * LimitRecordPage).ToString)
                    .Get;

    if (LResponse.StatusCode <> 200) then
      raise Exception.Create(LResponse.Content);

    //Limpa a tabela temporária
    if mtPesquisa.Active then
      mtPesquisa.EmptyDataSet;

    mtPesquisa.LoadFromJSON(LResponse.JSONValue.GetValue<TJSONArray>('data'), False);
    Records := LResponse.JSONValue.GetValue<Integer>('records');
  finally
    mtPesquisa.EnableControls;
  end;
end;

procedure TServicesBaseCadastro.Salvar;
var
  LResponse : IResponse;
begin
  mtPesquisa.DisableControls;
  try
    Request
        .ClearBody
        .AddBody(mtCadastro.ToJSONObject);

    if (mtCadastro.State = dsEdit) then
      LResponse := Request.Put
    else
      LResponse := Request.ResourceSuffix(EmptyStr).Post;

    if not (LResponse.StatusCode in [201, 204]) then
      raise Exception.Create(LResponse.Content);

    if not mtPesquisa.Active then
      mtPesquisa.Open;

    if (mtCadastro.State = dsEdit) then
      mtPesquisa.MergeFromJSONObject(mtCadastro.ToJSONObject, False)
    else
      mtPesquisa.LoadFromJSON(LResponse.Content);

    //Ao alterar o status da tabela para cancel a procedure dsCadastroStateChange
    //É executada, fazendo a tela voltar para a Pesquisa.
    mtCadastro.Cancel;
  finally
    mtPesquisa.EnableControls;
  end;
end;

end.
