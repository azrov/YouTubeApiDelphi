program App;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
