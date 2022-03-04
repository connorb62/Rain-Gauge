{ © 2022 Connor Bell
Creates by Connor Bell (Dated: 26 February 2022 - 27 February 2022)
Location: 27 Beukes Avenue, Highway Gardens, 1609, Germiston
          Gauteng, South Africa

cbell@jeppeboys.co.za
066 202 1724
}
unit Unit11;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Grids, Printers, Spin, TeEngine,
  Series, TeeProcs, Chart, DateUtils;

type
  TfrmMain = class(TForm)
    statMain: TStatusBar;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    Open1: TMenuItem;
    Print1: TMenuItem;
    Edit1: TMenuItem;
    Clear1: TMenuItem;
    Editing1: TMenuItem;
    AllRecords1: TMenuItem;
    Add1: TMenuItem;
    Row1: TMenuItem;
    USer1: TMenuItem;
    Gauge1: TMenuItem;
    Record1: TMenuItem;
    View1: TMenuItem;
    Records1: TMenuItem;
    Analysis1: TMenuItem;
    Close1: TMenuItem;
    Help1: TMenuItem;
    ContactSupport1: TMenuItem;
    About1: TMenuItem;
    pnlMain: TPanel;
    btnSave: TButton;
    btnLoad: TButton;
    cbbUsers: TComboBox;
    btnAddUser: TButton;
    btnAddRow: TButton;
    btnClearAll: TButton;
    grpGrid: TGroupBox;
    grpInput: TGroupBox;
    str1: TStringGrid;
    grpGaugeInfo: TGroupBox;
    grpRecord: TGroupBox;
    grpDateTime: TGroupBox;
    pnlBase: TPanel;
    cbbGauges: TComboBox;
    btnNewGauge: TButton;
    lbledtMaxCap: TLabeledEdit;
    dtpDate: TDateTimePicker;
    dtpTime: TDateTimePicker;
    lbledtWeather: TLabeledEdit;
    chkUser: TCheckBox;
    chkEmptied: TCheckBox;
    lbledtReading: TLabeledEdit;
    btnAdd: TButton;
    btnClear: TButton;
    Refresh1: TMenuItem;
    GaugeList1: TMenuItem;
    btnRefresh: TButton;
    btnGetMax: TButton;
    Apply: TButton;
    btnSetDateTimeNow: TButton;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    Userlist1: TMenuItem;
    btnClose: TButton;
    pgcMain: TPageControl;
    tsMain: TTabSheet;
    tsGraph: TTabSheet;
    grpGraph: TGroupBox;
    chtMain: TChart;
    csRainfall: TAreaSeries;
    grpDo: TGroupBox;
    btnDo: TButton;
    pnlGraph: TPanel;
    redSum: TRichEdit;
    btnSum: TButton;
    Records2: TMenuItem;
    Summary1: TMenuItem;
    Graph1: TMenuItem;
    Summary2: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure btnNewGaugeClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnGetMaxClick(Sender: TObject);
    procedure ApplyClick(Sender: TObject);
    procedure btnSetDateTimeNowClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnAddRowClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnClearAllClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
    procedure GaugeList1Click(Sender: TObject);
    procedure Userlist1Click(Sender: TObject);
    procedure CurrentGauge1Click(Sender: TObject);
    procedure CurrentUser1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cbbUsersChange(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure PrintGrid(sGrid: TStringGrid; sTitle: string);
    procedure Save1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure btnDoClick(Sender: TObject);
    procedure btnSumClick(Sender: TObject);
    procedure Record1Click(Sender: TObject);
    procedure USer1Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure Editing1Click(Sender: TObject);
    procedure AllRecords1Click(Sender: TObject);
    procedure Records1Click(Sender: TObject);
    procedure Analysis1Click(Sender: TObject);
    procedure Row1Click(Sender: TObject);
    procedure Gauge1Click(Sender: TObject);
    procedure cbbGaugesChange(Sender: TObject);
    procedure Records2Click(Sender: TObject);
    procedure Graph1Click(Sender: TObject);
    procedure Summary1Click(Sender: TObject);
    procedure ContactSupport1Click(Sender: TObject);
    procedure Summary2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      sLine, sName, sMaxCap, sMaxCapMain, sDate, sTime, sUser, sReading,
      sGauge, sWeather, sUsername, sDUser, sDGauge : String;
      txtFile : TextFile;
      iCount, iRow, iCol, iMaxCapMain, iReading, iCount1 : Integer;
      bStatus, bApplied, bGetMax : Boolean;
      rCap, rReading : Real;
      Date : TDate;
      rRainfall : Real;
      iRainfall : Integer;
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Unit1;

{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
begin
  frmAbout.Show;
end;

procedure TfrmMain.AllRecords1Click(Sender: TObject);
begin
  str1.RowCount := 1;
  with str1 do
    begin
      Cells[0, 0] := 'User';
      Cells[1, 0] := 'Gauge Name';
      Cells[2, 0] := 'Date';
      Cells[3, 0] := 'Time';
      Cells[4, 0] := 'Reading(mm)';
      Cells[5, 0] := 'Weather';
      Cells[6, 0] := 'Empty Status';
      Cells[7, 0] := 'Gauge Max (mm)';
      Cells[8, 0] := '% Capacity';
    end;
end;

procedure TfrmMain.Analysis1Click(Sender: TObject);
begin
  tsGraph.Show;
end;

procedure TfrmMain.ApplyClick(Sender: TObject);
begin
  sDate := DateToStr(dtpDate.Date);
  sTime := TimeToStr(dtpTime.Time);
  MessageDlg('Date/Time Applied', mtInformation, [mbOK], 0);
  bApplied := True;
end;

procedure TfrmMain.btnAddClick(Sender: TObject);
var
  iValue : Integer;
begin
  sGauge := cbbGauges.Text;
  sWeather := lbledtWeather.Text;
  rReading := StrToFloat(lbledtReading.Text);
  bStatus := chkEmptied.Checked;
  iMaxCapMain := StrToInt(sMaxCapMain);
  Date := dtpDate.Date;

  if  not (Ord(UpperCase(FloatToStr(rReading))) IN [65..90]) and
  (bApplied = True) and (Length(lbledtWeather.Text) > 0) and
  (Length(lbledtReading.Text) > 0) and (bGetMax = True) then
    begin
      if chkUser.Checked = True then
        begin
          sUser := cbbUsers.Text;
        end
      else
        begin
          sUser := InputBox('Add Temporary User', 'Add Name', '');
        end;
      Inc(iRow);
      rCap := ((rReading / iMaxCapMain) * 100);
      str1.Cells[0, iRow] := sUser;
      str1.Cells[1, iRow] := sGauge;
      str1.Cells[2, iRow] := sDate;
      str1.Cells[3, iRow] := sTime;
      str1.Cells[4, iRow] := FloatToStrF(rReading, ffNumber, 10, 2);
      str1.Cells[5, iRow] := UpperCase(sWeather);
      str1.Cells[7, iRow] := sMaxCapMain;
      str1.Cells[8, iRow] := FloatToStrF(rCap, ffNumber, 10, 2) + '%';

      if bStatus = True then
        begin
          str1.Cells[6, iRow] := 'YES';
        end
      else
        begin
          str1.Cells[6, iRow] := 'NO';
        end;

      statMain.Panels[1].Text := 'Last Record: ' + sDate;
      statMain.Panels[3].Text := 'Unsaved';
      lbledtWeather.Clear;
      lbledtReading.Clear;
      str1.RowCount := str1.RowCount + 1;
      MessageDlg('Successfully Added Record' + #13 +
      DateToStr(Now) + #9 + TimeToStr(Now), mtInformation, [mbOK], 0);
    end
  else
    begin
      iValue := MessageDlg('Please populate all data fields', mtError,
      [mbRetry, mbCancel], 0);
      if iValue = mrRetry then
        begin
          lbledtReading.SetFocus;
        end
      else
        begin
          Exit;
        end;
    end;
end;

procedure TfrmMain.btnAddRowClick(Sender: TObject);
begin
  str1.RowCount:= str1.RowCount + 1;
end;

procedure TfrmMain.btnAddUserClick(Sender: TObject);
var
  sTextLine : String;
  txtFile4 : TextFile;
  iPos, iButton : Integer;
begin
  sUsername := InputBox('Add New', 'Enter Name:', '');

  if FileExists('Users.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile4, 'Users.txt');
      Reset(txtFile4);
    end;

  while not Eof(txtFile4) do
    begin
      Readln(txtFile4, sTextLine);
      if sTextLine = sUsername then
        begin
           iButton := MessageDlg('User already exists' + #13 +
          'Add new anyway?', mtWarning, [mbYes, mbNo], 0);
        end;
    end;
  CloseFile(txtFile4);

  AssignFile(txtFile4, 'Users.txt');
  Append(txtFile4);



  if iButton = mrYes then
    begin
      Inc(iCount);
      sUsername := sUsername + '(' + IntToStr(iCount1) + ')';
      Writeln(txtFile4, sUsername);
    end
  else
    begin
      sUsername := sUsername;
      Writeln(txtFile4, sUsername);
    end;
  CloseFile(txtFile4);
  MessageDlg('Sucessfully added new user' + #13 + '"' + sUsername + '"',
  mtInformation, [mbOK], 0);
end;

procedure TfrmMain.btnClearAllClick(Sender: TObject);
begin
  str1.RowCount := 1;
  with str1 do
    begin
      Cells[0, 0] := 'User';
      Cells[1, 0] := 'Gauge Name';
      Cells[2, 0] := 'Date';
      Cells[3, 0] := 'Time';
      Cells[4, 0] := 'Reading(mm)';
      Cells[5, 0] := 'Weather';
      Cells[6, 0] := 'Empty Status';
      Cells[7, 0] := 'Gauge Max (mm)';
      Cells[8, 0] := '% Capacity';
    end;
end;

procedure TfrmMain.btnClearClick(Sender: TObject);
begin
  lbledtWeather.Clear;
  lbledtReading.Clear;
  lbledtReading.SetFocus;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
var
  sStatus : String;
  iMessage : Integer;
  SD : TSaveDialog;
  i : Integer;
  CSV : TStrings;
  FileName : string;
begin
  sStatus := statMain.Panels[3].Text;
  if (sStatus = 'Saved') or (sStatus = '') then
    begin
      frmMain.Close;
    end
  else
  if (sStatus = 'Unsaved') then
    begin
      iMessage := MessageDlg('Unsaved Changes' + #13 +
      'Would you like to save changes?', mtWarning, [mbYes, mbNo, mbCancel], 0);
      if iMessage = mrYes then
        begin
          SD := TSaveDialog.Create(Self);
          SD.Filter := 'CSV separator separated(*.csv)|*.CSV';
          if SD.Execute = True then
            begin
              FileName := SD.FileName;
              if Copy(FileName, Pos('.', FileName), Length(FileName) -
              Pos('.', FileName) + 1) <> '.csv' then
                FileName := FileName + '.csv';
                Screen.Cursor := crHourGlass;
                CSV := TStringList.Create;
              try
                for i := 0 to str1.RowCount - 1 do
                  begin
                    CSV.Add(str1.Rows[i].CommaText);
                  end;
                CSV.SaveToFile(FileName);
              finally
                CSV.Free;
                Screen.Cursor := crDefault;
                MessageDlg('Sucessfully saved records' + #13 + FileName,
                 mtInformation, [mbOK], 0);
              end;
            end;
          frmMain.Close;
        end
      else
      if iMessage = mrNo then
        begin
          frmMain.Close;
        end;
    end;
end;

procedure TfrmMain.btnDoClick(Sender: TObject);
var
  i : Integer;
begin
  iCount := 1;
  for i := 1 to (str1.RowCount - 1) do
    begin
      csRainfall.AddXY(StrToDate(str1.Cells[2, iCount]),
      StrToFloat(str1.Cells[4, iCount]));
      iCount := iCount + 1;
    end;

end;

procedure TfrmMain.btnGetMaxClick(Sender: TObject);
var
  sTextFile, sName1, sName2, sVol : string;
  iPos1 : Integer;
  txtFile1 : TextFile;
begin
  // Get Max Capacity from a specific gauge in list
  sName1 := cbbGauges.Text;
  bGetMax := True;
  if FileExists('Gauges.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile1, 'Gauges.txt');
      Reset(txtFile1);
    end;

  while not Eof(txtFile1) do
    begin
      Readln(txtFile1, sTextFile);
      iPos1 := Pos('$', sTextFile);
      sName2 := Copy(sTextFile, 1, iPos1 - 1);
      Delete(sTextFile, 1, iPos1);
      if sName1 = sName2 then
        begin
          sMaxCapMain := sTextFile;
        end;
    end;
  CloseFile(txtFile1);
  lbledtMaxCap.Text := sMaxCapMain;
end;

procedure TfrmMain.btnLoadClick(Sender: TObject);
var
  i, iValue : Cardinal;
  CSV : TStrings;
  FileName : string;
  OD : TOpenDialog;
  sDateEnd : string;
begin
  str1.RowCount := 2;
  str1.FixedRows := 1;

  OD := TOpenDialog.Create(Self);
  OD.Filter := 'CSV separator separated(*.csv)|*.CSV';
  CSV := TStringList.Create;

  if OD.Execute = True then
    begin
      FileName := OD.FileName;
      try
        CSV.LoadFromFile(FileName);
        str1.RowCount := CSV.Count;
        for i := 1 to CSV.Count do
          begin
            str1.Rows[i - 1].CommaText := CSV[i - 1];
          end;
      finally
        CSV.Free;
        MessageDlg('Successfully Imported Records' + #13 + FileName,
        mtInformation, [mbOK], 0);
      end;
    end;
  iRow := str1.RowCount - 1;
  iValue := str1.RowCount;
  statMain.Panels[2].Text := FileName;
  statMain.Panels[3].Text := 'Saved';
  sDateEnd := (str1.Cells[2, iValue - 1]);
  statMain.Panels[1].Text := 'Last Record: ' + sDateEnd;
end;

procedure TfrmMain.btnNewGaugeClick(Sender: TObject);
var
  iButton, i, iPos : Integer;
  sNameText, sWrite, sSpecial : String;
begin
  // Add a new gauge
  sName := InputBox('Add New', 'Gauge Name:', '');
  sMaxCap := InputBox('Add New', 'Max Capacity (mm): ', '');
  sWrite := sName + '$' + sMaxCap;
  sSpecial := sName + '(' + IntToStr(iCount) + ')' + '$' + sMaxCap;
    for i := 1 to Length(sMaxCap) do
      begin
        if not (Ord(sMaxCap[i]) IN [48..57]) then
          begin
            MessageDlg('Max Capacity can only contain numerical values' + #13 +
            'Error Code: ' + 'illchar_01', mtError, [mbOK], 0);
            sMaxCap := '';
            Exit;
          end
      end;

  if FileExists('Gauges.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile, 'Gauges.txt');
      Reset(txtFile);
    end;

  while not Eof(txtFile) do
    begin
      Readln(txtFile, sLine);
      iPos := Pos('$', sLine);
      sNameText := Copy(sLine, 1, iPos - 1);
      if sNameText = sName then
        begin
          iButton := MessageDlg('Gauge already exists' + #13 +
          'Add new anyway?', mtWarning, [mbYes, mbNo], 0);
        end;
    end;
  CloseFile(txtFile);

  AssignFile(txtFile, 'Gauges.txt');
  Append(txtFile);
  if iButton = mrYes then
    begin
      Inc(iCount);
      Writeln(txtFile, sSpecial);
    end
  else
    begin
      Writeln(txtFile, sWrite);
    end;
  CloseFile(txtFile);
  MessageDlg('Successfully added Gauge' + #13 +
  '"Refresh" to update Gauge List', mtInformation, [mbOK], 0);
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  sString, sGaugeName, sMaxCap1 : string;
  iPos : Integer;
  txtFile3 : TextFile;
begin
 // Add/Update Gauges in Gauge List
  if FileExists('Gauges.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile3, 'Gauges.txt');
      Reset(txtFile3);
    end;

  while not Eof(txtFile3) do
    begin
      Readln(txtFile3, sString);
      iPos := Pos('$', sString);
      sGaugeName := Copy(sString, 1, iPos - 1);
      Delete(sString, 1, iPos + 1);

      sMaxCap1 := sString;
      cbbGauges.Items.Add(sGaugeName);
    end;
  CloseFile(txtFile3);
  MessageDlg('Refresh Success' + #13 +
  '"Get Max" to get the max capacity after selecting a gauge', mtInformation,
  [mbOK], 0);

end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
var
  SD : TSaveDialog;
  i : Integer;
  CSV : TStrings;
  FileName : string;
begin
  // Save to CSV
  SD := TSaveDialog.Create(Self);
  SD.Filter := 'CSV separator separated(*.csv)|*.CSV';
  if SD.Execute = True then
    begin
      FileName := SD.FileName;
      if Copy(FileName, Pos('.', FileName), Length(FileName) - Pos('.', FileName)
      + 1) <> '.csv' then
        FileName := FileName + '.csv';
        Screen.Cursor := crHourGlass;
        CSV := TStringList.Create;
      try
        for i := 0 to str1.RowCount - 1 do
          begin
            CSV.Add(str1.Rows[i].CommaText);
          end;
        CSV.SaveToFile(FileName);
      finally
        CSV.Free;
        Screen.Cursor := crDefault;
        MessageDlg('Sucessfully saved records' + #13 + FileName, mtInformation,
        [mbOK], 0);
      end;
    end;
  statMain.Panels[2].Text := FileName;
  statMain.Panels[3].Text := 'Saved';
end;

procedure TfrmMain.btnSetDateTimeNowClick(Sender: TObject);
begin
  dtpDate.Date := Now;
  dtpTime.Time := Now;
end;

procedure TfrmMain.btnSumClick(Sender: TObject);
var
  rAverage, rTotal : Real;
  i, iDB, iValue : Integer;
  DateFrom, DateEnd : TDate;
begin
  redSum.Paragraph.TabCount := 3;
  redSum.Paragraph.Tab[0] := 40;
  redSum.Paragraph.Tab[1] := 80;
  redSum.Paragraph.Tab[2] := 120;
  iCount := 1;
  for i := 1 to (str1.RowCount - 1) do
    begin
      rTotal := rTotal + StrToFloat(str1.Cells[4, iCount]);
      iCount := iCount + 1;
    end;
  rAverage := rTotal / (str1.RowCount - 1);
  iValue := str1.RowCount;
  DateFrom := StrToDate(str1.Cells[2, 1]);
  DateEnd := StrToDate(str1.Cells[2, iValue - 1]);
  iDB := DaysBetween(DateEnd, DateFrom);
  redSum.Lines.Add('Rainfall Summary - ' +
  '(' + DateToStr(DateFrom) + ' - ' + DateToStr(DateEnd) + ')');
  redSum.Lines.Add('Total:' + #9 + 'Average:' + #9 + 'Data Period:');
  redSum.Lines.Add(FloatToStrF(rTotal, ffNumber, 10, 2) + 'mm' + #9 +
  FloatToStrF(rAverage, ffNumber, 10, 2) + 'mm' + #9 + IntToStr(iDB) + ' days' + #13);
end;

procedure TfrmMain.cbbGaugesChange(Sender: TObject);
begin
  btnGetMax.Enabled := True;
end;

procedure TfrmMain.cbbUsersChange(Sender: TObject);
begin
  statMain.Panels[0].Text := cbbUsers.Text;
end;

procedure TfrmMain.Close1Click(Sender: TObject);
var
  sStatus : String;
  iMessage : Integer;
  SD : TSaveDialog;
  i : Integer;
  CSV : TStrings;
  FileName : string;
begin
  sStatus := statMain.Panels[3].Text;
  if (sStatus = 'Saved') or (sStatus = '') then
    begin
      frmMain.Close;
    end
  else
  if (sStatus = 'Unsaved') then
    begin
      iMessage := MessageDlg('Unsaved Changes' + #13 +
      'Would you like to save changes?', mtWarning, [mbYes, mbNo, mbCancel], 0);
      if iMessage = mrYes then
        begin
          SD := TSaveDialog.Create(Self);
          SD.Filter := 'CSV separator separated(*.csv)|*.CSV';
          if SD.Execute = True then
            begin
              FileName := SD.FileName;
              if Copy(FileName, Pos('.', FileName), Length(FileName) -
              Pos('.', FileName) + 1) <> '.csv' then
                FileName := FileName + '.csv';
                Screen.Cursor := crHourGlass;
                CSV := TStringList.Create;
              try
                for i := 0 to str1.RowCount - 1 do
                  begin
                    CSV.Add(str1.Rows[i].CommaText);
                  end;
                CSV.SaveToFile(FileName);
              finally
                CSV.Free;
                Screen.Cursor := crDefault;
                MessageDlg('Sucessfully saved records' + #13 + FileName,
                 mtInformation, [mbOK], 0);
              end;
            end;
          frmMain.Close;
        end
      else
      if iMessage = mrNo then
        begin
          frmMain.Close;
        end;
    end;
end;

procedure TfrmMain.ContactSupport1Click(Sender: TObject);
begin
  MessageDlg('Email: cbell@jeppeboys.co.za' + #13 + 'Call: 0662021724',
  mtInformation, [mbOK], 0);
end;

procedure TfrmMain.CurrentGauge1Click(Sender: TObject);
begin
  sDGauge := cbbGauges.Text;
  MessageDlg('Set Current Gauge as Default', mtInformation, [mbOK], 0);
end;

procedure TfrmMain.CurrentUser1Click(Sender: TObject);
begin
  sDUser := cbbUsers.Text;
  MessageDlg('Set Current User as Default', mtInformation, [mbOK], 0);
end;

procedure TfrmMain.Editing1Click(Sender: TObject);
begin
  lbledtWeather.Clear;
  lbledtReading.Clear;
  lbledtReading.SetFocus;
end;

procedure TfrmMain.FormActivate(Sender: TObject);
var
  sString, sGaugeName, sMaxCap1, sTLine : string;
  iPos : Integer;
  txtFile2, txtFile6 : TextFile;
begin
  bGetMax := False;
  bApplied := False;
  dtpDate.Date := Now;
  dtpTime.Time := Now;
  cbbUsers.Text := 'User';
  cbbGauges.Text := 'Gauge';
  iRow := 0;
  iCol := 0;
  str1.RowCount := 1;
  str1.FixedRows := 0;
  iCount1 := 1;
  with str1 do
    begin
      Cells[0, 0] := 'User';
      Cells[1, 0] := 'Gauge Name';
      Cells[2, 0] := 'Date';
      Cells[3, 0] := 'Time';
      Cells[4, 0] := 'Reading(mm)';
      Cells[5, 0] := 'Weather';
      Cells[6, 0] := 'Empty Status';
      Cells[7, 0] := 'Gauge Max (mm)';
      Cells[8, 0] := '% Capacity';
    end;
  iCount := 1;
   // Add/Update Gauges in Gauge List
  if FileExists('Gauges.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile2, 'Gauges.txt');
      Reset(txtFile2);
    end;

  while not Eof(txtFile2) do
    begin
      Readln(txtFile2, sString);
      iPos := Pos('$', sString);
      sGaugeName := Copy(sString, 1, iPos - 1);
      Delete(sString, 1, iPos + 1);

      sMaxCap1 := sString;
      cbbGauges.Items.Add(sGaugeName);
    end;
  CloseFile(txtFile2);
  AssignFile(txtFile6, 'Users.txt');
  Reset(txtFile6);

  while not Eof(txtFile6) do
    begin
      Readln(txtFile6, sTLine);
      cbbUsers.Items.Add(sTLine);
    end;
  CloseFile(txtFile6);

end;

procedure TfrmMain.Gauge1Click(Sender: TObject);
var
  iButton, i, iPos : Integer;
  sNameText, sWrite, sSpecial : String;
begin
// Add a new gauge
  sName := InputBox('Add New', 'Gauge Name:', '');
  sMaxCap := InputBox('Add New', 'Max Capacity (mm): ', '');
  sWrite := sName + '$' + sMaxCap;
  sSpecial := sName + '(' + IntToStr(iCount) + ')' + '$' + sMaxCap;
    for i := 1 to Length(sMaxCap) do
      begin
        if not (Ord(sMaxCap[i]) IN [48..57]) then
          begin
            MessageDlg('Max Capacity can only contain numerical values' + #13 +
            'Error Code: ' + 'illchar_01', mtError, [mbOK], 0);
            sMaxCap := '';
            Exit;
          end
      end;

  if FileExists('Gauges.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile, 'Gauges.txt');
      Reset(txtFile);
    end;

  while not Eof(txtFile) do
    begin
      Readln(txtFile, sLine);
      iPos := Pos('$', sLine);
      sNameText := Copy(sLine, 1, iPos - 1);
      if sNameText = sName then
        begin
          iButton := MessageDlg('Gauge already exists' + #13 +
          'Add new anyway?', mtWarning, [mbYes, mbNo], 0);
        end;
    end;
  CloseFile(txtFile);

  AssignFile(txtFile, 'Gauges.txt');
  Append(txtFile);
  if iButton = mrYes then
    begin
      Inc(iCount);
      Writeln(txtFile, sSpecial);
    end
  else
    begin
      Writeln(txtFile, sWrite);
    end;
  CloseFile(txtFile);
  MessageDlg('Successfully added Gauge' + #13 +
  '"Refresh" to update Gauge List', mtInformation, [mbOK], 0);
end;

procedure TfrmMain.GaugeList1Click(Sender: TObject);
var
  sString, sGaugeName, sMaxCap1 : string;
  iPos : Integer;
  txtFile3 : TextFile;
begin
  // Add/Update Gauges in Gauge List
  if FileExists('Gauges.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile3, 'Gauges.txt');
      Reset(txtFile3);
    end;

  while not Eof(txtFile3) do
    begin
      Readln(txtFile3, sString);
      iPos := Pos('$', sString);
      sGaugeName := Copy(sString, 1, iPos - 1);
      Delete(sString, 1, iPos + 1);

      sMaxCap1 := sString;
      cbbGauges.Items.Add(sGaugeName);
    end;
  CloseFile(txtFile3);
  MessageDlg('Refresh Success' + #13 +
  '"Get Max" to get the max capacity after selecting a gauge', mtInformation,
  [mbOK], 0);

end;

procedure TfrmMain.Graph1Click(Sender: TObject);
begin
  with TPrintDialog.Create(nil) do
    begin
      try
        if Execute then
          chtMain.Print;
      finally
        Free;
      end;
    end;
    MessageDlg('Sent To Printer' + #13 + 'Summary: ' + DateToStr(Now),
    mtInformation, [mbOK], 0);
end;

procedure TfrmMain.Open1Click(Sender: TObject);
var
  i : Cardinal;
  CSV : TStrings;
  FileName : string;
  OD : TOpenDialog;
begin
 str1.RowCount := 2;
  str1.FixedRows := 1;

  OD := TOpenDialog.Create(Self);
  OD.Filter := 'CSV separator separated(*.csv)|*.CSV';
  CSV := TStringList.Create;

  if OD.Execute = True then
    begin
      FileName := OD.FileName;
      try
        CSV.LoadFromFile(FileName);
        str1.RowCount := CSV.Count;
        for i := 1 to CSV.Count do
          begin
            str1.Rows[i - 1].CommaText := CSV[i - 1];
          end;
      finally
        CSV.Free;
        MessageDlg('Successfully Imported Records' + #13 + FileName,
        mtInformation, [mbOK], 0);
      end;
    end;
  iRow := str1.RowCount - 1;
  statMain.Panels[2].Text := FileName;
  statMain.Panels[3].Text := 'Saved';
end;

procedure TfrmMain.PrintGrid(sGrid: TStringGrid; sTitle: string);
var
  iX1, iX2, iY1, iY2, iTmp, f: Integer;
  TR: TRect;
  sHeader : String;
begin
  sHeader := statMain.Panels[2].Text + '  ' + DateToStr(Now) + '  ' +
  TimeToStr(Now) + '  ' + cbbUsers.Text;
  Printer.Title := sHeader;
  Printer.BeginDoc;
  Printer.Canvas.Pen.Color  := 0;
  Printer.Canvas.Font.Name  := 'Tahoma';
  Printer.Canvas.Font.Size  := 8;
  Printer.Canvas.TextOut(5, 100, Printer.Title);
  for f := 1 to str1.ColCount - 1 do
  begin
    iX1 := 0;
    for iTmp := 1 to (f - 1) do
      iX1 := iX1 + 5 * (str1.ColWidths[iTmp]);
    iY1 := 300;
    iX2 := 0;
    for iTmp := 1 to f do
      iX2 := iX2 + 5 * (str1.ColWidths[iTmp]);
    iY2 := 450;
    TR := Rect(iX1, iY1, iX2 - 30, iY2);
    Printer.Canvas.Font.Style := [fsBold];
    Printer.Canvas.Font.Size := 8;
    Printer.Canvas.TextRect(TR, iX1 + 50, 350, str1.Cells[f, 0]);
    Printer.Canvas.Font.Style := [];
    for iTmp := 1 to str1.RowCount - 1 do
    begin
      iY1 := 150 * iTmp + 300;
      iY2 := 150 * (iTmp + 1) + 300;
      TR := Rect(iX1, iY1, iX2 - 30, iY2);
      Printer.Canvas.TextRect(TR, iX1 + 50, iY1 + 50, str1.Cells[f, iTmp]);
    end;
  end;
  Printer.EndDoc;
end;

procedure TfrmMain.Record1Click(Sender: TObject);
var
  iValue : Integer;
begin
 sGauge := cbbGauges.Text;
  sWeather := lbledtWeather.Text;
  rReading := StrToFloat(lbledtReading.Text);
  bStatus := chkEmptied.Checked;
  iMaxCapMain := StrToInt(sMaxCapMain);
  Date := dtpDate.Date;

  if  not (Ord(UpperCase(FloatToStr(rReading))) IN [65..90]) and
  (bApplied = True) and (Length(lbledtWeather.Text) > 0) and
  (Length(lbledtReading.Text) > 0) and (bGetMax = True) then
    begin
      if chkUser.Checked = True then
        begin
          sUser := cbbUsers.Text;
        end
      else
        begin
          sUser := InputBox('Add Temporary User', 'Add Name', '');
        end;
      Inc(iRow);
      rCap := ((rReading / iMaxCapMain) * 100);
      str1.Cells[0, iRow] := sUser;
      str1.Cells[1, iRow] := sGauge;
      str1.Cells[2, iRow] := sDate;
      str1.Cells[3, iRow] := sTime;
      str1.Cells[4, iRow] := FloatToStrF(rReading, ffNumber, 10, 2);
      str1.Cells[5, iRow] := UpperCase(sWeather);
      str1.Cells[7, iRow] := sMaxCapMain;
      str1.Cells[8, iRow] := FloatToStrF(rCap, ffNumber, 10, 2) + '%';

      if bStatus = True then
        begin
          str1.Cells[6, iRow] := 'YES';
        end
      else
        begin
          str1.Cells[6, iRow] := 'NO';
        end;

      statMain.Panels[1].Text := 'Last Record: ' + sDate;
      statMain.Panels[3].Text := 'Unsaved';
      lbledtWeather.Clear;
      lbledtReading.Clear;
      str1.RowCount := str1.RowCount + 1;
      MessageDlg('Successfully Added Record' + #13 +
      DateToStr(Now) + #9 + TimeToStr(Now), mtInformation, [mbOK], 0);
    end
  else
    begin
      iValue := MessageDlg('Please populate all data fields', mtError,
      [mbRetry, mbCancel], 0);
      if iValue = mrRetry then
        begin
          lbledtReading.SetFocus;
        end
      else
        begin
          Exit;
        end;
    end;
end;

procedure TfrmMain.Records1Click(Sender: TObject);
begin
  tsMain.Show;
end;

procedure TfrmMain.Records2Click(Sender: TObject);
begin
  PrintGrid(str1, 'Print Records');
  MessageDlg('Sent to Printer', mtInformation, [mbOK], 0);
end;

procedure TfrmMain.Row1Click(Sender: TObject);
begin
  str1.RowCount:= str1.RowCount + 1;
end;

procedure TfrmMain.Save1Click(Sender: TObject);
var
  SD : TSaveDialog;
  i : Integer;
  CSV : TStrings;
  FileName : string;
begin
    // Save to CSV
  SD := TSaveDialog.Create(Self);
  SD.Filter := 'CSV separator separated(*.csv)|*.CSV';
  if SD.Execute = True then
    begin
      FileName := SD.FileName;
      if Copy(FileName, Pos('.', FileName), Length(FileName) - Pos('.', FileName)
      + 1) <> '.csv' then
        FileName := FileName + '.csv';
        Screen.Cursor := crHourGlass;
        CSV := TStringList.Create;
      try
        for i := 0 to str1.RowCount - 1 do
          begin
            CSV.Add(str1.Rows[i].CommaText);
          end;
        CSV.SaveToFile(FileName);
      finally
        CSV.Free;
        Screen.Cursor := crDefault;
        MessageDlg('Sucessfully saved records' + #13 + FileName, mtInformation,
        [mbOK], 0);
      end;
    end;
  statMain.Panels[2].Text := FileName;
  statMain.Panels[3].Text := 'Saved';
end;

procedure TfrmMain.Summary1Click(Sender: TObject);
var
  pixX, pixY : Integer;
begin
  with redSum do
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
      Print('Summary');
    end;
end;

procedure TfrmMain.Summary2Click(Sender: TObject);
begin
  redSum.Clear;
end;

procedure TfrmMain.USer1Click(Sender: TObject);
var
  sTextLine : String;
  txtFile4 : TextFile;
  iPos, iButton : Integer;
begin
 sUsername := InputBox('Add New', 'Enter Name:', '');

  if FileExists('Users.txt') <> True then
    begin
      MessageDlg('Error: Cannot Add New Gauge' + #13 + 'Erorr Code: '
      + 'listntfnd_01', mtError, [mbOK], 0);
    end
  else
    begin
      AssignFile(txtFile4, 'Users.txt');
      Reset(txtFile4);
    end;

  while not Eof(txtFile4) do
    begin
      Readln(txtFile4, sTextLine);
      if sTextLine = sUsername then
        begin
           iButton := MessageDlg('User already exists' + #13 +
          'Add new anyway?', mtWarning, [mbYes, mbNo], 0);
        end;
    end;
  CloseFile(txtFile4);

  AssignFile(txtFile4, 'Users.txt');
  Append(txtFile4);



  if iButton = mrYes then
    begin
      Inc(iCount);
      sUsername := sUsername + '(' + IntToStr(iCount1) + ')';
      Writeln(txtFile4, sUsername);
    end
  else
    begin
      sUsername := sUsername;
      Writeln(txtFile4, sUsername);
    end;
  CloseFile(txtFile4);
  MessageDlg('Sucessfully added new user' + #13 + '"' + sUsername + '"',
  mtInformation, [mbOK], 0);
end;

procedure TfrmMain.Userlist1Click(Sender: TObject);
var
  sTLine, sUsername1 : String;
  txtFile6 : TextFile;
begin
  AssignFile(txtFile6, 'Users.txt');
  Reset(txtFile6);

  while not Eof(txtFile6) do
    begin
      Readln(txtFile6, sTLine);
      cbbUsers.Items.Add(sTLine);
    end;
  CloseFile(txtFile6);
  MessageDlg('Successfully updated user list', mtInformation, [mbOK], 0);
end;

end.
