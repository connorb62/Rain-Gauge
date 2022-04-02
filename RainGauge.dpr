program RainGauge;

uses
  Forms,
  MAIN in 'MAIN.pas' {frmMain},
  Vcl.Themes,
  Vcl.Styles,
  ABOUTNEW in 'ABOUTNEW.pas' {frmMainAbout},
  SETTINGS in 'SETTINGS.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Rain Gauge';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmMainAbout, frmMainAbout);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
