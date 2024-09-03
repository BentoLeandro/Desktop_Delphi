unit Services_Produtos;

interface

uses
  System.SysUtils, System.Classes, Services_Base_Cadastro, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TServicesProdutos = class(TServicesBaseCadastro)
    mtCadastroid: TLargeintField;
    mtCadastronome: TWideStringField;
    mtCadastrovalor: TFMTBCDField;
    mtCadastrostatus: TSmallintField;
    mtCadastroestoque: TFMTBCDField;
    mtPesquisaid: TLargeintField;
    mtPesquisanome: TWideStringField;
    mtPesquisavalor: TFMTBCDField;
    mtPesquisastatus: TSmallintField;
    mtPesquisaestoque: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure mtCadastroAfterInsert(DataSet: TDataSet);
    procedure mtPesquisastatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TServicesProdutos.DataModuleCreate(Sender: TObject);
begin
  inherited;
   Request.BaseURL('http://localhost:9000').Resource('produtos');
end;

procedure TServicesProdutos.mtCadastroAfterInsert(DataSet: TDataSet);
begin
  inherited;
  mtCadastrostatus.AsInteger := 1;
end;

procedure TServicesProdutos.mtPesquisastatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  Text := 'Ativo';
  if (Sender.AsInteger = 0) then
    Text := 'Inativo';
end;

end.
