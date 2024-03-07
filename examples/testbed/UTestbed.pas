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

unit UTestbed;

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.IOUtils,
  System.Math,
  System.Classes,
  System.AnsiStrings,
  Vcl.Themes,
  Vcl.Styles,
  WinApi.Windows,
  SGT.Deps,
  SGT.Deps.Ext,
  SGT.OGL,
  SGT.Core,
  SGT.StartupDialog,
  SGT.TreeMenu,
  SGT.ClaudeAI;

type

  { TTestbed }
  TTestbed = class(TBaseObject)
  private const
    CZipFilename = 'Data.zip';
  public
    constructor Create(); override;
    destructor Destroy(); override;
    procedure Run(); override;
    procedure StartupDialogRun();
    procedure StartupDialogMore();
    procedure BuildZipFile();
    procedure BasicWindow();
    procedure RotatingTexture();
    procedure MultiChannelAudio();
    procedure LoopingVideo();
    procedure Starfield();
    procedure ScaledPolygon();
    procedure UnicodeFont();
    procedure TiledParallaxTexture();
    procedure Camera();
    procedure DearImGui();
    procedure Timer();
    procedure EntityCollision();
    procedure ClaudeAIChat();
  end;

procedure RunTests();

implementation

procedure RunTests();
var
  LTestbed: TTestbed;
begin
  LTestbed := TTestbed.Create();
  try
    LTestbed.Run();
  finally
    LTestbed.Free();
  end;
end;

{ TTestbed }
constructor TTestbed.Create();
begin
  inherited;
end;

destructor TTestbed.Destroy();
begin
  inherited;
end;

procedure TTestbed.Run();
var
  LStartupDialog: TStartupDialog;
  LState: TStartupDialog.State;
  LZipFile: TZipFile;
begin
  // set custom style
  TStyleManager.TrySetStyle('Aqua Light Slate');

  if not InitLib() then Exit;

  LZipFile := TZipFile.Init(CZipFilename);

  //LSpeech.Say('Welcome to Spark Game Toolkit, the easy fast and fun twodee game development framework for Delphi', True);

  LStartupDialog := TStartupDialog.Create();
  try
    LStartupDialog.SetCaption('Spark Game Toolkit: Testbed');
    LStartupDialog.SetLogo(LZipFile, 'res/startupdialog/banner.png');
    LStartupDialog.SetLogoClickUrl('https://github.com/tinyBigGAMES/SparkGameToolkit');
    LStartupDialog.SetReadme(LZipFile, 'res/startupdialog/readme.rtf');
    LStartupDialog.SetLicense(LZipFile, 'res/startupdialog/license.rtf');
    LStartupDialog.SetReleaseInfo('v'+SGT_VERSION+' ('+SGT_CODENAME+')');

    // process startupdialog
    repeat
      LState := LStartupDialog.Show();
      case LState of
        sdsMore: StartupDialogMore();
        sdsRun : StartupDialogRun();
        sdsQuit: ;
      end;
    until LState = sdsQuit;

  finally
    LStartupDialog.Free();
  end;

  LZipFile.Free();

  QuitLib();
end;

procedure TTestbed.StartupDialogRun();
type
  TMenuItem = (
    // audio
    miAudio_MultiChannel,

    // window
    miWindow_Basic,
    miWindow_Starfield,
    miWindow_ScaledRotatedPolygon,

    // texture
    miTexture_Rotating,
    miTexture_TiledParallax,

    // entity
    miEntity_Collision,

    // gui
    miGui_DearImGui,

    // misc
    miMisc_BuildZipFile,
    miMisc_Camera,
    miMisc_Timer,
    miMisc_ClaudeAIChat,

    // video
    miVideo_Playback,

    // font
    miFont_Unicode,

    miLast
  );
var
  LTreeMenu: TTreeMenu;
  LAudioMenu: Pointer;
  LWindowMenu: Pointer;
  LMiscMenu: Pointer;
  LVideoMenu: Pointer;
  LTextureMenu: Pointer;
  LFontMenu: Pointer;
  LGuiMenu: Pointer;
  LEntityMenu: Pointer;
  LSelItem: Integer;
