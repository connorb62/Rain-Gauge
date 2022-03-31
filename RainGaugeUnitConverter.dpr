program RainGaugeUnitConverter;

uses
  Forms,
  MAIN in 'MAIN.pas' {frmConvert};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Rain Gauge - Unit Convert';
  Application.CreateForm(TfrmConvert, frmConvert);
  Application.Run;
end.
