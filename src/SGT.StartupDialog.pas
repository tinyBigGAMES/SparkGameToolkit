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

unit SGT.StartupDialog;

{$I SGT.Defines.inc}

interface

uses
  System.SysUtils,
  System.Classes,
  VCL.Forms,
  SGT.Core;

type

  { TStartupDialog }
  TStartupDialog = class(TBaseObject)
  public type
    State = (sdsMore = 0, sdsRun = 1, sdsQuit = 2);
  protected
    FDialog: TForm;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure SetCaption(const ACaption: string);
    procedure SetLogo(const AZipFile: TZipFile; const AFilename: string);
    procedure SetLogoClickUrl(const AURL: string);
    procedure SetReadme(const AZipFile: TZipFile; const AFilename: string);
    procedure SetReadmeText(const AText: string);
    procedure SetLicense(const AZipFile: TZipFile; const AFilename: string);
    procedure SetLicenseText(const AText: string);
    procedure SetReleaseInfo(const AReleaseInfo: string);
    procedure SetWordWrap(const AWrap: Boolean);
    function  Show(): TStartupDialog.State;
    procedure Hide();
  end;

implementation

uses
  SGT.StartupDialogForm;

{ TStartupDialog }
constructor TStartupDialog.Create;
begin
  inherited;
  FDialog := TStartupDialogForm.Create(nil);
  FDialog.Enabled := True;
end;

destructor TStartupDialog.Destroy;
begin
  if Assigned(FDialog) then
  begin
    FDialog.Free();
    FDialog := nil;
  end;

  inherited;
end;

procedure TStartupDialog.SetCaption(const ACaption: string);
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).SetCaption(ACaption);
end;

procedure TStartupDialog.SetLogo(const AZipFile: TZipFile; const AFilename: string);
var
  LStream: TStream;
begin
  if FDialog = nil then Exit;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen then Exit;

  LStream := AZipFile.OpenFileToStream(AFilename);
  try
    if not Assigned(LStream) then Exit;
    TStartupDialogForm(FDialog).SetLogo(LStream);
  finally
    if Assigned(LStream) then
      LStream.Free();
  end;
end;

procedure TStartupDialog.SetLogoClickUrl(const AURL: string);
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).SetLogoClickUrl(AURL);
end;

procedure TStartupDialog.SetReadme(const AZipFile: TZipFile; const AFilename: string);
var
  LStream: TStream;
begin
  if FDialog = nil then Exit;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen then Exit;

  LStream := AZipFile.OpenFileToStream(AFilename);
  try
    if not Assigned(LStream) then Exit;
    TStartupDialogForm(FDialog).SetReadme(LStream);
  finally
    if Assigned(LStream) then
      LStream.Free();
  end;
end;

procedure TStartupDialog.SetReadmeText(const AText: string);
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).SetReadmeText(AText);
end;

procedure TStartupDialog.SetLicense(const AZipFile: TZipFile; const AFilename: string);
var
  LStream: TStream;
begin
  if FDialog = nil then Exit;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen then Exit;

  LStream := AZipFile.OpenFileToStream(AFilename);
  try
    if not Assigned(LStream) then Exit;
    TStartupDialogForm(FDialog).SetLicense(LStream);
  finally
    if Assigned(LStream) then
      LStream.Free();
  end;
end;

procedure TStartupDialog.SetLicenseText(const AText: string);
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).SetLicenseText(AText);
end;

procedure TStartupDialog.SetReleaseInfo(const AReleaseInfo: string);
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).SetReleaseInfo(AReleaseInfo);
end;

procedure TStartupDialog.SetWordWrap(const AWrap: Boolean);
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).SetWordWrap(AWrap);
end;

function TStartupDialog.Show(): State;
begin
  Result := sdsQuit;
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).State := sdsQuit;

  TStartupDialogForm(FDialog).PageControl.ActivePageIndex := 0;
  FDialog.ShowModal;
  try
    Result := TStartupDialogForm(FDialog).State;
  finally
    TStartupDialogForm(FDialog).Hide;
  end;
end;

procedure TStartupDialog.Hide();
begin
  if FDialog = nil then Exit;
  TStartupDialogForm(FDialog).Hide();
end;

end.
