unit MAIN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, Grids, Printers, Spin, TeEngine,
  Series, TeeProcs, Chart, DateUtils, ImgList, ToolWin, pngimage, Gauges,
  VclTee.TeeGDIPlus, System.ImageList;

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
    btnAddUser: TButton;
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
    btnSetDateTimeNow: TButton;
    dlgSave1: TSaveDialog;
    dlgOpen1: TOpenDialog;
    Userlist1: TMenuItem;
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
    ToolBar1: TToolBar;
    tlbSave: TToolButton;
    tlbOpen: TToolButton;
    cbbUsers: TComboBox;
    CoolBar1: TCoolBar;
    ToolButton3: TToolButton;
    tlbRefresh: TToolButton;
    ToolButton5: TToolButton;
    tlbAdd: TToolButton;
    tlbClear: TToolButton;
    ToolButton8: TToolButton;
    tlbPrint: TToolButton;
    tlbAddRow: TToolButton;
    tlbClearGrid: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    GroupBox1: TGroupBox;
    redNotes: TRichEdit;
    tlbGraph: TToolButton;
    tlbSummary: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Gauge3: TGauge;
    tlbClearSummary: TToolButton;
    ilSecond: TImageList;
    Graph2: TMenuItem;
    pgcGraph: TPageControl;
    tsDaily: TTabSheet;
    tsMonthly: TTabSheet;
    tsAnnual: TTabSheet;
    chtMonth: TChart;
    chtAnnual: TChart;
    bsMonth: TBarSeries;
    bsYear: TBarSeries;
    lsYear: TLineSeries;
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
    procedure Graph1Click(Sender: TObject);
    procedure Summary1Click(Sender: TObject);
    procedure ContactSupport1Click(Sender: TObject);
    procedure Summary2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tlbRefreshClick(Sender: TObject);
    procedure tlbAddClick(Sender: TObject);
    procedure tlbClearClick(Sender: TObject);
    procedure tlbPrintClick(Sender: TObject);
    procedure tlbAddRowClick(Sender: TObject);
    procedure tlbClearGridClick(Sender: TObject);
    procedure ToolButton16Click(Sender: TObject);
    procedure dtpDateChange(Sender: TObject);
    procedure dtpTimeChange(Sender: TObject);
    procedure pgcMainChange(Sender: TObject);
    procedure lbledtReadingChange(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure tlbSummaryClick(Sender: TObject);
    procedure tlbClearSummaryClick(Sender: TObject);
    procedure Graph2Click(Sender: TObject);
    procedure tlbOpenClick(Sender: TObject);
    procedure tlbSaveClick(Sender: TObject);
    procedure tlbGraphClick(Sender: TObject);
    procedure Records2Click(Sender: TObject);
  private
    { Private declarations }
  procedure GetMaxCap;
  procedure DefaultUser;
  public
    { Public declarations }

  end;

var
  frmMain: TfrmMain;
  sLine, sName, sMaxCap, sMaxCapMain, sDate, sTime, sUser, sReading,
  sGauge, sWeather, sUsername, sDUser, sDGauge : String;
  txtFile : TextFile;
  iCount, iRow, iCol, iMaxCapMain, iReading, iCount1 : Integer;
  bStatus, bApplied, bGetMax, bOk, bOpen : Boolean;
  rCap, rReading : Real;
  Date : TDate;
  rRainfall : Real;
  iRainfall, iRowCount, iCount2 : Integer;
  arrMonths : array[1..12] of Real;
  arrYears : array[2022..2027] of Real;
  rMainYear : Real;


implementation

uses
  ABOUT, ABOUTNEW;

{$R *.dfm}

procedure TfrmMain.About1Click(Sender: TObject);
begin
  frmMainAbout.Show;
end;

procedure TfrmMain.AllRecords1Click(Sender: TObject);
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
      iCount2 := 1;
      statMain.Panels[1].Text := '';
      statMain.Panels[2].Text := '';
      statMain.Panels[3].Text := '';
      for I := 0 to str1.ColCount - 1 do
        str1.Cols[I].Clear;

      str1.RowCount := 1;
      str1.FixedRows := 0;
      iRow := 0;
      with str1 do
        begin
          Cells[0, 0] := '#';
          Cells[1, 0] := 'User';
          Cells[2, 0] := 'Gauge Name';
          Cells[3, 0] := 'Date';
          Cells[4, 0] := 'Time';
          Cells[5, 0] := 'Reading(mm)';
          Cells[6, 0] := 'Weather';
          Cells[7, 0] := 'Empty Status';
          Cells[8, 0] := 'Gauge Max (mm)';
          Cells[9, 0] := '% Capacity';
          Cells[10, 0] := 'Notes';
        end;
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
          iCount2 := 1;
          statMain.Panels[1].Text := '';
          statMain.Panels[2].Text := '';
          statMain.Panels[3].Text := '';
          for I := 0 to str1.ColCount - 1 do
            str1.Cols[I].Clear;

          str1.RowCount := 1;
          str1.FixedRows := 0;
          iRow := 0;
          with str1 do
            begin
              Cells[0, 0] := '#';
              Cells[1, 0] := 'User';
              Cells[2, 0] := 'Gauge Name';
              Cells[3, 0] := 'Date';
              Cells[4, 0] := 'Time';
              Cells[5, 0] := 'Reading(mm)';
              Cells[6, 0] := 'Weather';
              Cells[7, 0] := 'Empty Status';
              Cells[8, 0] := 'Gauge Max (mm)';
              Cells[9, 0] := '% Capacity';
              Cells[10, 0] := 'Notes';
            end;
        end
      else
      if iMessage = mrNo then
        begin
          iCount2 := 1;
          statMain.Panels[1].Text := '';
          statMain.Panels[2].Text := '';
          statMain.Panels[3].Text := '';
          for I := 0 to str1.ColCount - 1 do
            str1.Cols[I].Clear;

          str1.RowCount := 1;
          str1.FixedRows := 0;
          iRow := 0;
          with str1 do
            begin
              Cells[0, 0] := '#';
              Cells[1, 0] := 'User';
              Cells[2, 0] := 'Gauge Name';
              Cells[3, 0] := 'Date';
              Cells[4, 0] := 'Time';
              Cells[5, 0] := 'Reading(mm)';
              Cells[6, 0] := 'Weather';
              Cells[7, 0] := 'Empty Status';
              Cells[8, 0] := 'Gauge Max (mm)';
              Cells[9, 0] := '% Capacity';
              Cells[10, 0] := 'Notes';
            end;
        end;
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
  I : Integer;
begin
  bOk := True;
  if bOpen = True then
    begin
      iCount2 := str1.RowCount;
    end
  else
  if bOpen = False then
    begin
      iCount2 := str1.RowCount;
    end;
  sDate := DateToStr(dtpDate.Date);
  sTime := TimeToStr(dtpTime.Time);
  bApplied := True;
  sGauge := cbbGauges.Text;
  sWeather := lbledtWeather.Text;
  rReading := StrToFloat(lbledtReading.Text);
  bStatus := chkEmptied.Checked;
  iMaxCapMain := StrToInt(sMaxCapMain);
  Date := dtpDate.Date;
  for I := 1 to Length(lbledtReading.Text) do
    begin
      if UpCase(lbledtReading.Text[I]) IN ['A'..'Z'] then
        begin
          bOk := False;
        end
      else
        begin
          bOk := True;
        end;
    end;
  if (bOk = True) and (Length(lbledtWeather.Text) >= 1) and
  (lbledtReading.GetTextLen >= 1) and (bGetMax = True) then
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
      str1.Cells[0, iRow] := IntToStr(iCount2);
      str1.Cells[1, iRow] := sUser;
      str1.Cells[2, iRow] := sGauge;
      str1.Cells[3, iRow] := sDate;
      str1.Cells[4, iRow] := sTime;
      str1.Cells[5, iRow] := FloatToStrF(rReading, ffNumber, 10, 2);
      str1.Cells[6, iRow] := UpperCase(sWeather);
      str1.Cells[8, iRow] := sMaxCapMain;
      str1.Cells[9, iRow] := FloatToStrF(rCap, ffNumber, 10, 2) + '%';
      str1.Cells[10, iRow] := redNotes.Lines.Text;
      Inc(iCount2);
      if bStatus = True then
        begin
          str1.Cells[7, iRow] := 'YES';
        end
      else
        begin
          str1.Cells[7, iRow] := 'NO';
        end;

      statMain.Panels[1].Text := 'Last Record: ' + sDate;
      statMain.Panels[3].Text := 'Unsaved';
      lbledtWeather.Clear;
      lbledtReading.Clear;
      str1.RowCount := str1.RowCount + 1;
      MessageDlg('Successfully Added Record' + #13 +
      DateToStr(dtpDate.Date) + '  ' +
      TimeToStr(dtpTime.Time), mtInformation, [mbOK], 0);
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
 if Length(sUsername) > 0 then
  begin
    if FileExists('Users.txt') <> True then
      begin
        MessageDlg('Error: Cannot Add New User' + #13 + 'Erorr Code: '
        + 'listntfnd_02', mtError, [mbOK], 0);
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
  end
 else
  begin
    MessageDlg('Error: Please enter a suitable username' + #13 + 'Erorr Code: '
    + 'usererr_01', mtError, [mbOK], 0);
  end;


end;

procedure TfrmMain.btnClearAllClick(Sender: TObject);
var
  I : Integer;
begin
  for I := 0 to str1.ColCount - 1 do
    str1.Cols[I].Clear;

  str1.RowCount := 2;
  str1.FixedRows := 1;
  iRow := 0;
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
  i, k, j : Integer;
  iCount : Integer;
  sDate : String;
  iPos : Integer;
  sLine : String;
  Date : TDate;
  iCount2 : Integer;
  iVal : Integer;
  Year, Month, Day : Word;
  sDate2 : string;
  sValue, sTotal, sMonth, sYear : string;
begin
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  csRainfall.Clear;
  bsYear.Clear;
  lsYear.Clear;
  bsMonth.Clear;
  iCount := 1;
  iCount2 := 1;
  iVal := 1;
  for i := 1 to (str1.RowCount - 1) do
    begin
      csRainfall.AddXY(StrToDate(str1.Cells[3, iCount]),
      StrToFloat(str1.Cells[5, iCount]));
      iCount := iCount + 1;
    end;

      for k := 1 to str1.RowCount - 1 do
        begin
          Date := StrToDate(str1.Cells[3, k]);
          DecodeDate(Date, Year, Month, Day);
          // redSum.Lines.Add(IntToStr(Month));

          sDate2 := str1.Cells[3, k];
          sValue := str1.Cells[5, k];
          sTotal := sDate2 + '/' + sValue;
          iPos := Pos('/', sTotal);
          sYear := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);
          iPos := Pos('/', sTotal);
          sMonth := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);

          case Year of
            2022 : begin
              arrYears[2022] := arrYears[2022] + StrToFloat(str1.Cells[5, k]);
            end;
             2023 : begin
              arrYears[2023] := arrYears[2023] + StrToFloat(str1.Cells[5, k]);
            end;
             2024 : begin
              arrYears[2024] := arrYears[2024] + StrToFloat(str1.Cells[5, k]);
            end;
             2025 : begin
              arrYears[2025] := arrYears[2025] + StrToFloat(str1.Cells[5, k]);
            end;
             2026 : begin
              arrYears[2026] := arrYears[2026] + StrToFloat(str1.Cells[5, k]);
            end;
             2027 : begin
              arrYears[2027] := arrYears[2027] + StrToFloat(str1.Cells[5, k]);
            end;
          end;



          case Month of
           1: begin
            iVal := 1;
            arrMonths[1] := arrMonths[1] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           2: begin
            iVal := 2;
            arrMonths[2] := arrMonths[2] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           3 : begin
            iVal := 3;
            arrMonths[3] := arrMonths[3] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[3]));
           end;
           4 : begin
            iVal := 4;
            arrMonths[4] := arrMonths[4] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           5 : begin
            iVal := 5;
            arrMonths[5] := arrMonths[5] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           6 : begin
            iVal := 6;
            arrMonths[6] := arrMonths[6] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           7 : begin
            iVal := 7;
            arrMonths[7] := arrMonths[7] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           8 : begin
            iVal := 8;
            arrMonths[8] := arrMonths[8] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           9 : begin
            iVal := 9;
            arrMonths[9] := arrMonths[9] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           10 : begin
            iVal := 10;
            arrMonths[10] := arrMonths[10] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           11 : begin
            iVal := 11;
            arrMonths[11] := arrMonths[11] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           12 : begin
            iVal := 12;
            arrMonths[12] := arrMonths[12] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
          end;
        end;

    with bsMonth do
      begin
        AddXY(1, arrMonths[1]);
        AddXY(2, arrMonths[2]);
        AddXY(3, arrMonths[3]);
        AddXY(4, arrMonths[4]);
        AddXY(5, arrMonths[5]);
        AddXY(6, arrMonths[6]);
        AddXY(7, arrMonths[7]);
        AddXY(8, arrMonths[8]);
        AddXY(9, arrMonths[9]);
        AddXY(10, arrMonths[10]);
        AddXY(11, arrMonths[11]);
        AddXY(12, arrMonths[12]);
      end;
     with bsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
     with lsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
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

  if (Length(sName) > 0) and (Length(sMaxCap) > 0) then
    begin
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
    end
  else
    begin
      MessageDlg('Error: Please enter proper value/s' + #13 + 'Erorr Code: '
      + 'usererr_02', mtError, [mbOK], 0);
    end;