begin
  LTreeMenu := TTreeMenu.Create();
  try
    LTreeMenu.SetTitle('Spark Game Toolkit: Examples');
    //LTreeMenu.SetStatus('v'+LGT_VERSION+' ('+LGT_CODENAME+')');

    // audio
    LAudioMenu := LTreeMenu.AddItem(nil, 'Audio', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LAudioMenu, 'Multichannel', Ord(miAudio_MultiChannel), True);
    LTreeMenu.Sort(LAudioMenu);

    // window
    LWindowMenu := LTreeMenu.AddItem(nil, 'Window', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LWindowMenu, 'Scaled/Rotated Polygon', Ord(miWindow_ScaledRotatedPolygon), True);
      LTreeMenu.AddItem(LWindowMenu, 'Starfield', Ord(miWindow_Starfield), True);
      LTreeMenu.AddItem(LWindowMenu, 'Basic', Ord(miWindow_Basic), True);
    LTreeMenu.Sort(LWindowMenu);

    // video
    LVideoMenu := LTreeMenu.AddItem(nil, 'Video', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LVideoMenu, 'Looping', Ord(miVideo_Playback), True);
    LTreeMenu.Sort(LVideoMenu);

    // texture
    LTextureMenu := LTreeMenu.AddItem(nil, 'Texture', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LTextureMenu, 'Tiled Parallax', Ord(miTexture_TiledParallax), True);
      LTreeMenu.AddItem(LTextureMenu, 'Rotating', Ord(miTexture_Rotating), True);
    LTreeMenu.Sort(LTextureMenu);

    // entity
    LEntityMenu := LTreeMenu.AddItem(nil, 'Entity', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LEntityMenu, 'Collision', Ord(miEntity_Collision), True);
    LTreeMenu.Sort(LEntityMenu);


    // font
    LFontMenu := LTreeMenu.AddItem(nil, 'Font', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LFontMenu, 'Unicode', Ord(miFont_Unicode), True);
    LTreeMenu.Sort(LFontMenu);

    // gui
    LGuiMenu := LTreeMenu.AddItem(nil, 'GUI', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LGuiMenu, 'Dear ImGui', Ord(miGui_DearImGui), True);
    LTreeMenu.Sort(LGuiMenu);

    // sort whole menu
    LTreeMenu.Sort(nil);

    // misc
    LMiscMenu := LTreeMenu.AddItem(nil, 'Misc', TTreeMenu.NONE, True);
      LTreeMenu.AddItem(LMiscMenu, 'Build ZipFile', Ord(miMisc_BuildZipFile), True);
      LTreeMenu.AddItem(LMiscMenu, 'Camera', Ord(miMisc_Camera), True);
      LTreeMenu.AddItem(LMiscMenu, 'Timer', Ord(miMisc_Timer), True);
      LTreeMenu.AddItem(LMiscMenu, 'ClaudeAI Chat', Ord(miMisc_ClaudeAIChat), True);
    LTreeMenu.Sort(LMiscMenu);

    // menu loop
    LSelItem := -1;
    while true do
    begin
      LSelItem := LTreeMenu.Show(LSelItem);
      if (LSelItem = TTreeMenu.QUIT) then
        Break;

      case TMenuItem(LSelItem) of
        // misc
        miMisc_BuildZipFile: BuildZipFile();
        miMisc_Camera: Camera();
        miMisc_Timer: Timer();
        miMisc_ClaudeAIChat: ClaudeAIChat();

        // audio
        miAudio_MultiChannel: MultiChannelAudio();

        // video
        miVideo_Playback: LoopingVideo();

        // texture
        miTexture_TiledParallax: TiledParallaxTexture();
        miTexture_Rotating: RotatingTexture();

        // entity
        miEntity_Collision: EntityCollision();

        // font
        miFont_Unicode: UnicodeFont();

        // gui
        miGui_DearImGui: DearImGui();

        // window
        miWindow_Basic: BasicWindow();
        miWindow_ScaledRotatedPolygon: ScaledPolygon();
        miWindow_Starfield: Starfield();
      end;
    end;
  finally
    LTreeMenu.Free();
  end;
