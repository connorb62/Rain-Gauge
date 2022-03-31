unit ABOUTNEW;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TfrmMainAbout = class(TForm)
    imgMain: TImage;
    redApp: TRichEdit;
    redVersion: TRichEdit;
    redHelp: TRichEdit;
    procedure btnCloseClick(Sender: TObject);
    procedure imgAboutClick(Sender: TObject);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMainAbout: TfrmMainAbout;

implementation

uses
  MAIN;

{$R *.dfm}

procedure TfrmMainAbout.btnCloseClick(Sender: TObject);
begin
  frmMainAbout.Close;
end;

procedure TfrmMainAbout.FormClick(Sender: TObject);
begin
  frmMainAbout.Close;
end;

procedure TfrmMainAbout.imgAboutClick(Sender: TObject);
begin
  frmMainAbout.Close;
end;

end.
