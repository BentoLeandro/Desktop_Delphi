unit Views_Base_Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Views_Base, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.WinXPanels, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Services_Base_Cadastro;

type
  TFrmBaseCadastro = class(TFrmBase)
    pnlHeader: TPanel;
    lblTitle: TLabel;
    CardPanel: TCardPanel;
    cardVisualizar: TCard;
    cardCadastro: TCard;
    pnlButtons: TPanel;
    btnIncluir: TSpeedButton;
    btnPesquisar: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    pnlFooter: TPanel;
    dbgRegistro: TDBGrid;
    pnlFiltros: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    dsPesquisa: TDataSource;
    pnlCadastro: TPanel;
    pnlFooterCadastro: TPanel;
    btnCancelar: TSpeedButton;
    btnConfirmar: TSpeedButton;
    dsCadastro: TDataSource;
    btnPrimeiro: TSpeedButton;
    btnAnterior: TSpeedButton;
    btnUltimo: TSpeedButton;
    btnProximo: TSpeedButton;
    lblPagina: TLabel;
    pnlRegistros: TPanel;
    cmbRegistros: TComboBox;
    lblRegistros: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure dsCadastroStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgRegistroDblClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure cmbRegistrosChange(Sender: TObject);
    procedure dbgRegistroDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
    function GetRecordLimitPage: Integer;
    procedure CalcularPaginacao;
    procedure ListarRegistrosPaginacao;
  public
    { Public declarations }
  protected
    FService: TServicesBaseCadastro;
    procedure DoBeforeList; virtual;
  end;

implementation

{$R *.dfm}

procedure TFrmBaseCadastro.btnAlterarClick(Sender: TObject);
begin
  inherited;
  FService.Alterar;
end;

procedure TFrmBaseCadastro.btnAnteriorClick(Sender: TObject);
begin
  inherited;
  if FService.CurrentPage = 1 then
    Exit;

  FService.CurrentPage := FService.CurrentPage - 1;
  ListarRegistrosPaginacao;
end;

procedure TFrmBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dsCadastro.DataSet.Cancel;
end;

procedure TFrmBaseCadastro.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  pnlFooterCadastro.SetFocus;
  FService.Salvar;
end;

procedure TFrmBaseCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if (dsPesquisa.DataSet.Active) and (not dsPesquisa.DataSet.IsEmpty) then
  begin
    if Application.MessageBox('Deseja realmente Excluir o registro ?',
                              'Confirmação', MB_ICONQUESTION+MB_YESNO) = mrYes then
      FService.Excluir;
  end;
end;

procedure TFrmBaseCadastro.btnIncluirClick(Sender: TObject);
begin
  inherited;
  FService.Incluir;
end;

procedure TFrmBaseCadastro.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  ListarRegistrosPaginacao;
end;

procedure TFrmBaseCadastro.btnPrimeiroClick(Sender: TObject);
begin
  inherited;
  if FService.CurrentPage = 1 then
    Exit;

  FService.CurrentPage := 1;
  ListarRegistrosPaginacao;
end;

procedure TFrmBaseCadastro.btnProximoClick(Sender: TObject);
begin
  inherited;
  if FService.CurrentPage = FService.TotalPages then
    Exit;

  FService.CurrentPage := FService.CurrentPage + 1;
  ListarRegistrosPaginacao;
end;

procedure TFrmBaseCadastro.btnUltimoClick(Sender: TObject);
begin
  inherited;
  if FService.CurrentPage = FService.TotalPages then
    Exit;

  FService.CurrentPage := FService.TotalPages;
  ListarRegistrosPaginacao;
end;

procedure TFrmBaseCadastro.CalcularPaginacao;
var
  LTotalPaginas : Double;
begin
  if (FService.CurrentPage <= 0) then
    FService.CurrentPage := 1;

  LTotalPaginas := FService.Records / GetRecordLimitPage;
  FService.TotalPages := Trunc(LTotalPaginas);

  if ((LTotalPaginas - FService.TotalPages) > 0) or (FService.TotalPages = 0) then
    FService.TotalPages := FService.TotalPages + 1;
end;

procedure TFrmBaseCadastro.cmbRegistrosChange(Sender: TObject);
begin
  inherited;
  FService.LimitRecordPage := GetRecordLimitPage;
  FService.CurrentPage := 1;
  ListarRegistrosPaginacao;
end;

procedure TFrmBaseCadastro.dbgRegistroDblClick(Sender: TObject);
begin
  inherited;
  btnAlterar.Click;
end;

procedure TFrmBaseCadastro.dbgRegistroDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if gdSelected in State then
  begin
    dbgRegistro.Canvas.Font.Color := clHighlightText; //Fundo
    dbgRegistro.Canvas.Brush.Color:= clHighlight; //Fonte
  end
  else
  begin
    If odd(dsPesquisa.DataSet.RecNo) then
    begin
      //dbgRegistro.Canvas.Font.Color  := clWhite;
      dbgRegistro.Canvas.Brush.Color := $00C9C9C9; //$00E9E9E9;
    end
    else
    begin
      //dbgRegistro.Canvas.Font.Color := clBlack;
      dbgRegistro.Canvas.Brush.Color := clWhite;
    end;
  end;

  dbgRegistro.Canvas.FillRect(Rect);
  dbgRegistro.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmBaseCadastro.DoBeforeList;
begin

end;

procedure TFrmBaseCadastro.dsCadastroStateChange(Sender: TObject);
begin
  inherited;
  if (dsCadastro.DataSet.State in dsEditModes) then
    cardCadastro.Show
  else
    cardVisualizar.Show;
end;

procedure TFrmBaseCadastro.FormDestroy(Sender: TObject);
begin
  if Assigned(FService) then
    FService.Free;
  inherited;
end;

procedure TFrmBaseCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if cardVisualizar.Visible then
  begin
    case Key of
      VK_INSERT:
        btnIncluir.Click;
      VK_F3:
        btnAlterar.Click;
      VK_DELETE:
        btnExcluir.Click;
      VK_F5:
        btnPesquisar.Click;
    end;
  end
  else
  begin
    case Key of
      VK_F2:
        btnConfirmar.Click;
      VK_F4:
        btnCancelar.Click;
    end;
  end;

end;

procedure TFrmBaseCadastro.FormShow(Sender: TObject);
begin
  inherited;
  dsPesquisa.DataSet := FService.mtPesquisa;
  dsCadastro.DataSet := FService.mtCadastro;
  cardVisualizar.Show;
end;

function TFrmBaseCadastro.GetRecordLimitPage: Integer;
begin
  Result := StrToIntDef(cmbRegistros.Text, 50);
end;

procedure TFrmBaseCadastro.ListarRegistrosPaginacao;
begin
  DoBeforeList;
  FService.ListarRegistro;
  CalcularPaginacao;
  lblPagina.Caption := Format('Pagina %d de %d', [FService.CurrentPage, FService.TotalPages]);
end;

end.