end;

procedure TTestbed.StartupDialogMore();
begin
  MessageBox(0, 'You can process additional custom dialog operations here', 'StartupDialog MORE', MB_OK);
end;

procedure TTestbed.BuildZipFile();
begin
  Console.PrintLn(Console.CRLF+'Build zip file "%s"...', [CZipFilename]);
  if TZipFile.Build('Data.zip', 'res', nil, nil) then
    Console.PrintLn(Console.CRLF+Console.CRLF+'Success!', Console.MAGENTA)
  else
    Console.PrintLn(Console.CRLF+Console.CRLF+'Failed!', Console.RED);

  Console.Pause();
end;

procedure TTestbed.BasicWindow();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
begin
  LWindow := TWindow.Init('SGT: Basic Window');

  LFont := TFont.LoadDefault(LWindow, 10);

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed.RotatingTexture();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LTexture: TTexture;
  LAngle: Single;
begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: Rotating Texture');

  LFont := TFont.LoadDefault(LWindow, 10);

  LTexture := TTexture.LoadFromZipFile(LZipFile, 'res/images/SGT.png');
  LTexture.SetPos(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT);

  LAngle := 0;

  while not LWindow.ShouldClose() do
  begin
    LAngle := LAngle + 0.1;
    Math.ClipVaLuef(LAngle, 0, 360, True);
    LTexture.SetAngle(LAngle);

    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        LTexture.Draw();

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LTexture.Free();
  LFont.Free();
  LWindow.Free();
  LZipFile.Free();
end;

procedure TTestbed.MultiChannelAudio();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LSound: array[0..7] of Integer;
  LChan: integer;
  LSongNum: Integer;
  LSongFilename: string;

  procedure PlaySong;
  begin
    Audio.UnloadMusic();
    LSongFilename := Format('res/music/song%.2d.ogg', [LSongNum]);
    Audio.PlayMusicFromZipFile(LZipFile, LSongFilename, 1.0, True);
  end;

begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: MultiChannel Audio');

  LFont := TFont.LoadDefault(LWindow, 10);

  Audio.Open();

  LSongNum := 1;
  LChan := -1;

  LSound[0] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/digthis.ogg');
  LSound[1] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/samp0.ogg');
  LSound[2] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/samp1.ogg');
  LSound[3] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/samp2.ogg');
  LSound[4] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/samp3.ogg');
  LSound[5] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/samp4.ogg');
  LSound[6] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/samp5.ogg');
  LSound[7] := Audio.LoadSoundFromZipFile(LZipFile, 'res/sfx/explo_rock.ogg');

  Audio.ReserveChannel(0, True);
  Audio.ReserveChannel(1, True);

  PlaySong();

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if LWindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      if LWindow.GetKey(KEY_1, isWasPressed) then
        Audio.PlaySound(LSound[0], 0, 1.0, False);

      if LWindow.GetKey(KEY_2, isWasPressed) then
        LChan := Audio.PlaySound(LSound[1], 1, 1.0, True);

      if LWindow.GetKey(KEY_3, isWasPressed) then
        Audio.PlaySound(LSound[2], Audio.CHANNEL_DYNAMIC, 1.0, False);

      if LWindow.GetKey(KEY_4, isWasPressed) then
        Audio.PlaySound(LSound[3], Audio.CHANNEL_DYNAMIC, 1.0, False);

      if LWindow.GetKey(KEY_5, isWasPressed) then
        Audio.PlaySound(LSound[4], Audio.CHANNEL_DYNAMIC, 1.0, False);

      if LWindow.GetKey(KEY_6, isWasPressed) then
        Audio.PlaySound(LSound[5], Audio.CHANNEL_DYNAMIC, 1.0, False);

      if LWindow.GetKey(KEY_7, isWasPressed) then
        Audio.PlaySound(LSound[6], Audio.CHANNEL_DYNAMIC, 1.0, False);

      if LWindow.GetKey(KEY_8, isWasPressed) then
        Audio.PlaySound(LSound[7], Audio.CHANNEL_DYNAMIC, 1.0, False);

      if LWindow.GetKey(KEY_9, isWasPressed) then
        Audio.StopChannel(LChan);

      if LWindow.GetKey(KEY_UP, isWasPressed) then
        begin
          Inc(LSongNum);
          LSongNum := EnsureRange(LSongNum, 1, 14);
          PlaySong();
        end
      else if LWindow.GetKey(KEY_DOWN, isWasPressed) then
        begin
          Dec(LSongNum);
          LSongNum := EnsureRange(LSongNum, 1, 14);
          PlaySong();
        end;

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( '1-8', 'Play sound'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( '9', 'Stop sound on channel #1'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'UP/DOWN', 'Next/Prev song'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, YELLOW,haLeft, Utils.HudTextItem( 'Song', '%s'), [TPath.GetFileName(LSongFilename)]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  Audio.Close();

  LFont.Free();
  LWindow.Free();
  LZipFile.Free();
end;

procedure TTestbed.LoopingVideo();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
begin
  LWindow := TWindow.Init('SGT: Looping Video');

  LFont := TFont.LoadDefault(LWindow, 10);

  Audio.Open();

  Video.Play(TZipFileIO.Open(CZipFilename, 'res/videos/SGT.mpg'), 0.8, True);

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        Video.Draw(0, 0, 0.5);

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  Video.Stop();
  Audio.Close();

  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed.Starfield();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LStarfield: TStarfield;
begin
  LWindow := TWindow.Init('SGT: Starfield');

  LFont := TFont.LoadDefault(LWindow, 10);

  LStarfield := TStarfield.New(LWindow);

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if LWindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      // update starfield
      if LWindow.GetKey(KEY_1, isWasPressed) then
      begin
        LStarfield.SetXSpeed(6);
        LStarfield.SetYSpeed(0);
        LStarfield.SetZSpeed(-5);
        LStarfield.SetVirtualPos(0, 0);
      end;

      if LWindow.GetKey(KEY_2, isWasPressed) then
      begin
        LStarfield.SetXSpeed(0);
        LStarfield.SetYSpeed(-6);
        LStarfield.SetZSpeed(-6);
        LStarfield.SetVirtualPos(0, 0);
      end;

      if LWindow.GetKey(KEY_3, isWasPressed) then
      begin
        LStarfield.SetXSpeed(-6);
        LStarfield.SetYSpeed(0);
        LStarfield.SetZSpeed(-6);
        LStarfield.SetVirtualPos(0, 0);
      end;

      if LWindow.GetKey(KEY_4, isWasPressed) then
      begin
        LStarfield.SetXSpeed(0);
        LStarfield.SetYSpeed(6);
        LStarfield.SetZSpeed(-6);
        LStarfield.SetVirtualPos(0, 0);
      end;

      if LWindow.GetKey(KEY_5, isWasPressed) then
      begin
        LStarfield.SetXSpeed(0);
        LStarfield.SetYSpeed(0);
        LStarfield.SetZSpeed(6);
        LStarfield.SetVirtualPos(0, 0);
      end;

      if LWindow.GetKey(KEY_6, isWasPressed) then
      begin
        LStarfield.Init(LWindow, 250, -1000, -1000, 10, 1000, 1000, 1000, 160);
        LStarfield.SetZSpeed(0);
        LStarfield.SetYSpeed(6);
      end;

      if LWindow.GEtKey(KEY_7, isWasPressed) then
      begin
        LStarfield.Init(LWindow, 250, -1000, -1000, 10, 1000, 1000, 1000, 80);
        LStarfield.SetXSpeed(0);
        LStarfield.SetYSpeed(0);
        LStarfield.SetZSpeed(-3);
        LStarfield.SetVirtualPos(0, 0);
      end;

      LStarfield.Update();

      LWindow.StartDrawing();

      LWindow.Clear(BLACK);

        LStarfield.Render(LWindow);

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( '1-7', 'Change starfield'), []);

        LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LStarfield.Free();
  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed.ScaledPolygon();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LPolygon: TPolygon;
  LAngle: Single;
  LScale: Single;
begin
  LWindow := TWindow.Init('SGT: Scaled Polygon');

  LFont := TFont.LoadDefault(LWindow, 10);

  LPolygon := TPolygon.Create();
  LPolygon.AddLocalPoint(-1, -1, True);
  LPolygon.AddLocalPoint(1, -1, True);
  LPolygon.AddLocalPoint(1, 1, True);
  LPolygon.AddLocalPoint(-1, 1, True);
  LPolygon.AddLocalPoint(-1, -1, True);

  LAngle := 0.0;
  LScale := 150.0;

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      if LWindow.GetKey(KEY_UP, isPressed) then
        begin
          LScale := LScale + 1.0;
          Math.ClipValuef(LScale, 10, 150, False);
        end
      else
      if LWindow.GetKey(KEY_DOWN, isPressed) then
        begin
          LScale := LScale - 1.0;
          Math.ClipValuef(LScale, 10, 150, False);
        end;

      LAngle := LAngle + 0.6;
      Math.ClipValuef(LAngle, 0, 360, True);

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        LPolygon.Render(LWindow, LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT, LScale, LAngle, 2, YELLOW, nil, False, False);

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'UP', 'Scale up'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'DOWN', 'Scale down'), []);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LPolygon.Free();
  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed.UnicodeFont();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LPos: TPoint;
  LFont: array[0..1] of TFont;
begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: Unicode Font');

  LFont[0] := TFont.LoadDefault(LWindow, 10);
  LFont[1] := TFont.LoadFromZipFile(LWindow, LZipFile, 'res/fonts/unifont.ttf', 16, '你好こんにちは안녕하세요');

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        LFont[1].DrawText(LWindow, LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT, YELLOW, haCenter, ' en   zh      ja       ko        de   es   pt     fr      vi    id', []);
        LFont[1].DrawText(LWindow, LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT+LFont[1].TextHeight()+3, DARKGREEN, haCenter, 'Hello|你好|こんにちは|안녕하세요|Hallo|Hola|Olá|Bonjour|Xin chào|Halo', []);
        LFont[0].DrawText(LWindow, LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT-LFont[1].TextHeight()-10, GREENYELLOW, haCenter, 'these are truetype fonts', []);

        LPos := Math.Point(3, 3);
        LFont[0].DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont[0].DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LFont[1].Free();
  LFont[0].Free();
  LWindow.Free();
  LZipFile.Free();
end;

procedure TTestbed.TiledParallaxTexture();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  FTexture: array[0..3] of TTexture;
  FTexPos: array[0..3] of TPoint;
  FSpeed: array[0..3] of Single;
  I: Integer;
begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: Tiled Parallex Texture');

  LFont := TFont.LoadDefault(LWindow, 10);

  // init textures
  FTexture[0] := TTexture.LoadFromZipFile(LZipFile, 'res/backgrounds/space.png', nil);
  FTexture[1] := TTexture.LoadFromZipFile(LZipFile, 'res/backgrounds/nebula1.png', @BLACK);
  FTexture[2] := TTexture.LoadFromZipFile(LZipFile, 'res/backgrounds/spacelayer1.png', @BLACK);
  FTexture[3] := TTexture.LoadFromZipFile(LZipFile, 'res/backgrounds/spacelayer2.png', @BLACK);

  // init texture settings
  FTexture[0].SetColor(0.3, 0.3, 0.3, 0.3);
  FTexture[0].SetBlend(tbNone);
  FTexture[1].SetBlend(tbAdditiveAlpha);
  FTexture[2].SetBlend(tbAlpha);
  FTexture[3].SetBlend(tbAlpha);

  // init texture pos
  FTexPos[0] := Math.Point(0,0);
  FTexPos[1] := Math.Point(0,0);
  FTexPos[2] := Math.Point(0,0);
  FTexPos[3] := Math.Point(0,0);

  // init texture speed
  FSpeed[0] := 0.1;
  FSpeed[1] := 0.15;
  FSpeed[2] := 0.2;
  FSpeed[3] := 0.3;

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      for I := 0 to 3 do
      begin
        FTexPos[I].Y := FTexPos[I].Y + FSpeed[I];
      end;

      LWindow.StartDrawing();

        LWindow.Clear(BLACK);

        for I := 0 to 3 do
        begin
          FTexture[I].DrawTiled(LWindow, FTexPos[I].X, FTexPos[I].Y);
        end;

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  FTexture[3].Free();
  FTexture[2].Free();
  FTexture[1].Free();
  FTexture[0].Free();
  LFont.Free();
  LWindow.Free();
  LZipFile.Free();
