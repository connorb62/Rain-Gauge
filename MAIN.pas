unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ImgList, Menus, ExtCtrls, Printers;

type
  TfrmConvert = class(TForm)
    statMain: TStatusBar;
    mmMain: TMainMenu;
    Convert1: TMenuItem;
    Edit1: TMenuItem;
    Convert2: TMenuItem;
    Help1: TMenuItem;
    Print1: TMenuItem;
    ilMain: TImageList;
    grpOutput: TGroupBox;
    redOut: TRichEdit;
    Close1: TMenuItem;
    pnlMain: TPanel;
    grpConvert: TGroupBox;
    grpDo: TGroupBox;
    btnConvert: TButton;
    cbbConvert: TComboBox;
    lbledtCenti: TLabeledEdit;
    lbledtMili: TLabeledEdit;
    lbledtInch: TLabeledEdit;
    chkClear: TCheckBox;
    ClearOutput1: TMenuItem;
    ReportError1: TMenuItem;
    Contact1: TMenuItem;
    About1: TMenuItem;
    procedure cbbConvertClick(Sender: TObject);
    procedure cbbConvertChange(Sender: TObject);
    procedure lbledtMiliChange(Sender: TObject);
    procedure lbledtInchChange(Sender: TObject);
    procedure lbledtCentiChange(Sender: TObject);
    procedure btnConvertClick(Sender: TObject);
    procedure Convert2Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Contact1Click(Sender: TObject);
    procedure ReportError1Click(Sender: TObject);
    procedure ClearOutput1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConvert: TfrmConvert;

implementation

{$R *.dfm}

procedure TfrmConvert.About1Click(Sender: TObject);
begin
  MessageDlg('Rain Gauge - Unit Convert ®'  + #13 +
  'Part of the Rain Gauge ® Application' + #13 +
  '© 2022 Connor Bell All Rights Reserved' + #13 +
  'See LICENSE.txt for Licensing Information', mtInformation, [mbClose], 0);
end;

procedure TfrmConvert.btnConvertClick(Sender: TObject);
var
  rValue : Real;
