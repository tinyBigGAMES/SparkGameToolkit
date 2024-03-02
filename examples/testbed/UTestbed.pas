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
    procedure TestImGui();
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
    Console.PrintLn('1. Build ZipFile');
    Console.PrintLn('2. Window');
    Console.PrintLn('3. Texture');
    Console.PrintLn('4. Audio');
    Console.PrintLn('5. Video');
    Console.PrintLn('Q. Quit');
    Console.PrintLn();
    Console.Print('Select: ');
    LOption := Console.ReadLnX(['q', 'Q', '1', '2', '3', '4', '5'], 1).ToLower;
    if LOption.Length = 0 then continue;
    case Ord(LOption[1]) of
      Ord('1'): TestZipFile();
      Ord('2'): TestWindow();
      Ord('3'): TestTexture();
      Ord('4'): TestAudio();
      Ord('5'): TestVideo();
      Ord('6'): TestImGui();
      Ord('q'): LDone := True;
    end;
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

procedure TTestbed.TestImGui();
begin
end;

end.
