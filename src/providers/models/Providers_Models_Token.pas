unit Providers_Models_Token;

interface

type
  TToken = class
  private
    FRefresh: string;
    FAccess: string;
    procedure SetRefresh(const Value: string);
  public
    property Access : string read FAccess write FAccess;
    property Refresh : string read FRefresh write SetRefresh;
  end;

implementation

{ TToken }

procedure TToken.SetRefresh(const Value: string);
begin
  FRefresh := Value;
end;

end.
