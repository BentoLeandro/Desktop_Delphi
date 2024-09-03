unit Services_Clientes;

interface

uses
  System.SysUtils, System.Classes, Services_Base_Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TServicesClientes = class(TServicesBaseCadastro)
    mtPesquisaid: TLargeintField;
    mtPesquisanome: TWideStringField;
    mtPesquisastatus: TSmallintField;
    mtCadastroid: TLargeintField;
    mtCadastronome: TWideStringField;
    mtCadastrostatus: TSmallintField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mtPesquisastatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure mtCadastroAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses Providers_Request;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TServicesClientes.DataModuleCreate(Sender: TObject);
begin
  inherited;
  Request.BaseURL('http://localhost:9000').Resource('clientes');
end;

procedure TServicesClientes.mtCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtCadastrostatus.AsInteger := 1;
end;

procedure TServicesClientes.mtPesquisastatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := 'Ativo';
  if (Sender.AsInteger = 0) then
    Text := 'Inativo';
end;

end.
