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

unit SGT.TreeMenuForm;

{$I SGT.Defines.inc }

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, VCL.Graphics, VCL.Controls,
  VCL.Forms, VCL.Dialogs, VCL.ComCtrls, VCL.StdCtrls, CommCtrl, Vcl.Menus;

type
  { TTreeMenuForm }
  TTreeMenuForm = class(TForm)
    TreeView: TTreeView;
    OkButton: TButton;
    QuitButton: TButton;
    StatusBar: TStatusBar;
    procedure TreeViewClick(Sender: TObject);
    procedure QuitButtonClick(Sender: TObject);
    procedure TreeViewDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
  private type
    QuitState = (qsNone, qsOk, qsQuit, qsDblClick);
  private
    { Private declarations }
    FQuit: Boolean;
    FQuitState: TTreeMenuForm.QuitState;
  public
    { Public declarations }
    SelId: Integer;
    LastSelId: Integer;
    procedure SelMenu(aId: Integer);
    procedure BoldItemId(aId: Integer; aValue: Boolean);
    procedure BoldItem(aItem: string; aValue: Boolean);
    function  Count: Integer;
  end;

var
  TreeMenuForm: TTreeMenuForm;

implementation

uses
  Winapi.Uxtheme,
  VCL.Themes,
  SGT.TreeMenu;

{$R *.dfm}

{ TTreeMenuForm }
function  TTreeMenuForm.Count: Integer;
var
  LNode: TTreeNode;
begin
  Result := 0;
  if TreeView.Items.Count = 0 then Exit;
  LNode := TreeView.Items[0];
  while LNode <> nil do
  begin
    if LNode.SelectedIndex <> TTreeMenu.NONE then
    begin
      if LNode.Enabled then
      begin
        Inc(Result);
      end;
    end;
    LNode := LNode.GetNext;
  end;
end;

procedure TTreeMenuForm.SelMenu(aId: Integer);
var
  LNode: TTreeNode;
begin
  SelId := TTreeMenu.NONE;
  if TreeView.Items.Count = 0 then Exit;
  TreeView.HideSelection := False;
  LNode := TreeView.Items[0];
  while LNode <> nil do
  begin
    if LNode.SelectedIndex = aId then
    begin
      LNode.Selected := True;
      LNode.MakeVisible;
      SelId := aId;
      Break;
    end;
    LNode := LNode.GetNext;
  end;
  if SelId = TTreeMenu.NONE then
  begin
    LNode := TreeView.Items[0];
    while LNode <> nil do
    begin
      if LNode.SelectedIndex <> TTreeMenu.NONE then
      begin
        LNode.Selected := True;
        LNode.MakeVisible;
        SelId := LNode.SelectedIndex;
        Break;
      end;
      LNode := LNode.GetNext;
    end;
  end;
  FQuitState := qsNone;
  FQuit := False;
end;

procedure TTreeMenuForm.BoldItemId(aId: Integer; aValue: Boolean);
var
  LNode: TTreeNode;
  LTreeItem: TTVItem;
begin
  SelId := aId;
  if TreeView.Items.Count = 0 then Exit;
  TreeView.HideSelection := False;
  LNode := TreeView.Items[0];
  while LNode <> nil do
  begin
    if LNode.SelectedIndex = aId then
    begin
      with LTreeItem do
      begin
        hItem := LNode.ItemId;
        stateMask := TVIS_BOLD;
        mask := TVIF_HANDLE or TVIF_STATE;
        if aValue then
          state := TVIS_BOLD
        else
          state := 0;
        end;
        TreeView_SetItem(LNode.Handle, LTreeItem) ;
      Break;
    end;
    LNode := LNode.GetNext;
  end;
end;

procedure TTreeMenuForm.BoldItem(aItem: string; aValue: Boolean);
var
  LNode: TTreeNode;
  LTreeItem: TTVItem;
begin
  if TreeView.Items.Count = 0 then Exit;
  TreeView.HideSelection := False;
  LNode := TreeView.Items[0];
  while LNode <> nil do
  begin
    if LNode.Text = aItem then
    begin
      with LTreeItem do
      begin
        hItem := LNode.ItemId;
        stateMask := TVIS_BOLD;
        mask := TVIF_HANDLE or TVIF_STATE;
        if aValue then
          state := TVIS_BOLD
        else
          state := 0;
        end;
        TreeView_SetItem(LNode.Handle, LTreeItem);
      Break;
    end;
    LNode := LNode.GetNext;
  end;
end;

procedure TTreeMenuForm.OkButtonClick(Sender: TObject);
begin
  if TreeView.Selected.Enabled then
  begin
    if SelId <> TTreeMenu.NONE then
    begin
      FQuitState := qsOk;
      FQuit := True;
      Close;
    end;
  end;
end;

procedure TTreeMenuForm.QuitButtonClick(Sender: TObject);
begin
  SelId := TTreeMenu.QUIT;
  FQuitState := qsQuit;
  FQuit := True;
  Close;
end;

procedure TTreeMenuForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (SelId = TTreeMenu.NONE) or (FQuit = False)  then
  begin
    SelId := TTreeMenu.QUIT;
  end;
end;

procedure TTreeMenuForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  //
end;

procedure TTreeMenuForm.FormCreate(Sender: TObject);
begin
  FQuitState := qsNone;
  FQuit := False;
  SelId := TTreeMenu.NONE;
  LastSelId := SelId;
  Scaled := False;

  //LoadDefaultIcon(Handle);

  if (not (Screen.PixelsPerInch = PixelsPerInch)) then
  begin
    ScaleBy(Screen.PixelsPerInch, PixelsPerInch);
  end;

  // remove style servers for tree views so the default check
  // check/min selectors will show
  if StyleServices.Enabled and CheckWin32Version(6, 0) then
  begin
    SetWindowTheme(TreeView.Handle, nil, nil);
  end;

end;

procedure TTreeMenuForm.FormShow(Sender: TObject);
begin
  TreeView.SetFocus;
end;

procedure TTreeMenuForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
  //
  if TreeView.Selected.Enabled then
  begin
    SelId := TreeView.Selected.SelectedIndex;
    LastSelId := SelId;
  end;
end;

procedure TTreeMenuForm.TreeViewChanging(Sender: TObject; Node: TTreeNode; var AllowChange: Boolean);
begin
  //
  //AllowChange := Node.Enabled;
end;

procedure TTreeMenuForm.TreeViewClick(Sender: TObject);
begin
  //
  if TreeView.Selected.Enabled then
  begin
    SelId := TreeView.Selected.SelectedIndex;
    LastSelId := SelId;
  end;
end;

procedure TTreeMenuForm.TreeViewDblClick(Sender: TObject);
begin
  //
  if TreeView.Selected.Enabled then
  begin
    SelId := TreeView.Selected.SelectedIndex;
    if SelId <> TTreeMenu.NONE then
    begin
      LastSelId := SelId;
      FQuitState := qsDblClick;
      FQuit := True;
      Close;
    end;
  end;
end;

end.
