unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, pngimage, ExtCtrls;

type
  TfrmAbout = class(TForm)
    s: TImage;
    redt1: TRichEdit;
    btnClose: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iRow : Integer;
  end;

var
  frmAbout: TfrmAbout;


implementation

uses
  Unit11;

{$R *.dfm}
procedure TfrmAbout.btnCloseClick(Sender: TObject);
begin
  frmAbout.Hide;
  frmMain.Show;
end;

procedure TfrmAbout.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmAbout.Hide;
  frmMain.Show;
end;

procedure TfrmAbout.FormCreate(Sender: TObject);
begin
  iRow := frmMain.str1.RowCount - 1;
end;

end.
