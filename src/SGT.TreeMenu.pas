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

unit SGT.TreeMenu;

{$I SGT.Defines.inc}

interface

uses
  System.SysUtils,
  System.Math,
  VCL.ComCtrls,
  SGT.Core,
  SGT.TreeMenuForm;

type
  { TTreeMenu }
  TTreeMenu = class(TBaseObject)
  public const
    NONE = -1;
    QUIT = -2;
  protected
    FForm: TTreeMenuForm;
    FLastSelectedId: Integer;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    procedure SetTitle(const aTitle: string);
    procedure SetStatus(const aTitle: string);
    procedure Clear();
    function  First(const AParent: Pointer): Integer;
    function  AddItem(const AParent: Pointer; const AName: string; const AId: Integer; const AEnabled: Boolean): Pointer;
    function  InsertItem(const ASibling: Pointer; const AName: string; const AId: Integer; const AEnabled: Boolean): Pointer;
    procedure Sort(const AParent: Pointer);
    procedure SelItem(const AId: Integer);
    procedure BoldItemId(const AId: Integer; const AValue: Boolean);
    procedure BoldItem(const AItem: string; const AValue: Boolean);
    function  Show(const AId: Integer): Integer;
    function  GetCount(): Integer;
    function  GetLastSelectedId(): Integer;
    function  GetSelectableCount(): Integer;
  end;

implementation

{ TTreeMenu }
constructor TTreeMenu.Create;
begin
  inherited;
  FForm := TTreeMenuForm.Create(nil);
  FForm.StatusBar.SimplePanel := True;
end;

destructor TTreeMenu.Destroy;
begin
  if Assigned(FForm) then
  begin
    FForm.Free();
    FForm := nil;
  end;
  inherited;
end;

procedure TTreeMenu.SetTitle(const aTitle: string);
begin
  FForm.Caption := aTitle;
end;

procedure TTreeMenu.SetStatus(const aTitle: string);
begin
  FForm.StatusBar.SimpleText := aTitle;
end;

procedure TTreeMenu.Clear;
begin
  FForm.TreeView.Items.Clear;
end;

function  TTreeMenu.First(const AParent: Pointer): Integer;
var
  LNode: TTreeNode;
begin
  Result := NONE;
  if AParent = nil then
    LNode := FForm.TreeView.Items.GetFirstNode
  else
    LNode := TTreeNode(AParent);

  if LNode.Count > 0 then
  begin
    Result := LNode.getFirstChild.SelectedIndex;
  end;
end;

function  TTreeMenu.AddItem(const AParent: Pointer; const AName: string; const AId: Integer; const AEnabled: Boolean): Pointer;
var
  LNode: TTreeNode;
begin
  LNode := FForm.TreeView.Items.AddChild(TTreeNode(AParent), AName);
  LNode.SelectedIndex := AId;
  if AId = NONE then BoldItem(AName, True);
  LNode.Enabled := AEnabled;
  Result := Pointer(LNode);
end;

function  TTreeMenu.InsertItem(const ASibling: Pointer; const AName: string; const AId: Integer; const AEnabled: Boolean): Pointer;
var
  LNode: TTreeNode;
begin
  LNode := FForm.TreeView.Items.Insert(TTreeNode(ASibling), AName);
  LNode.SelectedIndex := AId;
  if AId = NONE then BoldItem(AName, True);
  LNode.Enabled := AEnabled;
  Result := Pointer(LNode);
end;

procedure TTreeMenu.Sort(const AParent: Pointer);
var
  LNode: TTreeNode;
begin
  LNode := TTreeNode(AParent);
  if LNode = nil then
    FForm.TreeView.AlphaSort(True)
  else
    LNode.CustomSort(nil, 0, False);
end;

procedure TTreeMenu.SelItem(const AId: Integer);
begin
  FForm.SelMenu(AId);
end;

procedure TTreeMenu.BoldItemId(const AId: Integer; const AValue: Boolean);
begin
  FForm.BoldItemId(AId, AValue);
end;

procedure TTreeMenu.BoldItem(const AItem: string; const AValue: Boolean);
begin
  FForm.BoldItem(AItem, AValue);
end;

function TTreeMenu.Show(const AId: Integer): Integer;
begin
  if FForm.TreeView.Items.Count <= 0 then
  begin
    AddItem(nil, 'You must add at lest one item', 0, False);
  end;

  FForm.SelMenu(AId);
  Console.ClearKeyboardBuffer();
  FForm.ShowModal();
  Result := FForm.SelId;
end;

function TTreeMenu.GetCount(): Integer;
begin
  Result := FForm.TreeView.Items.Count;
  if Result < 0 then Result := 0;
end;

function  TTreeMenu.GetLastSelectedId(): Integer;
begin
  Result := FForm.LastSelId;
end;

function  TTreeMenu.GetSelectableCount(): Integer;
begin
  Result := FForm.Count;
end;

end.
