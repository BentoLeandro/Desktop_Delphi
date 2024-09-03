unit Views_Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views_Base, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmHome = class(TFrmBase)
    Label1: TLabel;
    Memo1: TMemo;
    Panel1: TPanel;
    lblTitle: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
