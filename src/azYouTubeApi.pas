{*******************************************************}
{                                                       }
{                Delphi YouTubeApi Library              }
{                                                       }
{           Copyright(c) 2010-2018 Ali Zairov           }
{                                                       }
{*******************************************************}

unit azYouTubeApi;

interface

uses
  System.SysUtils,
  System.Classes,
  IdHTTP;

type
  TazInfo = record
    url,
    title,
    thumbnailUrl,
    description,
    channelId,
    videoId,
    duration,
    datePublished,
    genre,
    embedUrl: string;
    width,
    height: Integer;
    keywords,
    author: string;
    length_seconds: Integer;
    subscriber,
    view,
    like,
    unlike: string;
  end;

type
  TazYouTubeApi = class(TComponent)
  private
    FAuthor, FSite, FVersion: string;
    FHTTP: TIdHTTP;
    function Parse(Source, L, R: string): string;
    function SReplace(Source, Old, New: string): string;
    function TagClear(Source: string): string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Get(v: string): TazInfo;
  published
    property Author: string Read FAuthor;
    property Site: string Read FSite;
    property Version: string Read FVersion;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('AliZairov', [TazYouTubeApi]);
end;

{ TazYouTubeApi }

constructor TazYouTubeApi.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FAuthor                       := 'Ali Zairov';
  FSite                         := 'http://delphidx.blogspot.com';
  FVersion                      := '1.4';
  FHTTP                         := TIdHTTP.Create(nil);
  FHTTP.Request.AcceptLanguage  := 'en';
  FHTTP.Request.UserAgent       := 'Mozilla/5.0';
end;

destructor TazYouTubeApi.Destroy;
begin
  FHTTP.Free;
  inherited Destroy;
end;

function TazYouTubeApi.Parse(Source, L, R: string): string;
begin
  Delete(Source, 1, Pos(L, Source) + Length(L) - 1);
  Result := Copy(Source, 1, Pos(R, Source) - 1);
end;

function TazYouTubeApi.SReplace(Source, Old, New: string): string;
begin
  Result := StringReplace(Source, Old, New, [rfReplaceAll, rfIgnoreCase]);
end;

function TazYouTubeApi.TagClear(Source: string): string;
var
  S: string;
begin
  S := Source;
  S := SReplace(S, '&quot;', '"');
  S := SReplace(S, '&amp;', '&');
  S := SReplace(S, '&lt;', '<');
  S := SReplace(S, '&gt;', '>');
  S := SReplace(S, '&nbsp;', ' ');
  S := SReplace(S, '&copy;', '©');
  S := SReplace(S, '&#39;', '”');
  Result := S;
end;

function TazYouTubeApi.Get(v: string): TazInfo;
var
  Source, Source2: string;
begin
  Source := FHTTP.Get('https://www.youtube.com/watch?v=' + v);
  Source2 := Parse(Source, 'ytplayer.config =', ';ytplayer.load');
  with Result do
  begin
    url             := Parse(Source, 'og:url" content="', '"');
    title           := Parse(Source, 'og:title" content="', '"');
    thumbnailUrl    := Parse(Source, 'og:image" content="', '"');
    description     := TagClear(Parse(Source, 'og:description" content="', '"'));
    channelId       := Parse(Source, 'channelId" content="', '"');
    videoId         := Parse(Source, 'videoId" content="', '"');
    duration        := Parse(Source, 'duration" content="', '"');
    datePublished   := Parse(Source, 'datePublished" content="', '"');
    genre           := Parse(Source, 'genre" content="', '"');
    embedUrl        := Parse(Source, 'og:video:url" content="', '"');
    width           := Parse(Source, 'og:video:width" content="', '"').ToInteger;
    height          := Parse(Source, 'og:video:height" content="', '"').ToInteger;
    keywords        := Parse(Source2, '"keywords":"', '"');
    author          := Parse(Source2, 'author":"', '"');
    length_seconds  := Parse(Source2, 'length_seconds":"', '"').ToInteger;
    subscriber      := Parse(Source, 'subscriber-count" title="', '"');
    view            := Trim(Parse(Source, 'watch-view-count">', 'views'));
    like            := Trim(Parse(Source, 'like this video along with', 'other'));
    unlike          := Trim(Parse(Source, 'dislike this video along with', 'other'))
  end;
end;

end.
