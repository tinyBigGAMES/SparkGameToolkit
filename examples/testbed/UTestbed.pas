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
  SGT.Deps,
  SGT.OGL,
  SGT.Lib;

type

  { TTestbed }
  TTestbed = class(TBaseObject)
  private const
    CZipFilename = 'Data.zip';
  public
    constructor Create(); override;
    destructor Destroy(); override;
    procedure Run(); override;
    procedure TestZipFile();
    procedure TestWindow();
    procedure TestTexture();
    procedure TestAudio();
    procedure TestVideo();
    procedure TestStarfield();
    procedure TestPolygon();
    procedure TestFont();
    procedure TestTiledTexture();
    procedure TestCamera();
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
  LOption: string;
  LDone: Boolean;
begin
  if not InitLib() then Exit;

  Speech.Say('Welcome to Spark Game Toolkit, the easy fast and fun twodee game development framework for Delphi', True);

  LDone := False;
  while not LDone do
  begin
    Console.Clear();
    Console.PrintLn(SGT_PROJECT, Console.DARKGREEN);
    Console.PrintLn();
    Console.PrintLn('>>> MENU <<<');
    Console.PrintLn(' 1. Build ZipFile');
    Console.PrintLn(' 2. Window');
    Console.PrintLn(' 3. Texture');
    Console.PrintLn(' 4. Tiled Texture');
    Console.PrintLn(' 5. Audio');
    Console.PrintLn(' 6. Video');
    Console.PrintLn(' 7. Starfield');
    Console.PrintLn(' 8. Polygon');
    Console.PrintLn(' 9. Font');
    Console.PrintLn('10. Camera');
    Console.PrintLn(' Q. Quit');
    Console.PrintLn();
    Console.Print('Select: ');
    LOption := Console.ReadLnX(['q', 'Q', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'], 2).ToLower;
    if LOption.Length = 0 then continue;
    if LOption = '1' then
      TestZipFile()
    else
    if LOption = '2' then
      TestWindow()
    else
    if LOption = '3' then
      TestTexture()
    else
    if LOption = '4' then
      TestTiledTexture()
    else
    if LOption = '5' then
      TestAudio()
    else
    if LOption = '6' then
      TestVideo()
    else
    if LOption = '7' then
      TestStarfield()
    else
    if LOption = '8' then
      TestPolygon()
    else
    if LOption = '9' then
      TestFont()
    else
    if LOption = '10' then
      TestCamera()
    else
    if LOption = 'q' then
      LDone := True;
  end;

  QuitLib();
end;

procedure TTestbed.TestZipFile();
begin
  Console.PrintLn(Console.CRLF+'Build zip file "%s"...', [CZipFilename]);
  if TZipFile.Build('Data.zip', 'res', nil, nil) then
    Console.PrintLn(Console.CRLF+Console.CRLF+'Success!', Console.MAGENTA)
  else
    Console.PrintLn(Console.CRLF+Console.CRLF+'Failed!', Console.RED);

  Console.Pause();
end;

procedure TTestbed.TestWindow();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
begin
  LWindow := TWindow.Init('SGT: Window');

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

procedure TTestbed.TestTexture();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LTexture: TTexture;
  LAngle: Single;
begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: Texture');

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

procedure TTestbed.TestAudio();
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

  LWindow := TWindow.Init('SGT: Audio');

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

procedure TTestbed.TestVideo();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
begin
  LWindow := TWindow.Init('SGT: Video');

  LFont := TFont.LoadDefault(LWindow, 10);

  Audio.Open();

  Video.Play(TZipFileIO.Open(CZipFilename, 'res/videos/Spark2.mpg'), 0.8, True);

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

procedure TTestbed.TestStarfield();
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

procedure TTestbed.TestPolygon();
var
  LWindow: TWindow;
  LFont: TFont;
  LPos: TPoint;
  LPolygon: TPolygon;
  LAngle: Single;
  LScale: Single;
begin
  LWindow := TWindow.Init('SGT: Polygon');

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

procedure TTestbed.TestFont();
var
  LZipFile: TZipFile;
  LWindow: TWindow;
  LPos: TPoint;
  LFont: array[0..1] of TFont;
begin
  LZipFile := TZipFile.Init(CZipFilename);

  LWindow := TWindow.Init('SGT: Font');

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

procedure TTestbed.TestTiledTexture();
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

  LWindow := TWindow.Init('SGT: Tiled Texture');

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

procedure TTestbed.TestCamera();
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

end.
