(* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
                         -****************+.
               .-=++*+::*###############*-
           :=+##*+=-::*##**############=
        .=*#*=:    .+#*=+############+.
       =##+.      +#+-=############*-:
     :*#+.      =+-.=#############- =#*.
    -##-      -=..+#############*:.  ---.
   -##:     .: .+################= :+#*-:.
  .##-        :==========*#####= :*#*- -#*
  =##                   -####*:-*#*-   .##:
  +#+                  -###*--*#*-      *#=
  *#+                 +###==*#*:        *#=
  +#*                *##+=*#*-          ##-
  :##.             .*##*##*:           -##.
   +#*            -#####*:             *#=
    *#+          =####+:             .*#+
     +#*.       +###+.              :##=
      -##+.    *##+:              :+#*:
        =*#+..*#+:             .-*#*-
          :-:#+::.        .:-=*##+:
           -+..+*###****####*+-.
          :.      ..:::::..
        ____                   _
       / ___| _ __   __ _ _ __| | __
       \___ \| '_ \ / _` | '__| |/ /
        ___) | |_) | (_| | |  |   <
       |____/| .__/ \__,_|_|  |_|\_\
             |_|   Game Toolkit™

Copyright © 2024-present tinyBigGAMES™ LLC
         All Rights Reserved.

Website: https://tinybiggames.com
Email  : support@tinybiggames.com

See LICENSE for license information
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *)

unit SGT.StartupDialogForm;

{$I SGT.Defines.inc }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, VCL.Graphics, VCL.Controls, VCL.Forms,
  VCL.Dialogs, VCL.Menus, VCL.ExtCtrls, VCL.StdCtrls, VCL.OleCtrls, SHDocVw, Vcl.ComCtrls,
  Vcl.Grids, SGT.Core, SGT.StartupDialog;

type

  { TStartupDialogForm }
  TStartupDialogForm = class(TForm)
    LogoImage: TImage;
    Bevel: TBevel;
    MoreButton: TButton;
    RunButton: TButton;
    QuitButton: TButton;
    RelTypePanel: TPanel;
    PageControl: TPageControl;
    tbLicense: TTabSheet;
    tbReadme: TTabSheet;
    ReadmeMemo: TRichEdit;
    LicenseMemo: TRichEdit;
    tbConfig: TTabSheet;
    StringGrid: TStringGrid;
    procedure MoreButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RunButtonClick(Sender: TObject);
    procedure QuitButtonClick(Sender: TObject);
    procedure LogoImageDblClick(Sender: TObject);
    procedure LogoImageClick(Sender: TObject);
    procedure ReadmeMemoLinkClick(Sender: TCustomRichEdit; const URL: string;
      Button: TMouseButton);
    procedure LicenseMemoLinkClick(Sender: TCustomRichEdit; const URL: string;
      Button: TMouseButton);
    procedure PageControlChange(Sender: TObject);
  private
    { Private declarations }
    FState: TStartupDialog.State;
    FRunOnce: Boolean;
    FClickUrl: string;
    procedure DoClickUrl;
    procedure UpdateConfigInfo;
  public
    property State: TStartupDialog.State read FState write FState;

    { Public declarations }
    procedure SetCaption(const aCaption: string);

    procedure SetLogo(const AStream: TStream);
    procedure SetLogoClickUrl(const aURL: string);

    procedure SetReadme(const AStream: TStream);
    procedure SetReadmeText(const aText: string);

    procedure SetLicense(const AStream: TStream);
    procedure SetLicenseText(const aText: string);

    procedure SetReleaseInfo(const aReleaseInfo: string);

    procedure SetWordWrap(const aWrap: Boolean);
  end;

var
  StartupDialogForm: TStartupDialogForm;

implementation

uses
  System.IOUtils,
  Vcl.Imaging.pngimage;

{$R *.dfm}

{ TStartupDialogForm }
procedure TStartupDialogForm.DoClickUrl;
begin
  Utils.GotoURL(FClickUrl);
end;

procedure TStartupDialogForm.UpdateConfigInfo;
var
  LFreeSpace: Int64;
  LTotalSpace: Int64;
  LAvailMem: UInt64;
  LTotalMem: UInt64;
begin
  StringGrid.RowCount := 6;
  StringGrid.ColWidths[0] := 200;
  StringGrid.ColWidths[1] := 600;

  StringGrid.Cells[0,0] := 'Application';
  StringGrid.Cells[1,0] := Utils.GetAppName;

  StringGrid.Cells[0,1] := 'Path';
  StringGrid.Cells[1,1] := Utils.GetAppPath;

  StringGrid.Cells[0,2] := 'CPU cores';
  StringGrid.Cells[1,2] := Utils.GetCPUCount.ToString;

  StringGrid.Cells[0,3] := 'OS version';
  StringGrid.Cells[1,3] := Utils.GetOSVersion;

  Utils.GetMemoryFree(LAvailMem, LTotalMem);
  StringGrid.Cells[0,4] := 'Memory Freel/Total';
  StringGrid.Cells[1,4] := Format('%3.2f/%3.2f Gigabytes', [(LAvailMem/1073741824), (LTotalMem/1073741824)]);

  Utils.GetDiskFreeSpace(Utils.GetAppPath, LFreeSpace, LTotalSpace);
  StringGrid.Cells[0,5] := 'HD Free/Total';
  StringGrid.Cells[1,5] := Format('%3.2f/%3.2f Gigabytes', [(LFreeSpace/1073741824), (LTotalSpace/1073741824)]);

  StringGrid.Cells[0,6] := 'Video Card';
  StringGrid.Cells[1,6] := Utils.GetVideoCardName;

  //TODO: figure how to get video card memory
  //StringGrid.Cells[0,7] := 'Video Memory';
  //StringGrid.Cells[1,7] := Format('%d Gigabytes', [(GetVideoCardMemory)]);


