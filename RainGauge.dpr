program RainGauge;

uses
  Forms,
  Unit11 in 'Unit11.pas' {frmMain},
  Unit1 in 'Unit1.pas' {frmAbout};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Rain Gauge';
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.Run;
end.