begin
  rValue := 0;
  if cbbConvert.Text = 'Centimetre to Inch' then
    begin
      rValue := StrToInt(lbledtCenti.Text) / 2.54;
      redOut.Lines.Add(lbledtCenti.Text + ' cm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' in');
      lbledtCenti.Clear;
    end
  else
  if cbbConvert.Text = 'Centimetre to Millimetre' then
    begin
      rValue := StrToInt(lbledtCenti.Text) * 10;
      redOut.Lines.Add(lbledtCenti.Text + ' cm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' mm');
      lbledtCenti.Clear;
    end
  else
  if cbbConvert.Text = 'Inch to Centimetre' then
    begin
      rValue := StrToInt(lbledtInch.Text) * 2.54;
      redOut.Lines.Add(lbledtInch.Text + ' in =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' cm');
      lbledtInch.Clear;
    end
  else
  if cbbConvert.Text = 'Inch to Millimetre' then
    begin
      rValue := StrToInt(lbledtInch.Text) * 25.4;
      redOut.Lines.Add(lbledtInch.Text + ' in =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' mm');
      lbledtInch.Clear;
    end
  else
  if cbbConvert.Text = 'Millimetre to Centimetre' then
    begin
      rValue := StrToInt(lbledtMili.Text) / 10;
      redOut.Lines.Add(lbledtMili.Text + ' mm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' cm');
      lbledtMili.Clear;
    end
  else
  if cbbConvert.Text = 'Millimetre to Inch' then
    begin
      rValue := StrToInt(lbledtMili.Text) / 25.4;
      redOut.Lines.Add(lbledtMili.Text + ' mm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' in');
      lbledtMili.Clear;
    end
  else
    begin
      MessageDlg('Only select a value from the list', mtError, [mbOK], 0);
    end;
end;

procedure TfrmConvert.cbbConvertChange(Sender: TObject);
begin
  statMain.Panels[0].Text := cbbConvert.Text;
 if (cbbConvert.Text = 'Centimetre to Inch') or
  (cbbConvert.Text = 'Centimetre to Millimetre') then
    begin
      lbledtCenti.Enabled := True;
      lbledtMili.Enabled := False;
      lbledtInch.Enabled := False;
    end
  else
  if (cbbConvert.Text = 'Inch to Millimetre') or
  (cbbConvert.Text = 'Inch to Centimetre') then
    begin
      lbledtInch.Enabled := True;
      lbledtCenti.Enabled := False;
      lbledtMili.Enabled := False;
    end
  else
  if (cbbConvert.Text = 'Millimetre to Centimetre') or
  (cbbConvert.Text = 'Millimetre to Inch') then
    begin
      lbledtMili.Enabled := True;
      lbledtCenti.Enabled := False;
      lbledtInch.Enabled := False;
    end;

  btnConvert.Enabled := False;

  if chkClear.Checked = True then
    begin
      redOut.Clear;
      redOut.Lines.Clear;
    end
  else
  if chkClear.Checked = False then
    begin
      Exit;
    end;
end;

procedure TfrmConvert.cbbConvertClick(Sender: TObject);
begin
  if (cbbConvert.Text = 'Centimetre to Inch') or
  (cbbConvert.Text = 'Centimetre to Millimetre') then
    begin
      lbledtCenti.Enabled := True;
      lbledtMili.Enabled := False;
      lbledtInch.Enabled := False;
    end
  else
  if (cbbConvert.Text = 'Inch to Millimetre') or
  (cbbConvert.Text = 'Inch to Centimetre') then
    begin
      lbledtInch.Enabled := True;
      lbledtCenti.Enabled := False;
      lbledtMili.Enabled := False;
    end
  else
  if (cbbConvert.Text = 'Millimetre to Centimetre') or
  (cbbConvert.Text = 'Millimetre to Inch') then
    begin
      lbledtMili.Enabled := True;
      lbledtCenti.Enabled := False;
      lbledtInch.Enabled := False;
    end;
    btnConvert.Enabled := False;

  if chkClear.Checked = True then
    begin
      redOut.Clear;
      redOut.Lines.Clear;
    end
  else
  if chkClear.Checked = False then
    begin
      Exit;
    end;
end;

procedure TfrmConvert.ClearOutput1Click(Sender: TObject);
begin
  redOut.Lines.Clear;
  redOut.Clear;
end;

procedure TfrmConvert.Close1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmConvert.Contact1Click(Sender: TObject);
begin
  MessageDlg('Contact: ' + #13 + 'Email: cbell@jeppeboys.co.za' + #13 +
  'Phone: +27 66 202 1724', mtInformation, [mbClose], 0)
end;

procedure TfrmConvert.Convert2Click(Sender: TObject);
var
  rValue : Real;
begin
  rValue := 0;
  if cbbConvert.Text = 'Centimetre to Inch' then
    begin
      rValue := StrToInt(lbledtCenti.Text) / 2.54;
      redOut.Lines.Add(lbledtCenti.Text + ' cm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' in');
      lbledtCenti.Clear;
    end
  else
  if cbbConvert.Text = 'Centimetre to Millimetre' then
    begin
      rValue := StrToInt(lbledtCenti.Text) * 10;
      redOut.Lines.Add(lbledtCenti.Text + ' cm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' mm');
      lbledtCenti.Clear;
    end
  else
  if cbbConvert.Text = 'Inch to Centimetre' then
    begin
      rValue := StrToInt(lbledtInch.Text) * 2.54;
      redOut.Lines.Add(lbledtInch.Text + ' in =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' cm');
      lbledtInch.Clear;
    end
  else
  if cbbConvert.Text = 'Inch to Millimetre' then
    begin
      rValue := StrToInt(lbledtInch.Text) * 25.4;
      redOut.Lines.Add(lbledtInch.Text + ' in =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' mm');
      lbledtInch.Clear;
    end
  else
  if cbbConvert.Text = 'Millimetre to Centimetre' then
    begin
      rValue := StrToInt(lbledtMili.Text) / 10;
      redOut.Lines.Add(lbledtMili.Text + ' mm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' cm');
      lbledtMili.Clear;
    end
  else
  if cbbConvert.Text = 'Millimetre to Inch' then
    begin
      rValue := StrToInt(lbledtMili.Text) / 25.4;
      redOut.Lines.Add(lbledtMili.Text + ' mm =' + #13 +
      FloatToStrF(rValue, ffNumber, 10, 4) + ' in');
      lbledtMili.Clear;
    end
  else
    begin
      MessageDlg('Only select a value from the list', mtError, [mbOK], 0);
    end;
end;

procedure TfrmConvert.lbledtCentiChange(Sender: TObject);
begin
  btnConvert.Enabled := True;
end;

procedure TfrmConvert.lbledtInchChange(Sender: TObject);
begin
  btnConvert.Enabled := True;
end;

procedure TfrmConvert.lbledtMiliChange(Sender: TObject);
begin
  btnConvert.Enabled := True;
end;

procedure TfrmConvert.Print1Click(Sender: TObject);
var
  pixX, pixY : Integer;
begin
  with TPrintDialog.Create(nil) do
    begin
      try
        if Execute then
          begin
            with redOut do
              begin
                PlainText := True;
                Lines.SaveToFile('Lines.txt');
                Lines.LoadFromFile('Lines.txt');
                pixX := GetDeviceCaps(Printer.Handle, LOGPIXELSX);
                pixY := GetDeviceCaps(Printer.Handle, LOGPIXELSY);

                with PageRect do
                  begin
                    Margins.Left := 2 * pixX div 2;
                    Margins.Top := 3 * pixY div 2;
                    Margins.Right := Printer.PageWidth - 3 * pixX div 4;
                    Margins.Bottom := Printer.PageHeight - pixY;
                  end;
                Print('Unit Convert - Output');
              end;
          end;
      finally
        Free;
      end;
    end;
end;

procedure TfrmConvert.ReportError1Click(Sender: TObject);
begin
  MessageDlg('Report and Error or Bug to: ' + #13 +
  'Email: cbell@jeppeboys.co.za' + #13 + 'Phone: +27 66 202 1724',
  mtInformation, [mbClose], 0)
end;

end.