end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  sString, sGaugeName, sMaxCap1 : string;
  iPos : Integer;
  txtFile3 : TextFile;
begin
 // Add/Update Gauges in Gauge List
  cbbGauges.Clear;
  cbbGauges.Text := 'Gauge';
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
  redSum.Paragraph.Tab[0] := 80;
  redSum.Paragraph.Tab[1] := 120;
  redSum.Paragraph.Tab[2] := 240;
  redSum.Lines.Clear;
  iCount := 1;
  for i := 1 to (str1.RowCount - 1) do
    begin
      rTotal := rTotal + StrToFloat(str1.Cells[5, iCount]);
      iCount := iCount + 1;
    end;

  rAverage := rTotal / (str1.RowCount - 1);
  iValue := str1.RowCount;
  DateFrom := StrToDate(str1.Cells[3, 1]);
  DateEnd := StrToDate(str1.Cells[3, iValue - 1]);
  iDB := DaysBetween(DateEnd, DateFrom);
  redSum.Lines.Add('Rainfall Summary - ' +
  '(' + DateToStr(DateFrom) + ' - ' + DateToStr(DateEnd) + ')');
  redSum.Lines.Add('Total:' + #9 + 'Average:' + #9 + 'Data Period:');
  redSum.Lines.Add(FloatToStrF(rTotal, ffNumber, 10, 2) + 'mm' + #9 +
  FloatToStrF(rAverage, ffNumber, 10, 2) + 'mm' + #9 + IntToStr(iDB) + ' day/s' + #13);
  // Monthly Total Summary
  with redSum do
    begin
      Lines.Add(#13 + 'Monthly Totals: ');
      Lines.Add('(Monthly Totals accumulate all years)');
      Lines.Add('January: ' + FloatToStrF(arrMonths[1], ffNumber, 10, 2) + ' mm');
      Lines.Add('February: ' + FloatToStrF(arrMonths[2], ffNumber, 10, 2) + ' mm');
      Lines.Add('March: ' + FloatToStrF(arrMonths[3], ffNumber, 10, 2) + ' mm');
      Lines.Add('April: ' + FloatToStrF(arrMonths[4], ffNumber, 10, 2) + ' mm');
      Lines.Add('May: ' + FloatToStrF(arrMonths[5], ffNumber, 10, 2) + ' mm');
      Lines.Add('June: ' + FloatToStrF(arrMonths[6], ffNumber, 10, 2) + ' mm');
      Lines.Add('July: ' + FloatToStrF(arrMonths[7], ffNumber, 10, 2) + ' mm');
      Lines.Add('August: ' + FloatToStrF(arrMonths[8], ffNumber, 10, 2) + ' mm');
      Lines.Add('September: ' + FloatToStrF(arrMonths[9], ffNumber, 10, 2) + ' mm');
      Lines.Add('October: ' + FloatToStrF(arrMonths[10], ffNumber, 10, 2) + ' mm');
      Lines.Add('November: ' + FloatToStrF(arrMonths[11], ffNumber, 10, 2) + ' mm');
      Lines.Add('December: ' + FloatToStrF(arrMonths[12], ffNumber, 10, 2) + ' mm');
      Lines.Add(#13 + 'Annual Totals: ');
      Lines.Add('2022: ' + FloatToStrF(arrYears[2022], ffNumber, 10, 2) + 'mm');
      Lines.Add('2023: ' + FloatToStrF(arrYears[2023], ffNumber, 10, 2) + 'mm');
      Lines.Add('2024: ' + FloatToStrF(arrYears[2024], ffNumber, 10, 2) + 'mm');
      Lines.Add('2025: ' + FloatToStrF(arrYears[2025], ffNumber, 10, 2) + 'mm');
      Lines.Add('2026: ' + FloatToStrF(arrYears[2026], ffNumber, 10, 2) + 'mm');
      Lines.Add('2027: ' + FloatToStrF(arrYears[2027], ffNumber, 10, 2) + 'mm');
    end;
end;

procedure TfrmMain.cbbGaugesChange(Sender: TObject);
begin
  GetMaxCap;
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
  MessageDlg('Email: cbell@jeppeboys.co.za' + #13 + 'Phone: 0662021724',
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

procedure TfrmMain.DefaultUser;
begin
  frmMain.cbbUsers.Text := cbbGauges.Text;
end;

procedure TfrmMain.dtpDateChange(Sender: TObject);
begin
  sDate := DateToStr(dtpDate.Date);
end;

procedure TfrmMain.dtpTimeChange(Sender: TObject);
begin
  sTime := TimeToStr(dtpTime.Time);
  bApplied := True;
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
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  bOpen := False;
  cbbUsers.Clear;
  cbbGauges.Clear;
  dtpDate.DateFormat := dfShort;
  iCount2 := 1;
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
  str1.ColWidths[10] := 200;
  str1.ColWidths[0] := 20;
  with str1 do
    begin
      Cells[0, 0] := '#';
      Cells[1, 0] := 'User';
      Cells[2, 0] := 'Gauge Name';
      Cells[3, 0] := 'Date';
      Cells[4, 0] := 'Time';
      Cells[5, 0] := 'Reading(mm)';
      Cells[6, 0] := 'Weather';
      Cells[7, 0] := 'Empty Status';
      Cells[8, 0] := 'Gauge Max (mm)';
      Cells[9, 0] := '% Capacity';
      Cells[10, 0] := 'Notes';
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
  if cbbGauges.Items.Count > 1  then
    begin
      cbbGauges.Text := cbbGauges.Items[0];
      GetMaxCap;
    end
  else
    begin
      cbbGauges.Text := 'Gauges';
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
   if frmMain.WindowState = wsMaximized then
    begin

    end;

    if cbbUsers.Items.Count > 1 then
      begin
        cbbUsers.Text := cbbUsers.Items[0];
        statMain.Panels[0].Text := cbbUsers.Items[0];
      end
    else
      begin
        cbbUsers.Text := 'Users';
      end;
  tlbGraph.Enabled := False;
  tlbSummary.Enabled := False;
  tlbClearSummary.Enabled := False;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  sString, sGaugeName, sMaxCap1, sTLine : string;
  iPos : Integer;
  txtFile2, txtFile6 : TextFile;
begin
  // frmMain.Hide;
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

procedure TfrmMain.FormShow(Sender: TObject);
begin
  str1.RowCount := iRowCount;
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
  cbbGauges.Clear;
  cbbGauges.Text := 'Gauges';
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

procedure TfrmMain.GetMaxCap;
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

procedure TfrmMain.Graph1Click(Sender: TObject);
begin
  with TPrintDialog.Create(nil) do
    begin
      try
        if Execute then
          chtMain.Print;
          chtAnnual.Print;
          chtMonth.Print;
      finally
        Free;
      end;
    end;
end;

procedure TfrmMain.Graph2Click(Sender: TObject);
begin
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  redSum.Clear;
  redSum.Lines.Clear;
  csRainfall.Clear;
  bsMonth.Clear;
  lsYear.Clear;
  bsYear.Clear;
end;

procedure TfrmMain.lbledtReadingChange(Sender: TObject);
var
  iGauge : Integer;
begin
   if Length(lbledtReading.Text) >= 1 then
    begin
      iGauge := Round(StrToInt(lbledtReading.Text) /  StrToInt(lbledtMaxCap.Text) * 100);
      Gauge3.Progress := iGauge;
    end
  else
    begin
      Gauge3.Progress := 0;
    end;
end;

procedure TfrmMain.Open1Click(Sender: TObject);
var
  i : Cardinal;
  CSV : TStrings;
  FileName : string;
  OD : TOpenDialog;
  K: Integer;
  J : Integer;
  iCount9, iCount6 : Integer;
  rAverage, rTotal : Real;
  L, iDB, iValue : Integer;
  DateFrom, DateEnd : TDate;
  Year, Month, Day : Word;
  sValue, sTotal, sYear, sDate2, sMonth : string;
  iPos, iVal : Integer;
begin
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  bOpen := True;
  bsYear.Clear;
  lsYear.Clear;
  OD := TOpenDialog.Create(Self);
  OD.Filter := 'CSV separator separated(*.csv)|*.CSV';
  CSV := TStringList.Create;
  iCount2 := str1.RowCount - 1;
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
  statMain.Panels[1].Text := 'Last Record: ' + str1.Cells[3, str1.RowCount - 1];
  iCount6 := 1;
  for J := 1 to (str1.RowCount - 1) do
    begin
      csRainfall.AddXY(StrToDate(str1.Cells[3, iCount6]),
      StrToFloat(str1.Cells[5, iCount6]));
      iCount6 := iCount6 + 1;
    end;
  redSum.Paragraph.TabCount := 3;
  redSum.Paragraph.Tab[0] := 40;
  redSum.Paragraph.Tab[1] := 80;
  redSum.Paragraph.Tab[2] := 120;
  iCount9 := 1;
  for L := 1 to (str1.RowCount - 1) do
    begin
      rTotal := rTotal + StrToFloat(str1.Cells[5, iCount9]);
      iCount9 := iCount9 + 1;
    end;
  rAverage := rTotal / (str1.RowCount - 1);
  iValue := str1.RowCount;
  DateFrom := StrToDate(str1.Cells[3, 1]);
  DateEnd := StrToDate(str1.Cells[3, iValue - 1]);
  iDB := DaysBetween(DateEnd, DateFrom);
  redSum.Lines.Add('Rainfall Summary - ' +
  '(' + DateToStr(DateFrom) + ' - ' + DateToStr(DateEnd) + ')');
  redSum.Lines.Add('Total:' + #9 + 'Average:' + #9 + 'Data Period:');
  redSum.Lines.Add(FloatToStrF(rTotal, ffNumber, 10, 2) + 'mm' + #9 +
  FloatToStrF(rAverage, ffNumber, 10, 2) + 'mm' + #9 + IntToStr(iDB) + ' day/s' + #13);
  for k := 1 to str1.RowCount - 1 do
        begin
          Date := StrToDate(str1.Cells[3, k]);
          DecodeDate(Date, Year, Month, Day);
          sDate2 := str1.Cells[3, k];
          sValue := str1.Cells[5, k];
          sTotal := sDate2 + '/' + sValue;
          iPos := Pos('/', sTotal);
          sYear := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);
          iPos := Pos('/', sTotal);
          sMonth := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);
          case Year of
            2022 : begin
              arrYears[2022] := arrYears[2022] + StrToFloat(str1.Cells[5, k]);
            end;
             2023 : begin
              arrYears[2023] := arrYears[2023] + StrToFloat(str1.Cells[5, k]);
            end;
             2024 : begin
              arrYears[2024] := arrYears[2024] + StrToFloat(str1.Cells[5, k]);
            end;
             2025 : begin
              arrYears[2025] := arrYears[2025] + StrToFloat(str1.Cells[5, k]);
            end;
             2026 : begin
              arrYears[2026] := arrYears[2026] + StrToFloat(str1.Cells[5, k]);
            end;
             2027 : begin
              arrYears[2027] := arrYears[2027] + StrToFloat(str1.Cells[5, k]);
            end;
          end;
          case Month of
           1: begin
            arrMonths[1] := arrMonths[1] + StrToFloat(str1.Cells[5, k]);
           end;
           2: begin
            arrMonths[2] := arrMonths[2] + StrToFloat(str1.Cells[5, k]);
           end;
           3 : begin
            arrMonths[3] := arrMonths[3] + StrToFloat(str1.Cells[5, k]);
           end;
           4 : begin
            arrMonths[4] := arrMonths[4] + StrToFloat(str1.Cells[5, k]);
           end;
           5 : begin
            arrMonths[5] := arrMonths[5] + StrToFloat(str1.Cells[5, k]);
           end;
           6 : begin
            arrMonths[6] := arrMonths[6] + StrToFloat(str1.Cells[5, k]);
           end;
           7 : begin
            arrMonths[7] := arrMonths[7] + StrToFloat(str1.Cells[5, k]);
           end;
           8 : begin
            arrMonths[8] := arrMonths[8] + StrToFloat(str1.Cells[5, k]);
           end;
           9 : begin
            arrMonths[9] := arrMonths[9] + StrToFloat(str1.Cells[5, k]);
           end;
           10 : begin
            arrMonths[10] := arrMonths[10] + StrToFloat(str1.Cells[5, k]);
           end;
           11 : begin
            arrMonths[11] := arrMonths[11] + StrToFloat(str1.Cells[5, k]);
           end;
           12 : begin
            arrMonths[12] := arrMonths[12] + StrToFloat(str1.Cells[5, k]);
           end;
          end;
        end;
    with bsMonth do
      begin
        AddXY(1, arrMonths[1]);
        AddXY(2, arrMonths[2]);
        AddXY(3, arrMonths[3]);
        AddXY(4, arrMonths[4]);
        AddXY(5, arrMonths[5]);
        AddXY(6, arrMonths[6]);
        AddXY(7, arrMonths[7]);
        AddXY(8, arrMonths[8]);
        AddXY(9, arrMonths[9]);
        AddXY(10, arrMonths[10]);
        AddXY(11, arrMonths[11]);
        AddXY(12, arrMonths[12]);
      end;
  with redSum do
    begin
       Lines.Add(#13 + 'Monthly Totals: ');
      Lines.Add('(Monthly Totals accumulate all years)');
      Lines.Add('January: ' + FloatToStrF(arrMonths[1], ffNumber, 10, 2) + ' mm');
      Lines.Add('February: ' + FloatToStrF(arrMonths[2], ffNumber, 10, 2) + ' mm');
      Lines.Add('March: ' + FloatToStrF(arrMonths[3], ffNumber, 10, 2) + ' mm');
      Lines.Add('April: ' + FloatToStrF(arrMonths[4], ffNumber, 10, 2) + ' mm');
      Lines.Add('May: ' + FloatToStrF(arrMonths[5], ffNumber, 10, 2) + ' mm');
      Lines.Add('June: ' + FloatToStrF(arrMonths[6], ffNumber, 10, 2) + ' mm');
      Lines.Add('July: ' + FloatToStrF(arrMonths[7], ffNumber, 10, 2) + ' mm');
      Lines.Add('August: ' + FloatToStrF(arrMonths[8], ffNumber, 10, 2) + ' mm');
      Lines.Add('September: ' + FloatToStrF(arrMonths[9], ffNumber, 10, 2) + ' mm');
      Lines.Add('October: ' + FloatToStrF(arrMonths[10], ffNumber, 10, 2) + ' mm');
      Lines.Add('November: ' + FloatToStrF(arrMonths[11], ffNumber, 10, 2) + ' mm');
      Lines.Add('December: ' + FloatToStrF(arrMonths[12], ffNumber, 10, 2) + ' mm');
      Lines.Add(#13 + 'Annual Totals: ');
      Lines.Add('2022: ' + FloatToStrF(arrYears[2022], ffNumber, 10, 2) + 'mm');
      Lines.Add('2023: ' + FloatToStrF(arrYears[2023], ffNumber, 10, 2) + 'mm');
      Lines.Add('2024: ' + FloatToStrF(arrYears[2024], ffNumber, 10, 2) + 'mm');
      Lines.Add('2025: ' + FloatToStrF(arrYears[2025], ffNumber, 10, 2) + 'mm');
      Lines.Add('2026: ' + FloatToStrF(arrYears[2026], ffNumber, 10, 2) + 'mm');
      Lines.Add('2027: ' + FloatToStrF(arrYears[2027], ffNumber, 10, 2) + 'mm');
    end;
    with bsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
     with lsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
end;

procedure TfrmMain.pgcMainChange(Sender: TObject);
begin
   if tsGraph.Visible = True then
    begin
      tlbAddRow.Enabled := False;
      tlbClearGrid.Enabled := False;
      tlbSave.Enabled := False;
      tlbOpen.Enabled := False;
      tlbRefresh.Enabled := False;
      tlbClear.Enabled := False;
      tlbAdd.Enabled := False;
      tlbGraph.Enabled := True;
      tlbSummary.Enabled := True;
      tlbClearSummary.Enabled := True;
    end
   else
  if tsMain.Visible = True then
    begin
      tlbAddRow.Enabled := True;
      tlbClearGrid.Enabled := True;
      tlbSave.Enabled := True;
      tlbOpen.Enabled := True;
      tlbRefresh.Enabled := True;
      tlbClear.Enabled := True;
      tlbAdd.Enabled := True;
      tlbGraph.Enabled := False;
      tlbSummary.Enabled := False;
      tlbClearSummary.Enabled := False;
    end;
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
  I : Integer;
begin
  bOk := True;
  if bOpen = True then
    begin
      iCount2 := str1.RowCount;
    end
  else
  if bOpen = False then
    begin
      iCount2 := str1.RowCount;
    end;
  sDate := DateToStr(dtpDate.Date);
  sTime := TimeToStr(dtpTime.Time);
  bApplied := True;
  sGauge := cbbGauges.Text;
  sWeather := lbledtWeather.Text;
  rReading := StrToFloat(lbledtReading.Text);
  bStatus := chkEmptied.Checked;
  iMaxCapMain := StrToInt(sMaxCapMain);
  Date := dtpDate.Date;
  for I := 1 to Length(lbledtReading.Text) do
    begin
      if UpCase(lbledtReading.Text[I]) IN ['A'..'Z'] then
        begin
          bOk := False;
        end
      else
        begin
          bOk := True;
        end;
    end;
  if (bOk = True) and (Length(lbledtWeather.Text) >= 1) and
  (lbledtReading.GetTextLen >= 1) and (bGetMax = True) then
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
      str1.Cells[0, iRow] := IntToStr(iCount2);
      str1.Cells[1, iRow] := sUser;
      str1.Cells[2, iRow] := sGauge;
      str1.Cells[3, iRow] := sDate;
      str1.Cells[4, iRow] := sTime;
      str1.Cells[5, iRow] := FloatToStrF(rReading, ffNumber, 10, 2);
      str1.Cells[6, iRow] := UpperCase(sWeather);
      str1.Cells[8, iRow] := sMaxCapMain;
      str1.Cells[9, iRow] := FloatToStrF(rCap, ffNumber, 10, 2) + '%';
      str1.Cells[10, iRow] := redNotes.Lines.Text;
      Inc(iCount2);
      if bStatus = True then
        begin
          str1.Cells[7, iRow] := 'YES';
        end
      else
        begin
          str1.Cells[7, iRow] := 'NO';
        end;

      statMain.Panels[1].Text := 'Last Record: ' + sDate;
      statMain.Panels[3].Text := 'Unsaved';
      lbledtWeather.Clear;
      lbledtReading.Clear;
      str1.RowCount := str1.RowCount + 1;
      MessageDlg('Successfully Added Record' + #13 +
      DateToStr(dtpDate.Date) + '  ' +
      TimeToStr(dtpTime.Time), mtInformation, [mbOK], 0);
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
with TPrintDialog.Create(nil) do
    begin
      try
        if Execute then
          begin
            PrintGrid(str1, 'Print Records');
          end;
      finally
        Free;
      end;
    end;
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
  with TPrintDialog.Create(nil) do
    begin
      try
        if Execute then
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
      finally
        Free;
      end;
    end;
end;

procedure TfrmMain.Summary2Click(Sender: TObject);
begin
  redSum.Clear;
  redSum.Lines.Clear;
end;

procedure TfrmMain.tlbAddRowClick(Sender: TObject);
begin
  if bOpen = True then
    begin
      iCount2 := str1.RowCount;
      Inc(iRow);
      str1.RowCount:= str1.RowCount + 1;
      str1.Cells[0, iRow] := IntToStr(iCount2);
      Inc(iCount2);
    end
  else 
  if bOpen = False then
    begin
       Inc(iRow);
       str1.RowCount:= str1.RowCount + 1;
       str1.Cells[0, iRow] := IntToStr(iCount2);
       Inc(iCount2); 
    end;
 { Inc(iRow);
  str1.RowCount:= str1.RowCount + 1;
  str1.Cells[0, iRow] := IntToStr(iCount2);
  Inc(iCount2); }

end;

procedure TfrmMain.tlbClearGridClick(Sender: TObject);
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
      iCount2 := 1;
      statMain.Panels[1].Text := '';
      statMain.Panels[2].Text := '';
      statMain.Panels[3].Text := '';
      for I := 0 to str1.ColCount - 1 do
        str1.Cols[I].Clear;

      str1.RowCount := 1;
      str1.FixedRows := 0;
      iRow := 0;
      with str1 do
        begin
          Cells[0, 0] := '#';
          Cells[1, 0] := 'User';
          Cells[2, 0] := 'Gauge Name';
          Cells[3, 0] := 'Date';
          Cells[4, 0] := 'Time';
          Cells[5, 0] := 'Reading(mm)';
          Cells[6, 0] := 'Weather';
          Cells[7, 0] := 'Empty Status';
          Cells[8, 0] := 'Gauge Max (mm)';
          Cells[9, 0] := '% Capacity';
          Cells[10, 0] := 'Notes';
        end;
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
          iCount2 := 1;
          statMain.Panels[1].Text := '';
          statMain.Panels[2].Text := '';
          statMain.Panels[3].Text := '';
          for I := 0 to str1.ColCount - 1 do
            str1.Cols[I].Clear;

          str1.RowCount := 1;
          str1.FixedRows := 0;
          iRow := 0;
          with str1 do
            begin
              Cells[0, 0] := '#';
              Cells[1, 0] := 'User';
              Cells[2, 0] := 'Gauge Name';
              Cells[3, 0] := 'Date';
              Cells[4, 0] := 'Time';
              Cells[5, 0] := 'Reading(mm)';
              Cells[6, 0] := 'Weather';
              Cells[7, 0] := 'Empty Status';
              Cells[8, 0] := 'Gauge Max (mm)';
              Cells[9, 0] := '% Capacity';
              Cells[10, 0] := 'Notes';
            end;
        end
      else
      if iMessage = mrNo then
        begin
          iCount2 := 1;
          statMain.Panels[1].Text := '';
          statMain.Panels[2].Text := '';
          statMain.Panels[3].Text := '';
          for I := 0 to str1.ColCount - 1 do
            str1.Cols[I].Clear;

          str1.RowCount := 1;
          str1.FixedRows := 0;
          iRow := 0;
          with str1 do
            begin
              Cells[0, 0] := '#';
              Cells[1, 0] := 'User';
              Cells[2, 0] := 'Gauge Name';
              Cells[3, 0] := 'Date';
              Cells[4, 0] := 'Time';
              Cells[5, 0] := 'Reading(mm)';
              Cells[6, 0] := 'Weather';
              Cells[7, 0] := 'Empty Status';
              Cells[8, 0] := 'Gauge Max (mm)';
              Cells[9, 0] := '% Capacity';
              Cells[10, 0] := 'Notes';
            end;
        end;
    end;
end;

procedure TfrmMain.tlbClearSummaryClick(Sender: TObject);
begin
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  redSum.Clear;
  redSum.Lines.Clear;
  csRainfall.Clear;
  bsMonth.Clear;
  lsYear.Clear;
  bsYear.Clear;
end;

procedure TfrmMain.tlbGraphClick(Sender: TObject);
var
  i, k, j : Integer;
  iCount : Integer;
  sDate : String;
  iPos : Integer;
  sLine : String;
  Date : TDate;
  iCount2 : Integer;
  iVal : Integer;
  Year, Month, Day : Word;
  sDate2 : string;
  sValue, sTotal, sMonth, sYear : string;
begin
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  csRainfall.Clear;
  bsYear.Clear;
  lsYear.Clear;
  bsMonth.Clear;
  iCount := 1;
  iCount2 := 1;
  iVal := 1;
  for i := 1 to (str1.RowCount - 1) do
    begin
      csRainfall.AddXY(StrToDate(str1.Cells[3, iCount]),
      StrToFloat(str1.Cells[5, iCount]));
      iCount := iCount + 1;
    end;

      for k := 1 to str1.RowCount - 1 do
        begin
          Date := StrToDate(str1.Cells[3, k]);
          DecodeDate(Date, Year, Month, Day);
          // redSum.Lines.Add(IntToStr(Month));

          sDate2 := str1.Cells[3, k];
          sValue := str1.Cells[5, k];
          sTotal := sDate2 + '/' + sValue;
          iPos := Pos('/', sTotal);
          sYear := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);
          iPos := Pos('/', sTotal);
          sMonth := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);

          case Year of
            2022 : begin
              arrYears[2022] := arrYears[2022] + StrToFloat(str1.Cells[5, k]);
            end;
             2023 : begin
              arrYears[2023] := arrYears[2023] + StrToFloat(str1.Cells[5, k]);
            end;
             2024 : begin
              arrYears[2024] := arrYears[2024] + StrToFloat(str1.Cells[5, k]);
            end;
             2025 : begin
              arrYears[2025] := arrYears[2025] + StrToFloat(str1.Cells[5, k]);
            end;
             2026 : begin
              arrYears[2026] := arrYears[2026] + StrToFloat(str1.Cells[5, k]);
            end;
             2027 : begin
              arrYears[2027] := arrYears[2027] + StrToFloat(str1.Cells[5, k]);
            end;
          end;



          case Month of
           1: begin
            iVal := 1;
            arrMonths[1] := arrMonths[1] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           2: begin
            iVal := 2;
            arrMonths[2] := arrMonths[2] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           3 : begin
            iVal := 3;
            arrMonths[3] := arrMonths[3] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[3]));
           end;
           4 : begin
            iVal := 4;
            arrMonths[4] := arrMonths[4] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           5 : begin
            iVal := 5;
            arrMonths[5] := arrMonths[5] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           6 : begin
            iVal := 6;
            arrMonths[6] := arrMonths[6] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           7 : begin
            iVal := 7;
            arrMonths[7] := arrMonths[7] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           8 : begin
            iVal := 8;
            arrMonths[8] := arrMonths[8] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           9 : begin
            iVal := 9;
            arrMonths[9] := arrMonths[9] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           10 : begin
            iVal := 10;
            arrMonths[10] := arrMonths[10] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           11 : begin
            iVal := 11;
            arrMonths[11] := arrMonths[11] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
           12 : begin
            iVal := 12;
            arrMonths[12] := arrMonths[12] + StrToFloat(str1.Cells[5, k]);
            // redSum.Lines.Add(FloatToStr(arrMonths[4]));
           end;
          end;
        end;

    with bsMonth do
      begin
        AddXY(1, arrMonths[1]);
        AddXY(2, arrMonths[2]);
        AddXY(3, arrMonths[3]);
        AddXY(4, arrMonths[4]);
        AddXY(5, arrMonths[5]);
        AddXY(6, arrMonths[6]);
        AddXY(7, arrMonths[7]);
        AddXY(8, arrMonths[8]);
        AddXY(9, arrMonths[9]);
        AddXY(10, arrMonths[10]);
        AddXY(11, arrMonths[11]);
        AddXY(12, arrMonths[12]);
      end;
     with bsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
     with lsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
end;

procedure TfrmMain.tlbOpenClick(Sender: TObject);
var
  i : Cardinal;
  CSV : TStrings;
  FileName : string;
  OD : TOpenDialog;
  K: Integer;
  J : Integer;
  iCount9, iCount6 : Integer;
  rAverage, rTotal : Real;
  L, iDB, iValue : Integer;
  DateFrom, DateEnd : TDate;
  Year, Month, Day : Word;
  sValue, sTotal, sYear, sDate2, sMonth : string;
  iPos, iVal : Integer;
begin
  arrMonths[1] := 0;
  arrMonths[2] := 0;
  arrMonths[3] := 0;
  arrMonths[4] := 0;
  arrMonths[5] := 0;
  arrMonths[6] := 0;
  arrMonths[7] := 0;
  arrMonths[8] := 0;
  arrMonths[9] := 0;
  arrMonths[10] := 0;
  arrMonths[11] := 0;
  arrMonths[12] := 0;
  arrYears[2022] := 0;
  arrYears[2023] := 0;
  arrYears[2024] := 0;
  arrYears[2025] := 0;
  arrYears[2026] := 0;
  arrYears[2027] := 0;
  bOpen := True;
  bsYear.Clear;
  lsYear.Clear;
  OD := TOpenDialog.Create(Self);
  OD.Filter := 'CSV separator separated(*.csv)|*.CSV';
  CSV := TStringList.Create;
  iCount2 := str1.RowCount - 1;
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
  statMain.Panels[1].Text := 'Last Record: ' + str1.Cells[3, str1.RowCount - 1];
  iCount6 := 1;
  for J := 1 to (str1.RowCount - 1) do
    begin
      csRainfall.AddXY(StrToDate(str1.Cells[3, iCount6]),
      StrToFloat(str1.Cells[5, iCount6]));
      iCount6 := iCount6 + 1;
    end;
  redSum.Paragraph.TabCount := 3;
  redSum.Paragraph.Tab[0] := 40;
  redSum.Paragraph.Tab[1] := 80;
  redSum.Paragraph.Tab[2] := 120;
  iCount9 := 1;
  for L := 1 to (str1.RowCount - 1) do
    begin
      rTotal := rTotal + StrToFloat(str1.Cells[5, iCount9]);
      iCount9 := iCount9 + 1;
    end;
  rAverage := rTotal / (str1.RowCount - 1);
  iValue := str1.RowCount;
  DateFrom := StrToDate(str1.Cells[3, 1]);
  DateEnd := StrToDate(str1.Cells[3, iValue - 1]);
  iDB := DaysBetween(DateEnd, DateFrom);
  redSum.Lines.Add('Rainfall Summary - ' +
  '(' + DateToStr(DateFrom) + ' - ' + DateToStr(DateEnd) + ')');
  redSum.Lines.Add('Total:' + #9 + 'Average:' + #9 + 'Data Period:');
  redSum.Lines.Add(FloatToStrF(rTotal, ffNumber, 10, 2) + 'mm' + #9 +
  FloatToStrF(rAverage, ffNumber, 10, 2) + 'mm' + #9 + IntToStr(iDB) + ' day/s' + #13);
  for k := 1 to str1.RowCount - 1 do
        begin
          Date := StrToDate(str1.Cells[3, k]);
          DecodeDate(Date, Year, Month, Day);
          sDate2 := str1.Cells[3, k];
          sValue := str1.Cells[5, k];
          sTotal := sDate2 + '/' + sValue;
          iPos := Pos('/', sTotal);
          sYear := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);
          iPos := Pos('/', sTotal);
          sMonth := Copy(sTotal, 1, iPos - 1);
          Delete(sTotal, 1, iPos);
          case Year of
            2022 : begin
              arrYears[2022] := arrYears[2022] + StrToFloat(str1.Cells[5, k]);
            end;
             2023 : begin
              arrYears[2023] := arrYears[2023] + StrToFloat(str1.Cells[5, k]);
            end;
             2024 : begin
              arrYears[2024] := arrYears[2024] + StrToFloat(str1.Cells[5, k]);
            end;
             2025 : begin
              arrYears[2025] := arrYears[2025] + StrToFloat(str1.Cells[5, k]);
            end;
             2026 : begin
              arrYears[2026] := arrYears[2026] + StrToFloat(str1.Cells[5, k]);
            end;
             2027 : begin
              arrYears[2027] := arrYears[2027] + StrToFloat(str1.Cells[5, k]);
            end;
          end;
          case Month of
           1: begin
            arrMonths[1] := arrMonths[1] + StrToFloat(str1.Cells[5, k]);
           end;
           2: begin
            arrMonths[2] := arrMonths[2] + StrToFloat(str1.Cells[5, k]);
           end;
           3 : begin
            arrMonths[3] := arrMonths[3] + StrToFloat(str1.Cells[5, k]);
           end;
           4 : begin
            arrMonths[4] := arrMonths[4] + StrToFloat(str1.Cells[5, k]);
           end;
           5 : begin
            arrMonths[5] := arrMonths[5] + StrToFloat(str1.Cells[5, k]);
           end;
           6 : begin
            arrMonths[6] := arrMonths[6] + StrToFloat(str1.Cells[5, k]);
           end;
           7 : begin
            arrMonths[7] := arrMonths[7] + StrToFloat(str1.Cells[5, k]);
           end;
           8 : begin
            arrMonths[8] := arrMonths[8] + StrToFloat(str1.Cells[5, k]);
           end;
           9 : begin
            arrMonths[9] := arrMonths[9] + StrToFloat(str1.Cells[5, k]);
           end;
           10 : begin
            arrMonths[10] := arrMonths[10] + StrToFloat(str1.Cells[5, k]);
           end;
           11 : begin
            arrMonths[11] := arrMonths[11] + StrToFloat(str1.Cells[5, k]);
           end;
           12 : begin
            arrMonths[12] := arrMonths[12] + StrToFloat(str1.Cells[5, k]);
           end;
          end;
        end;
    with bsMonth do
      begin
        AddXY(1, arrMonths[1]);
        AddXY(2, arrMonths[2]);
        AddXY(3, arrMonths[3]);
        AddXY(4, arrMonths[4]);
        AddXY(5, arrMonths[5]);
        AddXY(6, arrMonths[6]);
        AddXY(7, arrMonths[7]);
        AddXY(8, arrMonths[8]);
        AddXY(9, arrMonths[9]);
        AddXY(10, arrMonths[10]);
        AddXY(11, arrMonths[11]);
        AddXY(12, arrMonths[12]);
      end;
  with redSum do
    begin
       Lines.Add(#13 + 'Monthly Totals: ');
      Lines.Add('(Monthly Totals accumulate all years)');
      Lines.Add('January: ' + FloatToStrF(arrMonths[1], ffNumber, 10, 2) + ' mm');
      Lines.Add('February: ' + FloatToStrF(arrMonths[2], ffNumber, 10, 2) + ' mm');
      Lines.Add('March: ' + FloatToStrF(arrMonths[3], ffNumber, 10, 2) + ' mm');
      Lines.Add('April: ' + FloatToStrF(arrMonths[4], ffNumber, 10, 2) + ' mm');
      Lines.Add('May: ' + FloatToStrF(arrMonths[5], ffNumber, 10, 2) + ' mm');
      Lines.Add('June: ' + FloatToStrF(arrMonths[6], ffNumber, 10, 2) + ' mm');
      Lines.Add('July: ' + FloatToStrF(arrMonths[7], ffNumber, 10, 2) + ' mm');
      Lines.Add('August: ' + FloatToStrF(arrMonths[8], ffNumber, 10, 2) + ' mm');
      Lines.Add('September: ' + FloatToStrF(arrMonths[9], ffNumber, 10, 2) + ' mm');
      Lines.Add('October: ' + FloatToStrF(arrMonths[10], ffNumber, 10, 2) + ' mm');
      Lines.Add('November: ' + FloatToStrF(arrMonths[11], ffNumber, 10, 2) + ' mm');
      Lines.Add('December: ' + FloatToStrF(arrMonths[12], ffNumber, 10, 2) + ' mm');
      Lines.Add(#13 + 'Annual Totals: ');
      Lines.Add('2022: ' + FloatToStrF(arrYears[2022], ffNumber, 10, 2) + 'mm');
      Lines.Add('2023: ' + FloatToStrF(arrYears[2023], ffNumber, 10, 2) + 'mm');
      Lines.Add('2024: ' + FloatToStrF(arrYears[2024], ffNumber, 10, 2) + 'mm');
      Lines.Add('2025: ' + FloatToStrF(arrYears[2025], ffNumber, 10, 2) + 'mm');
      Lines.Add('2026: ' + FloatToStrF(arrYears[2026], ffNumber, 10, 2) + 'mm');
      Lines.Add('2027: ' + FloatToStrF(arrYears[2027], ffNumber, 10, 2) + 'mm');
    end;
    with bsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
     with lsYear do
      begin
        AddXY(2022, arrYears[2022]);
        AddXY(2023, arrYears[2023]);
        AddXY(2024, arrYears[2024]);
        AddXY(2025, arrYears[2025]);
        AddXY(2026, arrYears[2026]);
        AddXY(2027, arrYears[2027]);
      end;
end;

procedure TfrmMain.ToolButton16Click(Sender: TObject);
  var
  sStatus : String;
  iMessage : Integer;
  SD : TSaveDialog;
  i : Integer;
  CSV : TStrings;
  FileName : string;
begin
  bOpen := True;
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

procedure TfrmMain.tlbRefreshClick(Sender: TObject);
var
  sString, sGaugeName, sMaxCap1 : string;
  iPos : Integer;
  txtFile3 : TextFile;
  sTLine, sUsername1 : String;
  txtFile6 : TextFile;
begin
 cbbUsers.Clear;
 cbbGauges.Clear;
 cbbUsers.Text := 'User';
 cbbGauges.Text := 'Gauge';
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
  AssignFile(txtFile6, 'Users.txt');
  Reset(txtFile6);
  while not Eof(txtFile6) do
    begin
      Readln(txtFile6, sTLine);
      cbbUsers.Items.Add(sTLine);
    end;
end;

procedure TfrmMain.tlbSaveClick(Sender: TObject);
var
  SD : TSaveDialog;
  i : Integer;
  CSV : TStrings;
  FileName : string;
begin
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

procedure TfrmMain.tlbSummaryClick(Sender: TObject);
var
  rAverage, rTotal : Real;
  i, iDB, iValue : Integer;
  DateFrom, DateEnd : TDate;
begin
  redSum.Paragraph.TabCount := 3;
  redSum.Paragraph.Tab[0] := 40;
  redSum.Paragraph.Tab[1] := 80;
  redSum.Paragraph.Tab[2] := 120;
  redSum.Lines.Clear;
  iCount := 1;
  for i := 1 to (str1.RowCount - 1) do
    begin
      rTotal := rTotal + StrToFloat(str1.Cells[5, iCount]);
      iCount := iCount + 1;
    end;
  rAverage := rTotal / (str1.RowCount - 1);
  iValue := str1.RowCount;
  DateFrom := StrToDate(str1.Cells[3, 1]);
  DateEnd := StrToDate(str1.Cells[3, iValue - 1]);
  iDB := DaysBetween(DateEnd, DateFrom);
  redSum.Lines.Add('Rainfall Summary - ' +
  '(' + DateToStr(DateFrom) + ' - ' + DateToStr(DateEnd) + ')');
  redSum.Lines.Add('Total:' + #9 + 'Average:' + #9 + 'Data Period:');
  redSum.Lines.Add(FloatToStrF(rTotal, ffNumber, 10, 2) + 'mm' + #9 +
  FloatToStrF(rAverage, ffNumber, 10, 2) + 'mm' + #9 + IntToStr(iDB) + ' day/s' + #13);
  with redSum do
    begin
        Lines.Add(#13 + 'Monthly Totals: ');
      Lines.Add('(Monthly Totals accumulate all years)');
      Lines.Add('January: ' + FloatToStrF(arrMonths[1], ffNumber, 10, 2) + ' mm');
      Lines.Add('February: ' + FloatToStrF(arrMonths[2], ffNumber, 10, 2) + ' mm');
      Lines.Add('March: ' + FloatToStrF(arrMonths[3], ffNumber, 10, 2) + ' mm');
      Lines.Add('April: ' + FloatToStrF(arrMonths[4], ffNumber, 10, 2) + ' mm');
      Lines.Add('May: ' + FloatToStrF(arrMonths[5], ffNumber, 10, 2) + ' mm');
      Lines.Add('June: ' + FloatToStrF(arrMonths[6], ffNumber, 10, 2) + ' mm');
      Lines.Add('July: ' + FloatToStrF(arrMonths[7], ffNumber, 10, 2) + ' mm');
      Lines.Add('August: ' + FloatToStrF(arrMonths[8], ffNumber, 10, 2) + ' mm');
      Lines.Add('September: ' + FloatToStrF(arrMonths[9], ffNumber, 10, 2) + ' mm');
      Lines.Add('October: ' + FloatToStrF(arrMonths[10], ffNumber, 10, 2) + ' mm');
      Lines.Add('November: ' + FloatToStrF(arrMonths[11], ffNumber, 10, 2) + ' mm');
      Lines.Add('December: ' + FloatToStrF(arrMonths[12], ffNumber, 10, 2) + ' mm');
      Lines.Add(#13 + 'Annual Totals: ');
      Lines.Add('2022: ' + FloatToStrF(arrYears[2022], ffNumber, 10, 2) + 'mm');
      Lines.Add('2023: ' + FloatToStrF(arrYears[2023], ffNumber, 10, 2) + 'mm');
      Lines.Add('2024: ' + FloatToStrF(arrYears[2024], ffNumber, 10, 2) + 'mm');
      Lines.Add('2025: ' + FloatToStrF(arrYears[2025], ffNumber, 10, 2) + 'mm');
      Lines.Add('2026: ' + FloatToStrF(arrYears[2026], ffNumber, 10, 2) + 'mm');
      Lines.Add('2027: ' + FloatToStrF(arrYears[2027], ffNumber, 10, 2) + 'mm');
    end;
end;

procedure TfrmMain.tlbAddClick(Sender: TObject);
var
  iValue, I : Integer;
begin
  sGauge := cbbGauges.Text;
  sWeather := lbledtWeather.Text;
  rReading := StrToFloat(lbledtReading.Text);
  bStatus := chkEmptied.Checked;
  iMaxCapMain := StrToInt(sMaxCapMain);
  Date := dtpDate.Date;
  for I := 1 to Length(lbledtReading.Text) do
    begin
      if UpCase(lbledtReading.Text[I]) IN ['A'..'Z'] then
        begin
          bOk := False;
        end
      else
        begin
          bOk := True;
        end;
    end;
  if  (bOk = True) and
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

procedure TfrmMain.tlbClearClick(Sender: TObject);
begin
  lbledtWeather.Clear;
  lbledtReading.Clear;
  lbledtReading.SetFocus;
end;

procedure TfrmMain.tlbPrintClick(Sender: TObject);
var
  pixX, pixY : Integer;
begin
   with TPrintDialog.Create(nil) do
    begin
      try
        if Execute then
          begin
            chtMain.Print;
            chtMonth.Print;
            chtAnnual.Print;
            PrintGrid(str1, 'Print Records');
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
      finally
        Free;
      end;
    end;

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
  cbbUsers.Clear;
  cbbUsers.Text := 'User';
  while not Eof(txtFile6) do
    begin
      Readln(txtFile6, sTLine);
      cbbUsers.Items.Add(sTLine);
    end;
  CloseFile(txtFile6);
  MessageDlg('Successfully updated user list', mtInformation, [mbOK], 0);
end;

end.