end;

procedure TTestbed.Camera();
type
  TObj = record
    X, Y, Size: Single;
    Color: TColor;
  end;
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  FCam: TCamera;
  FObj: array[0..1000] of TObj;

  procedure InitObjects();
  var
    I: Integer;
  begin
    for I := Low(FObj) to High(FObj) do
    begin
      FObj[i].X := Math.RandomRange(-10000, 10000);
      FObj[i].Y := Math.RandomRange(-10000, 10000);
      FObj[i].Size := Math.RandomRange(50, 250);
      FObj[i].Color.Red := Math.RandomRange(0, 255)/$FF;
      FObj[i].Color.Green := Math.RandomRange(0, 255)/$FF;
      FObj[i].Color.Blue := Math.RandomRange(0, 255)/$FF;
      FObj[i].Color.Alpha := 1;
    end;
  end;

  procedure DrawObjects();
  var
    I: Integer;
  begin
    for I := Low(FObj) to High(FObj) do
    //for I := 0 to 0 do
    begin
      LWindow.DrawFilledRect(FObj[i].X, FObj[i].Y, FObj[i].Size, FObj[i].Size, FObj[i].Color, 0);
    end;
  end;

begin
  LWindow := TWindow.Init('SGT: Camera');

  LFont := TFont.LoadDefault(LWindow, 10);

  // init camera
  FCam := TCamera.Create();
  FCam.X := LWindow.DEFAULT_CENTER_WIDTH;
  FCam.Y := LWindow.DEFAULT_CENTER_HEIGHT;
  FCam.Rotation := 0;
  FCam.Scale := 0.20;

  InitObjects();

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      if LWindow.GetKey(KEY_DOWN, isPressed) then
        begin
          FCam.Move(0, 10)
        end
      else
      if LWindow.GetKey(KEY_UP, isPressed) then
        begin
          FCam.Move(0, -10)
        end;

      if LWindow.GetKey(KEY_RIGHT, isPressed) then
        begin
          FCam.Move(10, 0)
        end
      else
      if LWindow.GetKey(KEY_LEFT, isPressed) then
        begin
          FCam.Move(-10, 0)
        end;

      if LWindow.GetKey(KEY_A, isPressed) then
        begin
          FCam.Rotate(-2)
        end
      else
      if LWindow.GetKey(KEY_D, isPressed) then
        begin
          FCam.Rotate(3)
        end;


      if LWindow.GetKey(KEY_S, isPressed) then
        begin
          FCam.Zoom(-0.01)
        end
      else
      if LWindow.GetKey(KEY_W, isPressed) then
        begin
          FCam.Zoom(0.01)
        end;

      if LWindow.GetKey(KEY_R, isWasReleased) then
      begin
        FCam.Reset();
        FCam.X := LWindow.DEFAULT_CENTER_WIDTH;
        FCam.Y := LWindow.DEFAULT_CENTER_HEIGHT;
        FCam.Rotation := 0;
        FCam.Scale := 0.20;
      end;

      if LWindow.GetKey(KEY_SPACE, isWasReleased) then
      begin
        InitObjects()
      end;

      LWindow.StartDrawing();

        LWindow.Clear(BLACK);

        FCam.Use(LWindow);
        DrawObjects();
        FCam.Use(nil);

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('Space', 'Spawn'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('Left/Right', 'cam move left/right'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('Up/Down', 'cam move up/down'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('W/S', 'cam zoom up/down'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('A/D', 'cam rotate up/down'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem('R', 'Reset'), []);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, YELLOW, haLeft, Utils.HudTextItem('Pos', '%03.2f/%03.2f', 20, ' '), [FCam.X, FCam.Y]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, YELLOW, haLeft, Utils.HudTextItem('Zoom', '%3.2f'), [FCam.Scale]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, YELLOW, haLeft, Utils.HudTextItem('Angle', '%3.2f'), [FCam.Rotation]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  FCam.Free();
  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed_ContentScaledEvent(const ASender: Pointer; const AScaleX, AScaleY: Single; const AUserData: Pointer);
var
  LFontAtlas: PImFontAtlas;
begin
  LFontAtlas := AUserData;
  ImFontAtlas_ResizeDefaultFont(LFontAtlas, 16*AScaleX);
end;

procedure TTestbed.DearImGui();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  io: PImGuiIO;
  show_demo_window: Boolean;
  clear_color: ImVec4;
  color: TColor;
  LScale: SGT.Core.TPoint;

  procedure ResizeFont();
  begin
    LWindow.GetScale(LScale);
    ImFontAtlas_ResizeDefaultFont(io.Fonts, 16*LScale.x);
  end;

begin
  show_demo_window := True;
  clear_color.x := 0.45;
  clear_color.y := 0.55;
  clear_color.z := 0.60;
  clear_color.w := 1.0;

  LWindow := TWindow.Init('SGT: Dear ImGui');


  igCreateContext(nil);
  io := igGetIO();
  io.ConfigFlags := ImGuiConfigFlags_NavEnableKeyboard or
                      ImGuiConfigFlags_NavEnableGamepad or
                      ImGuiConfigFlags_DockingEnable;

  LWindow.SetContentScaledEvent(Self, TTestbed_ContentScaledEvent, io.Fonts);

  ImGui_ImplGlfw_InitForOpenGL(LWindow.GetHandle(), true);
  ImGui_ImplOpenGL2_Init();

  ResizeFont();

  LFont := TFont.LoadDefault(LWindow, 10);

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      ImGui_ImplOpenGL2_NewFrame();
      ImGui_ImplGlfw_NewFrame();
      igNewFrame();

      if show_demo_window then
        igShowDemoWindow(@show_demo_window);

      if igBegin('Hello, world!', nil, ImGuiWindowFlags_AlwaysAutoResize) then
      begin
        igText('This is some useful text.');
        igCheckbox('Demo Window', @show_demo_window);
        igEnd();
      end;

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      LWindow.StartDrawing();

        Color.Red := clear_color.x;
        Color.Green := clear_color.y;
        Color.Blue := clear_color.z;
        Color.Alpha := clear_color.w;
        LWindow.Clear(Color);

        igRender();
        ImGui_ImplOpenGL2_RenderDrawData(igGetDrawData());

        LPos := Math.Point(3, 20);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  ImGui_ImplOpenGL2_Shutdown();
  ImGui_ImplGlfw_Shutdown();
  igDestroyContext(nil);

  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed.Timer();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LTimer: TTimer;
  LCount: Integer;
begin
  LWindow := TWindow.Init('SGT: Timer');

  LFont := TFont.LoadDefault(LWindow, 10);

  LTimer.InitFPS(8);
  LCount := 0;

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      if LTimer.Check() then
      begin
        Inc(LCount);
        LCount := Math.ClipValue(LCount, 0, 3, True);
      end;

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        case LCount of
          0: LWindow.DrawFilledRect(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT, 50, 50, DARKSEAGREEN, 0);
          1: LWindow.DrawFilledRect(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT, 50, 50, FORESTGREEN, 0);
          2: LWindow.DrawFilledRect(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT, 50, 50, GREEN, 0);
          3: LWindow.DrawFilledRect(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT, 50, 50, DARKGREEN, 0);
        end;

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LFont.Free();
  LWindow.Free();
end;

procedure TTestbed.EntityCollision();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LSprite: TSprite;
  LBoss: TEntity;
  LPlayer: TEntity;
  LCollide: Boolean;
  LMousePos: TPoint;
begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: Entity Collision');

  LFont := TFont.LoadDefault(LWindow, 10);

  LSprite := TSprite.Create();
  LSprite.LoadPageFromZipFile(LZipFile, 'res/sprites/boss.png', nil); // page #0
  LSprite.AddGroup(); // group #0
  LSprite.AddImageFromGrid(0, 0, 0, 0, 128, 128);
  LSprite.AddImageFromGrid(0, 0, 1, 0, 128, 128);
  LSprite.AddImageFromGrid(0, 0, 0, 1, 128, 128);

  LSprite.LoadPageFromZipFile(LZipFile, 'res/sprites/ship.png', nil); // page #1
  LSprite.AddGroup(); // group #1
  LSprite.AddImageFromGrid(1, 1, 1, 0, 64, 64);
  LSprite.AddImageFromGrid(1, 1, 2, 0, 64, 64);
  LSprite.AddImageFromGrid(1, 1, 3, 0, 64, 64);

  LBoss := TEntity.New(LSprite, 0);
  LBoss.SetPosAbs(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT);
  LBoss.SetFrameSpeed(24);

  LPlayer := TEntity.New(LSprite, 1);
  LPlayer.SetPosAbs(0, 0);
  LPlayer.SetFrameSpeed(24);

  while not LWindow.ShouldClose() do
  begin
    LWindow.StartFrame();

      LMousePos := LWindow.GetMousePos();

      if Lwindow.GetKey(KEY_ESCAPE, isWasPressed) then
        LWindow.SetShouldClose(True);

      LBoss.NextFrame();

      LPlayer.NextFrame();
      LPlayer.ThrustToPos(40, 40, LMousePos.x, LMousePos.y, 128, 32, 1, 0.001);
      LCollide := LPlayer.Collide(LBoss);

      LWindow.StartDrawing();

        LWindow.Clear(DARKSLATEBROWN);

        LBoss.Render();
        if LCollide then
          LWindow.DrawFilledRect(LWindow.DEFAULT_CENTER_WIDTH, LWindow.DEFAULT_CENTER_HEIGHT-64, 64, 10, RED, 0);

        LPlayer.Render();

        LPos := Math.Point(3, 3);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, WHITE, haLeft, 'fps %d', [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LPos.X, LPos.Y, 0, GREEN, haLeft, Utils.HudTextItem( 'Quit', 'ESC'), [FrameLimitTimer.FrameRate()]);
        LFont.DrawText(LWindow, LWindow.DEFAULT_CENTER_WIDTH, 150, YELLOW, haCenter, 'move blue ship over green ship', []);

      LWindow.EndDrawing();

    LWindow.EndFrame();
  end;

  LPlayer.Free();
  LBoss.Free();
  LSprite.Free();

  LFont.Free();
  LWindow.Free();
  LZipFile.Free();
end;

procedure TTestbed.ClaudeAIChat();
var
  LClaudeAI: TClaudeAI;
begin
  LClaudeAI := TClaudeAI.Create();
  try
    LClaudeAI.SimpleChat();
  finally
    LClaudeAI.Free();
  end;
end;


end.
