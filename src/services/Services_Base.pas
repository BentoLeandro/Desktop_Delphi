unit Services_Base;

interface

uses
  System.SysUtils, System.Classes, Providers_Request;

type
  TServicesBase = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    FRequest: IRequest;
  public
    { Public declarations }
    property Request: IRequest read FRequest write FRequest;
  end;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TServicesBase.DataModuleCreate(Sender: TObject);
begin
  FRequest := TRequest.New;
end;

procedure TServicesBase.DataModuleDestroy(Sender: TObject);
begin
  FRequest := nil;
end;

end.