end;

procedure TStartupDialogForm.SetCaption(const aCaption: string);
begin
  Caption := aCaption;
end;

procedure TStartupDialogForm.SetLogo(const AStream: TStream);
var
  LPng: TPngImage;
begin
  if not Assigned(AStream) then Exit;

  LPng := TPngImage.Create;
  try
    LPng.LoadFromStream(AStream);
    LogoImage.Picture.Bitmap.Assign(LPng);
  finally
    FreeAndNil(LPng);
  end;
end;

procedure TStartupDialogForm.SetLogoClickUrl(const AURL: string);
begin
  FClickUrl := aURL;
end;

procedure TStartupDialogForm.SetReadme(const AStream: TStream);
begin
  if not Assigned(AStream) then Exit;
  ReadMeMemo.WordWrap := True;
  ReadMeMemo.Lines.Clear;
  ReadMeMemo.Lines.LoadFromStream(AStream, TEncoding.UTF8);
end;

procedure TStartupDialogForm.SetReadmeText(const AText: string);
begin
  ReadMeMemo.Lines.Clear;
  ReadMeMemo.Lines.Text := AText;
end;

procedure TStartupDialogForm.SetLicense(const AStream: TStream);
begin
  if not Assigned(AStream) then Exit;
  LicenseMemo.WordWrap := True;
  LicenseMemo.Lines.Clear;
  LicenseMemo.Lines.LoadFromStream(AStream, TEncoding.UTF8);
end;

procedure TStartupDialogForm.SetLicenseText(const AText: string);
begin
  LicenseMemo.Lines.Clear;
  LicenseMemo.Lines.Text := AText;
end;

procedure TStartupDialogForm.SetReleaseInfo(const AReleaseInfo: string);
begin
  RelTypePanel.Caption := AReleaseInfo;
end;

procedure TStartupDialogForm.SetWordWrap(const AWrap: Boolean);
begin
  ReadMeMemo.WordWrap := AWrap;
  LicenseMemo.WordWrap := AWrap;
  if aWrap then
  begin
    ReadMeMemo.ScrollBars := ssVertical;
    LicenseMemo.ScrollBars := ssVertical;
  end
  else
  begin
    ReadMeMemo.ScrollBars := ssBoth;
    LicenseMemo.ScrollBars := ssBoth;
  end;
end;

procedure TStartupDialogForm.FormActivate(Sender: TObject);
begin
  if not FRunOnce then
  begin
    FRunOnce := True;
    ReadMeMemo.SetFocus;
    ReadMeMemo.SelLength := 0;
    ReadMeMemo.SelStart := 0;

    LicenseMemo.SelLength := 0;
    LicenseMemo.SelStart := 0;
  end;
end;

procedure TStartupDialogForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caHide;
end;

procedure TStartupDialogForm.FormCreate(Sender: TObject);
begin
  FClickUrl := '';
  Scaled := False;
  if (not(Screen.PixelsPerInch = PixelsPerInch)) then
  begin
    ScaleBy(Screen.PixelsPerInch, PixelsPerInch);
  end;

  FRunOnce := False;
  FState := sdsQuit;

  UpdateConfigInfo;
end;

procedure TStartupDialogForm.FormDestroy(Sender: TObject);
begin
  //
end;

procedure TStartupDialogForm.LicenseMemoLinkClick(Sender: TCustomRichEdit;
  const URL: string; Button: TMouseButton);
begin
  Utils.GotoURL(URL);
end;

procedure TStartupDialogForm.LogoImageClick(Sender: TObject);
begin
  //
  DoClickUrl;
end;

procedure TStartupDialogForm.LogoImageDblClick(Sender: TObject);
begin
  //
end;

procedure TStartupDialogForm.MoreButtonClick(Sender: TObject);
begin
  FState := sdsMore;
  Close;
end;

procedure TStartupDialogForm.PageControlChange(Sender: TObject);
begin
  //
  if PageControl.ActivePageIndex = 2 then
  begin
    StringGrid.Row := 0;
    StringGrid.Col := 0;
  end;
end;

procedure TStartupDialogForm.ReadmeMemoLinkClick(Sender: TCustomRichEdit;
  const URL: string; Button: TMouseButton);
begin
  Utils.GotoURL(URL);
end;

procedure TStartupDialogForm.RunButtonClick(Sender: TObject);
begin
  FState := sdsRun;
  Close;
end;

procedure TStartupDialogForm.QuitButtonClick(Sender: TObject);
begin
  FState := sdsQuit;
  Close;
end;

end.
