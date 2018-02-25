unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, azYouTubeApi;

type
  TMain = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    YT: TazYouTubeApi;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;

implementation

{$R *.dfm}

procedure TMain.Button1Click(Sender: TObject);
var
  Info: TazInfo;
begin
  Application.ProcessMessages;
  Info := YT.Get('_P7S2lKif-A');
  Memo1.Lines.Add('url: '             + Info.url);
  Memo1.Lines.Add('title: '           + Info.title);
  Memo1.Lines.Add('thumbnailUrl: '    + Info.thumbnailUrl);
  Memo1.Lines.Add('description: '     + Info.description);
  Memo1.Lines.Add('channelId: '       + Info.channelId);
  Memo1.Lines.Add('videoId: '         + Info.videoId);
  Memo1.Lines.Add('duration: '        + Info.duration);
  Memo1.Lines.Add('datePublished: '   + Info.datePublished);
  Memo1.Lines.Add('genre: '           + Info.genre);
  Memo1.Lines.Add('embedUrl: '        + Info.embedUrl);
  Memo1.Lines.Add('width: '           + Info.width.ToString);
  Memo1.Lines.Add('height: '          + Info.height.ToString);
  Memo1.Lines.Add('keywords: '        + Info.keywords);
  Memo1.Lines.Add('author: '          + Info.author);
  Memo1.Lines.Add('length_seconds: '  + Info.length_seconds.ToString);
  Memo1.Lines.Add('subscriber: '      + Info.subscriber);
  Memo1.Lines.Add('view: '            + Info.view);
  Memo1.Lines.Add('like: '            + Info.like);
  Memo1.Lines.Add('unlike: '          + Info.unlike);
end;

end.
