unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, azYouTubeApi;

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

{$R *.fmx}

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
