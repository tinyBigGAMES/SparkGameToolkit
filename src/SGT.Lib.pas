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

unit SGT.Lib;

{$I SGT.Defines.inc}

interface

uses
  System.TypInfo,
  System.Types,
  System.Rtti,
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  System.IOUtils,
  System.SyncObjs,
  System.Math,
  System.Net.HttpClient,
  System.JSON,
  System.Variants,
  System.Win.ComObj,
  System.IniFiles,
  WinApi.Windows,
  WinApi.Messages,
  WinApi.ShellAPI,
  WinApi.ActiveX,
  SGT.Deps,
  SGT.OGL,
  SGT.SpeechLib;

const
  SGT_NAME          = 'Spark Game Toolkit™';
  SGT_DEVELOPER     = 'tinyBigGAMES™ LLC';
  SGT_CODENAME      = 'Ignite';
  SGT_MAJOR_VERSION = '0';
  SGT_MINOR_VERSION = '1';
  SGT_PATCH_VERSION = '0';
  SGT_VERSION       = SGT_MAJOR_VERSION+'.'+SGT_MINOR_VERSION+'.'+SGT_PATCH_VERSION;
  SGT_PROJECT       = SGT_NAME+' ('+SGT_CODENAME+') v'+SGT_MAJOR_VERSION+'.'+SGT_MINOR_VERSION+'.'+SGT_PATCH_VERSION+', ' + SGT_DEVELOPER;

{ Init }
function  InitLib(): Boolean;
procedure QuitLib();
function  IsLibInit(): Boolean;
procedure ResetLib();

type
  { TSeekMode }
  TSeekMode = (smStart, smCurrent, smEnd);

  { THAlign }
  THAlign = (haLeft, haCenter, haRight);

  { TVAlign }
  TVAlign = (vaTop, vaCenter, vaBottom);

  { TStartupDialogState }
  TStartupDialogState = (sdsMore = 0, sdsRun = 1, sdsQuit = 2);

  { TBaseObject }
  TBaseObject = class
  protected
    FTag: string;
  public
    property Tag: string read FTag write FTag;
    constructor Create(); virtual;
    destructor Destroy(); override;
    procedure Run(); virtual;
  end;

  TBaseObjectClass = class of TBaseObject;

procedure RunObject(const AObject: TBaseObjectClass);

type

  { Utils }
  Utils = class
  private const
    CTempStaticBufferSize = 4096;
  private class var
    FCriticalSection: TCriticalSection;
    FMarshaller: TMarshaller;
    FTempStaticBuffer: array[0..CTempStaticBufferSize - 1] of Byte;
  public
    class constructor Create();
    class destructor Destroy();
    class function  AsUTF8(const AText: string): Pointer;
    class function  GetTempStaticBuffer(): PByte;
    class function  GetTempStaticBufferSize(): Integer;
    class function  ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
    class procedure EnterCriticalSection();
    class procedure LeaveCriticalSection();
    class procedure SetDefaultIcon(AWindow: HWND); overload;
    class procedure SetDefaultIcon(AWindow: PGLFWwindow); overload;
    class function  RemoveDuplicates(const aText: string): string;
    class function  HudTextItem(const AKey: string; const AValue: string; const APaddingWidth: Cardinal=20; const ASeperator: string='-'): string;
    class procedure GotoURL(const AURL: string);
    class function  GetComputerName(): string;
    class function  GetLoggedUserName(): string;
    class function  GetOSVersion(): string;
    class function  GetNow(): string;
    class procedure GetDiskFreeSpace(const APath: string; var AFreeSpace: Int64; var ATotalSpace: Int64);
    class procedure GetMemoryFree(var AAvailMem: UInt64; var ATotalMem: UInt64);
    class function  GetVideoCardName(): string;
    class function  GetAppName(): string;
    class function  GetAppPath(): string;
    class function  GetCPUCount(): Integer;
    class function  GetAppVersionStr(): string;
    class function  GetAppVersionFullStr(): string;
    class function  GetModuleVersionFullStr(): string; overload;
    class function  GetModuleVersionFullStr(AFilename: string): string; overload;
    class function  HttpGet(const aURL: string; const aStatus: PString=nil): string;
    class function  RemoveQuotes(const AText: string): string;
  end;

  { Console }
  Console = class
  public const
    LF   = #10;
    CR   = #13;
    CRLF = LF+CR;

    BRIGHTYELLOW = FOREGROUND_RED OR FOREGROUND_GREEN OR FOREGROUND_INTENSITY;
    YELLOW       = FOREGROUND_RED OR FOREGROUND_GREEN;
    WHITE        = FOREGROUND_RED OR FOREGROUND_GREEN OR FOREGROUND_BLUE;
    BRIGHTWHITE  = FOREGROUND_RED OR FOREGROUND_GREEN OR FOREGROUND_BLUE OR FOREGROUND_INTENSITY;
    DARKGREEN    = FOREGROUND_GREEN;
    DARKGRAY     = FOREGROUND_INTENSITY;
    CYAN         = FOREGROUND_GREEN OR FOREGROUND_BLUE;
    MAGENTA      = FOREGROUND_RED OR FOREGROUND_BLUE;
    RED          = FOREGROUND_RED;
  private class var
    FInputCodePage: Cardinal;
    FOutputCodePage: Cardinal;
    FKeyState: array [0..1, 0..255] of Boolean;
  public
    class constructor Create();
    class destructor Destroy();
    class procedure Clear();
    class function  ClearScreen(const AConsole: THandle): Boolean;
    class procedure SetTextColor(AColor: Word);
    class procedure ClearLine(AColor: Word);
    class procedure ClearLineFromCursor(AColor: Word);
    class procedure GetSize(AWidth: PInteger; AHeight: PInteger);
    class procedure SetTitle(const ATitle: string);
    class function  HasOutput: Boolean;
    class function  WasRunFrom(): Boolean;
    class function  IsStartedFromDelphiIDE(): Boolean;
    class procedure WaitForAnyKey();
    class function  AnyKeyPressed(): Boolean;
    class procedure ClearKeyStates();
    class function  IsKeyPressed(AKey: Byte): Boolean;
    class function  WasKeyReleased(AKey: Byte): Boolean;
    class function  WasKeyPressed(AKey: Byte): Boolean;
    class procedure Pause(aColor: DWORD=Console.WHITE; const aMsg: string=''; const AForcePause: Boolean=False);
    class procedure ClearKeyboardBuffer();
    class function  ReadKey(): Char;
    class function  ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer): string;
    class function  WrapTextEx(const ALine: string; AMaxCol: Integer; const ABreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
    class procedure Print(const AMsg: string; const AArgs: array of const; const AColor: DWORD=Console.WHITE); overload;
    class procedure Print(const AMsg: string; const AColor: DWORD=Console.WHITE); overload;
    class procedure PrintLn(const AMsg: string; const AArgs: array of const; const AColor: DWORD=Console.WHITE); overload;
    class procedure PrintLn(const AMsg: string; const AColor: DWORD=Console.WHITE); overload;
    class procedure PrintLn(); overload;
    class procedure Print(); overload;
    class procedure Teletype(const AText: string; const AColor: DWORD; const AMargin: Integer; const AMinDelay: Integer; const AMaxDelay: Integer; const ABreakKey: Byte);
  end;

  { FrameLimitTimer }
  FrameLimitTimer = class
  private class var
    FLastTime: Double;
    FTargetTime: Double;
    FCurrentTime: Double;
    FElapsedTime: Double;
    FRemainingTime: Double;
    FLastFPSTime: Double;
    FEndtime: double;
    FFrameCount: Cardinal;
    FFramerate: Cardinal;
    FTargetFrameRate: Cardinal;
  private
    class constructor Create();
    class destructor Destroy();
  public const
    DEFAULT_FPS = 60;
  public
    class procedure Init(const ATargetFrameRate: Cardinal=DEFAULT_FPS); static;
    class function  TargetFrameRate(): Cardinal; static;
    class function  TargetTime(): Double; static;
    class procedure Reset(); static;
    class procedure Start(); static;
    class procedure Stop(); static;
    class function  FrameRate(): Cardinal; static;
  end;

  { TTimer }
  TTimer = record
  private
    FLastTime: Double;
    FInterval: Double;
    FSpeed: Double;
  public
    class operator Initialize (out ADest: TTimer);
    procedure InitMS(const AValue: Double);
    procedure InitFPS(const AValue: Double);
    function Check(): Boolean;
    procedure Reset();
    function  Speed(): Double;
  end;

  { TVector }
  PVector = ^TVector;
  TVector = record
    X,Y,Z,W: Single;
    class operator Initialize (out ADest: TVector);
    constructor Create(const AX, AY: Single);
    procedure Assign(const AX, AY: Single); overload; inline;
    procedure Assign(const AX, AY, AZ: Single); overload;
    procedure Assign(const AX, AY, AZ, AW: Single); overload;
    procedure Assign(AVector: TVector); overload; inline;
    procedure Clear(); inline;
    procedure Add(aVector: TVector); inline;
    procedure Subtract(AVector: TVector); inline;
    procedure Multiply(AVector: TVector); inline;
    procedure Divide(AVector: TVector); inline;
    function  Magnitude(): Single; inline;
    function  MagnitudeTruncate(AMaxMagitude: Single): TVector; inline;
    function  Distance(AVector: TVector): Single; inline;
    procedure Normalize(); inline;
    function  Angle(AVector: TVector): Single; inline;
    procedure Thrust(AAngle: Single; aSpeed: Single); inline;
    function  MagnitudeSquared(): Single; inline;
    function  DotProduct(AVector: TVector): Single; inline;
    procedure ScaleBy(AValue: Single); inline;
    procedure DivideBy(AValue: Single); inline;
    function  Project(AVector: TVector): TVector; inline;
    procedure Negate(); inline;
  end;

  { TPoint }
  PPoint = ^TPoint;
  TPoint = record
    X,Y,Z: Single;
    class operator Initialize (out ADest: TPoint);
    class operator Implicit(AValue: TVector): TPoint;
    constructor Create(const AX, AY, AZ: Single);
  end;

  { TSize }
  PSize = ^TSize;
  TSize = record
    Width, Height: Single;
    class operator Initialize (out ADest: TSize);
  end;

  { TRect }
  PRect = ^TRect;
  TRect = record
    X, Y, Width,Height: Single;
    class operator Initialize (out ADest: TRect);
    constructor Create(const AX, AY, AWidth, AHeight: Single);
    procedure Assign(AX, AY, AWidth, AHeight: Single); inline;
    function  Intersect(ARect: TRect): Boolean; inline;
  end;

  { TExtent }
  PExtent = ^TExtent;
  TExtent = record
    MinX,MinY,MaxX,MaxY: Single;
    class operator Initialize (out ADest: TExtent);
  end;

  { TLineIntersection }
  TLineIntersection = (liNone, liTrue, liParallel);

  { TEaseType }
  TEaseType = (etLinearTween, etInQuad, etOutQuad, etInOutQuad, etInCubic,
    etOutCubic, etInOutCubic, etInQuart, etOutQuart, etInOutQuart, etInQuint,
    etOutQuint, etInOutQuint, etInSine, etOutSine, etInOutSine, etInExpo,
    etOutExpo, etInOutExpo, etInCircle, etOutCircle, etInOutCircle);

  { TlgOBB }
  TlgOBB = record
    Center: TPoint;
    Extents: TPoint;
    Rotation: Single;
  end;

  { TMath }
  Math = class
  public const
    RADTODEG = 180.0 / PI;
    DEGTORAD = PI / 180.0;
    EPSILON  = 0.00001;
    NAN      =  0.0 / 0.0;
  private class var
    FCosTable: array [0..360] of Single;
    FSinTable: array [0..360] of Single;
  public
    class constructor Create();
    class destructor Destroy();
    class function  Point(const X, Y: Single): TPoint;
    class function  Vector(const X, Y: Single): TVector;
    class function  Size(const AWidth, AHeight: Single): TSize;
    class function  Rect(const X, Y, AWidth, AHeight: Single): TRect;
    class function  Extent(const AMinX, AMinY, AMaxX, AMaxY: Single): TExtent;
    class function  AngleCos(const AAngle: Cardinal): Single;
    class function  AngleSin(const AAngle: Cardinal): Single;
    class function  RandomRange(const AMin, AMax: Integer): Integer;
    class function  RandomRangef(const AMin, AMax: Single): Single;
    class function  RandomBool(): Boolean;
    class function  GetRandomSeed(): Integer;
    class procedure SetRandomSeed(const AVaLue: Integer);
    class function  ClipVaLuef(var AVaLue: Single; const AMin, AMax: Single; const AWrap: Boolean): Single;
    class function  ClipVaLue(var AVaLue: Integer; const aMin, AMax: Integer; const AWrap: Boolean): Integer;
    class function  SameSign(const AVaLue1, AVaLue2: Integer): Boolean;
    class function  SameSignf(const AVaLue1, AVaLue2: Single): Boolean;
    class function  SameVaLue(const AA, AB: Double; const AEpsilon: Double = 0): Boolean;
    class function  SameVaLuef(const AA, AB: Single; const AEpsilon: Single = 0): Boolean;
    class function  AngleDiff(const ASrcAngle, ADestAngle: Single): Single;
    class procedure AngleRotatePos(const AAngle: Single; var AX, AY: Single);
    class procedure SmoothMove(var AVaLue: Single; const AAmount, AMax, ADrag: Single);
    class function  Lerp(const AFrom, ATo, ATime: Double): Double;
    class function  PointInRectangle(APoint: TVector; ARect: TRect): Boolean;
    class function  PointInCircle(APoint, ACenter: TVector; ARadius: Single): Boolean;
    class function  PointInTriangle(APoint, AP1, AP2, AP3: TVector): Boolean;
    class function  CirclesOverlap(ACenter1: TVector; ARadius1: Single; ACenter2: TVector; ARadius2: Single): Boolean;
    class function  CircleInRectangle(ACenter: TVector; ARadius: Single; ARect: TRect): Boolean;
    class function  RectanglesOverlap(ARect1: TRect; ARect2: TRect): Boolean;
    class function  RectangleIntersection(ARect1, ARect2: TRect): TRect;
    class function  LineIntersection(AX1, AY1, AX2, AY2, AX3, AY3, AX4, AY4: Integer; var AX: Integer; var AY: Integer): TLineIntersection;
    class function  RadiusOverlap(ARadius1, AX1, AY1, ARadius2, AX2, AY2, AShrinkFactor: Single): Boolean;
    class function  EaseValue(ACurrentTime: Double; AStartValue: Double; AChangeInValue: Double; ADuration: Double; AEaseType: TEaseType): Double;
    class function  EasePosition(AStartPos: Double; AEndPos: Double; ACurrentPos: Double; AEaseType: TEaseType): Double;
    class function  OBBIntersect(const AObbA, AObbB: TlgOBB): Boolean;
    class function  UnitToScalarValue(const AValue, AMaxValue: Double): Double;
  end;

  { TAsyncProc }
  TAsyncProc = reference to procedure;

  { TAsyncThread }
  TAsyncThread = class(TThread)
  protected
    FTask: TAsyncProc;
    FWait: TAsyncProc;
    FFinished: Boolean;
  public
    property TaskProc: TAsyncProc read FTask write FTask;
    property WaitProc: TAsyncProc read FWait write FWait;
    property Finished: Boolean read FFinished;
    constructor Create(); virtual;
    destructor Destroy(); override;
    procedure Execute(); override;
  end;

  { Async }
  Async = class
  private type
    TBusyData = record
      Name: string;
      Thread: Pointer;
      Flag: Boolean;
    end;
  private class var
    FQueue: TList<TAsyncThread>;
    FBusy: TDictionary<string, TBusyData>;
  private
    class constructor Create();
    class destructor Destroy();
  public
    class procedure Clear(); static;
    class procedure Process(); static;
    class procedure Run(const AName: string; const ABackgroundTask: TAsyncProc; const AWaitForgroundTask: TAsyncProc); static;
    class function  Busy(const AName: string): Boolean; static;
    class procedure Suspend(); static;
    class procedure Resume(); static;
    class procedure Enter(); static;
    class procedure Leave(); static;
  end;

  { TVirtualBuffer }
  TVirtualBuffer = class(TCustomMemoryStream)
  protected
    FHandle: THandle;
    FName: string;
    procedure Clear();
  public
    constructor Create(aSize: Cardinal);
    destructor Destroy(); override;
    function Write(const aBuffer; aCount: Longint): Longint; override;
    function Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint; override;
    procedure SaveToFile(aFilename: string);
    property Name: string read FName;
    function  Eob(): Boolean;
    function  ReadString(): string;
    class function LoadFromFile(const aFilename: string): TVirtualBuffer;
  end;

  { TRingBuffer }
  TRingBuffer<T> = class
  private type
    PType = ^T;
  private
    FBuffer: array of T;
    FReadIndex, FWriteIndex, FCapacity: Integer;
  public
    constructor Create(ACapacity: Integer);
    function Write(const AData: array of T; ACount: Integer): Integer;
    function Read(var AData: array of T; ACount: Integer): Integer;
    function DirectReadPointer(ACount: Integer): Pointer;
    function AvailableBytes(): Integer;
    procedure Clear();
  end;

  { TVirtualRingBuffer }
  TVirtualRingBuffer<T> = class
  private type
    PType = ^T;
  private
    FBuffer: TVirtualBuffer;
    FReadIndex, FWriteIndex, FCapacity: Integer;
    function GetArrayValue(AIndex: Integer): T;
    procedure SetArrayValue(AIndex: Integer; AValue: T);
  public
    constructor Create(ACapacity: Integer);
    destructor Destroy; override;
    function Write(const AData: array of T; ACount: Integer): Integer;
    function Read(var AData: array of T; ACount: Integer): Integer;
    function DirectReadPointer(ACount: Integer): Pointer;
    function AvailableBytes(): Integer;
    procedure Clear();
  end;

type
  { TIOMode }
  TIOMode = (iomRead, iomWrite);

  { TIO }
  PIO = ^TIO;
  TIO = class(TBaseObject)
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Opened(): Boolean; virtual;
    procedure Close(); virtual;
    function  Size(): Int64; virtual;
    function  Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64; virtual;
    function  Read(const AData: Pointer; const ASize: Int64): Int64; virtual;
    function  Write(const AData: Pointer; const ASize: Int64): Int64; virtual;
    function  Tell(): Int64; virtual;
    function  Eos(): Boolean; virtual;
  end;

  { TMemoryIO }
  TMemoryIO = class(TIO)
  protected
    FHandle: TMemoryStream;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Duplicate(): TIO; virtual;
    function  Opened(): Boolean; override;
    procedure Close(); override;
    function  Size(): Int64; override;
    function  Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64; override;
    function  Read(const AData: Pointer; const ASize: Int64): Int64; override;
    function  Write(const AData: Pointer; const ASize: Int64): Int64; override;
    function  Tell(): Int64; override;
    function  Eos(): Boolean; override;
    function  Memory(): Pointer; virtual;
    class function Open(const ASize: Int64): TMemoryIO; overload;
    class function Open(const AFilename: string): TMemoryIO; overload;
    class function Open(const AData: Pointer; ASize: Int64): TMemoryIO; overload;
  end;

  { TFileIO }
  TFileIO = class(TIO)
  protected
    FHandle: TFileStream;
    FMode: TIOMode;
    function DoOpen(const AFilename: string; const AMode: TIOMode): Boolean;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Opened(): Boolean; override;
    procedure Close(); override;
    function  Size(): Int64; override;
    function  Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64; override;
    function  Read(const AData: Pointer; const ASize: Int64): Int64; override;
    function  Write(const AData: Pointer; const ASize: Int64): Int64; override;
    function  Tell(): Int64; override;
    function  Eos(): Boolean; override;
    class function Open(const AFilename: string; const AMode: TIOMode): TFileIO;
  end;

  { TZipFileIO }
  TZipFileIO = class(TIO)
  protected
    FHandle: unzFile;
    FPassword: AnsiString;
    FFilename: AnsiString;
    function DoOpen(const AZipFilename, AFilename: string; const APassword: string): Boolean;
  public const
    DEFAULT_PASSWORD = 'N^TpjE5/*czG,<ns>$}w;?x_uBm9[JSr{(+FRv7ZW@C-gd3D!PRUgWE4P2/wpm9-dt^Y?e)Az+xsMb@jH"!X`B3ar(yq=nZ_~85<';
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Opened(): Boolean; override;
    procedure Close(); override;
    function  Size(): Int64; override;
    function  Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64; override;
    function  Read(const AData: Pointer; const ASize: Int64): Int64; override;
    function  Write(const AData: Pointer; const ASize: Int64): Int64; override;
    function  Tell(): Int64; override;
    function  Eos(): Boolean; override;
    class function Open(const AZipFilename, AFilename: string; const APassword: string=DEFAULT_PASSWORD): TZipFileIO;
  end;

  { TZipFile }
  TZipFile = class(TBaseObject)
  protected
    FZipFilename: string;
    FPassword: string;
    FIsOpen: Boolean;
  public type
    BuildProgress = procedure(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean);
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Open(const AZipFilename: string; const APassword: string=TZipFileIO.DEFAULT_PASSWORD): Boolean;
    function  IsOpen(): Boolean;
    procedure Close();
    function  OpenFile(const AFilename: string): TZipFileIO;
    function  OpenFileToStream(const AFilename: string): TStream;
    class function Init(const AZipFilename: string; const APassword: string=TZipFileIO.DEFAULT_PASSWORD): TZipFile;
    class function Build(const AZipFilename, ADirectoryName: string; const ASender: Pointer; const AHandler: BuildProgress; const APassword: string=TZipFileIO.DEFAULT_PASSWORD): Boolean;
  end;

  { TMaVFS }
  PMaVFS = ^TMaVFS;
  TMaVFS = record
  private
    Callbacks: ma_vfs_callbacks;
    IO: TIO;
  public
    constructor Create(const AIO: TIO);
  end;

  { Audio }
  Audio = class
  public const
    ERROR           = -1;
    MUSIC_COUNT     = 256;
    SOUND_COUNT     = 256;
    CHANNEL_COUNT   = 16;
    CHANNEL_DYNAMIC = -2;

  protected type
    TMusic = record
      Handle: ma_sound;
      Loaded: Boolean;
      Volume: Single;
      Pan: Single;
    end;
    TSound = record
      Handle: ma_sound;
      InUse: Boolean;
    end;
    TChannel = record
      Handle: ma_sound;
      Reserved: Boolean;
      InUse: Boolean;
      Volume: Single;
    end;
  protected class var
    FVFS: TMaVFS;
    FEngineConfig: ma_engine_config;
    FEngine: ma_engine;
    FOpened: Boolean;
    FPaused: Boolean;
    FMusic: TMusic;
    snd1,snd2,snd3: ma_sound;
    FSound: array[0..SOUND_COUNT-1] of TSound;
    FChannel: array[0..CHANNEL_COUNT-1] of TChannel;
  protected
    class function FindFreeSoundSlot(): Integer;
    class function FindFreeChannelSlot(): Integer;
    class function ValidChannel(const AChannel: Integer): Boolean;
    class procedure InitData();
    class constructor Create();
    class destructor Destroy();
    class procedure Update();
  public
    class function  Open(): Boolean;
    class procedure Close();
    class function  Opened(): Boolean;
    class function  GetPause(): Boolean;
    class procedure SetPause(const APause: Boolean);
    class function  PlayMusic(const AIO: TIO; const AVolume: Single; const ALoop: Boolean; const APan: Single=0.0): Boolean;
    class function  PlayMusicFromFile(const AFilename: string; const AVolume: Single; const ALoop: Boolean; const APan: Single=0.0): Boolean;
    class function  PlayMusicFromZipFile(const AZipFile: TZipFile; const AFilename: string; const AVolume: Single; const ALoop: Boolean; const APan: Single=0.0): Boolean;
    class procedure UnloadMusic();
    class function  GetMusicLoop(): Boolean;
    class procedure SetMusicLoop(const ALoop: Boolean);
    class function  GetMusicVolume(): Single;
    class procedure SetMusicVolume(const AVolume: Single);
    class function  GetMusicPan(): Single;
    class procedure SetMusicPan(const APan: Single);
    class function  LoadSound(const AIO: TIO): Integer;
    class function  LoadSoundFromFile(const AFilename: string): Integer;
    class function  LoadSoundFromZipFile(const AZipFile: TZipFile; const AFilename: string): Integer;
    class procedure UnloadSound(var aSound: Integer);
    class procedure UnloadAllSounds();
    class function  PlaySound(const aSound, aChannel: Integer; const AVolume: Single; const ALoop: Boolean): Integer;
    class procedure ReserveChannel(const aChannel: Integer; const aReserve: Boolean);
    class procedure StopChannel(const aChannel: Integer);
    class procedure SetChannelVolume(const aChannel: Integer; const AVolume: Single);
    class function  GetChannelVolume(const aChannel: Integer): Single;
    class procedure SetChannelPosition(const aChannel: Integer; const aX, aY: Single);
    class procedure SetChannelLoop(const aChannel: Integer; const ALoop: Boolean);
    class function  GetchannelLoop(const aChannel: Integer): Boolean;
    class function  GetChannelPlaying(const aChannel: Integer): Boolean;
  end;

  { TColor }
  PColor = ^TColor;
  TColor = record
    Red,Green,Blue,Alpha: Single;
    function Make(const ARed, AGreen, ABlue, AAlpha: Byte): TColor; overload;
    function Make(const ARed, AGreen, ABlue, AAlpha: Single): TColor; overload;
    function Fade(const ATo: TColor; const APos: Single): TColor;
    function Equal(AColor: TColor): Boolean;
  end;

{$REGION 'Common Colors'}
const
  ALICEBLUE           : TColor = (Red:$F0/$FF; Green:$F8/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  ANTIQUEWHITE        : TColor = (Red:$FA/$FF; Green:$EB/$FF; Blue:$D7/$FF; Alpha:$FF/$FF);
  AQUA                : TColor = (Red:$00/$FF; Green:$FF/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  AQUAMARINE          : TColor = (Red:$7F/$FF; Green:$FF/$FF; Blue:$D4/$FF; Alpha:$FF/$FF);
  AZURE               : TColor = (Red:$F0/$FF; Green:$FF/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  BEIGE               : TColor = (Red:$F5/$FF; Green:$F5/$FF; Blue:$DC/$FF; Alpha:$FF/$FF);
  BISQUE              : TColor = (Red:$FF/$FF; Green:$E4/$FF; Blue:$C4/$FF; Alpha:$FF/$FF);
  BLACK               : TColor = (Red:$00/$FF; Green:$00/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  BLANCHEDALMOND      : TColor = (Red:$FF/$FF; Green:$EB/$FF; Blue:$CD/$FF; Alpha:$FF/$FF);
  BLUE                : TColor = (Red:$00/$FF; Green:$00/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  BLUEVIOLET          : TColor = (Red:$8A/$FF; Green:$2B/$FF; Blue:$E2/$FF; Alpha:$FF/$FF);
  BROWN               : TColor = (Red:$A5/$FF; Green:$2A/$FF; Blue:$2A/$FF; Alpha:$FF/$FF);
  BURLYWOOD           : TColor = (Red:$DE/$FF; Green:$B8/$FF; Blue:$87/$FF; Alpha:$FF/$FF);
  CADETBLUE           : TColor = (Red:$5F/$FF; Green:$9E/$FF; Blue:$A0/$FF; Alpha:$FF/$FF);
  CHARTREUSE          : TColor = (Red:$7F/$FF; Green:$FF/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  CHOCOLATE           : TColor = (Red:$D2/$FF; Green:$69/$FF; Blue:$1E/$FF; Alpha:$FF/$FF);
  CORAL               : TColor = (Red:$FF/$FF; Green:$7F/$FF; Blue:$50/$FF; Alpha:$FF/$FF);
  CORNFLOWERBLUE      : TColor = (Red:$64/$FF; Green:$95/$FF; Blue:$ED/$FF; Alpha:$FF/$FF);
  CORNSILK            : TColor = (Red:$FF/$FF; Green:$F8/$FF; Blue:$DC/$FF; Alpha:$FF/$FF);
  CRIMSON             : TColor = (Red:$DC/$FF; Green:$14/$FF; Blue:$3C/$FF; Alpha:$FF/$FF);
  CYAN                : TColor = (Red:$00/$FF; Green:$FF/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  DARKBLUE            : TColor = (Red:$00/$FF; Green:$00/$FF; Blue:$8B/$FF; Alpha:$FF/$FF);
  DARKCYAN            : TColor = (Red:$00/$FF; Green:$8B/$FF; Blue:$8B/$FF; Alpha:$FF/$FF);
  DARKGOLDENROD       : TColor = (Red:$B8/$FF; Green:$86/$FF; Blue:$0B/$FF; Alpha:$FF/$FF);
  DARKGRAY            : TColor = (Red:$A9/$FF; Green:$A9/$FF; Blue:$A9/$FF; Alpha:$FF/$FF);
  DARKGREEN           : TColor = (Red:$00/$FF; Green:$64/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  DARKGREY            : TColor = (Red:$A9/$FF; Green:$A9/$FF; Blue:$A9/$FF; Alpha:$FF/$FF);
  DARKKHAKI           : TColor = (Red:$BD/$FF; Green:$B7/$FF; Blue:$6B/$FF; Alpha:$FF/$FF);
  DARKMAGENTA         : TColor = (Red:$8B/$FF; Green:$00/$FF; Blue:$8B/$FF; Alpha:$FF/$FF);
  DARKOLIVEGREEN      : TColor = (Red:$55/$FF; Green:$6B/$FF; Blue:$2F/$FF; Alpha:$FF/$FF);
  DARKORANGE          : TColor = (Red:$FF/$FF; Green:$8C/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  DARKORCHID          : TColor = (Red:$99/$FF; Green:$32/$FF; Blue:$CC/$FF; Alpha:$FF/$FF);
  DARKRED             : TColor = (Red:$8B/$FF; Green:$00/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  DARKSALMON          : TColor = (Red:$E9/$FF; Green:$96/$FF; Blue:$7A/$FF; Alpha:$FF/$FF);
  DARKSEAGREEN        : TColor = (Red:$8F/$FF; Green:$BC/$FF; Blue:$8F/$FF; Alpha:$FF/$FF);
  DARKSLATEBLUE       : TColor = (Red:$48/$FF; Green:$3D/$FF; Blue:$8B/$FF; Alpha:$FF/$FF);
  DARKSLATEGRAY       : TColor = (Red:$2F/$FF; Green:$4F/$FF; Blue:$4F/$FF; Alpha:$FF/$FF);
  DARKSLATEGREY       : TColor = (Red:$2F/$FF; Green:$4F/$FF; Blue:$4F/$FF; Alpha:$FF/$FF);
  DARKTURQUOISE       : TColor = (Red:$00/$FF; Green:$CE/$FF; Blue:$D1/$FF; Alpha:$FF/$FF);
  DARKVIOLET          : TColor = (Red:$94/$FF; Green:$00/$FF; Blue:$D3/$FF; Alpha:$FF/$FF);
  DEEPPINK            : TColor = (Red:$FF/$FF; Green:$14/$FF; Blue:$93/$FF; Alpha:$FF/$FF);
  DEEPSKYBLUE         : TColor = (Red:$00/$FF; Green:$BF/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  DIMGRAY             : TColor = (Red:$69/$FF; Green:$69/$FF; Blue:$69/$FF; Alpha:$FF/$FF);
  DIMGREY             : TColor = (Red:$69/$FF; Green:$69/$FF; Blue:$69/$FF; Alpha:$FF/$FF);
  DODGERBLUE          : TColor = (Red:$1E/$FF; Green:$90/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  FIREBRICK           : TColor = (Red:$B2/$FF; Green:$22/$FF; Blue:$22/$FF; Alpha:$FF/$FF);
  FLORALWHITE         : TColor = (Red:$FF/$FF; Green:$FA/$FF; Blue:$F0/$FF; Alpha:$FF/$FF);
  FORESTGREEN         : TColor = (Red:$22/$FF; Green:$8B/$FF; Blue:$22/$FF; Alpha:$FF/$FF);
  FUCHSIA             : TColor = (Red:$FF/$FF; Green:$00/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  GAINSBORO           : TColor = (Red:$DC/$FF; Green:$DC/$FF; Blue:$DC/$FF; Alpha:$FF/$FF);
  GHOSTWHITE          : TColor = (Red:$F8/$FF; Green:$F8/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  GOLD                : TColor = (Red:$FF/$FF; Green:$D7/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  GOLDENROD           : TColor = (Red:$DA/$FF; Green:$A5/$FF; Blue:$20/$FF; Alpha:$FF/$FF);
  GRAY                : TColor = (Red:$80/$FF; Green:$80/$FF; Blue:$80/$FF; Alpha:$FF/$FF);
  GREEN               : TColor = (Red:$00/$FF; Green:$80/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  GREENYELLOW         : TColor = (Red:$AD/$FF; Green:$FF/$FF; Blue:$2F/$FF; Alpha:$FF/$FF);
  GREY                : TColor = (Red:$80/$FF; Green:$80/$FF; Blue:$80/$FF; Alpha:$FF/$FF);
  HONEYDEW            : TColor = (Red:$F0/$FF; Green:$FF/$FF; Blue:$F0/$FF; Alpha:$FF/$FF);
  HOTPINK             : TColor = (Red:$FF/$FF; Green:$69/$FF; Blue:$B4/$FF; Alpha:$FF/$FF);
  INDIANRED           : TColor = (Red:$CD/$FF; Green:$5C/$FF; Blue:$5C/$FF; Alpha:$FF/$FF);
  INDIGO              : TColor = (Red:$4B/$FF; Green:$00/$FF; Blue:$82/$FF; Alpha:$FF/$FF);
  IVORY               : TColor = (Red:$FF/$FF; Green:$FF/$FF; Blue:$F0/$FF; Alpha:$FF/$FF);
  KHAKI               : TColor = (Red:$F0/$FF; Green:$E6/$FF; Blue:$8C/$FF; Alpha:$FF/$FF);
  LAVENDER            : TColor = (Red:$E6/$FF; Green:$E6/$FF; Blue:$FA/$FF; Alpha:$FF/$FF);
  LAVENDERBLUSH       : TColor = (Red:$FF/$FF; Green:$F0/$FF; Blue:$F5/$FF; Alpha:$FF/$FF);
  LAWNGREEN           : TColor = (Red:$7C/$FF; Green:$FC/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  LEMONCHIFFON        : TColor = (Red:$FF/$FF; Green:$FA/$FF; Blue:$CD/$FF; Alpha:$FF/$FF);
  LIGHTBLUE           : TColor = (Red:$AD/$FF; Green:$D8/$FF; Blue:$E6/$FF; Alpha:$FF/$FF);
  LIGHTCORAL          : TColor = (Red:$F0/$FF; Green:$80/$FF; Blue:$80/$FF; Alpha:$FF/$FF);
  LIGHTCYAN           : TColor = (Red:$E0/$FF; Green:$FF/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  LIGHTGOLDENRODYELLOW: TColor = (Red:$FA/$FF; Green:$FA/$FF; Blue:$D2/$FF; Alpha:$FF/$FF);
  LIGHTGRAY           : TColor = (Red:$D3/$FF; Green:$D3/$FF; Blue:$D3/$FF; Alpha:$FF/$FF);
  LIGHTGREEN          : TColor = (Red:$90/$FF; Green:$EE/$FF; Blue:$90/$FF; Alpha:$FF/$FF);
  LIGHTGREY           : TColor = (Red:$D3/$FF; Green:$D3/$FF; Blue:$D3/$FF; Alpha:$FF/$FF);
  LIGHTPINK           : TColor = (Red:$FF/$FF; Green:$B6/$FF; Blue:$C1/$FF; Alpha:$FF/$FF);
  LIGHTSALMON         : TColor = (Red:$FF/$FF; Green:$A0/$FF; Blue:$7A/$FF; Alpha:$FF/$FF);
  LIGHTSEAGREEN       : TColor = (Red:$20/$FF; Green:$B2/$FF; Blue:$AA/$FF; Alpha:$FF/$FF);
  LIGHTSKYBLUE        : TColor = (Red:$87/$FF; Green:$CE/$FF; Blue:$FA/$FF; Alpha:$FF/$FF);
  LIGHTSLATEGRAY      : TColor = (Red:$77/$FF; Green:$88/$FF; Blue:$99/$FF; Alpha:$FF/$FF);
  LIGHTSLATEGREY      : TColor = (Red:$77/$FF; Green:$88/$FF; Blue:$99/$FF; Alpha:$FF/$FF);
  LIGHTSTEELBLUE      : TColor = (Red:$B0/$FF; Green:$C4/$FF; Blue:$DE/$FF; Alpha:$FF/$FF);
  LIGHTYELLOW         : TColor = (Red:$FF/$FF; Green:$FF/$FF; Blue:$E0/$FF; Alpha:$FF/$FF);
  LIME                : TColor = (Red:$00/$FF; Green:$FF/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  LIMEGREEN           : TColor = (Red:$32/$FF; Green:$CD/$FF; Blue:$32/$FF; Alpha:$FF/$FF);
  LINEN               : TColor = (Red:$FA/$FF; Green:$F0/$FF; Blue:$E6/$FF; Alpha:$FF/$FF);
  MAGENTA             : TColor = (Red:$FF/$FF; Green:$00/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  MAROON              : TColor = (Red:$80/$FF; Green:$00/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  MEDIUMAQUAMARINE    : TColor = (Red:$66/$FF; Green:$CD/$FF; Blue:$AA/$FF; Alpha:$FF/$FF);
  MEDIUMBLUE          : TColor = (Red:$00/$FF; Green:$00/$FF; Blue:$CD/$FF; Alpha:$FF/$FF);
  MEDIUMORCHID        : TColor = (Red:$BA/$FF; Green:$55/$FF; Blue:$D3/$FF; Alpha:$FF/$FF);
  MEDIUMPURPLE        : TColor = (Red:$93/$FF; Green:$70/$FF; Blue:$DB/$FF; Alpha:$FF/$FF);
  MEDIUMSEAGREEN      : TColor = (Red:$3C/$FF; Green:$B3/$FF; Blue:$71/$FF; Alpha:$FF/$FF);
  MEDIUMSLATEBLUE     : TColor = (Red:$7B/$FF; Green:$68/$FF; Blue:$EE/$FF; Alpha:$FF/$FF);
  MEDIUMSPRINGGREEN   : TColor = (Red:$00/$FF; Green:$FA/$FF; Blue:$9A/$FF; Alpha:$FF/$FF);
  MEDIUMTURQUOISE     : TColor = (Red:$48/$FF; Green:$D1/$FF; Blue:$CC/$FF; Alpha:$FF/$FF);
  MEDIUMVIOLETRED     : TColor = (Red:$C7/$FF; Green:$15/$FF; Blue:$85/$FF; Alpha:$FF/$FF);
  MIDNIGHTBLUE        : TColor = (Red:$19/$FF; Green:$19/$FF; Blue:$70/$FF; Alpha:$FF/$FF);
  MINTCREAM           : TColor = (Red:$F5/$FF; Green:$FF/$FF; Blue:$FA/$FF; Alpha:$FF/$FF);
  MISTYROSE           : TColor = (Red:$FF/$FF; Green:$E4/$FF; Blue:$E1/$FF; Alpha:$FF/$FF);
  MOCCASIN            : TColor = (Red:$FF/$FF; Green:$E4/$FF; Blue:$B5/$FF; Alpha:$FF/$FF);
  NAVAJOWHITE         : TColor = (Red:$FF/$FF; Green:$DE/$FF; Blue:$AD/$FF; Alpha:$FF/$FF);
  NAVY                : TColor = (Red:$00/$FF; Green:$00/$FF; Blue:$80/$FF; Alpha:$FF/$FF);
  OLDLACE             : TColor = (Red:$FD/$FF; Green:$F5/$FF; Blue:$E6/$FF; Alpha:$FF/$FF);
  OLIVE               : TColor = (Red:$80/$FF; Green:$80/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  OLIVEDRAB           : TColor = (Red:$6B/$FF; Green:$8E/$FF; Blue:$23/$FF; Alpha:$FF/$FF);
  ORANGE              : TColor = (Red:$FF/$FF; Green:$A5/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  ORANGERED           : TColor = (Red:$FF/$FF; Green:$45/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  ORCHID              : TColor = (Red:$DA/$FF; Green:$70/$FF; Blue:$D6/$FF; Alpha:$FF/$FF);
  PALEGOLDENROD       : TColor = (Red:$EE/$FF; Green:$E8/$FF; Blue:$AA/$FF; Alpha:$FF/$FF);
  PALEGREEN           : TColor = (Red:$98/$FF; Green:$FB/$FF; Blue:$98/$FF; Alpha:$FF/$FF);
  PALETURQUOISE       : TColor = (Red:$AF/$FF; Green:$EE/$FF; Blue:$EE/$FF; Alpha:$FF/$FF);
  PALEVIOLETRED       : TColor = (Red:$DB/$FF; Green:$70/$FF; Blue:$93/$FF; Alpha:$FF/$FF);
  PAPAYAWHIP          : TColor = (Red:$FF/$FF; Green:$EF/$FF; Blue:$D5/$FF; Alpha:$FF/$FF);
  PEACHPUFF           : TColor = (Red:$FF/$FF; Green:$DA/$FF; Blue:$B9/$FF; Alpha:$FF/$FF);
  PERU                : TColor = (Red:$CD/$FF; Green:$85/$FF; Blue:$3F/$FF; Alpha:$FF/$FF);
  PINK                : TColor = (Red:$FF/$FF; Green:$C0/$FF; Blue:$CB/$FF; Alpha:$FF/$FF);
  PLUM                : TColor = (Red:$DD/$FF; Green:$A0/$FF; Blue:$DD/$FF; Alpha:$FF/$FF);
  POWDERBLUE          : TColor = (Red:$B0/$FF; Green:$E0/$FF; Blue:$E6/$FF; Alpha:$FF/$FF);
  PURPLE              : TColor = (Red:$80/$FF; Green:$00/$FF; Blue:$80/$FF; Alpha:$FF/$FF);
  REBECCAPURPLE       : TColor = (Red:$66/$FF; Green:$33/$FF; Blue:$99/$FF; Alpha:$FF/$FF);
  RED                 : TColor = (Red:$FF/$FF; Green:$00/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  ROSYBROWN           : TColor = (Red:$BC/$FF; Green:$8F/$FF; Blue:$8F/$FF; Alpha:$FF/$FF);
  ROYALBLUE           : TColor = (Red:$41/$FF; Green:$69/$FF; Blue:$E1/$FF; Alpha:$FF/$FF);
  SADDLEBROWN         : TColor = (Red:$8B/$FF; Green:$45/$FF; Blue:$13/$FF; Alpha:$FF/$FF);
  SALMON              : TColor = (Red:$FA/$FF; Green:$80/$FF; Blue:$72/$FF; Alpha:$FF/$FF);
  SANDYBROWN          : TColor = (Red:$F4/$FF; Green:$A4/$FF; Blue:$60/$FF; Alpha:$FF/$FF);
  SEAGREEN            : TColor = (Red:$2E/$FF; Green:$8B/$FF; Blue:$57/$FF; Alpha:$FF/$FF);
  SEASHELL            : TColor = (Red:$FF/$FF; Green:$F5/$FF; Blue:$EE/$FF; Alpha:$FF/$FF);
  SIENNA              : TColor = (Red:$A0/$FF; Green:$52/$FF; Blue:$2D/$FF; Alpha:$FF/$FF);
  SILVER              : TColor = (Red:$C0/$FF; Green:$C0/$FF; Blue:$C0/$FF; Alpha:$FF/$FF);
  SKYBLUE             : TColor = (Red:$87/$FF; Green:$CE/$FF; Blue:$EB/$FF; Alpha:$FF/$FF);
  SLATEBLUE           : TColor = (Red:$6A/$FF; Green:$5A/$FF; Blue:$CD/$FF; Alpha:$FF/$FF);
  SLATEGRAY           : TColor = (Red:$70/$FF; Green:$80/$FF; Blue:$90/$FF; Alpha:$FF/$FF);
  SLATEGREY           : TColor = (Red:$70/$FF; Green:$80/$FF; Blue:$90/$FF; Alpha:$FF/$FF);
  SNOW                : TColor = (Red:$FF/$FF; Green:$FA/$FF; Blue:$FA/$FF; Alpha:$FF/$FF);
  SPRINGGREEN         : TColor = (Red:$00/$FF; Green:$FF/$FF; Blue:$7F/$FF; Alpha:$FF/$FF);
  STEELBLUE           : TColor = (Red:$46/$FF; Green:$82/$FF; Blue:$B4/$FF; Alpha:$FF/$FF);
  TAN                 : TColor = (Red:$D2/$FF; Green:$B4/$FF; Blue:$8C/$FF; Alpha:$FF/$FF);
  TEAL                : TColor = (Red:$00/$FF; Green:$80/$FF; Blue:$80/$FF; Alpha:$FF/$FF);
  THISTLE             : TColor = (Red:$D8/$FF; Green:$BF/$FF; Blue:$D8/$FF; Alpha:$FF/$FF);
  TOMATO              : TColor = (Red:$FF/$FF; Green:$63/$FF; Blue:$47/$FF; Alpha:$FF/$FF);
  TURQUOISE           : TColor = (Red:$40/$FF; Green:$E0/$FF; Blue:$D0/$FF; Alpha:$FF/$FF);
  VIOLET              : TColor = (Red:$EE/$FF; Green:$82/$FF; Blue:$EE/$FF; Alpha:$FF/$FF);
  WHEAT               : TColor = (Red:$F5/$FF; Green:$DE/$FF; Blue:$B3/$FF; Alpha:$FF/$FF);
  WHITE               : TColor = (Red:$FF/$FF; Green:$FF/$FF; Blue:$FF/$FF; Alpha:$FF/$FF);
  WHITESMOKE          : TColor = (Red:$F5/$FF; Green:$F5/$FF; Blue:$F5/$FF; Alpha:$FF/$FF);
  YELLOW              : TColor = (Red:$FF/$FF; Green:$FF/$FF; Blue:$00/$FF; Alpha:$FF/$FF);
  YELLOWGREEN         : TColor = (Red:$9A/$FF; Green:$CD/$FF; Blue:$32/$FF; Alpha:$FF/$FF);
  BLANK               : TColor = (Red:$00;     Green:$00;     Blue:$00;     Alpha:$00);
  WHITE2              : TColor = (Red:$F5/$FF; Green:$F5/$FF; Blue:$F5/$FF; Alpha:$FF/$FF);
  RED22               : TColor = (Red:$7E/$FF; Green:$32/$FF; Blue:$3F/$FF; Alpha:255/$FF);
  COLORKEY            : TColor = (Red:$FF/$FF; Green:$00;     Blue:$FF/$FF; Alpha:$FF/$FF);
  OVERLAY1            : TColor = (Red:$00/$FF; Green:$20/$FF; Blue:$29/$FF; Alpha:$B4/$FF);
  OVERLAY2            : TColor = (Red:$01/$FF; Green:$1B/$FF; Blue:$01/$FF; Alpha:255/$FF);
  DIMWHITE            : TColor = (Red:$10/$FF; Green:$10/$FF; Blue:$10/$FF; Alpha:$10/$FF);
  DARKSLATEBROWN      : TColor = (Red:30/255; Green:31/255; Blue:30/255; Alpha:1/255);
{$ENDREGION}

{$REGION ' Key Codes '}
const
  KEY_UNKNOWN = -1;
  KEY_SPACE = 32;
  KEY_APOSTROPHE = 39;
  KEY_COMMA = 44;
  KEY_MINUS = 45;
  KEY_PERIOD = 46;
  KEY_SLASH = 47;
  KEY_0 = 48;
  KEY_1 = 49;
  KEY_2 = 50;
  KEY_3 = 51;
  KEY_4 = 52;
  KEY_5 = 53;
  KEY_6 = 54;
  KEY_7 = 55;
  KEY_8 = 56;
  KEY_9 = 57;
  KEY_SEMICOLON = 59;
  KEY_EQUAL = 61;
  KEY_A = 65;
  KEY_B = 66;
  KEY_C = 67;
  KEY_D = 68;
  KEY_E = 69;
  KEY_F = 70;
  KEY_G = 71;
  KEY_H = 72;
  KEY_I = 73;
  KEY_J = 74;
  KEY_K = 75;
  KEY_L = 76;
  KEY_M = 77;
  KEY_N = 78;
  KEY_O = 79;
  KEY_P = 80;
  KEY_Q = 81;
  KEY_R = 82;
  KEY_S = 83;
  KEY_T = 84;
  KEY_U = 85;
  KEY_V = 86;
  KEY_W = 87;
  KEY_X = 88;
  KEY_Y = 89;
  KEY_Z = 90;
  KEY_LEFT_BRACKET = 91;
  KEY_BACKSLASH = 92;
  KEY_RIGHT_BRACKET = 93;
  KEY_GRAVE_ACCENT = 96;
  KEY_WORLD_1 = 161;
  KEY_WORLD_2 = 162;
  KEY_ESCAPE = 256;
  KEY_ENTER = 257;
  KEY_TAB = 258;
  KEY_BACKSPACE = 259;
  KEY_INSERT = 260;
  KEY_DELETE = 261;
  KEY_RIGHT = 262;
  KEY_LEFT = 263;
  KEY_DOWN = 264;
  KEY_UP = 265;
  KEY_PAGE_UP = 266;
  KEY_PAGE_DOWN = 267;
  KEY_HOME = 268;
  KEY_END = 269;
  KEY_CAPS_LOCK = 280;
  KEY_SCROLL_LOCK = 281;
  KEY_NUM_LOCK = 282;
  KEY_PRINT_SCREEN = 283;
  KEY_PAUSE = 284;
  KEY_F1 = 290;
  KEY_F2 = 291;
  KEY_F3 = 292;
  KEY_F4 = 293;
  KEY_F5 = 294;
  KEY_F6 = 295;
  KEY_F7 = 296;
  KEY_F8 = 297;
  KEY_F9 = 298;
  KEY_F10 = 299;
  KEY_F11 = 300;
  KEY_F12 = 301;
  KEY_F13 = 302;
  KEY_F14 = 303;
  KEY_F15 = 304;
  KEY_F16 = 305;
  KEY_F17 = 306;
  KEY_F18 = 307;
  KEY_F19 = 308;
  KEY_F20 = 309;
  KEY_F21 = 310;
  KEY_F22 = 311;
  KEY_F23 = 312;
  KEY_F24 = 313;
  KEY_F25 = 314;
  KEY_KP_0 = 320;
  KEY_KP_1 = 321;
  KEY_KP_2 = 322;
  KEY_KP_3 = 323;
  KEY_KP_4 = 324;
  KEY_KP_5 = 325;
  KEY_KP_6 = 326;
  KEY_KP_7 = 327;
  KEY_KP_8 = 328;
  KEY_KP_9 = 329;
  KEY_KP_DECIMAL = 330;
  KEY_KP_DIVIDE = 331;
  KEY_KP_MULTIPLY = 332;
  KEY_KP_SUBTRACT = 333;
  KEY_KP_ADD = 334;
  KEY_KP_ENTER = 335;
  KEY_KP_EQUAL = 336;
  KEY_LEFT_SHIFT = 340;
  KEY_LEFT_CONTROL = 341;
  KEY_LEFT_ALT = 342;
  KEY_LEFT_SUPER = 343;
  KEY_RIGHT_SHIFT = 344;
  KEY_RIGHT_CONTROL = 345;
  KEY_RIGHT_ALT = 346;
  KEY_RIGHT_SUPER = 347;
  KEY_MENU = 348;
  KEY_LAST = KEY_MENU;
{$ENDREGION}

{$REGION ' Mouse Buttons '}
const
  MOUSE_BUTTON_1 = 0;
  MOUSE_BUTTON_2 = 1;
  MOUSE_BUTTON_3 = 2;
  MOUSE_BUTTON_4 = 3;
  MOUSE_BUTTON_5 = 4;
  MOUSE_BUTTON_6 = 5;
  MOUSE_BUTTON_7 = 6;
  MOUSE_BUTTON_8 = 7;
  MOUSE_BUTTON_LAST = GLFW_MOUSE_BUTTON_8;
  MOUSE_BUTTON_LEFT = GLFW_MOUSE_BUTTON_1;
  MOUSE_BUTTON_RIGHT = GLFW_MOUSE_BUTTON_2;
  MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3;
{$ENDREGION}

{$REGION ' Gamepads '}
const
  GAMEPAD_1 = 0;
  GAMEPAD_2 = 1;
  GAMEPAD_3 = 2;
  GAMEPAD_4 = 3;
  GAMEPAD_5 = 4;
  GAMEPAD_6 = 5;
  GAMEPAD_7 = 6;
  GAMEPAD_8 = 7;
  GAMEPAD_9 = 8;
  GAMEPAD_10 = 9;
  GAMEPAD_11 = 10;
  GAMEPAD_12 = 11;
  GAMEPAD_13 = 12;
  GAMEPAD_14 = 13;
  GAMEPAD_15 = 14;
  GAMEPAD_16 = 15;
  GAMEPAD_LAST = GAMEPAD_16;
{$ENDREGION}

{$REGION ' Gamepad Buttons '}
const
  GAMEPAD_BUTTON_A = 0;
  GAMEPAD_BUTTON_B = 1;
  GAMEPAD_BUTTON_X = 2;
  GAMEPAD_BUTTON_Y = 3;
  GAMEPAD_BUTTON_LEFT_BUMPER = 4;
  GAMEPAD_BUTTON_RIGHT_BUMPER = 5;
  GAMEPAD_BUTTON_BACK = 6;
  GAMEPAD_BUTTON_START = 7;
  GAMEPAD_BUTTON_GUIDE = 8;
  GAMEPAD_BUTTON_LEFT_THUMB = 9;
  GAMEPAD_BUTTON_RIGHT_THUMB = 10;
  GAMEPAD_BUTTON_DPAD_UP = 11;
  GAMEPAD_BUTTON_DPAD_RIGHT = 12;
  GAMEPAD_BUTTON_DPAD_DOWN = 13;
  GAMEPAD_BUTTON_DPAD_LEFT = 14;
  GAMEPAD_BUTTON_LAST = GAMEPAD_BUTTON_DPAD_LEFT;
  GAMEPAD_BUTTON_CROSS = GAMEPAD_BUTTON_A;
  GAMEPAD_BUTTON_CIRCLE = GAMEPAD_BUTTON_B;
  GAMEPAD_BUTTON_SQUARE = GAMEPAD_BUTTON_X;
  GAMEPAD_BUTTON_TRIANGLE = GAMEPAD_BUTTON_Y;
{$ENDREGION}

{$REGiON ' Gamepad Axis '}
const
  GAMEPAD_AXIS_LEFT_X = 0;
  GAMEPAD_AXIS_LEFT_Y = 1;
  GAMEPAD_AXIS_RIGHT_X = 2;
  GAMEPAD_AXIS_RIGHT_Y = 3;
  GAMEPAD_AXIS_LEFT_TRIGGER = 4;
  GAMEPAD_AXIS_RIGHT_TRIGGER = 5;
  GAMEPAD_AXIS_LAST = GAMEPAD_AXIS_RIGHT_TRIGGER;
{$ENDREGiON}

type
  { TInputState }
  TInputState = (isPressed, isWasPressed, isWasReleased);

  { TWindow }
  TWindow = class(TBaseObject)
  public type
    ContentScaledEvent = procedure(const ASender: Pointer; const AScaleX, AScaleY: Single; const AUserData: Pointer);
  protected type
    TOnContentScaledEvent = record
      Sender: Pointer;
      Handler: TWindow.ContentScaledEvent;
      UserData: Pointer;
    end;
  protected
    FHandle: PGLFWwindow;
    FSize: TSize;
    FScaledSize: TSize;
    FScale: TPoint;
    FMaxTextureSize: GLint;
    FKeyState: array [0..0, KEY_SPACE..KEY_LAST] of Boolean;
    FMouseButtonState: array [0..0, MOUSE_BUTTON_1..MOUSE_BUTTON_MIDDLE] of Boolean;
    FGamepadButtonState: array[0..0, GAMEPAD_BUTTON_A..GAMEPAD_BUTTON_LAST] of Boolean;
    FVsync: Boolean;
    FOnContentScaled: TOnContentScaledEvent;
  public const
    DEFAULT_WIDTH = 1920 div 2;
    DEFAULT_HEIGHT = 1080 div 2;
    DEFAULT_CENTER_WIDTH = DEFAULT_WIDTH div 2;
    DEFAULT_CENTER_HEIGHT = DEFAULT_HEIGHT div 2;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Open(const aTitle: string; const AWidth: Integer=DEFAULT_WIDTH; const AHeight: Integer=DEFAULT_HEIGHT; const AEnableVSync: Boolean=False): Boolean;
    function  IsOpen(): Boolean;
    procedure Close();
    function  Ready(): Boolean;
    function  GetHandle(): PGLFWwindow;
    function  GetVSync(): Boolean;
    procedure SetVSync(const AEnable: Boolean);
    function  GetMaxTextureSize(): Integer;
    function  GetTitle(): string;
    procedure SetTitle(const ATitle: string);
    function  ShouldClose(): Boolean;
    procedure SetShouldClose(const AValue: Boolean);
    procedure GetSize(var ASize: TSize);
    procedure GetScaledSize(var ASize: TSize);
    procedure GetScale(var AScale: TPoint);
    procedure GetViewport(var AViewport: TRect); overload;
    procedure GetViewport(X, Y, AWidth, AHeight: PSingle); overload;
    procedure Clear(const AColor: TColor); overload;
    procedure Clear(const ARed, AGreen, ABlue, AAlpha: Single); overload;
    procedure StartFrame();
    procedure EndFrame();
    procedure StartDrawing();
    procedure EndDrawing();
    procedure DrawLine(const X1, Y1, X2, Y2: Single; const AColor: TColor; const AThickness: Single);
    procedure DrawRect(const X, Y, AWidth, AHeight, AThickness: Single; const AColor: TColor; const AAngle: Single);
    procedure DrawFilledRect(const X, Y, AWidth, AHeight: Single; const AColor: TColor; const AAngle: Single);
    procedure DrawCircle(const X, Y, ARadius, AThickness: Single; const AColor: TColor);
    procedure DrawFilledCircle(const X, Y, ARadius: Single; const AColor: TColor);
    procedure DrawTriangle(const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor: TColor);
    procedure DrawFilledTriangle(const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: TColor);
    procedure DrawPolygon(const APoints: array of TPoint; const AThickness: Single; const AColor: TColor);
    procedure DrawFilledPolygon(const APoints: array of TPoint; const AColor: TColor);
    procedure DrawPolyline(const APoints: array of TPoint; const AThickness: Single; const AColor: TColor);
    procedure ClearInput();
    function  GetKey(const AKey: Integer; const AState: TInputState): Boolean;
    function  GetMouseButton(const AButton: Byte; const AState: TInputState): Boolean;
    procedure GetMousePos(const X, Y: PSingle); overload;
    function  GetMousePos(): TPoint; overload;
    procedure SetMousePos(const X, Y: Single);
    function  GamepadPresent(const AGamepad: Byte): Boolean;
    function  GetGamepadName(const AGamepad: Byte): string;
    function  GetGamepadButton(const AGamepad, AButton: Byte; const AState: TInputState): Boolean;
    function  GetGamepadAxisValue(const AGamepad, AAxis: Byte): Single;
    function  SaveToFile(const AFilename: string): Boolean;
    function  GetPixel(const X, Y: Single): TColor;
    procedure SetPixel(const X, Y: Single; const AColor: TColor); overload;
    procedure SetPixel(const X, Y: Single; const ARed, AGreen, ABlue, AAlpha: Byte); overload;
    procedure SetContentScaledEvent(const ASender: Pointer; const AHandler: TWindow.ContentScaledEvent; const AUserData: Pointer);
    function  GetContextScaledEvent(): TWindow.ContentScaledEvent;
    class function Init(const aTitle: string; const AWidth: Integer=DEFAULT_WIDTH; const AHeight: Integer=DEFAULT_HEIGHT): TWindow;
  end;

  { TTextureBlend }
  TTextureBlend = (tbNone, tbAlpha, tbAdditiveAlpha);

  { TTexture }
  TTexture = class(TBaseObject)
  protected
    FHandle: Cardinal;
    FChannels: Integer;
    FSize: TSize;
    FPivot: TPoint;
    FAnchor: TPoint;
    FBlend: TTextureBlend;
    FPos: TPoint;
    FScale: Single;
    FColor: TColor;
    FAngle: Single;
    FHFlip: Boolean;
    FVFlip: Boolean;
    FRegion: TRect;
    FLock: PByte;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function   Allocate(const AWidth, AHeight: Integer): Boolean;
    procedure  Fill(const AColor: TColor);
    function   Load(const ARGBData: Pointer; const AWidth, AHeight: Integer): Boolean; overload;
    function   Load(const AIO: TIO; const AColorKey: PColor=nil): Boolean; overload;
    function   LoadSVG(const AIO: TIO; const AUnits: string='px'; const ADPI: Single=96.0; const AColorKey: PColor=nil): Boolean;
    procedure  Unload();
    function   GetChannels(): Integer;
    function   GetSize(): TSize;
    function   GetPivot(): TPoint;
    procedure  SetPivot(const APoint: TPoint); overload;
    procedure  SetPivot(const X, Y: Single); overload;
    function   GetAnchor(): TPoint;
    procedure  SetAnchor(const APoint: TPoint); overload;
    procedure  SetAnchor(const X, Y: Single); overload;
    function   GetBlend: TTextureBlend;
    procedure  SetBlend(const AValue: TTextureBlend);
    function   GetPos(): TPoint;
    procedure  SetPos(const APos: TPoint); overload;
    procedure  SetPos(const X, Y: Single); overload;
    function   GetScale(): Single;
    procedure  SetScale(const AScale: Single);
    function   GetColor(): TColor;
    procedure  SetColor(const AColor: TColor); overload;
    procedure  SetColor(const ARed, AGreen, ABlue, AAlpha: Single); overload;
    function   GetAngle(): Single;
    procedure  SetAngle(const AAngle: Single);
    function   GetHFlip: Boolean;
    procedure  SetHFlip(const AFlip: Boolean);
    function   GetVFlip: Boolean;
    procedure  SetVFlip(const AFlip: Boolean);
    function   GetRegion(): TRect;
    procedure  SetRegion(const ARegion: TRect); overload;
    procedure  SetRegion(const X, Y, AWidth, AHeight: Single); overload;
    procedure  ResetRegion();
    procedure  Draw();
    procedure  DrawTiled(const AWindow: TWindow; const ADeltaX, ADeltaY: Single);
    function   SaveToFile(const AFilename: string): Boolean;
    function   Lock(): Boolean;
    procedure  Unlock();
    function   GetPixel(const X, Y: Single): TColor;
    procedure  SetPixel(const X, Y: Single; const AColor: TColor); overload;
    procedure  SetPixel(const X, Y: Single; const ARed, AGreen, ABlue, AAlpha: Byte); overload;
    function   CollideAABB(const ATexture: TTexture): Boolean;
    function   CollideOBB(const ATexture: TTexture): Boolean;
    class function LoadFromFile(const AFilename: string; const AColorKey: PColor=nil): TTexture;
    class function LoadFromZipFile(const AZipFile: TZipFile; const AFilename: string; const AColorKey: PColor=nil): TTexture;
    class function LoadSVGFromFile(const AFilename: string;  const AUnits: string='px'; const ADPI: Single=96.0; const AColorKey: PColor=nil): TTexture;
    class function LoadSVGFromZipFile(const AZipFile: TZipFile; const AFilename: string;  const AUnits: string='px'; const ADPI: Single=96.0; const AColorKey: PColor=nil): TTexture;
  end;

  { TFont }
  TFont = class(TBaseObject)
  public const
    DEFAULT_GLYPHS = ' !"#$%&''()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~™©';
  protected type
    PGlyph = ^TGlyph;
    TGlyph = record
      SrcRect: TRect;
      DstRect: TRect;
      XAdvance: Single;
    end;
  protected
    FAtlasSize: Integer;
    FAtlas: TTexture;
    FBaseLine: Single;
    FGlyph: TDictionary<Integer, TGlyph>;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Load(const AWindow: TWindow; const AIO: TIO; const ASize: Cardinal; const AGlyphs: string=''): Boolean;
    procedure Unload();
    procedure DrawText(const AWindow: TWindow; const aX, aY: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const); overload;
    procedure DrawText(const AWindow: TWindow; const aX: Single; var aY: Single; const aLineSpace: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const); overload;
    function  TextLength(const aMsg: string; const aArgs: array of const): Single;
    function  TextHeight(): Single;
    function  SaveTexture(const AFilename: string): Boolean;
    class function LoadFromFile(const AWindow: TWindow; const AFilename: string; const ASize: Cardinal; const AGlyphs: string=''): TFont;
    class function LoadFromZipFile(const AWindow: TWindow; const AZipFile: TZipFile; const AFilename: string; const ASize: Cardinal; const AGlyphs: string=''): TFont;
    class function LoadDefault(const AWindow: TWindow; const aSize: Cardinal; const aGlyphs: string=''): TFont;
  end;

  { Video }
  Video = class
  public const
    BUFFERSIZE = 1024;
  public type
    Status = (vsStopped, vsPlaying);
  private const
    CSampleSize = 2304;
    CSampleRate = 44100;
  private type
  private class var
    FIO: TIO;
    FStatus: Status;
    FStaticPlmBuffer: array[0..BUFFERSIZE] of byte;
    FRingBuffer: TVirtualRingBuffer<Single>;
    FDeviceConfig: ma_device_config;
    FDevice: ma_device;
    FPLM: Pplm_t;
    FVolume: Single;
    FLoop: Boolean;
    FRGBABuffer: array of uint8;
    FTexture: TTexture;
  private
    class constructor Create;
    class destructor Destroy;
  public
    class function  Play(const AIO: TIO; const AVolume: Single; const ALoop: Boolean): Boolean;
    class procedure Stop();
    class function  Update(): Boolean;
    class procedure Draw(const X, Y, AScale: Single);
    class function  GetStatus(): Status;
    class function  GetVolume(): Single;
    class procedure SetVolume(const AVolume: Single);
    class function  GetLooping(): Boolean;
    class procedure SetLooping(const ALoop: Boolean);
  end;

  { TCamera }
  TCamera = class(TBaseObject)
  protected
    FX, FY: Single;
    FRotation: Single;
    FScale: Single;
    FWindow: TWindow;
    procedure SetRotation(const AValue: Single);
  public
    property X: Single read FX write FX;
    property Y: Single read FY write FY;
    property Rotation: Single read FRotation write SetRotation;
    property Scale: Single read FScale write FScale;
    constructor Create; override;
    destructor Destroy; override;
    procedure Move(const X, Y: Single);
    procedure Zoom(const AScale: Single);
    procedure Rotate(const ARotation: Single);
    procedure Use(const AWindow: TWindow);
    procedure Reset();
  end;

  { TCloudDb }
  TCloudDb = class(TBaseObject)
  protected const
    cURL = '/?apikey=%s&keyspace=%s&query=%s';
  protected
    FUrl: string;
    FApiKey: string;
    FDatabase: string;
    FResponseText: string;
    FLastError: string;
    FHttp: THTTPClient;
    FSQL: TStringList;
    FPrepairedSQL: string;
    FJSON: TJSONObject;
    FDataset: TJSONArray;
    FMacros: TDictionary<string, string>;
    FParams: TDictionary<string, string>;
    procedure SetMacroValue(const AName, AValue: string);
    procedure SetParamValue(const AName, AValue: string);
    procedure Prepair;
    function  GetQueryURL(const ASQL: string): string;
    function  GetPrepairedSQL: string;
    function  GetResponseText: string;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    procedure Setup(const AURL, AApiKey, ADatabase: string);
    procedure ClearSQLText();
    procedure AddSQLText(const AText: string; const AArgs: array of const);
    function  GetSQLText(): string;
    procedure SetSQLText(const AText: string);
    function  GetMacro(const AName: string): string;
    procedure SetMacro(const AName, AValue: string);
    function  GetParam(const AName: string): string;
    procedure SetParam(const AName, AValue: string);
    function  RecordCount(): Integer;
    function  GetField(const AIndex: Cardinal; const AName: string): string;
    function  Execute(): Boolean;
    function  ExecuteSQL(const ASQL: string): Boolean;
    function  GetLastError(): string;
  end;

  { Speech }
  Speech = class
  public type
    VoiceAttributeEvent = (vaDescription, vaName, vaVendor, vaAge, vaGender, vaLanguage, vaId);
    WordEvent = procedure(const AWord: string; const AText: string) of object;
  protected class var
    FSpVoice: TSpVoice;
    FVoiceList: TInterfaceList;
    FVoiceDescList: TStringList;
    FPaused: Boolean;
    FText: string;
    FWord: string;
    FVoice: Integer;
    FSubList: TDictionary<string, string>;
    FOnWord: WordEvent;
    FVolume: Single;
    class procedure DoOnWord(ASender: TObject; AStreamNumber: Integer; AStreamPosition: OleVariant; ACharacterPosition, ALength: Integer);
    class procedure DoSpeak(AText: string; AFlags: Integer);
    class procedure EnumVoices();
    class procedure FreeVoices();
  public
    class constructor Create();
    class destructor Destroy();
  public
    class property OnWord: WordEvent read FOnWord write FOnWord;
    class function  GetVoiceCount(): Integer;
    class function  GetVoiceAttribute(const AIndex: Integer; const AAttribute: VoiceAttributeEvent): string;
    class procedure ChangeVoice(const AIndex: Integer);
    class function  GetVoice(): Integer;
    class procedure SetVolume(const AVolume: Single);
    class function  GetVolume(): Single;
    class procedure SetRate(const ARate: Single);
    class function  GetRate(): Single;
    class procedure Clear();
    class procedure Say(const AText: string; const APurge: Boolean);
    class procedure SayXML(const AText: string; const APurge: Boolean);
    class function  Active(): Boolean;
    class procedure Pause();
    class procedure Resume();
    class procedure Reset();
    class procedure SubstituteWord(const AWord: string; const ASubstituteWord: string);
  end;

  { TPolygon }
  TPolygon = class(TBaseObject)
  protected type
    TSegment = record
      Point: TPoint;
      Visible: Boolean;
    end;
  protected
    FSegment: array of TSegment;
    FWorldPoint: array of TPoint;
    FItemCount: Integer;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Save(const AFilename: string);
    procedure Load(const AIO: TIO);
    procedure CopyFrom(APolygon: TPolygon);
    procedure Clear();
    procedure AddLocalPoint(AX, AY: Single; AVisible: Boolean);
    function  Transform(AX, AY, AScale, AAngle: Single; AOrigin: PPoint; AHFlip, AVFlip: Boolean): Boolean;
    procedure Render(const AWindow: TWindow; const AX, AY, AScale, AAngle: Single; AThickness: Integer; AColor: TColor; AOrigin: PPoint; AHFlip, AVFlip: Boolean);
    procedure SetSegmentVisible(AIndex: Integer; AVisible: Boolean);
    function  IsSegmentVisible(AIndex: Integer): Boolean;
    function  PointCount(): Integer;
    function  WorldPoint(AIndex: Integer): PPoint;
    function  LocalPoint(AIndex: Integer): PPoint;
  end;

  { TStarfield }
  TStarfield = class(TBaseObject)
  protected type
    TStar = record
      X, Y, Z: Single;
      Speed: Single;
    end;
    TPoint = record
      X,Y,Z: Single;
    end;
  protected
    FCenter: TPoint;
    FMin: TPoint;
    FMax: TPoint;
    FViewScaleRatio: Single;
    FViewScale: Single;
    FStarCount: Cardinal;
    FStar: array of TStar;
    FSpeed: TPoint;
    FVirtualPos: TPoint;
    procedure TransformDrawPoint(const X, Y, Z: Single; const AWindow: TWindow);
    procedure Done();
  public
    constructor Create(); override;
    destructor Destroy(); override;
  public
    procedure Init(const AWindow: TWindow; const aStarCount: Cardinal; const AMinX, AMinY, AMinZ, AMaxX, AMaxY, AMaxZ, AViewScale: Single);
    procedure SetVirtualPos(const X, Y: Single);
    procedure GetVirtualPos(var X: Single; var Y: Single);
    procedure SetXSpeed(const ASpeed: Single);
    procedure SetYSpeed(const ASpeed: Single);
    procedure SetZSpeed(const ASpeed: Single);
    procedure Update();
    procedure Render(const AWindow: TWindow);
    class function New(const AWindow: TWindow): TStarfield;
  end;

  { TSprite }
  TSprite = class(TBaseObject)
  protected type
    PImageRegion = ^TImageRegion;
    TImageRegion = record
      Rect: TRect;
      Page: Integer;
    end;
    PGroup = ^TGroup;
    TGroup = record
      Image: array of TImageRegion;
      Count: Integer;
    end;
  protected
    FTextures: array of TTexture;
    FGroups: array of TGroup;
    FPageCount: Integer;
    FGroupCount: Integer;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    procedure Clear();
    function LoadPageFromFile(const AFilename: string; AColorKey: PColor): Integer;
    function LoadPageFromZipFile(const AZipFile: TZipFile; const AFilename: string; AColorKey: PColor): Integer;
    function AddGroup(): Integer;
    function GetGroupCount(): Integer;
    function AddImageFromRect(const APage, AGroup: Integer; const ARect: TRect; const AXOffset: Integer=0; const AYOffset: Integer=0): Integer;
    function AddImageFromGrid(const APage, AGroup, AGridX, AGridY, AGridWidth, AGridHeight: Integer; const AXOffset: Integer=0; const AYOffset: Integer=0): Integer;
    function AddImages(const APage, AGroup, AColCount, ARowCount, AImageWidth, AImageHeight: Integer; const AXOffset: Integer=0; const AYOffset: Integer=0): Boolean;
    function GetImageCount(const AGroup: Integer): Integer;
    function GetImageWidth(const ANum, AGroup: Integer): Single;
    function GetImageHeight(const ANum, AGroup: Integer): Single;
    function GetImageTexture(const ANum, AGroup: Integer): TTexture;
    function GetImageRegion(const ANum, AGroup: Integer): TRect;
  end;

  { TEntity }
  TEntity = class(TBaseObject)
  public type
    Overlap = (eoAABB, eoOBB);
  protected
    FSprite: TSprite;
    FGroup: Integer;
    FFrame: Integer;
    FFrameSpeed: Single;
    FPos: TVector;
    FDir: TVector;
    FScale: Single;
    FAngle: Single;
    FAngleOffset : Single;
    FColor: TColor;
    FHFlip: Boolean;
    FVFlip: Boolean;
    FLoopFrame: Boolean;
    FWidth: Single;
    FHeight: Single;
    FRadius: Single;
    FFirstFrame: Integer;
    FLastFrame: Integer;
    FShrinkFactor: Single;
    FPivot: TPoint;
    FAnchor: TPoint;
    FBlend: TTextureBlend;
    FFrameTimer: TTimer;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    function  Init(const ASprite: TSprite; const AGroup: Integer): Boolean;
    function  GetPivot(): TPoint;
    procedure SetPivot(const APoint: TPoint); overload;
    procedure SetPivot(const X, Y: Single); overload;
    function  GetAnchor(): TPoint;
    procedure SetAnchor(const APoint: TPoint); overload;
    procedure SetAnchor(const X, Y: Single); overload;
    procedure SetFrameRange(const aFirst, aLast: Integer);
    function  NextFrame(): Boolean;
    function  PrevFrame(): Boolean;
    function  GetFrame(): Integer;
    procedure SetFrame(const AFrame: Integer);
    function  GetFrameSpeed(): Single;
    procedure SetFrameSpeed(const AFrameSpeed: Single);
    function  GetFirstFrame(): Integer;
    function  GetLastFrame(): Integer;
    procedure SetPosAbs(const X, Y: Single);
    procedure SetPosRel(const X, Y: Single);
    function  GetPos(): TVector;
    function  GetDir(): TVector;
    procedure SetScaleAbs(const AScale: Single);
    procedure SetScaleRel(const AScale: Single);
    function  GetAngle(): Single;
    function  GetAngleOffset(): Single;
    procedure SetAngleOffset(const AAngle: Single);
    procedure RotateAbs(const AAngle: Single);
    procedure RotateRel(const AAngle: Single);
    function  RotateToAngle(const AAngle, ASpeed: Single): Boolean;
    function  RotateToPos(const X, Y, ASpeed: Single): Boolean;
    function  RotateToPosAt(const aSrcX, aSrcY, ADestX, ADestY, ASpeed: Single): Boolean;
    procedure Thrust(const ASpeed: Single);
    procedure ThrustAngle(const AAngle, ASpeed: Single);
    function  ThrustToPos(const aThrustSpeed, ARotSpeed, ADestX, ADestY, ASlowdownDist, AStopDist, AStopSpeed, AStopSpeedEpsilon: Single): Boolean;
    function  IsVisible(const AWindow: TWindow): Boolean;
    function  IsFullyVisible(const AWindow: TWindow): Boolean;
    function  Collide(const X, Y, aRadius, aShrinkFactor: Single): Boolean; overload;
    function  Collide(const AEntity: TEntity; const AOverlap: TEntity.Overlap=eoAABB): Boolean; overload;
    procedure Render();
    procedure RenderAt(const X, Y: Single);
    function  GetSprite(): TSprite;
    function  GetGroup(): Integer;
    function  GetScale(): Single;
    function  GetColor(): TColor;
    procedure SetColor(const AColor: TColor);
    function  GetBlend(): TTextureBlend;
    procedure SetBlend(const AValue: TTextureBlend);
    function  GetHFlip(): Boolean;
    procedure SetHFlip(const AFlip: Boolean);
    function  GetVFlip: Boolean;
    procedure SetVFlip(const AFlip: Boolean);
    function  GetLoopFrame(): Boolean;
    procedure SetLoopFrame(const aLoop: Boolean);
    function  GetWidth(): Single;
    function  GetHeight(): Single;
    function  GetRadius(): Single;
    class function New(const ASprite: TSprite; const aGroup: Integer): TEntity;
  end;

{ TConfigFile }
  TConfigFile = class(TBaseObject)
  private
    FHandle: TIniFile;
    FFilename: string;
    FSection: TStringList;
  public
    constructor Create; override;
    destructor Destroy; override;
    function  Open(const AFilename: string=''): Boolean;
    procedure Close();
    function  Opened(): Boolean;
    procedure Update();
    function  RemoveSection(const AName: string): Boolean;
    procedure SetValue(const ASection, AKey, AValue: string);  overload;
    procedure SetValue(const ASection, AKey: string; AValue: Integer); overload;
    procedure SetValue(const ASection, AKey: string; AValue: Boolean); overload;
    procedure SetValue(const ASection, AKey: string; AValue: Pointer; AValueSize: Cardinal); overload;
    function  GetValue(const ASection, AKey, ADefaultValue: string): string; overload;
    function  GetValue(const ASection, AKey: string; ADefaultValue: Integer): Integer; overload;
    function  GetValue(const ASection, AKey: string; ADefaultValue: Boolean): Boolean; overload;
    procedure GetValue(const ASection, AKey: string; AValue: Pointer; AValueSize: Cardinal); overload;
    function  RemoveKey(const ASection, AKey: string): Boolean;
    function  GetSectionValues(const ASection: string): Integer;
    function  GetSectionValue(const AIndex: Integer; const ADefaultValue: string): string; overload;
    function  GetSectionValue(const AIndex, ADefaultValue: Integer): Integer; overload;
    function  GetSectionValue(const AIndex: Integer; const ADefaultValue: Boolean): Boolean; overload;
  end;

implementation

{$R SGT.Lib.res}

{ Init }
var
  LibInit: Boolean = False;

function GLFWallocate(size: NativeUInt; user: Pointer): Pointer; cdecl;
begin
  GetMem(Result, size);
end;

function GLFWreallocate(block: Pointer; size: NativeUInt; user: Pointer): Pointer; cdecl;
begin
  ReallocMem(block, size);
  Result := block;
end;

procedure GLFWdeallocate(block: Pointer; user: Pointer); cdecl;
begin
  FreeMem(block);
end;

function ImGuiMemAlloc(sz: NativeUInt; user_data: Pointer): Pointer; cdecl;
begin
  GetMem(Result, sz);
end;

procedure ImGuiMemFree(ptr: Pointer; user_data: Pointer); cdecl;
begin
  FreeMem(ptr);
end;

function InitLib(): Boolean;
var
  LAllocator: GLFWallocator;
begin
  Result := False;
  if IsLibInit() then Exit;

  LAllocator.allocate := GLFWallocate;
  LAllocator.reallocate := GLFWreallocate;
  LAllocator.deallocate := GLFWdeallocate;
  LAllocator.user := nil;
  glfwInitAllocator(@LAllocator);

  //igSetAllocatorFunctions(ImGuiMemAlloc, ImGuiMemFree, nil);

  if glfwInit() <> GLFW_TRUE then Exit;

  FrameLimitTimer.Reset();
  Async.Clear();

  LibInit := True;
  Result := IsLibInit();
end;

procedure QuitLib();
begin
  if not IsLibInit() then Exit;

  Audio.Close();

  glfwTerminate();

  LibInit := False;
end;

function  IsLibInit(): Boolean;
begin
  Result := LibInit;
end;

procedure ResetLib();
begin
  Async.Clear();
  FrameLimitTimer.Reset();
end;

{ TBaseObject }
procedure RunObject(const AObject: TBaseObjectClass);
var
  LObject: TBaseObject;
begin
  LObject := AObject.Create();
  try
    LObject.Run();
  finally
    LObject.Free();
  end;
end;

constructor TBaseObject.Create();
begin
  inherited;
end;

destructor TBaseObject.Destroy();
begin
  inherited;
end;

procedure TBaseObject.Run();
begin
  inherited;
end;

{ Utils }
class constructor Utils.Create();
begin
  // turn on memory leak detection
  ReportMemoryLeaksOnShutdown := True;


  // init critical section
  FCriticalSection := TCriticalSection.Create();
end;

class destructor Utils.Destroy();
begin
  // free critical section object
  FCriticalSection.Free();
end;

class function  Utils.AsUTF8(const AText: string): Pointer;
begin
  Result := FMarshaller.AsUtf8(AText).ToPointer;
end;

class function  Utils.GetTempStaticBuffer(): PByte;
begin
  Result := @FTempStaticBuffer[0];
end;

class function  Utils.GetTempStaticBufferSize(): Integer;
begin
  Result := CTempStaticBufferSize;
end;

class function  Utils.ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
begin
  Result := Boolean((FindResource(HInstance, PChar(AResName), RT_RCDATA) <> 0));
end;

class procedure Utils.EnterCriticalSection();
begin
  FCriticalSection.Enter;
end;

class procedure Utils.LeaveCriticalSection();
begin
  FCriticalSection.Leave;
end;

class procedure Utils.SetDefaultIcon(AWindow: HWND);
var
  IconHandle: HICON;
begin
  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(aWindow, WM_SETICON, ICON_BIG, IconHandle);
  end;
end;

class procedure Utils.SetDefaultIcon(AWindow: PGLFWwindow);
begin
  SetDefaultIcon(glfwGetWin32Window(AWindow))
end;

class function Utils.RemoveDuplicates(const aText: string): string;
var
  i, l: integer;
begin
  Result := '';
  l := Length(aText);
  for i := 1 to l do
  begin
    if (Pos(aText[i], result) = 0) then
    begin
      result := result + aText[i];
    end;
  end;
end;

class function  Utils.HudTextItem(const AKey: string; const AValue: string; const APaddingWidth: Cardinal=20; const ASeperator: string='-'): string;
begin
  Result := Format('%s %s %s', [aKey.PadRight(APaddingWidth), aSeperator, aValue]);
end;

class procedure Utils.GotoURL(const AURL: string);
begin
  if AURL.IsEmpty then Exit;
  ShellExecute(0, 'OPEN', PChar(AURL), '', '', SW_SHOWNORMAL);
end;

class function  Utils.GetComputerName(): string;
var
  LLength: dword;
begin
  LLength := 253;
  SetLength(Result, LLength+1);
  if not WinApi.Windows.GetComputerName(PChar(Result), LLength) then Result := 'Not detected!';
  Result := PChar(result);
end;

class function  Utils.GetLoggedUserName(): string;
const
  cnMaxUserNameLen = 254;
var
  sUserName     : string;
  dwUserNameLen : DWord;
begin
  dwUserNameLen := cnMaxUserNameLen-1;
  SetLength( sUserName, cnMaxUserNameLen );
  GetUserName(PChar( sUserName ),dwUserNameLen );
  SetLength( sUserName, dwUserNameLen );
  Result := sUserName;
end;

class function  Utils.GetOSVersion(): string;
begin
  Result := TOSVersion.ToString;
end;

class function  Utils.GetNow(): string;
begin
  Result := DateTimeToStr(Now());
end;

class procedure Utils.GetDiskFreeSpace(const APath: string; var AFreeSpace: Int64; var ATotalSpace: Int64);
begin
  GetDiskFreeSpaceEx(PChar(aPath), aFreeSpace, aTotalSpace, nil);
end;

class procedure Utils.GetMemoryFree(var AAvailMem: UInt64; var ATotalMem: UInt64);
var
  LMemStatus: MemoryStatusEx;
begin
 FillChar (LMemStatus, SizeOf(MemoryStatusEx), #0);
 LMemStatus.dwLength := SizeOf(MemoryStatusEx);
 GlobalMemoryStatusEx (LMemStatus);
 aAvailMem := LMemStatus.ullAvailPhys;
 aTotalMem := LMemStatus.ullTotalPhys;
end;

class function  Utils.GetVideoCardName(): string;
const
  WbemUser = '';
  WbemPassword = '';
  WbemComputer = 'localhost';
  wbemFlagForwardOnly = $00000020;
var
  LFSWbemLocator: OLEVariant;
  LFWMIService: OLEVariant;
  LFWbemObjectSet: OLEVariant;
  LFWbemObject: OLEVariant;
  LEnum: IEnumvariant;
  LValue: LongWord;
begin;
  try
    LFSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
    LFWMIService := LFSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2',
      WbemUser, WbemPassword);
    LFWbemObjectSet := LFWMIService.ExecQuery
      ('SELECT Name,PNPDeviceID  FROM Win32_VideoController', 'WQL',
      wbemFlagForwardOnly);
    LEnum := IUnknown(LFWbemObjectSet._NewEnum) as IEnumvariant;
    while LEnum.Next(1, LFWbemObject, LValue) = 0 do
    begin
      result := String(LFWbemObject.Name);
      LFWbemObject := Unassigned;
    end;
  except
  end;
end;

class function  Utils.GetAppName(): string;
begin
  Result := Format('%s %s',[TPath.GetFileNameWithoutExtension(ParamStr(0)),GetAppVersionFullStr]);
end;

class function  Utils.GetAppPath(): string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

class function  Utils.GetCPUCount(): Integer;
begin
  Result := CPUCount;
end;

class function  Utils.GetAppVersionStr(): string;
var
  LRec: LongRec;
  LVer : Cardinal;
begin
  LVer := GetFileVersion(ParamStr(0));
  if LVer <> Cardinal(-1) then
  begin
    LRec := LongRec(LVer);
    Result := Format('%d.%d', [LRec.Hi, LRec.Lo]);
  end
  else Result := '';
end;

class function  Utils.GetAppVersionFullStr(): string;
begin
  GetModuleVersionFullStr(ParamStr(0));
end;

class function  Utils.GetModuleVersionFullStr(): string;
begin
  Result := GetModuleVersionFullStr(GetModuleName(HInstance));
end;

class function  Utils.GetModuleVersionFullStr(AFilename: string): string;
var
  LExe: string;
  LSize, LHandle: DWORD;
  LBuffer: TBytes;
  LFixedPtr: PVSFixedFileInfo;
begin
  Result := '';
  if not TFile.Exists(aFilename) then Exit;
  LExe := aFilename;
  LSize := GetFileVersionInfoSize(PChar(LExe), LHandle);
  if LSize = 0 then
  begin
    //RaiseLastOSError;
    //no version info in file
    Exit;
  end;
  SetLength(LBuffer, LSize);
  if not GetFileVersionInfo(PChar(LExe), LHandle, LSize, LBuffer) then
    RaiseLastOSError;
  if not VerQueryValue(LBuffer, '\', Pointer(LFixedPtr), LSize) then
    RaiseLastOSError;
  if (LongRec(LFixedPtr.dwFileVersionLS).Hi = 0) and (LongRec(LFixedPtr.dwFileVersionLS).Lo = 0) then
  begin
    Result := Format('%d.%d',
    [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
     LongRec(LFixedPtr.dwFileVersionMS).Lo]); //minor
  end
  else if (LongRec(LFixedPtr.dwFileVersionLS).Lo = 0) then
  begin
    Result := Format('%d.%d.%d',
    [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
     LongRec(LFixedPtr.dwFileVersionMS).Lo,   //minor
     LongRec(LFixedPtr.dwFileVersionLS).Hi]); //release
  end
  else
  begin
    Result := Format('%d.%d.%d.%d',
    [LongRec(LFixedPtr.dwFileVersionMS).Hi,   //major
     LongRec(LFixedPtr.dwFileVersionMS).Lo,   //minor
     LongRec(LFixedPtr.dwFileVersionLS).Hi,   //release
     LongRec(LFixedPtr.dwFileVersionLS).Lo]); //build
  end;
end;

class function  Utils.HttpGet(const aURL: string; const aStatus: PString=nil): string;
var
  LHttp: THTTPClient;
  LResponse: IHTTPResponse;
begin
  LHttp := THTTPClient.Create;
  try
    LResponse := LHttp.Get(aURL);
    Result := LResponse.ContentAsString;
    if Assigned(aStatus) then
      aStatus^ := LResponse.StatusText;
  finally
    LHttp.Free();
  end;
end;

class function  Utils.RemoveQuotes(const AText: string): string;
var
  S: string;
begin
  S := AnsiDequotedStr(aText, '"');
  Result := AnsiDequotedStr(S, '''');
end;

{ Console }
class constructor Console.Create();
begin
  // save current console codepage
  FInputCodePage := GetConsoleCP();
  FOutputCodePage := GetConsoleOutputCP();

  // set code page to UTF8
  SetConsoleCP(CP_UTF8);
  SetConsoleOutputCP(CP_UTF8);

  // clear keyboard
  ClearKeyStates();
  ClearKeyboardBuffer();
end;

class destructor Console.Destroy();
begin
  // restore code page
  SetConsoleCP(FInputCodePage);
  SetConsoleOutputCP(FOutputCodePage);
end;

class procedure Console.Clear();
begin
  // Clear the console screen
  Win32Check(ClearScreen(GetStdHandle(STD_OUTPUT_HANDLE)));
end;

class function  Console.ClearScreen(const AConsole: THandle): Boolean;
var
  csbi: TConsoleScreenBufferInfo;
  ConsoleSize: DWORD;
  Coord: TCoord;
  CharsWritten: DWORD;
begin
  Result := False;
  if GetConsoleScreenBufferInfo(AConsole, csbi) then
  begin
    ConsoleSize := csbi.dwSize.X * csbi.dwSize.Y;
    Coord.X := 0;
    Coord.Y := 0;

    if FillConsoleOutputCharacter(AConsole, ' ', ConsoleSize, Coord, CharsWritten) then
      if FillConsoleOutputAttribute(AConsole, csbi.wAttributes, ConsoleSize, Coord, CharsWritten) then
        Result := SetConsoleCursorPosition(AConsole, Coord);
  end;
end;

class procedure Console.SetTextColor(AColor: Word);
var
  LConsoleHandle: THandle;
begin
  LConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  SetConsoleTextAttribute(LConsoleHandle, AColor);
end;

class procedure Console.ClearLine(AColor: Word);
var
  LConsoleOutput: THandle;
  LConsoleInfo: TConsoleScreenBufferInfo;
  LNumCharsWritten: DWORD;
  LCoord: TCoord;
begin
  LConsoleOutput := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(LConsoleOutput, LConsoleInfo) then
  begin
    LCoord.X := 0;
    LCoord.Y := LConsoleInfo.dwCursorPosition.Y;

    SetTextColor(AColor);
    FillConsoleOutputCharacter(LConsoleOutput, ' ', LConsoleInfo.dwSize.X,
      LCoord, LNumCharsWritten);
    SetConsoleCursorPosition(LConsoleOutput, LCoord);
  end;
end;

class procedure Console.ClearLineFromCursor(AColor: Word);
var
  LConsoleOutput: THandle;
  LConsoleInfo: TConsoleScreenBufferInfo;
  LNumCharsWritten: DWORD;
  LCoord: TCoord;
begin
  LConsoleOutput := GetStdHandle(STD_OUTPUT_HANDLE);

  if GetConsoleScreenBufferInfo(LConsoleOutput, LConsoleInfo) then
  begin
    LCoord.X := 0;
    LCoord.Y := LConsoleInfo.dwCursorPosition.Y;

    SetTextColor(AColor);
    FillConsoleOutputCharacter(LConsoleOutput, ' ', LConsoleInfo.dwSize.X
      - LConsoleInfo.dwCursorPosition.X, LCoord, LNumCharsWritten);
    SetConsoleCursorPosition(LConsoleOutput, LCoord);
  end;
end;

class procedure  Console.GetSize(AWidth: PInteger; AHeight: PInteger);
var
  LConsoleInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), LConsoleInfo);
  if Assigned(AWidth) then
    AWidth^ := LConsoleInfo.dwSize.X;

  if Assigned(AHeight) then
  AHeight^ := LConsoleInfo.dwSize.Y;
end;

class procedure Console.SetTitle(const ATitle: string);
begin
  WinApi.Windows.SetConsoleTitle(PChar(ATitle));
end;

class function  Console.HasOutput(): Boolean;
var
  LStdOut: THandle;
  LMode: DWORD;
begin
  LStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
  Result := (LStdOut <> INVALID_HANDLE_VALUE) and GetConsoleMode(LStdOut, LMode);
end;

class function  Console.WasRunFrom(): Boolean;
var
  LStartInfo: TStartupInfo;
begin
  LStartInfo.cb := SizeOf(TStartupInfo);
  GetStartupInfo(LStartInfo);
  Result := ((LStartInfo.dwFlags and STARTF_USESHOWWINDOW) = 0);
end;

class function  Console.IsStartedFromDelphiIDE(): Boolean;
begin
  Result := (GetEnvironmentVariable('BDS') <> '');
end;

class procedure Console.WaitForAnyKey();
var
  LInputRec: TInputRecord;
  LNumRead: Cardinal;
  LOldMode: DWORD;
  LStdIn: THandle;
begin
  LStdIn := GetStdHandle(STD_INPUT_HANDLE);
  GetConsoleMode(LStdIn, LOldMode);
  SetConsoleMode(LStdIn, 0);
  repeat
    ReadConsoleInput(LStdIn, LInputRec, 1, LNumRead);
  until (LInputRec.EventType and KEY_EVENT <> 0) and
    LInputRec.Event.KeyEvent.bKeyDown;
  SetConsoleMode(LStdIn, LOldMode);
end;

class function  Console.AnyKeyPressed(): Boolean;
var
  LNumberOfEvents     : DWORD;
  LBuffer             : TInputRecord;
  LNumberOfEventsRead : DWORD;
  LStdHandle           : THandle;
begin
  Result:=false;
  LStdHandle := GetStdHandle(STD_INPUT_HANDLE);
  LNumberOfEvents:=0;
  GetNumberOfConsoleInputEvents(LStdHandle,LNumberOfEvents);
  if LNumberOfEvents<> 0 then
  begin
    PeekConsoleInput(LStdHandle,LBuffer,1,LNumberOfEventsRead);
    if LNumberOfEventsRead <> 0 then
    begin
      if LBuffer.EventType = KEY_EVENT then
      begin
        if LBuffer.Event.KeyEvent.bKeyDown then
          Result:=true
        else
          FlushConsoleInputBuffer(LStdHandle);
      end
      else
      FlushConsoleInputBuffer(LStdHandle);
    end;
  end;
end;

class procedure Console.ClearKeyStates();
begin
  FillChar(FKeyState, SizeOf(FKeyState), 0);
  ClearKeyboardBuffer;
end;

class function  Console.IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := (GetAsyncKeyState(AKey) and $8000) <> 0;
end;

class function  Console.WasKeyReleased(AKey: Byte): Boolean;
begin
  Result := False;
  if IsKeyPressed(AKey) and (not FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := True;
    Result := True;
  end
  else if (not IsKeyPressed(AKey)) and (FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := False;
    Result := False;
  end;
end;

class function  Console.WasKeyPressed(AKey: Byte): Boolean;
begin
  Result := False;
  if IsKeyPressed(AKey) and (not FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := True;
    Result := False;
  end
  else if (not IsKeyPressed(AKey)) and (FKeyState[1, AKey]) then
  begin
    FKeyState[1, AKey] := False;
    Result := True;
  end;
end;

class procedure Console.Pause(aColor: DWORD; const aMsg: string; const AForcePause: Boolean);
var
  LDoPause: Boolean;
begin
  if not HasOutput then Exit;

  ClearKeyboardBuffer;
  ClearKeyStates;

  if not AForcePause then
  begin
    LDoPause := True;
    if WasRunFrom then LDoPause := False;
    if IsStartedFromDelphiIDE then LDoPause := True;
    if not LDoPause then Exit;
  end;

  SetTextColor(Ord(aColor));
  PrintLn();
  if aMsg.IsEmpty then
    Print('Press any key to continue... ')
  else
    Print(aMsg);
  WaitForAnyKey();
  PrintLn();
end;

class procedure Console.ClearKeyboardBuffer();
var
  LInputRecord: TInputRecord;
  LEventsRead: DWORD;
begin
  while PeekConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead) and (LEventsRead > 0) do
  begin
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead);
  end;
end;

class function  Console.ReadKey(): Char;
var
  LInputRecord: TInputRecord;
  LEventsRead: DWORD;
begin
  repeat
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead);
  until (LInputRecord.EventType = KEY_EVENT) and LInputRecord.Event.KeyEvent.bKeyDown;
  Result := LInputRecord.Event.KeyEvent.UnicodeChar;
end;

class function  Console.ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer): string;
var
  LInputChar: Char;
begin
  Result := '';

  repeat
    LInputChar := ReadKey;

    if CharInSet(LInputChar, AAllowedChars) then
    begin
      if Length(Result) < AMaxLength then
      begin
        Print(LInputChar);
        Result := Result + LInputChar;
      end;
    end
    else if LInputChar = #8 then
    begin
      if Length(Result) > 0 then
      begin
        Print(#8 + ' ' + #8);
        Delete(Result, Length(Result), 1);
      end;
    end;
  until (LInputChar = #13);

  PrintLn();
end;

class function  Console.WrapTextEx(const ALine: string; AMaxCol: Integer; const ABreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
var
  LText: string;
  LPos: integer;
  LChar: Char;
  LLen: Integer;
  I: Integer;
begin
  LText := ALine;

  LPos := 0;
  LLen := 0;

  while LPos < LText.Length do
  begin
    Inc(LPos);

    LChar := LText[LPos];

    if LChar = #10 then
    begin
      LLen := 0;
      continue;
    end;

    Inc(LLen);

    if LLen >= AMaxCol then
    begin
      for I := LPos downto 1 do
      begin
        LChar := LText[I];

        if CharInSet(LChar, ABreakChars) then
        begin
          LText.Insert(I, #10);
          Break;
        end;
      end;

      LLen := 0;
    end;
  end;

  Result := LText;
end;

class procedure Console.Print(const AMsg: string; const AArgs: array of const; const AColor: DWORD);
begin
  if not HasOutput then Exit;
  SetTextColor(Ord(AColor));
  Write(Format(AMsg, AArgs));
  SetTextColor(WHITE);
end;

class procedure Console.Print(const AMsg: string; const AColor: DWORD);
begin
  Print(AMsg, [], AColor);
end;

class procedure Console.PrintLn(const AMsg: string; const AArgs: array of const; const AColor: DWORD);
begin
  if not HasOutput then Exit;
  SetTextColor(Ord(AColor));
  WriteLn(Format(AMsg, AArgs));
  SetTextColor(WHITE);
end;

class procedure Console.PrintLn(const AMsg: string; const AColor: DWORD);
begin
  PrintLn(AMsg, [], AColor);
end;

class procedure Console.PrintLn();
begin
  PrintLn('');
end;

class procedure Console.Print();
begin
  Print('');
end;

class procedure Console.Teletype(const AText: string; const AColor: DWORD; const AMargin: Integer; const AMinDelay: Integer; const AMaxDelay: Integer; const ABreakKey: Byte);
const
  {$J+}
  LDelay: Integer = 0;
  {$J-}
var
  LText: string;
  LMaxCol: Integer;
  LChar: Char;
  LWidth: Integer;
begin
  GetSize(@LWidth, nil);
  //LMaxCol := GetWidth - AMargin;
  LMaxCol := LWidth - AMargin;

  LText := WrapTextEx(AText, LMaxCol);

  for LChar in LText do
  begin
    Print(LChar, [], AColor);
    if not Math.RandomBool then
      LDelay := RandomRange(AMinDelay, AMaxDelay);
    Sleep(LDelay);
    if IsKeyPressed(ABreakKey) then
    begin
      ClearKeyboardBuffer;
      Break;
    end;
  end;
end;

{ FrameLimitTimer }
class constructor FrameLimitTimer.Create();
begin
  Init();
end;

class destructor FrameLimitTimer.Destroy();
begin
end;

class  procedure FrameLimitTimer.Init(const ATargetFrameRate: Cardinal);
begin
  FLastTime := glfwGetTime();
  FLastFPSTime := FLastTime;
  FTargetFrameRate := ATargetFrameRate;
  FTargetTime := 1.0 / FTargetFrameRate;
  FFrameCount := 0;
  FFramerate :=0;
  FEndtime := 0;
end;

class function  FrameLimitTimer.TargetFrameRate(): Cardinal;
begin
  Result := FTargetFrameRate;
end;

class function  FrameLimitTimer.TargetTime(): Double;
begin
  Result := FTargetTime;
end;

class procedure FrameLimitTimer.Reset();
begin
  FLastTime := glfwGetTime();
  FLastFPSTime := FLastTime;
  FTargetTime := 1.0 / FTargetFrameRate;
  FFrameCount := 0;
  FFramerate :=0;
  FEndtime := 0;
end;

class procedure FrameLimitTimer.Start();
begin
  FCurrentTime := glfwGetTime();
  FElapsedTime := FCurrentTime - FLastTime;
end;

class procedure FrameLimitTimer.Stop();
begin
  Inc(FFrameCount);
  if (FCurrentTime - FLastFPSTime >= 1.0) then
  begin
    FFramerate := FFrameCount;
    FLastFPSTime := FCurrentTime;
    FFrameCount := 0;
  end;
  FLastTime := FCurrentTime;
  FRemainingTime := FTargetTime - (FCurrentTime - FLastTime);
  if (FRemainingTime > 0) then
   begin
      FEndtime := FCurrentTime + FRemainingTime;
      while glfwGetTime() < FEndtime do
      begin
        // Busy-wait for the remaining time
        Sleep(0); // allow other background tasks to run
      end;
    end;
end;

class function  FrameLimitTimer.FrameRate(): Cardinal;
begin
  Result := FFramerate;
end;

{ --- TlgTimer -------------------------------------------------------------- }
class operator TTimer.Initialize (out ADest: TTimer);
begin
  ADest.FLastTime := 0;
  ADest.FInterval := 0;
  ADest.FSpeed := 0;
end;

procedure TTimer.InitMS(const AValue: Double);
begin
  FInterval := AValue / 1000.0; // convert milliseconds to seconds
  FLastTime := glfwGetTime;
  FSpeed := AValue;
end;

procedure TTimer.InitFPS(const AValue: Double);
begin
  if AValue > 0 then
    FInterval := 1.0 / AValue
  else
    FInterval := 0; // Prevent division by zero if FPS is not positive
  FLastTime := glfwGetTime;
  FSpeed := AValue;
end;

function TTimer.Check(): Boolean;
begin
  Result := (glfwGetTime - FLastTime) >= FInterval;
  if Result then
    FLastTime := glfwGetTime; // Auto-reset on check
end;

procedure TTimer.Reset();
begin
  FLastTime := glfwGetTime;
end;

function  TTimer.Speed(): Double;
begin
  Result := FSpeed;
end;

{ TPoint }
class operator TPoint.Initialize(out ADest: TPoint);
begin
  ADest.X := 0;
  ADest.Y := 0;
  ADest.Z := 0;
end;

class operator TPoint.Implicit(AValue: TVector): TPoint;
begin
  Result.X := AValue.X;
  Result.Y := AValue.Y;
  Result.Z := AValue.Z;
end;

constructor TPoint.Create(const AX, AY, AZ: Single);
begin
  X := AX;
  Y := AY;
  Z := AZ;
end;

{ TExtent }
class operator TExtent.Initialize (out ADest: TExtent);
begin
  ADest.MinX := 0;
  ADest.MinY := 0;
  ADest.MaxX := 0;
  ADest.MaxY := 0;
end;

{ TVector }
class operator TVector.Initialize (out ADest: TVector);
begin
  ADest.X := 0;
  ADest.Y := 0;
  ADest.Z := 0;
  ADest.W := 0;
end;

constructor TVector.Create(const AX,  AY: Single);
begin
  X := AX;
  Y := AY;
  Z := 0;
  W := 0;
end;

procedure TVector.Assign(const AX, AY: Single);
begin
  X := X;
  Y := Y;
end;

procedure TVector.Assign(const AX, AY, AZ: Single);
begin
  X := AX;
  Y := AY;
  Z := AZ;
end;

procedure TVector.Assign(const AX, AY, AZ, AW: Single);
begin
  X := AX;
  Y := AY;
  Z := AZ;
  W := AW;
end;

procedure TVector.Clear();
begin
  X := 0;
  Y := 0;
  Z := 0;
  W := 0;
end;

procedure TVector.Assign(AVector: TVector);
begin
  X := AVector.X;
  Y := AVector.Y;
end;

procedure TVector.Add(aVector: TVector);
begin
  X := X + aVector.X;
  Y := Y + aVector.Y;
end;

procedure TVector.Subtract(AVector: TVector);
begin
  X := X - AVector.X;
  Y := Y - AVector.Y;
end;

procedure TVector.Multiply(AVector: TVector);
begin
  X := X * AVector.X;
  Y := Y * AVector.Y;
end;

procedure TVector.Divide(AVector: TVector);
begin
  X := X / AVector.X;
  Y := Y / AVector.Y;
end;

function TVector.Magnitude(): Single;
begin
  Result := Sqrt((X * X) + (Y * Y));
end;

function TVector.MagnitudeTruncate(AMaxMagitude: Single): TVector;
var
  LMaxMagSqrd: Single;
  LVecMagSqrd: Single;
  LTruc: Single;
begin
  Result.Assign(X, Y);
  LMaxMagSqrd := AMaxMagitude * AMaxMagitude;
  LVecMagSqrd := Result.Magnitude;
  if LVecMagSqrd > LMaxMagSqrd then
  begin
    LTruc := (AMaxMagitude / Sqrt(LVecMagSqrd));
    Result.X := Result.X * LTruc;
    Result.Y := Result.Y * LTruc;
  end;
end;

function TVector.Distance(AVector: TVector): Single;
var
  LDirVec: TVector;
begin
  LDirVec.X := X - AVector.X;
  LDirVec.Y := Y - AVector.Y;
  Result := LDirVec.Magnitude;
end;

procedure TVector.Normalize();
var
  LLen, LOOL: Single;
begin
  LLen := self.Magnitude;
  if LLen <> 0 then
  begin
    LOOL := 1.0 / LLen;
    X := X * LOOL;
    Y := Y * LOOL;
  end;
end;

function TVector.Angle(AVector: TVector): Single;
var
  LXOY: Single;
  LR: TVector;
begin
  LR.Assign(self);
  LR.Subtract(AVector);
  LR.Normalize;

  if LR.Y = 0 then
  begin
    LR.Y := 0.001;
  end;

  LXOY := LR.X / LR.Y;

  Result := ArcTan(LXOY) * Math.RADTODEG;
  if LR.Y < 0 then
    Result := Result + 180.0;
end;

procedure TVector.Thrust(AAngle: Single; aSpeed: Single);
var
  LA: Single;
begin
  LA := AAngle + 90.0;
  Math.ClipValuef(LA, 0, 360, True);

  X := X + Math.AngleCos(Round(LA)) * -(aSpeed);
  Y := Y + Math.AngleSin(Round(LA)) * -(aSpeed);
end;

function TVector.MagnitudeSquared(): Single;
begin
  Result := (X * X) + (Y * Y);
end;

function TVector.DotProduct(AVector: TVector): Single;
begin
  Result := (X * AVector.X) + (Y * AVector.Y);
end;

procedure TVector.ScaleBy(AValue: Single);
begin
  X := X * AValue;
  Y := Y * AValue;
end;

procedure TVector.DivideBy(AValue: Single);
begin
  X := X / AValue;
  Y := Y / AValue;
end;

function TVector.Project(AVector: TVector): TVector;
var
  LDP: Single;
begin
  LDP := self.DotProduct(AVector);
  Result.X := (LDP / (AVector.X * AVector.X + AVector.Y * AVector.Y)) * AVector.X;
  Result.Y := (LDP / (AVector.X * AVector.X + AVector.Y * AVector.Y)) * AVector.Y;
end;

procedure TVector.Negate();
begin
  X := -X;
  Y := -Y;
end;

{ TSize }
class operator TSize.Initialize (out ADest: TSize);
begin
  ADest.Width := 0;
  ADest.Height := 0;
end;

{ TRect }
class operator TRect.Initialize(out ADest: TRect);
begin
  ADest.X := 0;
  ADest.Y := 0;
  ADest.Width := 0;
  ADest.Height := 0;
end;

constructor TRect.Create(const aX, aY, aWidth, aHeight: Single);
begin
  Assign(aX, aY, aWidth, aHeight);
end;

procedure TRect.Assign(aX, aY, aWidth, aHeight: Single);
begin
  X := aX;
  Y := aY;
  Width := aWidth;
  Height := aHeight;
end;

function  TRect.Intersect(aRect: TRect): Boolean;
var
  LR1R, LR1B: Single;
  LR2R, LR2B: Single;
begin
  LR1R := X - (Width - 1);
  LR1B := Y - (Height - 1);
  LR2R := aRect.X - (aRect.Width - 1);
  LR2B := aRect.Y - (aRect.Height - 1);

  Result := (X < LR2R) and (LR1R > aRect.X) and (Y < LR2B) and (LR1B > aRect.Y);
end;

{ TMath }
class constructor Math.Create();
var
  I: Integer;
begin
  // init random number generator
  System.Randomize;

  // init sin/cos tables
  for I := 0 to 360 do
  begin
    FCosTable[I] := cos((I * PI / 180.0));
    FSinTable[I] := sin((I * PI / 180.0));
  end;
end;

class destructor Math.Destroy();
begin
end;

class function  Math.Point(const X, Y: Single): TPoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

class function  Math.Vector(const X, Y: Single): TVector;
begin
  Result.X := X;
  Result.Y := Y;
end;

class function  Math.Size(const AWidth, AHeight: Single): TSize;
begin
  Result.Width := AWidth;
  Result.Height := AHeight;
end;

class function  Math.Rect(const X, Y, AWidth, AHeight: Single): TRect;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Width := AWidth;
  Result.Height := AHeight;
end;

class function  Math.Extent(const AMinX, AMinY, AMaxX, AMaxY: Single): TExtent;
begin
  Result.MinX := AMinX;
  Result.MinY := AMinY;
  Result.MaxX := AMaxX;
  Result.MaxY := AMaxY;
end;

class function  Math.AngleCos(const AAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(AAngle, 0, 360);
  Result := FCosTable[LAngle];
end;

class function  Math.AngleSin(const AAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(AAngle, 0, 360);
  Result := FSinTable[LAngle];
end;

function _RandomRange(const aFrom, aTo: Integer): Integer;
var
  LFrom: Integer;
  LTo: Integer;
begin
  LFrom := aFrom;
  LTo := aTo;

  if AFrom > ATo then
    Result := Random(LFrom - LTo) + ATo
  else
    Result := Random(LTo - LFrom) + AFrom;
end;

class function  Math.RandomRange(const AMin, AMax: Integer): Integer;
begin
  Result := _RandomRange(AMin, AMax + 1);
end;

class function  Math.RandomRangef(const AMin, AMax: Single): Single;
var
  LNum: Single;
begin
  LNum := _RandomRange(0, MaxInt) / MaxInt;
  Result := AMin + (LNum * (AMax - AMin));
end;

class function  Math.RandomBool(): Boolean;
begin
  Result := Boolean(_RandomRange(0, 2) = 1);
end;

class function  Math.GetRandomSeed(): Integer;
begin
  Result := System.RandSeed;
end;

class procedure Math.SetRandomSeed(const AVaLue: Integer);
begin
  System.RandSeed := AVaLue;
end;

class function  Math.ClipVaLuef(var AVaLue: Single; const AMin, AMax: Single; const AWrap: Boolean): Single;
begin
  if AWrap then
    begin
      if (AVaLue > AMax) then
      begin
        AVaLue := AMin + Abs(AVaLue - AMax);
        if AVaLue > AMax then
          AVaLue := AMax;
      end
      else if (AVaLue < AMin) then
      begin
        AVaLue := AMax - Abs(AVaLue - AMin);
        if AVaLue < AMin then
          AVaLue := AMin;
      end
    end
  else
    begin
      if AVaLue < AMin then
        AVaLue := AMin
      else if AVaLue > AMax then
        AVaLue := AMax;
    end;

  Result := AVaLue;
end;

class function  Math.ClipVaLue(var AVaLue: Integer; const aMin, AMax: Integer; const AWrap: Boolean): Integer;
begin
  if AWrap then
    begin
      if (AVaLue > AMax) then
      begin
        AVaLue := aMin + Abs(AVaLue - AMax);
        if AVaLue > AMax then
          AVaLue := AMax;
      end
      else if (AVaLue < aMin) then
      begin
        AVaLue := AMax - Abs(AVaLue - aMin);
        if AVaLue < aMin then
          AVaLue := aMin;
      end
    end
  else
    begin
      if AVaLue < aMin then
        AVaLue := aMin
      else if AVaLue > AMax then
        AVaLue := AMax;
    end;

  Result := AVaLue;
end;

class function  Math.SameSign(const AVaLue1, AVaLue2: Integer): Boolean;
begin
  if Sign(AVaLue1) = Sign(AVaLue2) then
    Result := True
  else
    Result := False;
end;

class function  Math.SameSignf(const AVaLue1, AVaLue2: Single): Boolean;
begin
  if System.Math.Sign(AVaLue1) = System.Math.Sign(AVaLue2) then
    Result := True
  else
    Result := False;
end;

class function  Math.SameValue(const AA, AB: Double; const AEpsilon: Double = 0): Boolean;
begin
  Result := System.Math.SameVaLue(AA, AB, AEpsilon);
end;

class function  Math.SameVaLuef(const AA, AB: Single; const AEpsilon: Single = 0): Boolean;
begin
  Result := System.Math.SameVaLue(AA, AB, AEpsilon);
end;

class function  Math.AngleDiff(const ASrcAngle, ADestAngle: Single): Single;
var
  C: Single;
begin
  C := ADestAngle-ASrcAngle-(Floor((ADestAngle-ASrcAngle)/360.0)*360.0);

  if C >= (360.0 / 2) then
  begin
    C := C - 360.0;
  end;
  Result := C;
end;

class procedure Math.AngleRotatePos(const AAngle: Single; var AX, AY: Single);
var
  nx,ny: Single;
  ia: Integer;
  LAngle: Single;
begin
  LAngle := EnsureRange(AAngle, 0, 360);

  ia := Round(LAngle);

  nx := AX*FCosTable[ia] - AY*FSinTable[ia];
  ny := AY*FCosTable[ia] + AX*FSinTable[ia];

  AX := nx;
  AY := ny;
end;

class procedure Math.SmoothMove(var AVaLue: Single; const AAmount, AMax, ADrag: Single);
var
  LAmt: Single;
begin
  LAmt := AAmount;

  if LAmt > 0 then
  begin
    AVaLue := AVaLue + LAmt;
    if AVaLue > AMax then
      AVaLue := AMax;
  end else if LAmt < 0 then
  begin
    AVaLue := AVaLue + LAmt;
    if AVaLue < -AMax then
      AVaLue := -AMax;
  end else
  begin
    if AVaLue > 0 then
    begin
      AVaLue := AVaLue - ADrag;
      if AVaLue < 0 then
        AVaLue := 0;
    end else if AVaLue < 0 then
    begin
      AVaLue := AVaLue + ADrag;
      if AVaLue > 0 then
        AVaLue := 0;
    end;
  end;
end;

class function  Math.Lerp(const AFrom, ATo, ATime: Double): Double;
begin
  if ATime <= 0.5 then
    Result := AFrom + (ATo - AFrom) * ATime
  else
    Result := ATo - (ATo - AFrom) * (1.0 - ATime);
end;

class function  Math.PointInRectangle(APoint: TVector; ARect: TRect): Boolean;
begin
  if ((APoint.x >= ARect.x) and (APoint.x <= (ARect.x + ARect.width)) and
    (APoint.y >= ARect.y) and (APoint.y <= (ARect.y + ARect.height))) then
    Result := True
  else
    Result := False;
end;

class function  Math.PointInCircle(APoint, ACenter: TVector; ARadius: Single): Boolean;
begin
  Result := CirclesOverlap(APoint, 0, ACenter, ARadius);
end;

class function  Math.PointInTriangle(APoint, AP1, AP2, AP3: TVector): Boolean;
var
  LAlpha, LBeta, LGamma: Single;
begin
  LAlpha := ((AP2.y - AP3.y) * (APoint.x - AP3.x) + (AP3.x - AP2.x) *
    (APoint.y - AP3.y)) / ((AP2.y - AP3.y) * (AP1.x - AP3.x) + (AP3.x - AP2.x) *
    (AP1.y - AP3.y));

  LBeta := ((AP3.y - AP1.y) * (APoint.x - AP3.x) + (AP1.x - AP3.x) *
    (APoint.y - AP3.y)) / ((AP2.y - AP3.y) * (AP1.x - AP3.x) + (AP3.x - AP2.x) *
    (AP1.y - AP3.y));

  LGamma := 1.0 - LAlpha - LBeta;

  if ((LAlpha > 0) and (LBeta > 0) and (LGamma > 0)) then
    Result := True
  else
    Result := False;
end;

class function  Math.CirclesOverlap(ACenter1: TVector; ARadius1: Single; ACenter2: TVector; ARadius2: Single): Boolean;
var
  LDX, LDY, LDistance: Single;
begin
  LDX := ACenter2.x - ACenter1.x; // X distance between centers
  LDY := ACenter2.y - ACenter1.y; // Y distance between centers

  LDistance := sqrt(LDX * LDX + LDY * LDY); // Distance between centers

  if (LDistance <= (ARadius1 + ARadius2)) then
    Result := True
  else
    Result := False;
end;

class function  Math.CircleInRectangle(ACenter: TVector; ARadius: Single; ARect: TRect): Boolean;
var
  LDX, LDY: Single;
  LCornerDistanceSq: Single;
  LRecCenterX: Integer;
  LRecCenterY: Integer;
begin
  LRecCenterX := Round(ARect.x + ARect.width / 2);
  LRecCenterY := Round(ARect.y + ARect.height / 2);

  LDX := abs(ACenter.x - LRecCenterX);
  LDY := abs(ACenter.y - LRecCenterY);

  if (LDX > (ARect.width / 2.0 + ARadius)) then
  begin
    Result := False;
    Exit;
  end;

  if (LDY > (ARect.height / 2.0 + ARadius)) then
  begin
    Result := False;
    Exit;
  end;

  if (LDX <= (ARect.width / 2.0)) then
  begin
    Result := True;
    Exit;
  end;
  if (LDY <= (ARect.height / 2.0)) then
  begin
    Result := True;
    Exit;
  end;

  LCornerDistanceSq := (LDX - ARect.width / 2.0) * (LDX - ARect.width / 2.0) +
    (LDY - ARect.height / 2.0) * (LDY - ARect.height / 2.0);

  Result := Boolean(LCornerDistanceSq <= (ARadius * ARadius));
end;

class function  Math.RectanglesOverlap(ARect1: TRect; ARect2: TRect): Boolean;
var
  LDX, LDY: Single;
begin
  LDX := abs((ARect1.x + ARect1.width / 2) - (ARect2.x + ARect2.width / 2));
  LDY := abs((ARect1.y + ARect1.height / 2) - (ARect2.y + ARect2.height / 2));

  if ((LDX <= (ARect1.width / 2 + ARect2.width / 2)) and
    ((LDY <= (ARect1.height / 2 + ARect2.height / 2)))) then
    Result := True
  else
    Result := False;
end;

class function  Math.RectangleIntersection(ARect1, ARect2: TRect): TRect;
var
  LDXX, LDYY: Single;
begin
  Result.Assign(0, 0, 0, 0);

  if RectanglesOverlap(ARect1, ARect2) then
  begin
    LDXX := abs(ARect1.x - ARect2.x);
    LDYY := abs(ARect1.y - ARect2.y);

    if (ARect1.x <= ARect2.x) then
    begin
      if (ARect1.y <= ARect2.y) then
      begin
        Result.x := ARect2.x;
        Result.y := ARect2.y;
        Result.width := ARect1.width - LDXX;
        Result.height := ARect1.height - LDYY;
      end
      else
      begin
        Result.x := ARect2.x;
        Result.y := ARect1.y;
        Result.width := ARect1.width - LDXX;
        Result.height := ARect2.height - LDYY;
      end
    end
    else
    begin
      if (ARect1.y <= ARect2.y) then
      begin
        Result.x := ARect1.x;
        Result.y := ARect2.y;
        Result.width := ARect2.width - LDXX;
        Result.height := ARect1.height - LDYY;
      end
      else
      begin
        Result.x := ARect1.x;
        Result.y := ARect1.y;
        Result.width := ARect2.width - LDXX;
        Result.height := ARect2.height - LDYY;
      end
    end;

    if (ARect1.width > ARect2.width) then
    begin
      if (Result.width >= ARect2.width) then
        Result.width := ARect2.width;
    end
    else
    begin
      if (Result.width >= ARect1.width) then
        Result.width := ARect1.width;
    end;

    if (ARect1.height > ARect2.height) then
    begin
      if (Result.height >= ARect2.height) then
        Result.height := ARect2.height;
    end
    else
    begin
      if (Result.height >= ARect1.height) then
        Result.height := ARect1.height;
    end
  end;
end;

class function  Math.LineIntersection(AX1, AY1, AX2, AY2, AX3, AY3, AX4, AY4: Integer; var AX: Integer; var AY: Integer): TLineIntersection;
var
  LAX, LBX, LCX, LAY, LBY, LCY, LD, LE, LF, LNum: Integer;
  LOffset: Integer;
  LX1Lo, LX1Hi, LY1Lo, LY1Hi: Integer;
begin
  Result := liNone;

  LAX := AX2 - AX1;
  LBX := AX3 - AX4;

  if (LAX < 0) then // X bound box test
  begin
    LX1Lo := AX2;
    LX1Hi := AX1;
  end
  else
  begin
    LX1Hi := AX2;
    LX1Lo := AX1;
  end;

  if (LBX > 0) then
  begin
    if (LX1Hi < AX4) or (AX3 < LX1Lo) then
      Exit;
  end
  else
  begin
    if (LX1Hi < AX3) or (AX4 < LX1Lo) then
      Exit;
  end;

  LAY := AY2 - AY1;
  LBY := AY3 - AY4;

  if (LAY < 0) then // Y bound box test
  begin
    LY1Lo := AY2;
    LY1Hi := AY1;
  end
  else
  begin
    LY1Hi := AY2;
    LY1Lo := AY1;
  end;

  if (LBY > 0) then
  begin
    if (LY1Hi < AY4) or (AY3 < LY1Lo) then
      Exit;
  end
  else
  begin
    if (LY1Hi < AY3) or (AY4 < LY1Lo) then
      Exit;
  end;

  LCX := AX1 - AX3;
  LCY := AY1 - AY3;
  LD := LBY * LCX - LBX * LCY; // alpha numerator
  LF := LAY * LBX - LAX * LBY; // both denominator

  if (LF > 0) then // alpha tests
  begin
    if (LD < 0) or (LD > LF) then
      Exit;
  end
  else
  begin
    if (LD > 0) or (LD < LF) then
      Exit
  end;

  LE := LAX * LCY - LAY * LCX; // beta numerator
  if (LF > 0) then // beta tests
  begin
    if (LE < 0) or (LE > LF) then
      Exit;
  end
  else
  begin
    if (LE > 0) or (LE < LF) then
      Exit;
  end;

  // compute intersection coordinates

  if (LF = 0) then
  begin
    Result := liParallel;
    Exit;
  end;

  LNum := LD * LAX; // numerator
  // if SameSigni(num, f) then
  if Sign(LNum) = Sign(LF) then

    LOffset := LF div 2
  else
    LOffset := -LF div 2;
  AX := AX1 + (LNum + LOffset) div LF; // intersection x

  LNum := LD * LAY;
  // if SameSigni(num, f) then
  if Sign(LNum) = Sign(LF) then
    LOffset := LF div 2
  else
    LOffset := -LF div 2;

  AY := AY1 + (LNum + LOffset) div LF; // intersection y

  Result := liTrue;
end;

class function  Math.RadiusOverlap(ARadius1, AX1, AY1, ARadius2, AX2, AY2, AShrinkFactor: Single): Boolean;
var
  LDist: Single;
  LR1, LR2: Single;
  LV1, LV2: TVector;
begin
  LR1 := ARadius1 * AShrinkFactor;
  LR2 := ARadius2 * AShrinkFactor;

  LV1.x := AX1;
  LV1.y := AY1;
  LV2.x := AX2;
  LV2.y := AY2;

  LDist := LV1.distance(LV2);

  if (LDist < LR1) or (LDist < LR2) then
    Result := True
  else
    Result := False;
end;

class function  Math.EaseValue(ACurrentTime: Double; AStartValue: Double; AChangeInValue: Double; ADuration: Double; AEaseType: TEaseType): Double;
begin
  Result := 0;
  case AEaseType of
    etLinearTween:
      begin
        Result := AChangeInValue * ACurrentTime / ADuration + AStartValue;
      end;

    etInQuad:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime + AStartValue;
      end;

    etOutQuad:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := -AChangeInValue * ACurrentTime * (ACurrentTime-2) + AStartValue;
      end;

    etInOutQuad:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 1;
          Result := -AChangeInValue / 2 * (ACurrentTime * (ACurrentTime - 2) - 1) + AStartValue;
        end;
      end;

    etInCubic:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue;
      end;

    etOutCubic:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := AChangeInValue * ( ACurrentTime * ACurrentTime * ACurrentTime + 1) + AStartValue;
      end;

    etInOutCubic:
      begin
        ACurrentTime := ACurrentTime / (ADuration/2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := AChangeInValue / 2 * (ACurrentTime * ACurrentTime * ACurrentTime + 2) + AStartValue;
        end;
      end;

    etInQuart:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue;
      end;

    etOutQuart:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := -AChangeInValue * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime - 1) + AStartValue;
      end;

    etInOutQuart:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := -AChangeInValue / 2 * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime - 2) + AStartValue;
        end;
      end;

    etInQuint:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := AChangeInValue * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue;
      end;

    etOutQuint:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := AChangeInValue * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + 1) + AStartValue;
      end;

    etInOutQuint:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := AChangeInValue / 2 * (ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime * ACurrentTime + 2) + AStartValue;
        end;
      end;

    etInSine:
      begin
        Result := -AChangeInValue * Cos(ACurrentTime / ADuration * (PI / 2)) + AChangeInValue + AStartValue;
      end;

    etOutSine:
      begin
        Result := AChangeInValue * Sin(ACurrentTime / ADuration * (PI / 2)) + AStartValue;
      end;

    etInOutSine:
      begin
        Result := -AChangeInValue / 2 * (Cos(PI * ACurrentTime / ADuration) - 1) + AStartValue;
      end;

    etInExpo:
      begin
        Result := AChangeInValue * Power(2, 10 * (ACurrentTime/ADuration - 1) ) + AStartValue;
      end;

    etOutExpo:
      begin
        Result := AChangeInValue * (-Power(2, -10 * ACurrentTime / ADuration ) + 1 ) + AStartValue;
      end;

    etInOutExpo:
      begin
        ACurrentTime := ACurrentTime / (ADuration/2);
        if ACurrentTime < 1 then
          Result := AChangeInValue / 2 * Power(2, 10 * (ACurrentTime - 1) ) + AStartValue
        else
         begin
           ACurrentTime := ACurrentTime - 1;
           Result := AChangeInValue / 2 * (-Power(2, -10 * ACurrentTime) + 2 ) + AStartValue;
         end;
      end;

    etInCircle:
      begin
        ACurrentTime := ACurrentTime / ADuration;
        Result := -AChangeInValue * (Sqrt(1 - ACurrentTime * ACurrentTime) - 1) + AStartValue;
      end;

    etOutCircle:
      begin
        ACurrentTime := (ACurrentTime / ADuration) - 1;
        Result := AChangeInValue * Sqrt(1 - ACurrentTime * ACurrentTime) + AStartValue;
      end;

    etInOutCircle:
      begin
        ACurrentTime := ACurrentTime / (ADuration / 2);
        if ACurrentTime < 1 then
          Result := -AChangeInValue / 2 * (Sqrt(1 - ACurrentTime * ACurrentTime) - 1) + AStartValue
        else
        begin
          ACurrentTime := ACurrentTime - 2;
          Result := AChangeInValue / 2 * (Sqrt(1 - ACurrentTime * ACurrentTime) + 1) + AStartValue;
        end;
      end;
  end;
end;

class function  Math.EasePosition(AStartPos: Double; AEndPos: Double; ACurrentPos: Double; AEaseType: TEaseType): Double;
var
  LT, LB, LC, LD: Double;
begin
  LC := AEndPos - AStartPos;
  LD := 100;
  LT := ACurrentPos;
  LB := AStartPos;
  Result := EaseValue(LT, LB, LC, LD, AEaseType);
  if Result > 100 then
    Result := 100;
end;

class function  Math.OBBIntersect(const AObbA, AObbB: TlgOBB): Boolean;
var
  LAxes: array[0..3] of TPoint;
  I: Integer;
  LProjA, LProjB: TPoint;

  function Dot(const A, B: TPoint): Single;
  begin
    Result := A.x * B.x + A.y * B.y;
  end;

  function Rotate(const V: TPoint; AAngle: Single): TPoint;
  var
    s, c: Single;
    LAngle: Cardinal;
  begin
    LAngle := Abs(Round(AAngle));
    s := Math.AngleSin(LAngle);
    c := Math.AngleCos(LAngle);
    Result.x := V.x * c - V.y * s;
    Result.y := V.x * s + V.y * c;
  end;

  function Project(const AObb: TlgOBB; const AAxis: TPoint): TPoint;
  var
    LCorners: array[0..3] of TPoint;
    I: Integer;
    LDot: Single;
  begin
    LCorners[0] := Rotate(Math.Point(AObb.Extents.x, AObb.Extents.y), AObb.Rotation);
    LCorners[1] := Rotate(Math.Point(-AObb.Extents.x, AObb.Extents.y), AObb.Rotation);
    LCorners[2] := Rotate(Math.Point(AObb.Extents.x, -AObb.Extents.y), AObb.Rotation);
    LCorners[3] := Rotate(Math.Point(-AObb.Extents.x, -AObb.Extents.y), AObb.Rotation);

    Result.x := Dot(AAxis, Math.Point(AObb.Center.x + LCorners[0].x, AObb.Center.y + LCorners[0].y));
    Result.y := Result.x;

    for I := 1 to 3 do
    begin
      LDot := Dot(AAxis, Math.Point(AObb.Center.x + LCorners[I].x, AObb.Center.y + LCorners[I].y));
      if LDot < Result.x then Result.x := LDot;
      if LDot > Result.y then Result.y := LDot;
    end;
  end;


begin
  LAxes[0] := Rotate(Math.Point(1, 0), AObbA.Rotation);
  LAxes[1] := Rotate(Math.Point(0, 1), AObbA.Rotation);
  LAxes[2] := Rotate(Math.Point(1, 0), AObbB.Rotation);
  LAxes[3] := Rotate(Math.Point(0, 1), AObbB.Rotation);

  for I := 0 to 3 do
  begin
    LProjA := Project(AObbA, LAxes[I]);
    LProjB := Project(AObbB, LAxes[I]);
    if (LProjA.y < LProjB.x) or (LProjB.y < LProjA.x) then Exit(False);
  end;

  Result := True;
end;

class function  Math.UnitToScalarValue(const AValue, AMaxValue: Double): Double;
var
  LGain: Double;
  LFactor: Double;
  LVolume: Double;
begin
  LGain := (EnsureRange(AValue, 0.0, 1.0) * 50) - 50;
  LFactor := Power(10, LGain * 0.05);
  LVolume := EnsureRange(AMaxValue * LFactor, 0, AMaxValue);
  Result := LVolume;
end;

constructor TAsyncThread.Create();
begin
  inherited Create(True);

  FTask := nil;
  FWait := nil;
  FFinished := False;
end;

destructor TAsyncThread.Destroy();
begin
  inherited;
end;

procedure TAsyncThread.Execute();
begin
  FFinished := False;

  if Assigned(FTask) then
  begin
    FTask();
  end;

  FFinished := True;
end;

{ Async }
class constructor Async.Create();
begin
  FQueue := TList<TAsyncThread>.Create;
  FBusy := TDictionary<string, TBusyData>.Create;
end;

class destructor Async.Destroy();
begin
  FBusy.Free();
  FQueue.Free();
end;

class procedure Async.Clear();
begin
  FBusy.Clear();
  FQueue.Clear();
end;

class procedure Async.Process();
var
  LAsyncThread: TAsyncThread;
  LAsyncThread2: TAsyncThread;
  LIndex: TBusyData;
  LBusy: TBusyData;
begin
  Enter();

  if TThread.CurrentThread.ThreadID = MainThreadID then
  begin
    for LAsyncThread in FQueue do
    begin
      if Assigned(LAsyncThread) then
      begin
        if LAsyncThread.Finished then
        begin
          LAsyncThread.WaitFor();
          LAsyncThread.WaitProc();
          FQueue.Remove(LAsyncThread);
          for LIndex in FBusy.Values do
          begin
            if Lindex.Thread = LAsyncThread then
            begin
              LBusy := LIndex;
              LBusy.Flag := False;
              FBusy.AddOrSetValue(LBusy.Name, LBusy);
              Break;
            end;
          end;
          LAsyncThread2 := LAsyncThread;
          FreeAndNil(LAsyncThread2);
        end;
      end;
    end;
    FQueue.Pack;
  end;

  Leave();
end;

class procedure Async.Run(const AName: string; const ABackgroundTask: TAsyncProc; const AWaitForgroundTask: TAsyncProc);
var
  LAsyncThread: TAsyncThread;
  LBusy: TBusyData;
begin
  if not Assigned(ABackgroundTask) then Exit;
  if not Assigned(AWaitForgroundTask) then Exit;
  if AName.IsEmpty then Exit;
  if Busy(AName) then Exit;
  Enter;
  LAsyncThread := TAsyncThread.Create;
  LAsyncThread.TaskProc := ABackgroundTask;
  LAsyncThread.WaitProc := AWaitForgroundTask;
  FQueue.Add(LAsyncThread);
  LBusy.Name := AName;
  LBusy.Thread := LAsyncThread;
  LBusy.Flag := True;
  FBusy.AddOrSetValue(AName, LBusy);
  LAsyncThread.Start;
  Leave;
end;

class function  Async.Busy(const AName: string): Boolean;
var
  LBusy: TBusyData;
begin
  Result := False;
  if AName.IsEmpty then Exit;
  Enter;
  FBusy.TryGetValue(AName, LBusy);
  Leave;
  Result := LBusy.Flag;
end;

class procedure Async.Suspend();
var
  LAsyncThread: TAsyncThread;
begin
  for LAsyncThread in FQueue do
  begin
    if not LAsyncThread.Suspended then
      LAsyncThread.Suspend;
  end;
end;

class procedure Async.Resume();
var
  LAsyncThread: TAsyncThread;
begin
  for LAsyncThread in FQueue do
  begin
    if LAsyncThread.Suspended then
      LAsyncThread.Resume;
  end;
end;

class procedure Async.Enter();
begin
  Utils.EnterCriticalSection();
end;

class procedure Async.Leave();
begin
  Utils.LeaveCriticalSection();
end;

{ TVirtualBuffer }
procedure TVirtualBuffer.Clear();
begin
  if (Memory <> nil) then
  begin
    if not UnmapViewOfFile(Memory) then
      raise Exception.Create('Error deallocating mapped memory');
  end;

  if (FHandle <> 0) then
  begin
    if not CloseHandle(FHandle) then
      raise Exception.Create('Error freeing memory mapping handle');
  end;
end;

constructor TVirtualBuffer.Create(aSize: Cardinal);
var
  P: Pointer;
begin
  inherited Create;
  FName := TPath.GetGUIDFileName;
  FHandle := CreateFileMapping(INVALID_HANDLE_VALUE, nil, PAGE_READWRITE, 0, aSize, PChar(FName));
  if FHandle = 0 then
    begin
      Clear;
      raise Exception.Create('Error creating memory mapping');
      FHandle := 0;
    end
  else
    begin
      P := MapViewOfFile(FHandle, FILE_MAP_ALL_ACCESS, 0, 0, 0);
      if P = nil then
        begin
          Clear;
          raise Exception.Create('Error creating memory mapping');
        end
      else
        begin
          Self.SetPointer(P, aSize);
          Position := 0;
        end;
    end;
end;

destructor TVirtualBuffer.Destroy();
begin
  Clear;
  inherited;
end;

function TVirtualBuffer.Write(const aBuffer; aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer, (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

function TVirtualBuffer.Write(const aBuffer: TBytes; aOffset, aCount: Longint): Longint;
var
  Pos: Int64;
begin
  if (Position >= 0) and (aCount >= 0) then
  begin
    Pos := Position + aCount;
    if Pos > 0 then
    begin
      if Pos > Size then
      begin
        Result := 0;
        Exit;
      end;
      System.Move(aBuffer[aOffset], (PByte(Memory) + Position)^, aCount);
      Position := Pos;
      Result := aCount;
      Exit;
    end;
  end;
  Result := 0;
end;

procedure TVirtualBuffer.SaveToFile(aFilename: string);
var
  LStream: TFileStream;
begin
  LStream := TFile.Create(aFilename);
  try
    LStream.Write(Memory^, Size);
  finally
    LStream.Free;
  end;
end;

class function TVirtualBuffer.LoadFromFile(const aFilename: string): TVirtualBuffer;
var
  LStream: TStream;
  LBuffer: TVirtualBuffer;
begin
  Result := nil;
  if aFilename.IsEmpty then Exit;
  if not TFile.Exists(aFilename) then Exit;
  LStream := TFile.OpenRead(aFilename);
  try
    LBuffer := TVirtualBuffer.Create(LStream.Size);
    if LBuffer <> nil then
    begin
      LBuffer.CopyFrom(LStream);
    end;
  finally
    FreeAndNil(LStream);
  end;
  Result := LBuffer;
end;

function  TVirtualBuffer.Eob(): Boolean;
begin
  Result := Boolean(Position >= Size);
end;

function  TVirtualBuffer.ReadString(): string;
var
  LLength: LongInt;
begin
  Read(LLength, SizeOf(LLength));
  SetLength(Result, LLength);
  if LLength > 0 then Read(Result[1], LLength * SizeOf(Char));
end;

{ TRingBuffer }
constructor TRingBuffer<T>.Create(ACapacity: Integer);
begin
  SetLength(FBuffer, ACapacity);
  FReadIndex := 0;
  FWriteIndex := 0;
  FCapacity := ACapacity;
  Clear;
end;

function TRingBuffer<T>.Write(const AData: array of T;
  ACount: Integer): Integer;
var
  i, WritePos: Integer;
begin
  Utils.EnterCriticalSection();
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      FBuffer[WritePos] := AData[i];
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    Utils.LeaveCriticalSection();
  end;
end;

function TRingBuffer<T>.Read(var AData: array of T; ACount: Integer): Integer;
var
  i, ReadPos: Integer;
begin
  for i := 0 to ACount - 1 do
  begin
    ReadPos := (FReadIndex + i) mod FCapacity;
    AData[i] := FBuffer[ReadPos];
  end;
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
  Result := ACount;
end;

function TRingBuffer<T>.DirectReadPointer(ACount: Integer): Pointer;
begin
  Result := @FBuffer[FReadIndex mod FCapacity];
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
end;

function TRingBuffer<T>.AvailableBytes(): Integer;
begin
  Result := (FCapacity + FWriteIndex - FReadIndex) mod FCapacity;
end;

procedure TRingBuffer<T>.Clear();
var
  I: Integer;
begin

  Utils.EnterCriticalSection();
  try
    for I := Low(FBuffer) to High(FBuffer) do
    begin
     FBuffer[i] := Default(T);
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    Utils.LeaveCriticalSection();
  end;
end;

{ TVirtualRingBuffer }
function TVirtualRingBuffer<T>.GetArrayValue(AIndex: Integer): T;
begin
  Result := PType(PByte(FBuffer.Memory) + AIndex * SizeOf(T))^;
end;

procedure TVirtualRingBuffer<T>.SetArrayValue(AIndex: Integer; AValue: T);
begin
  PType(PByte(FBuffer.Memory) + AIndex * SizeOf(T))^ := AValue;
end;

constructor TVirtualRingBuffer<T>.Create(ACapacity: Integer);
begin
  //SetLength(FBuffer, ACapacity);
  FBuffer := TVirtualBuffer.Create(ACapacity*SizeOf(T));
  FReadIndex := 0;
  FWriteIndex := 0;
  FCapacity := ACapacity;
  Clear;
end;

destructor TVirtualRingBuffer<T>.Destroy;
begin
  FBuffer.Free;
  inherited;
end;

function TVirtualRingBuffer<T>.Write(const AData: array of T;
  ACount: Integer): Integer;
var
  i, WritePos: Integer;
begin
  Utils.EnterCriticalSection();
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      //FBuffer[WritePos] := AData[i];
      SetArrayValue(WritePos, AData[i]);
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    Utils.LeaveCriticalSection();
  end;
end;

function TVirtualRingBuffer<T>.Read(var AData: array of T; ACount: Integer): Integer;
var
  i, ReadPos: Integer;
begin
  for i := 0 to ACount - 1 do
  begin
    ReadPos := (FReadIndex + i) mod FCapacity;
    //AData[i] := FBuffer[ReadPos];
    AData[i] := GetArrayValue(ReadPos);
  end;
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
  Result := ACount;
end;

function TVirtualRingBuffer<T>.DirectReadPointer(ACount: Integer): Pointer;
begin
  //Result := @FBuffer[FReadIndex mod FCapacity];
  Result := PType(PByte(FBuffer.Memory) + (FReadIndex mod FCapacity) * SizeOf(T));
  FReadIndex := (FReadIndex + ACount) mod FCapacity;
end;

function TVirtualRingBuffer<T>.AvailableBytes(): Integer;
begin
  Result := (FCapacity + FWriteIndex - FReadIndex) mod FCapacity;
end;

procedure TVirtualRingBuffer<T>.Clear();
var
  I: Integer;
begin

  Utils.EnterCriticalSection();
  try
    for I := 0 to FCapacity-1 do
    begin
     SetArrayValue(I, Default(T));
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    Utils.LeaveCriticalSection();
  end;
end;

{ TIO }
constructor TIO.Create();
begin
  inherited;
end;

destructor TIO.Destroy();
begin
  inherited;
end;

procedure TIO.Close();
begin
end;

function  TIO.Opened(): Boolean;
begin
  Result := False;
end;

function  TIO.Size(): Int64;
begin
  Result := -1;
end;

function  TIO.Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64;
begin
  Result := -1;
end;

function  TIO.Read(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := -1;
end;

function  TIO.Write(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := -1;
end;

function  TIO.Tell(): Int64;
begin
  Result := -1;
end;

function  TIO.Eos(): Boolean;
begin
  Result := False;
end;

{ TStreamIO }
constructor TMemoryIO.Create();
begin
  inherited;
  FHandle := TMemoryStream.Create();
end;

destructor TMemoryIO.Destroy();
begin
  Close();
  inherited;
end;

function  TMemoryIO.Duplicate(): TIO;
var
  LIO: TMemoryIO;
begin
  LIO := TMemoryIO.Create;
  LIO.FHandle.CopyFrom(Self.FHandle);
  LIO.Seek(0, smStart);
  Result := LIO;
end;

function  TMemoryIO.Opened(): Boolean;
begin
  Result := Assigned(FHandle);
end;

procedure TMemoryIO.Close();
begin
  if not Assigned(FHandle) then Exit;
  FHandle.Free();
  FHandle := nil;
end;

function  TMemoryIO.Size(): Int64;
begin
  Result := FHandle.Size;
end;

function  TMemoryIO.Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64;
begin
  Result := FHandle.Seek(AOffset, Ord(ASeek));
end;

function  TMemoryIO.Read(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := FHandle.Read(AData^, ASize);
end;

function  TMemoryIO.Write(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := FHandle.Write(AData^, ASize);
end;

function  TMemoryIO.Tell(): Int64;
begin
  Result := FHandle.Position;
end;

function  TMemoryIO.Eos(): Boolean;
begin
  Result := Boolean(Tell() >= Size());
end;

function  TMemoryIO.Memory(): Pointer;
begin
  Result := FHandle.Memory;
end;

class function TMemoryIO.Open(const ASize: Int64): TMemoryIO;
begin
  Result := TMemoryIO.Create();
  Result.FHandle.SetSize(ASize);
end;

class function TMemoryIO.Open(const AFilename: string): TMemoryIO;
begin
  Result := TMemoryIO.Create();
  Result.FHandle.LoadFromFile(AFilename);
end;

class function TMemoryIO.Open(const AData: Pointer; ASize: Int64): TMemoryIO;
begin
  Result := nil;
  if not Assigned(AData) then Exit;
  if ASize <= 0 then Exit;

  Result := TMemoryIO.Create();
  Result.FHandle.Write(AData^, ASize);
  Result.FHandle.Position := 0;
end;

{ TFileIO }
constructor TFileIO.Create();
begin
  inherited;
end;

destructor TFileIO.Destroy();
begin
  Close();
  inherited;
end;

function  TFileIO.Opened(): Boolean;
begin
  Result := Assigned(FHandle);
end;

procedure TFileIO.Close();
begin
  if not Assigned(FHandle) then Exit;
  FHandle.Free();
  FHandle := nil;
end;

function  TFileIO.Size(): Int64;
begin
  Result := FHandle.Size;
end;

function  TFileIO.Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64;
begin
  Result := FHandle.Seek(AOffset, Ord(ASeek));
end;

function  TFileIO.Read(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := FHandle.Read(AData^, ASize);
end;

function  TFileIO.Write(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := FHandle.Write(AData^, ASize);
end;

function  TFileIO.Tell(): Int64;
begin
  Result := FHandle.Position;
end;

function  TFileIO.Eos(): Boolean;
begin
  Result := Boolean(Tell() >= Size());
end;

function TFileIO.DoOpen(const AFilename: string; const AMode: TIOMode): Boolean;
begin
  Result := False;
  if AFilename.IsEmpty then Exit;

  try
    case AMode of
      iomRead:
      begin
        FHandle := TFile.OpenRead(AFilename);
        FMode := AMode;
      end;

      iomWrite:
      begin
        FHandle := TFile.OpenWrite(AFilename);
        FMode := AMode;
      end;
    end;
  except
    FHandle := nil;
  end;

  Result := Assigned(FHandle);

  if Result then
    Tag := AFilename;
end;

class function TFileIO.Open(const AFilename: string; const AMode: TIOMode): TFileIO;
begin
  Result := TFileIO.Create();
  if not Result.DoOpen(AFilename, AMode) then
  begin
    Result.Free();
    Result := nil;
  end;
end;

{ TZipFileIO }
constructor TZipFileIO.Create();
begin
  inherited;
end;

destructor TZipFileIO.Destroy();
begin
  Close();
  inherited;
end;

function  TZipFileIO.Opened(): Boolean;
begin
  Result := Assigned(FHandle);
end;

procedure TZipFileIO.Close();
begin
  if Assigned(FHandle) then
  begin
    Assert(unzCloseCurrentFile(FHandle) = UNZ_OK);
    Assert(unzClose(FHandle) = UNZ_OK);
  end;
  FHandle := nil;
  FPassword := '';
  FFilename := '';
end;

function  TZipFileIO.Size(): Int64;
var
  LInfo: unz_file_info64;
begin
  Result := -1;
  if not Assigned(FHandle) then Exit;
  unzGetCurrentFileInfo64(FHandle, @LInfo, nil, 0, nil, 0, nil, 0);
  Result := LInfo.uncompressed_size;
end;

function  TZipFileIO.Seek(const AOffset: Int64; const ASeek: TSeekMode): Int64;
var
  LFileInfo: unz_file_info64;
  LCurrentOffset, LBytesToRead: UInt64;
  LOffset: Int64;

  procedure SeekToLoc;
  begin
    LBytesToRead := UInt64(LOffset) - unztell64(FHandle);
    while LBytesToRead > 0 do
    begin
      if LBytesToRead > Utils.GetTempStaticBufferSize() then
        unzReadCurrentFile(FHandle, Utils.GetTempStaticBuffer(), Utils.GetTempStaticBufferSize())
      else
        unzReadCurrentFile(FHandle, Utils.GetTempStaticBuffer(), LBytesToRead);

      LBytesToRead := UInt64(LOffset) - unztell64(FHandle);
    end;
  end;

begin
  Result := -1;

  if (FHandle = nil) or (unzGetCurrentFileInfo64(FHandle, @LFileInfo, nil, 0, nil, 0, nil, 0) <> UNZ_OK) then Exit;

  LOffset := AOffset;

  LCurrentOffset := unztell64(FHandle);
  if LCurrentOffset = -1 then Exit;

  case ASeek of
    // offset is already relative to the start of the file
    smStart: ;

    // offset is relative to current position
    smCurrent: Inc(LOffset, LCurrentOffset);

    // offset is relative to end of the file
    smEnd: Inc(LOffset, LFileInfo.uncompressed_size);
  else
    Exit;
  end;

  if LOffset < 0 then
    Exit
  else if AOffset > LCurrentOffset then
  begin
    SeekToLoc;
  end
  else // offset < current_offset
  begin
    unzCloseCurrentFile(FHandle);
    unzLocateFile(FHandle, PAnsiChar(FFilename), 0);
    unzOpenCurrentFilePassword(FHandle, PAnsiChar(FPassword));
    SeekToLoc;
  end;

  Result := unztell64(FHandle);
end;

function  TZipFileIO.Read(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := -1;
  if not Assigned(FHandle) then Exit;
  Result := unzReadCurrentFile(FHandle, AData, ASize);
end;

function  TZipFileIO.Write(const AData: Pointer; const ASize: Int64): Int64;
begin
  Result := -1;
end;

function  TZipFileIO.Tell(): Int64;
begin
  Result := -1;
  if not Assigned(FHandle) then Exit;
  Result := unztell64(FHandle);
end;

function  TZipFileIO.Eos(): Boolean;
begin
  Result := False;
  if not Assigned(FHandle) then Exit;
  Result := Boolean(Tell() >= Size());
end;

function TZipFileIO.DoOpen(const AZipFilename, AFilename: string; const APassword: string): Boolean;
var
  LPassword: PAnsiChar;
  LZipFilename: PAnsiChar;
  LFilename: PAnsiChar;
  LFile: unzFile;
begin
  Result := False;

  LPassword := PAnsiChar(AnsiString(APassword));
  LZipFilename := PAnsiChar(AnsiString(StringReplace(string(AZipFilename), '/', '\', [rfReplaceAll])));
  LFilename := PAnsiChar(AnsiString(StringReplace(string(AFilename), '/', '\', [rfReplaceAll])));

  LFile := unzOpen64(LZipFilename);
  if not Assigned(LFile) then Exit;

  if unzLocateFile(LFile, LFilename, 0) <> UNZ_OK then
  begin
    unzClose(LFile);
    Exit;
  end;

  if unzOpenCurrentFilePassword(LFile, LPassword) <> UNZ_OK then
  begin
    unzClose(LFile);
    Exit;
  end;

  Close();

  FHandle := LFile;
  FPassword := LPassword;
  FFilename := LFilename;

  Tag  := AFilename;
  Result := True;
end;

class function TZipFileIO.Open(const AZipFilename, AFilename: string; const APassword: string): TZipFileIO;
begin
  Result := TZipFileIO.Create();
  if not Result.DoOpen(AZipFilename, AFilename, APassword) then
  begin
    Result.Free();
    Result := nil;
  end;
end;

{ TZipFile }
constructor TZipFile.Create();
begin
  inherited;
end;

destructor TZipFile.Destroy();
begin
  Close();
  inherited;
end;

function  TZipFile.Open(const AZipFilename: string; const APassword: string=TZipFileIO.DEFAULT_PASSWORD): Boolean;
var
  LZipFilename: PAnsiChar;
  LFile: unzFile;
begin
  Result := False;

  if FIsOpen then Exit;

  LZipFilename := PAnsiChar(AnsiString(StringReplace(string(AZipFilename), '/', '\', [rfReplaceAll])));

  LFile := unzOpen64(LZipFilename);
  if not Assigned(LFile) then Exit;

  unzClose(LFile);

  FZipFilename := AZipFilename;
  FPassword := APassword;
  FIsOpen := True;

  Result := True;
end;

function  TZipFile.IsOpen(): Boolean;
begin
  Result := FIsOpen;
end;

procedure TZipFile.Close();
begin
  FZipFilename := '';
  FPassword := '';
  FIsOpen := False;
end;

function  TZipFile.OpenFile(const AFilename: string): TZipFileIO;
begin
  Result := TZipFileIO.Open(FZipFilename, AFilename, FPassword);
end;

function  TZipFile.OpenFileToStream(const AFilename: string): TStream;
var
  LZipStream: TZipFileIO;
  LMemoryStream: TMemoryStream;
begin
  Result := nil;

  LZipStream := OpenFile(AFilename);
  try
    if not Assigned(LZipStream) then Exit;
    LMemoryStream := TMemoryStream.Create();
    LMemoryStream.SetSize(LZipStream.Size);
    LZipStream.Read(LMemoryStream.Memory, LMemoryStream.Size);
    LMemoryStream.Position := 0;
    Result := LMemoryStream;
  finally
    if Assigned(LZipStream) then
      LZipStream.Free();
  end;
end;

class function TZipFile.Init(const AZipFilename: string; const APassword: string=TZipFileIO.DEFAULT_PASSWORD): TZipFile;
begin
  Result := TZipFile.Create();
  if not Result.Open(AZipFilename, APassword) then
  begin
    Result.Free();
    Result := nil;
  end;
end;

procedure TZipFile_BuildProgress(const ASender: Pointer; const AFilename: string; const AProgress: Integer; const ANewFile: Boolean);
begin
  if aNewFile then Console.PrintLn('');
  Console.Print(Console.CR+'Adding %s(%d%s)...', [ExtractFileName(string(aFilename)), aProgress, '%']);
end;

class function TZipFile.Build(const AZipFilename, ADirectoryName: string; const ASender: Pointer; const AHandler: BuildProgress; const APassword: string): Boolean;
var
  LFileList: TStringDynArray;
  LArchive: PAnsiChar;
  LFilename: string;
  LFilename2: PAnsiChar;
  LPassword: PAnsiChar;
  LZipFile: zipFile;
  LZipFileInfo: zip_fileinfo;
  LFile: System.Classes.TStream;
  LCrc: Cardinal;
  LBytesRead: Integer;
  LFileSize: Int64;
  LProgress: Single;
  LNewFile: Boolean;
  LHandler: BuildProgress;
  LSender: Pointer;

  function GetCRC32(aStream: System.Classes.TStream): Cardinal;
  var
    LBytesRead: Integer;
    LBuffer: array of Byte;
  begin
    Result := crc32(0, nil, 0);
    repeat
      LBytesRead := AStream.Read(Utils.GetTempStaticBuffer()^, Utils.GetTempStaticBufferSize());
      Result := crc32(Result, PBytef(Utils.GetTempStaticBuffer()), LBytesRead);
    until LBytesRead = 0;

    LBuffer := nil;
  end;

begin
  Result := False;

  // check if directory exists
  if not TDirectory.Exists(ADirectoryName) then Exit;

  // init variabls
  FillChar(LZipFileInfo, SizeOf(LZipFileInfo), 0);

  // scan folder and build file list
  LFileList := TDirectory.GetFiles(ADirectoryName, '*',
    TSearchOption.soAllDirectories);

  LArchive := PAnsiChar(AnsiString(AZipFilename));
  LPassword := PAnsiChar(AnsiString(APassword));

  // create a zip file
  LZipFile := zipOpen64(LArchive, APPEND_STATUS_CREATE);

  // init handler
  LHandler := AHandler;
  LSender := ASender;

  if not Assigned(LHandler) then
    LHandler := TZipFile_BuildProgress;

  // process zip file
  if LZipFile <> nil then
  begin
    // loop through all files in list
    for LFilename in LFileList do
    begin
      // open file
      LFile := TFile.OpenRead(LFilename);

      // get file size
      LFileSize := LFile.Size;

      // get file crc
      LCrc := GetCRC32(LFile);

      // open new file in zip
      LFilename2 := PAnsiChar(AnsiString(LFilename));
      if ZipOpenNewFileInZip3_64(LZipFile, LFilename2, @LZipFileInfo, nil, 0,
        nil, 0, '',  Z_DEFLATED, 9, 0, 15, 9, Z_DEFAULT_STRATEGY,
        LPassword, LCrc, 1) = Z_OK then
      begin
        // make sure we start at star of stream
        LFile.Position := 0;

        LNewFile := True;

        // read through file
        repeat
          // read in a buffer length of file
          LBytesRead := LFile.Read(Utils.GetTempStaticBuffer()^, Utils.GetTempStaticBufferSize());

          // write buffer out to zip file
          zipWriteInFileInZip(LZipFile, Utils.GetTempStaticBuffer(), LBytesRead);

          // calc file progress percentage
          LProgress := 100.0 * (LFile.Position / LFileSize);

          // show progress
          if Assigned(LHandler) then
          begin
            LHandler(LSender, LFilename, Round(LProgress), LNewFile);
          end;

          LNewFile := False;

        until LBytesRead = 0;

        // close file in zip
        zipCloseFileInZip(LZipFile);

        // free file stream
        LFile.Free;
      end;
    end;

    // close zip file
    zipClose(LZipFile, '');
  end;

  // return true if new zip file exits
  Result := TFile.Exists(LFilename);
end;

{ TMaVPS }
function TMaVFS_OnOpen(AVFS: Pma_vfs; const AFilename: PUTF8Char;
  AOpenMode: ma_uint32; AFile: Pma_vfs_file): ma_result; cdecl;
var
  LIO: TIO;
begin
  Result := MA_ERROR;
  LIO := PMaVFS(AVFS).IO;
  if not Assigned(LIO) then Exit;
  if not LIO.Opened then Exit;
  AFile^ := LIO;
  Result := MA_SUCCESS;
end;

function TMaVFS_OnOpenW(AVFS: Pma_vfs; const AFilename: PWideChar;
  AOpenMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
begin
  Result := MA_ERROR;
end;

function TMaVFS_OnClose(AVFS: Pma_vfs; file_: ma_vfs_file): ma_result; cdecl;
var
  LIO: TIO;
begin
  Result := MA_ERROR;
  LIO := File_;
  if not Assigned(LIO) then Exit;
  if not LIO.Opened then Exit;
  LIO.Free;
  Result := MA_SUCCESS;
end;

function TMaVFS_OnRead(AVFS: Pma_vfs; file_: ma_vfs_file; AData: Pointer; ASizeInBytes: NativeUInt; ABytesRead: PNativeUInt): ma_result; cdecl;
var
  LIO: TIO;
  LResult: Int64;
begin
  Result := MA_ERROR;
  LIO := File_;
  if not Assigned(LIO) then Exit;
  if not LIO.Opened then Exit;
  LResult := LIO.Read(AData, ASizeInBytes);
  if LResult < 0 then Exit;
  ABytesRead^ := LResult;
  Result := MA_SUCCESS;
end;

function TMaVFS_OnWrite(AVFS: Pma_vfs; AVFSFile: ma_vfs_file; const AData: Pointer; ASizeInBytes: NativeUInt; ABytesWritten: PNativeUInt): ma_result; cdecl;
begin
  Result := MA_ERROR;
end;

function TMaVFS_OnSeek(AVFS: Pma_vfs; file_: ma_vfs_file; AOffset: ma_int64;
  AOrigin: ma_seek_origin): ma_result; cdecl;
var
  LIO: TIO;
begin
  Result := MA_ERROR;
  LIO := File_;
  if not Assigned(LIO) then Exit;
  if not LIO.Opened then Exit;
  LIO.Seek(AOffset, TSeekMode(AOrigin));
  Result := MA_SUCCESS;
end;

function TMaVFS_OnTell(AVFS: Pma_vfs; file_: ma_vfs_file; ACursor: Pma_int64): ma_result; cdecl;
var
  LIO: TIO;
begin
  Result := MA_ERROR;
  LIO := File_;
  if not Assigned(LIO) then Exit;
  if not LIO.Opened then Exit;
  ACursor^ := LIO.Tell;
  Result := MA_SUCCESS;
end;

function TMaVFS_OnInfo(AVFS: Pma_vfs; AVFSFile: ma_vfs_file; AInfo: Pma_file_info): ma_result; cdecl;
var
  LIO: TIO;
  LResult: Int64;
begin
  Result := MA_ERROR;
  LIO := AVFSFile;
  if not Assigned(LIO) then Exit;
  if not LIO.Opened then Exit;

  LResult := LIO.Size;
  if LResult < 0 then Exit;

  AInfo.sizeInBytes := LResult;
  Result := MA_SUCCESS;
end;

constructor TMaVFS.Create(const AIO: TIO);
begin
  Self := Default(TMaVFS);
  Callbacks.onopen := @TMaVFS_OnOpen;
  Callbacks.onOpenW := @TMaVFS_OnOpenW;
  Callbacks.onRead := @TMaVFS_OnRead;
  Callbacks.onWrite := @TMaVFS_OnWrite;
  Callbacks.onclose := @TMaVFS_OnClose;
  Callbacks.onread := @TMaVFS_OnRead;
  Callbacks.onseek := @TMaVFS_OnSeek;
  Callbacks.onTell := @TMaVFS_OnTell;
  Callbacks.onInfo := @TMaVFS_OnInfo;
  IO := AIO;
end;

{ Audio }
class function Audio.FindFreeSoundSlot(): Integer;
var
  I: Integer;
begin
  Result := ERROR;
  for I := 0 to SOUND_COUNT-1 do
  begin
    if not FSound[I].InUse then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

class function Audio.FindFreeChannelSlot(): Integer;
var
  I: Integer;
begin
  Result := ERROR;
  for I := 0 to SOUND_COUNT-1 do
  begin
    if (not FChannel[I].InUse) and (not FChannel[I].Reserved) then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

class function Audio.ValidChannel(const AChannel: Integer): Boolean;
begin
  Result := False;
  if not InRange(AChannel, 0, CHANNEL_COUNT-1) then Exit;
  if not FChannel[AChannel].InUse then Exit;
  Result := True;
end;

class constructor Audio.Create();
begin
  inherited;
end;

class destructor Audio.Destroy();
begin
  Close;
  inherited;
end;

class function  Audio.Open(): Boolean;
begin
  Result := False;
  if Opened then Exit;

  FVFS := TMaVFS.Create(nil);
  FEngineConfig := ma_engine_config_init;
  FEngineConfig.pResourceManagerVFS := @FVFS;
  if ma_engine_init(@FEngineConfig, @FEngine) <> MA_SUCCESS then Exit;

  FOpened := True;
  Result := Opened;
end;

class procedure Audio.Close();
begin
  if not Opened then Exit;
  UnloadMusic();
  UnloadAllSounds();
  ma_engine_uninit(@FEngine);
  InitData;
end;

class function Audio.Opened(): Boolean;
begin
  Result := FOpened;
end;

class procedure Audio.InitData();
var
  I: Integer;
begin
  FEngine := Default(ma_engine);

  for I := Low(FSound) to High(FSound) do
    FSound[I] := Default(TSound);

  for I := Low(FChannel) to High(FChannel) do
    FChannel[i] := Default(TChannel);

  FOpened := False;
  FPaused := False;
end;

class procedure Audio.Update();
var
  I: Integer;
begin
  if not Opened then Exit;

  // check channels
  for I := 0 to CHANNEL_COUNT-1 do
  begin
    if FChannel[I].InUse then
    begin
      if ma_sound_is_playing(@FChannel[I].Handle) = MA_FALSE then
      begin
        ma_sound_uninit(@FChannel[I].Handle);
        FChannel[I].InUse := False;
      end;
    end;
  end;
end;

class function  Audio.GetPause(): Boolean;
begin
  Result := FPaused;
end;

class procedure Audio.SetPause(const APause: Boolean);
begin
  if not Opened then Exit;

  case aPause of
    True:
    begin
      if ma_engine_stop(@FEngine) = MA_SUCCESS then
        FPaused := aPause;
    end;

    False:
    begin
      if ma_engine_start(@FEngine) = MA_SUCCESS then
        FPaused := aPause;
    end;
  end;
end;

class function  Audio.PlayMusic(const AIO: TIO; const AVolume: Single; const ALoop: Boolean; const APan: Single): Boolean;
begin
  Result := FAlse;
  if not Opened then Exit;
  if not Assigned(AIO) then Exit;
  UnloadMusic;
  FVFS.IO := AIO;
  if ma_sound_init_from_file(@FEngine, Utils.AsUtf8(AIO.Tag) , MA_SOUND_FLAG_STREAM, nil,
    nil, @FMusic.Handle) <> MA_SUCCESS then
  FVFS.IO := nil;
  ma_sound_start(@FMusic);
  FMusic.Loaded := True;
  SetMusicLoop(ALoop);
  SetMusicVolume(AVolume);
  SetMusicPan(APan);
end;

class function  Audio.PlayMusicFromFile(const AFilename: string; const AVolume: Single; const ALoop: Boolean; const APan: Single): Boolean;
var
  LIO: TIO;
begin
  Result := False;
  LIO := TFileIO.Open(AFilename, iomRead);
  if not Assigned(LIO) then Exit;
  Result := PlayMusic(LIO, AVolume, ALoop, APan);
end;

class function  Audio.PlayMusicFromZipFile(const AZipFile: TZipFile; const AFilename: string; const AVolume: Single; const ALoop: Boolean; const APan: Single): Boolean;
var
  LIO: TIO;
begin
  Result := False;
  LIO := AZipFile.OpenFile(AFilename);
  if not Assigned(LIO) then Exit;
  Result := PlayMusic(LIO, AVolume, ALoop, APan);
end;

class procedure Audio.UnloadMusic();
begin
  if not Opened then Exit;
  if not FMusic.Loaded then Exit;
  ma_sound_stop(@FMusic.Handle);
  ma_sound_uninit(@FMusic.Handle);
  FMusic.Loaded := False;
end;

class function  Audio.GetMusicLoop(): Boolean;
begin
  Result := False;
  if not Opened then Exit;
  Result := Boolean(ma_sound_is_looping(@FMusic.Handle));
end;

class procedure Audio.SetMusicLoop(const ALoop: Boolean);
begin
  if not Opened then Exit;
  ma_sound_set_looping(@FMusic.Handle, Ord(ALoop))
end;

class function  Audio.GetMusicVolume(): Single;
begin
  Result := 0;
  if not Opened then Exit;
  Result := FMusic.Volume;
end;

class procedure Audio.SetMusicVolume(const AVolume: Single);
begin
  if not Opened then Exit;
  FMusic.Volume := AVolume;
  ma_sound_set_volume(@FMusic.Handle, Math.UnitToScalarValue(AVolume, 1));
end;

class function  Audio.GetMusicPan(): Single;
begin
  Result := ma_sound_get_pan(@FMusic.Handle);
end;

class procedure Audio.SetMusicPan(const APan: Single);
begin
  ma_sound_set_pan(@FMusic.Handle, EnsureRange(APan, -1, 1));
end;

class function  Audio.LoadSound(const AIO: TIO): Integer;
var
  LResult: Integer;
begin
  Result := ERROR;
  if not FOpened then Exit;
  if FPaused then Exit;
  LResult := FindFreeSoundSlot;
  if LResult = ERROR then Exit;

  FVFS.IO := AIO;
  if ma_sound_init_from_file(@FEngine, Utils.AsUtf8(AIO.Tag), 0, nil, nil,
    @FSound[LResult].Handle) <> MA_SUCCESS then Exit;
  FVFS.IO := nil;
  FSound[LResult].InUse := True;
  Result := LResult;
end;

class function  Audio.LoadSoundFromFile(const AFilename: string): Integer;
var
  LIO: TIO;
begin
  Result := -1;
  LIO := TFileIO.Open(AFilename, iomRead);
  if not Assigned(LIO) then Exit;
  try
    Result := LoadSound(LIO);
  finally
    LIO.Free();
  end;
end;

class function  Audio.LoadSoundFromZipFile(const AZipFile: TZipFile; const AFilename: string): Integer;
var
  LIO: TIO;
begin
  Result := -1;
  LIO := AZipFile.OpenFile(AFilename);
  if not Assigned(LIO) then Exit;
  Result := LoadSound(LIO);
end;

class procedure Audio.UnloadSound(var aSound: Integer);
begin
  if not FOpened then Exit;
  if FPaused then Exit;
  if not InRange(aSound, 0, SOUND_COUNT-1) then Exit;
  ma_sound_uninit(@FSound[aSound].Handle);
  FSound[aSound].InUse := False;
  aSound := ERROR;
end;

class procedure Audio.UnloadAllSounds();
var
  I: Integer;
begin
  // close all channels
  for I := 0 to CHANNEL_COUNT-1 do
  begin
    if FChannel[I].InUse then
    begin
      ma_sound_stop(@FChannel[I].Handle);
      ma_sound_uninit(@FChannel[I].Handle);
    end;
  end;

  // close all sound buffers
  for I := 0 to SOUND_COUNT-1 do
  begin
    if FSound[I].InUse then
    begin
      ma_sound_uninit(@FSound[I].Handle);
    end;
  end;

end;

class function  Audio.PlaySound(const aSound, aChannel: Integer; const AVolume: Single; const ALoop: Boolean): Integer;
var
  LResult: Integer;
begin
  Result := ERROR;

  if not FOpened then Exit;
  if FPaused then Exit;
  if not InRange(aSound, 0, SOUND_COUNT-1) then Exit;

  if aChannel = CHANNEL_DYNAMIC then
    LResult := FindFreeChannelSlot
  else
    begin
      LResult := aChannel;
      if not InRange(aChannel, 0, CHANNEL_COUNT-1) then Exit;
      StopChannel(LResult);
    end;
  if LResult = ERROR then Exit;
  if ma_sound_init_copy(@FEngine, @FSound[ASound].Handle, 0, nil,
    @FChannel[LResult].Handle) <> MA_SUCCESS then Exit;
  FChannel[LResult].InUse := True;

  SetChannelVolume(LResult, aVolume);
  SetChannelPosition(LResult, 0, 0);
  SetChannelLoop(LResult, aLoop);

  if ma_sound_start(@FChannel[LResult].Handle) <> MA_SUCCESS then
  begin
    StopChannel(LResult);
    LResult := ERROR;
  end;

  Result := LResult;
end;

class procedure Audio.ReserveChannel(const aChannel: Integer; const aReserve: Boolean);
begin
  if not FOpened then Exit;
  if FPaused then Exit;
  if not InRange(aChannel, 0, CHANNEL_COUNT-1) then Exit;
  FChannel[aChannel].Reserved := aReserve;
end;

class procedure Audio.StopChannel(const aChannel: Integer);
begin
  if not FOpened then Exit;
  if FPaused then Exit;
  if not ValidChannel(aChannel) then Exit;

  ma_sound_uninit(@FChannel[aChannel].Handle);
  FChannel[aChannel].InUse := False;
end;

class procedure Audio.SetChannelVolume(const aChannel: Integer; const AVolume: Single);
var
  LVolume: Single;
begin
  if not FOpened then Exit;
  if FPaused then Exit;
  if not InRange(aVolume, 0, 1) then Exit;
  if not ValidChannel(aChannel) then Exit;

  FChannel[aChannel].Volume := aVolume;
  LVolume := Math.UnitToScalarValue(aVolume, 1);
  ma_sound_set_volume(@FChannel[aChannel].Handle, LVolume);
end;

class function  Audio.GetChannelVolume(const aChannel: Integer): Single;
begin
Result := 0;
  if not FOpened then Exit;
  if FPaused then Exit;
  if not ValidChannel(aChannel) then Exit;
  Result := FChannel[aChannel].Volume;
end;

class procedure Audio.SetChannelPosition(const aChannel: Integer; const aX,
  aY: Single);
begin
  if not FOpened then Exit;
  if FPaused then Exit;
  if not ValidChannel(aChannel) then Exit;

  ma_sound_set_position(@FChannel[aChannel].Handle, aX, 0, aY);
end;

class procedure Audio.SetChannelLoop(const aChannel: Integer;
  const ALoop: Boolean);
begin
  if not FOpened then Exit;
  if FPaused then Exit;
  if not ValidChannel(aChannel) then Exit;

  ma_sound_set_looping(@FChannel[aChannel].Handle, Ord(aLoop));
end;

class function  Audio.GetchannelLoop(const aChannel: Integer): Boolean;
begin
  Result := False;
  if not FOpened then Exit;
  if FPaused then Exit;
  if not ValidChannel(aChannel) then Exit;

  Result := Boolean(ma_sound_is_looping(@FChannel[aChannel].Handle));
end;

class function  Audio.GetChannelPlaying(const aChannel: Integer): Boolean;
begin
  Result := False;
  if not FOpened then Exit;
  if FPaused then Exit;
  if not ValidChannel(aChannel) then Exit;

  Result := Boolean(ma_sound_is_playing(@FChannel[aChannel].Handle));
end;

{ TColor }
function TColor.Make(const ARed, AGreen, ABlue, AAlpha: Byte): TColor;
begin
  Red := EnsureRange(ARed, 0, 255) / $FF;
  Green := EnsureRange(AGreen, 0, 255) / $FF;
  Blue := EnsureRange(ABlue, 0, 255) / $FF;
  Alpha := EnsureRange(AAlpha, 0, 255) / $FF;
end;

function TColor.Make(const ARed, AGreen, ABlue, AAlpha: Single): TColor;
begin
  Red := EnsureRange(ARed, 0, 1);
  Green := EnsureRange(AGreen, 0, 1);
  Blue := EnsureRange(ABlue, 0, 1);
  Alpha := EnsureRange(AAlpha, 0, 1);
end;

function TColor.Fade(const ATo: TColor; const APos: Single): TColor;
var
  LColor: TColor;
  LPos: Single;
begin
  LPos := EnsureRange(APos, 0, 1);

  // fade colors
  LColor.Alpha := Alpha + ((ATo.Alpha - Alpha) * LPos);
  LColor.Blue := Blue + ((ATo.Blue - Blue) * LPos);
  LColor.Green := Green + ((ATo.Green - Green) * LPos);
  LColor.Red := Red + ((ATo.Red - Red) * LPos);
  Result := Make(LColor.Red, LColor.Green, LColor.Blue, LColor.Alpha);
  Red := LColor.Red;
  Green := LColor.Green;
  Blue := LColor.Blue;
  Alpha := LColor.Alpha;
end;

function TColor.Equal(AColor: TColor): Boolean;
begin
  if (Red = AColor.Red) and (Green = AColor.Green) and
    (Blue = AColor.Blue) and (Alpha = AColor.Alpha) then
    Result := True
  else
    Result := False;
end;

{ --- TlgWindow ------------------------------------------------------------- }
procedure  TlgWindow_OnSize(AWindow: PGLFWwindow; AWidth: Integer; AHeight: Integer); cdecl;
var
  LWindow: TWindow;
begin
  LWindow := glfwGetWindowUserPointer(AWindow);
  LWindow.FScaledSize.Width := AWidth;
  LWindow.FScaledSize.Height := AHeight;
end;

procedure TlgWindow_OnContentScale(AWindow: PGLFWwindow; AXScale: Single; AYScale: Single); cdecl;
var
  LWindow: TWindow;
begin
  LWindow := glfwGetWindowUserPointer(AWindow);
  LWindow.FScale.x := AXScale;
  LWindow.FScale.y := AXScale;

  if Assigned(LWindow.FOnContentScaled.Handler) then
  begin
    LWindow.FOnContentScaled.Handler(LWindow.FOnContentScaled.Sender, AXScale, AYScale, LWindow.FOnContentScaled.UserData);
  end;
end;

constructor TWindow.Create();
begin
  inherited;
end;

destructor TWindow.Destroy();
begin
  Close();
  inherited;
end;

function  TWindow.Open(const aTitle: string; const AWidth: Integer; const AHeight: Integer; const AEnableVSync: Boolean): Boolean;
var
  VideoMode: PGLFWvidmode;
  LWidth, LHeight: Integer;
begin
  Result := False;

  if Assigned(FHandle) then Exit;

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
  glfwWindowHint(GLFW_RESIZABLE, GLFW_FALSE);
  glfwWindowHint(GLFW_SCALE_TO_MONITOR, GLFW_TRUE);

  glfwWindowHint(GLFW_SAMPLES, 4);

  FHandle := glfwCreateWindow(AWidth, AHeight, Utils.AsUtf8(ATitle), nil, nil);
  if not Assigned(FHandle) then Exit;
  glfwSetWindowUserPointer(FHandle, Self);
  glfwSetWindowSizeCallback(FHandle, TlgWindow_OnSize);
  glfwSetWindowContentScaleCallback(FHandle,TlgWindow_OnContentScale);
  Utils.SetDefaultIcon(FHandle);
  VideoMode := glfwGetVideoMode(glfwGetPrimaryMonitor);
  glfwGetWindowSize(FHandle, @LWidth, @LHeight);
  glfwSetWindowPos(FHandle, (VideoMode.width - LWidth) div 2, (VideoMode.height - LHeight) div 2);
  glfwMakeContextCurrent(FHandle);

  SetVSync(AEnableVSync);

  if not LoadOpenGL then
  begin
    glfwDestroyWindow(FHandle);
    FHandle := nil;
    Exit;
  end;

  // Enable Line Smoothing
  glEnable(GL_LINE_SMOOTH);
  glHint(GL_LINE_SMOOTH_HINT, GL_NICEST);

  // Enable Polygon Smoothing
  glEnable(GL_POLYGON_SMOOTH);
  glHint(GL_POLYGON_SMOOTH_HINT, GL_NICEST);

  // Enable Point Smoothing
  glEnable(GL_POINT_SMOOTH);
  glHint(GL_POINT_SMOOTH_HINT, GL_NICEST);

  // Enable Multisampling for anti-aliasing (if supported)
  glEnable(GL_MULTISAMPLE);

  FSize.Width := AWidth;
  FSize.Height := AHeight;

  FScaledSize.Width := LWidth;
  FScaledSize.Height := LHeight;

  glfwGetWindowContentScale(FHandle, @FScale.X, @FScale.Y);

  glGetIntegerv(GL_MAX_TEXTURE_SIZE, @FMaxTextureSize);

  glfwSetInputMode(FHandle, GLFW_STICKY_KEYS, GLFW_TRUE);
  glfwSetInputMode(FHandle, GLFW_STICKY_MOUSE_BUTTONS, GLFW_TRUE);

  SetMousePos(0,0);

  Self.ClearInput();

  FrameLimitTimer.Reset();

  Result := True;
end;

function  TWindow.IsOpen(): Boolean;
begin
  Result := False;
  if not Assigned(FHandle) then Exit;
  if glfwGetCurrentContext() <> FHandle then Exit;
  Result := True;
end;

procedure TWindow.Close();
begin
  if Assigned(FHandle) then
  begin
    glfwMakeContextCurrent(nil);
    glfwDestroyWindow(FHandle);
    FHandle := nil;
  end;
  FSize := Math.Size(0, 0);
  FScaledSize := Math.Size(0, 0);
  FScale := Math.Point(0,0);
end;

function  TWindow.Ready(): Boolean;
begin
  Result := False;
  if not IsOpen then Exit;
  Result := True;
end;

function  TWindow.GetVSync(): Boolean;
begin
  Result := FVsync;
end;

procedure TWindow.SetVSync(const AEnable: Boolean);
begin
  if AEnable then
    glfwSwapInterval(1)
  else
    glfwSwapInterval(0);
  FVSync := AEnable;
end;

function  TWindow.GetHandle(): PGLFWwindow;
begin
  Result := FHandle;
end;

function  TWindow.GetMaxTextureSize(): Integer;
begin
  Result := FMaxTextureSize;
end;

function  TWindow.GetTitle(): string;
var
  LHwnd: HWND;
  LLen: Integer;
  LTitle: PChar;
begin
  Result := '';
  if not IsOpen then Exit;
  LHwnd := glfwGetWin32Window(FHandle);
  LLen := GetWindowTextLength(LHwnd);
  GetMem(LTitle, LLen + 1);
  try
    GetWindowText(LHwnd, LTitle, LLen + 1);
    Result := StrPas(LTitle);
  finally
    FreeMem(LTitle);
  end;
end;

procedure TWindow.SetTitle(const ATitle: string);
begin
  if not IsOpen then Exit;
  SetWindowText(glfwGetWin32Window(FHandle), ATitle);
end;

function  TWindow.ShouldClose(): Boolean;
begin
  Result := True;
  if not IsOpen then Exit;
  Result := Boolean(glfwWindowShouldClose(FHandle));
end;

procedure TWindow.SetShouldClose(const AValue: Boolean);
begin
  glfwSetWindowShouldClose(FHandle, Ord(AValue));
end;

procedure TWindow.GetSize(var ASize: TSize);
begin
  ASize := FSize;
end;

procedure TWindow.GetScaledSize(var ASize: TSize);
begin
  ASize := FScaledSize;
end;

procedure TWindow.GetScale(var AScale: TPoint);
begin
  AScale := FScale;
end;

procedure TWindow.GetViewport(var AViewport: TRect);
begin
  AViewport.X := 0;
  AViewport.Y := 0;
  AViewport.Width := Self.FSize.Width;
  AViewport.Height := Self.FSize.Height;
end;

procedure TWindow.GetViewport(X, Y, AWidth, AHeight: PSingle);
var
  LViewport: TRect;
begin
  GetViewport(LViewport);
  if Assigned(X) then X^ := LViewport.X;
  if Assigned(Y) then Y^ := LViewport.Y;
  if Assigned(AWidth) then AWidth^ := LViewport.Width;
  if Assigned(AHeight) then AHeight^ := LViewport.Height;
end;

procedure TWindow.Clear(const AColor: TColor);
begin
  Clear(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
end;

procedure TWindow.Clear(const ARed, AGreen, ABlue, AAlpha: Single);
begin
  if not IsOpen then Exit;
 glClearColor(ARed, AGreen, ABlue, AAlpha);
end;

procedure TWindow.StartFrame();
begin
  FrameLimitTimer.Start();
  Async.Process();
  Audio.Update();
  Video.Update();
  glfwPollEvents();
end;

procedure TWindow.EndFrame();
begin
  FrameLimitTimer.Stop();
end;

procedure TWindow.StartDrawing();
begin
  if not IsOpen then Exit;

  glViewport(0, 0, Round(FScaledSize.Width), Round(FScaledSize.Height));
  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glOrtho(0, FScaledSize.Width, FScaledSize.Height, 0, -1, 1);
  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();
  glScalef(FScale.X, FScale.Y, 1.0);
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);
end;

procedure TWindow.EndDrawing();
begin
  if not IsOpen then Exit;

  glfwSwapBuffers(FHandle);
  //glfwPollEvents;
end;

procedure TWindow.DrawLine(const X1, Y1, X2, Y2: Single; const AColor: TColor; const AThickness: Single);
begin
  if not IsOpen then Exit;

  glLineWidth(AThickness);
  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_LINES);
    glVertex2f(X1, Y1);
    glVertex2f(X2, Y2);
  glEnd;
end;

procedure TWindow.DrawRect(const X, Y, AWidth, AHeight, AThickness: Single; const AColor: TColor; const AAngle: Single);
var
  HalfWidth, HalfHeight: Single;
begin
  if not IsOpen then Exit;

  HalfWidth := AWidth / 2;
  HalfHeight := AHeight / 2;

  glLineWidth(AThickness);
  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);

  glPushMatrix;  // Save the current matrix

  // Translate to the center point
  glTranslatef(X, Y, 0);

  // Rotate around the center
  glRotatef(AAngle, 0, 0, 1);

  glBegin(GL_LINE_LOOP);
    glVertex2f(-HalfWidth, -HalfHeight);      // Bottom-left corner
    glVertex2f(HalfWidth, -HalfHeight);       // Bottom-right corner
    glVertex2f(HalfWidth, HalfHeight);        // Top-right corner
    glVertex2f(-HalfWidth, HalfHeight);       // Top-left corner
  glEnd;

  glPopMatrix;  // Restore the original matrix
end;

procedure TWindow.DrawFilledRect(const X, Y, AWidth, AHeight: Single; const AColor: TColor; const AAngle: Single);
var
  HalfWidth, HalfHeight: Single;
begin
  if not IsOpen then Exit;

  HalfWidth := AWidth / 2;
  HalfHeight := AHeight / 2;

  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);

  glPushMatrix;  // Save the current matrix

  // Translate to the center point
  glTranslatef(X, Y, 0);

  // Rotate around the center
  glRotatef(AAngle, 0, 0, 1);

  glBegin(GL_QUADS);
    glVertex2f(-HalfWidth, -HalfHeight);      // Bottom-left corner
    glVertex2f(HalfWidth, -HalfHeight);       // Bottom-right corner
    glVertex2f(HalfWidth, HalfHeight);        // Top-right corner
    glVertex2f(-HalfWidth, HalfHeight);       // Top-left corner
  glEnd;

  glPopMatrix;  // Restore the original matrix
end;


procedure TWindow.DrawCircle(const X, Y, ARadius, AThickness: Single; const AColor: TColor);
var
  I: Integer;
  LX, LY: Single;
begin
  if not IsOpen then Exit;

  glLineWidth(AThickness);
  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_LINE_LOOP);
    LX := X{ + ARadius};
    LY := Y{ + ARadius};
    for I := 0 to 360 do
    begin
      glVertex2f(LX + ARadius * Math.AngleCos(I), LY - ARadius * Math.AngleSin(I));
    end;
  glEnd();
end;

procedure TWindow.DrawFilledCircle(const X, Y, ARadius: Single; const AColor: TColor);
var
  I: Integer;
  LX, LY: Single;
begin
  if not IsOpen then Exit;

  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_TRIANGLE_FAN);
    LX := X{ + ARadius};
    LY := Y{ + ARadius};
    glVertex2f(LX, LY);
    for i := 0 to 360 do
    begin
      glVertex2f(LX + ARadius * Math.AngleCos(i), LY + ARadius * Math.AngleSin(i));
    end;
  glEnd;
end;

procedure TWindow.DrawTriangle(const X1, Y1, X2, Y2, X3, Y3, AThickness: Single; const AColor: TColor);
begin
  if not IsOpen then Exit;

  glLineWidth(AThickness);
  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_LINE_LOOP);
    glVertex2f(X1, Y1);
    glVertex2f(X2, Y2);
    glVertex2f(X3, Y3);
  glEnd;
end;

procedure TWindow.DrawFilledTriangle(const X1, Y1, X2, Y2, X3, Y3: Single; const AColor: TColor);
begin
  if not IsOpen then Exit;

  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_TRIANGLES);
    glVertex2f(X1, Y1);
    glVertex2f(X2, Y2);
    glVertex2f(X3, Y3);
  glEnd;
end;

procedure TWindow.DrawPolygon(const APoints: array of TPoint; const AThickness: Single; const AColor: TColor);
var
  I: Integer;
begin
  if not IsOpen then Exit;

  glLineWidth(AThickness);
  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_LINE_LOOP);
    for i := Low(APoints) to High(APoints) do
    begin
      glVertex2f(APoints[i].X, APoints[i].Y);
    end;
  glEnd;
end;

procedure TWindow.DrawFilledPolygon(const APoints: array of TPoint; const AColor: TColor);
var
  I: Integer;
begin
  if not IsOpen then Exit;

  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_POLYGON);
  for I := Low(APoints) to High(APoints) do
    begin
      glVertex2f(APoints[i].X, APoints[i].Y);
    end;
  glEnd;
end;

procedure TWindow.DrawPolyline(const APoints: array of TPoint; const AThickness: Single; const AColor: TColor);
var
  I: Integer;
begin
  if not IsOpen then Exit;

  glLineWidth(AThickness);
  glColor4f(AColor.Red, AColor.Green, AColor.Blue, AColor.Alpha);
  glBegin(GL_LINE_STRIP);
    for I := Low(APoints) to High(APoints) do
    begin
      glVertex2f(APoints[i].X, APoints[i].Y);
    end;
  glEnd;
end;

procedure TWindow.ClearInput();
begin
  FillChar(FKeyState, SizeOf(FKeyState), 0);
  FillChar(FMouseButtonState, SizeOf(FMouseButtonState), 0);
  FillChar(FGamepadButtonState, SizeOf(FGamepadButtonState), 0);
end;

function  TWindow.GetKey(const AKey: Integer; const AState: TInputState): Boolean;

  function IsKeyPressed(const AKey: Integer): Boolean;
  begin
    Result :=  Boolean(glfwGetKey(FHandle, AKey) = GLFW_PRESS);
  end;

begin
  Result := False;
  if not InRange(AKey,  KEY_SPACE, KEY_LAST) then Exit;

  case AState of
    isPressed:
    begin
      Result :=  IsKeyPressed(AKey);
    end;

    isWasPressed:
    begin
      if IsKeyPressed(AKey) and (not FKeyState[0, AKey]) then
      begin
        FKeyState[0, AKey] := True;
        Result := True;
      end
      else if (not IsKeyPressed(AKey)) and (FKeyState[0, AKey]) then
      begin
        FKeyState[0, AKey] := False;
        Result := False;
      end;
    end;

    isWasReleased:
    begin
      if IsKeyPressed(AKey) and (not FKeyState[0, AKey]) then
      begin
        FKeyState[0, AKey] := True;
        Result := False;
      end
      else if (not IsKeyPressed(AKey)) and (FKeyState[0, AKey]) then
      begin
        FKeyState[0, AKey] := False;
        Result := True;
      end;
    end;
  end;
end;

function  TWindow.GetMouseButton(const AButton: Byte; const AState: TInputState): Boolean;

  function IsButtonPressed(const AKey: Integer): Boolean;
  begin
    Result :=  Boolean(glfwGetMouseButton(FHandle, AButton) = GLFW_PRESS);
  end;

begin
  Result := False;
  if not InRange(AButton,  MOUSE_BUTTON_1, MOUSE_BUTTON_MIDDLE) then Exit;

  case AState of
    isPressed:
    begin
      Result :=  IsButtonPressed(AButton);
    end;

    isWasPressed:
    begin
      if IsButtonPressed(AButton) and (not FMouseButtonState[0, AButton]) then
      begin
        FMouseButtonState[0, AButton] := True;
        Result := True;
      end
      else if (not IsButtonPressed(AButton)) and (FMouseButtonState[0, AButton]) then
      begin
        FMouseButtonState[0, AButton] := False;
        Result := False;
      end;
    end;

    isWasReleased:
    begin
      if IsButtonPressed(AButton) and (not FMouseButtonState[0, AButton]) then
      begin
        FMouseButtonState[0, AButton] := True;
        Result := False;
      end
      else if (not IsButtonPressed(AButton)) and (FMouseButtonState[0, AButton]) then
      begin
        FMouseButtonState[0, AButton] := False;
        Result := True;
      end;
    end;
  end;
end;

procedure TWindow.GetMousePos(const X, Y: PSingle);
var
  LX, LY: Double;
begin
  glfwGetCursorPos(FHandle, @LX, @LY);
  if Assigned(X) then X^ := LX;
  if Assigned(Y) then Y^ := LY;
end;

function  TWindow.GetMousePos(): TPoint;
begin
  GetMousePos(@Result.x, @Result.y);
  Result.x := Result.x/FScale.x;
  Result.y := Result.y/FScale.y;
end;

procedure TWindow.SetMousePos(const X, Y: Single);
begin
  glfwSetCursorPos(FHandle, X*FScale.x, Y*FScale.y);
end;

function  TWindow.GamepadPresent(const AGamepad: Byte): Boolean;
begin
  Result := Boolean(glfwJoystickIsGamepad(EnsureRange(Agamepad, GAMEPAD_1, GAMEPAD_LAST)));
end;

function  TWindow.GetGamepadName(const AGamepad: Byte): string;
begin
  Result := 'Not present';
  if not GamepadPresent(AGamepad) then Exit;
  Result := string(glfwGetGamepadName(AGamepad));
end;

function  TWindow.GetGamepadButton(const AGamepad, AButton: Byte; const AState: TInputState): Boolean;
var
  LState: GLFWgamepadstate;

  function IsButtonPressed(const AButton: Byte): Boolean;
  begin
    Result :=  Boolean(LState.buttons[AButton]);
  end;

begin
  Result := False;

  if not Boolean(glfwGetGamepadState(EnsureRange(AGamepad, GAMEPAD_1, GAMEPAD_LAST), @LState)) then Exit;

  case AState of
    isPressed:
    begin
      Result :=  IsButtonPressed(AButton);
    end;

    isWasPressed:
    begin
      if IsButtonPressed(AButton) and (not FGamepadButtonState[0, AButton]) then
      begin
        FGamepadButtonState[0, AButton] := True;
        Result := True;
      end
      else if (not IsButtonPressed(AButton)) and (FGamepadButtonState[0, AButton]) then
      begin
        FGamepadButtonState[0, AButton] := False;
        Result := False;
      end;
    end;

    isWasReleased:
    begin
      if IsButtonPressed(AButton) and (not FGamepadButtonState[0, AButton]) then
      begin
        FGamepadButtonState[0, AButton] := True;
        Result := False;
      end
      else if (not IsButtonPressed(AButton)) and (FGamepadButtonState[0, AButton]) then
      begin
        FGamepadButtonState[0, AButton] := False;
        Result := True;
      end;
    end;
  end;
end;

function  TWindow.GetGamepadAxisValue(const AGamepad, AAxis: Byte): Single;
var
  LState: GLFWgamepadstate;
begin
  Result := 0;
  if not Boolean(glfwGetGamepadState(EnsureRange(AGamepad, GAMEPAD_1, GAMEPAD_LAST), @LState)) then Exit;
  Result := LState.axes[EnsureRange(AAxis, GAMEPAD_AXIS_LEFT_X, GLFW_GAMEPAD_AXIS_LAST)];
end;

function  TWindow.SaveToFile(const AFilename: string): Boolean;
var
  LBuffer: TVirtualBuffer;
  LWidth,LHeight, LRow, LCol: Integer;
  LTempByte: Byte;
  LFilename: string;
begin
  Result := False;
  if AFilename.IsEmpty then Exit;

  LWidth := Round(FScaledSize.Width);
  LHeight := Round(FScaledSize.Height);
  LFilename := TPath.ChangeExtension(AFilename, 'png');
  LBuffer := TVirtualBuffer.Create(LWidth * LHeight * 3);
  try
    glReadPixels(0, 0, LWidth, LHeight, GL_RGB, GL_UNSIGNED_BYTE, LBuffer.Memory);

    for LRow := 0 to LHeight div 2 - 1 do
    begin
      for LCol := 0 to LWidth * 3 - 1 do
      begin
        Move((PByte(LBuffer.Memory) + (LRow * LWidth * 3 + LCol))^, LTempByte, 1);
        Move((PByte(LBuffer.Memory) + ((LHeight - LRow - 1) * LWidth * 3 + LCol))^, (PByte(LBuffer.Memory) + (LRow * LWidth * 3 + LCol))^, 1);
        Move(LTempByte, (PByte(LBuffer.Memory) + ((LHeight - LRow - 1) * LWidth * 3 + LCol))^, 1);
      end;
    end;

    Result := Boolean(stbi_write_png(Utils.AsUtf8(LFileName), LWidth, LHeight, 3, LBuffer.Memory, LWidth * 3));
  finally
    LBuffer.Free();
  end;
end;

function  TWindow.GetPixel(const X, Y: Single): TColor;
var
  LPixel: array[0..3] of GLubyte;
begin
  glReadPixels(Round(X*FScale.x), Round(Y*FScale.y), 1, 1, GL_RGBA, GL_UNSIGNED_BYTE, @LPixel);
  Result.Red   := LPixel[0] / $FF;
  Result.Green := LPixel[1] / $FF;
  Result.Blue  := LPixel[2] / $FF;
  Result.Alpha := LPixel[3] / $FF;
end;

procedure TWindow.SetPixel(const X, Y: Single; const AColor: TColor);
begin
  SetPixel(X, Y, Round(AColor.Red * $FF), Round(AColor.Green * $FF), Round(AColor.Blue * $FF), Round(AColor.Alpha * $FF));
end;

procedure TWindow.SetPixel(const X, Y: Single; const ARed, AGreen, ABlue, AAlpha: Byte);
var
  LPixel: array[0..3] of GLubyte;
begin
  LPixel[0] := ARed;
  LPixel[1] := AGreen;
  LPixel[2] := ABlue;
  LPixel[3] := AAlpha;
  glRasterPos2f(X, Y);
  glDrawPixels(1, 1, GL_RGBA, GL_UNSIGNED_BYTE, @LPixel);
end;

procedure TWindow.SetContentScaledEvent(const ASender: Pointer; const AHandler: TWindow.ContentScaledEvent; const AUserData: Pointer);
begin
  FOnContentScaled.Sender := ASender;
  FOnContentScaled.Handler := AHandler;
  FOnContentScaled.UserData := AUserData;
end;

function  TWindow.GetContextScaledEvent(): TWindow.ContentScaledEvent;
begin
  Result := FOnContentScaled.Handler;
end;


class function TWindow.Init(const aTitle: string; const AWidth: Integer; const AHeight: Integer): TWindow;
begin
  Result := TWindow.Create();
  if not Result.Open(ATitle, AWidth, AHeight) then
  begin
    Result.Free();
    Result := nil;
  end;
end;

{ TTexture }
type
  PRGBA = ^TRGBA;
  TRGBA = packed record
    R, G, B, A: Byte;
  end;

procedure ConvertMaskToAlpha(Data: Pointer; Width, Height: Integer; MaskColor: TColor);
var
  i: Integer;
  PixelPtr: PRGBA;
begin
  PixelPtr := PRGBA(Data);

  for i := 0 to Width * Height - 1 do
  begin
    if (PixelPtr^.R = Round(MaskColor.Red * 256)) and
       (PixelPtr^.G = Round(MaskColor.Green * 256)) and
       (PixelPtr^.B = Round(MaskColor.Blue * 256)) then
      PixelPtr^.A := 0
    else
      PixelPtr^.A := 255;

    Inc(PixelPtr);
  end;
end;

function  TlgTexture_Read(AUser: Pointer; AData: PUTF8Char;
  ASize: Integer): Integer; cdecl;
var
  LIO: TIO;
begin
  LIO := AUser;
  Result := LIO.Read(AData, ASize);
end;

procedure TlgTexture_Skip(AUser: Pointer; AOffset: Integer); cdecl;
var
  LIO: TIO;
begin
  LIO := AUser;
  LIO.Seek(AOffset, smCurrent);
end;

function  TlgTexture_Eof(AUser: Pointer): Integer; cdecl;
var
  LIO: TIO;
begin
  LIO := AUser;
  Result := Ord(LIO.Eos);
end;

constructor TTexture.Create();
begin
  inherited;
end;

destructor TTexture.Destroy();
begin
  Unload;
  inherited;
end;

function   TTexture.Allocate(const AWidth, AHeight: Integer): Boolean;
var
  Data: array of Byte;
begin
  Result := False;

  if FHandle <> 0 then Exit;

  // init RGBA data
  SetLength(Data, AWidth * AHeight * 4);

  glGenTextures(1, @FHandle);
  glBindTexture(GL_TEXTURE_2D, FHandle);

  // init the texture with transparent pixels
  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, AWidth, AHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, @Data[0]);

  // set texture parameters
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  FSize.Width := AWidth;
  FSize.Height := AHeight;
  FChannels := 4;

  SetBlend(tbAlpha);
  SetColor(WHITE);
  SetScale(1.0);
  SetAngle(0.0);
  SetHFlip(False);
  SetVFlip(False);
  SetPivot(0.5, 0.5);
  SetAnchor(0.5, 0.5);
  SetPos(0.0, 0.0);
  ResetRegion();

  glBindTexture(GL_TEXTURE_2D, 0);

  Result := True;
end;

procedure  TTexture.Fill(const AColor: TColor);
var
  X,Y,LWidth,LHeight: Integer;
begin
  LWidth := Round(FSize.Width);
  LHeight := Round(FSize.Height);

  glBindTexture(GL_TEXTURE_2D, FHandle);

  for X := 0 to LWidth-1 do
  begin
    for Y := 0 to LHeight-1 do
    begin
      glTexSubImage2D(GL_TEXTURE_2D, 0, X, Y, 1, 1, GL_RGBA, GL_FLOAT, @AColor);
    end;
  end;

  glBindTexture(GL_TEXTURE_2D, 0);
end;

function   TTexture.Load(const ARGBData: Pointer; const AWidth, AHeight: Integer): Boolean;
begin
  Result := False;
  if FHandle > 0 then Exit;
  if not Allocate(AWidth, AHeight) then Exit;

  glBindTexture(GL_TEXTURE_2D, FHandle);
  glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, AWidth, AHeight, 0, GL_ALPHA, GL_UNSIGNED_BYTE, ARGBData);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  glBindTexture(GL_TEXTURE_2D, 0);

  Result := True;
end;

function   TTexture.Load(const AIO: TIO; const AColorKey: PColor): Boolean;
var
  LCallbacks: stbi_io_callbacks;
  LData: Pstbi_uc;
  LWidth,LHeight,LChannels: Integer;
begin
  Result := False;
  if FHandle > 0 then Exit;
  if not Assigned(AIO) then Exit;

  LCallbacks.read := TlgTexture_Read;
  LCallbacks.skip := TlgTexture_Skip;
  LCallbacks.eof := TlgTexture_Eof;

  LData := stbi_load_from_callbacks(@LCallbacks, AIO, @LWidth, @LHeight, @LChannels, 4);
  if not Assigned(LData) then Exit;

  if Assigned(AColorKey) then
    ConvertMaskToAlpha(LData, LWidth, LHeight, AColorKey^);

  glGenTextures(1, @FHandle);
  glBindTexture(GL_TEXTURE_2D, FHandle);

  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, LWidth, LHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, LData);

  // Set texture parameters
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  stbi_image_free(LData);

  FSize.Width := LWidth;
  FSize.Height := LHeight;
  FChannels := LChannels;

  SetBlend(tbAlpha);
  SetColor(WHITE);
  SetScale(1.0);
  SetAngle(0.0);
  SetHFlip(False);
  SetVFlip(False);
  SetPivot(0.5, 0.5);
  SetAnchor(0.5, 0.5);
  SetPos(0.0, 0.0);
  ResetRegion();

  glBindTexture(GL_TEXTURE_2D, 0);

  Result := True;
end;

function   TTexture.LoadSVG(const AIO: TIO; const AUnits: string; const ADPI: Single; const AColorKey: PColor): Boolean;
var
  LSVG: array of AnsiChar;
  LSize: Int64;
  LSVGImage: PNSVGimage;
  LSVGRast: PNSVGrasterizer;
  LRGBAData: PByte;
  W,H: Integer;
begin
  Result := False;
  if FHandle > 0 then Exit;
  if not Assigned(AIO) then Exit;

  LSize := AIO.Size();
  SetLength(LSVG, LSize+1);
  if Length(LSVG) = 0 then Exit;

  AIO.Read(@LSVG[0], LSize);
  LSVG[LSize] := #0;

  LSVGImage := nsvgParse(@LSVG[0], Utils.AsUTF8(AUnits), ADPI);
  if not Assigned(LSVGImage) then Exit;
  LSVG := nil;

  LSVGRast := nsvgCreateRasterizer();
  if not Assigned(LSVGRast) then Exit;

  W := Round(LSVGImage.width);
  H := Round(LSVGImage.height);
  LRGBAData := AllocMem(W * H * 4);
  if not Assigned(LRGBAData) then
  begin
    nsvgDeleteRasterizer(LSVGRast);
    nsvgDelete(LSVGImage);
    Exit;
  end;

  nsvgRasterize(LSVGRast, LSVGImage, 0, 0, 1, LRGBAData, W, H, W*4);

  if Assigned(AColorKey) then
    ConvertMaskToAlpha(LRGBAData, W, H, AColorKey^);

  glGenTextures(1, @FHandle);
  glBindTexture(GL_TEXTURE_2D, FHandle);

  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, W, H, 0, GL_RGBA, GL_UNSIGNED_BYTE, LRGBAData);

  // Set texture parameters
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

  FSize.Width := W;
  FSize.Height := H;
  FChannels := 4;

  SetBlend(tbAlpha);
  SetColor(WHITE);
  SetScale(1.0);
  SetAngle(0.0);
  SetHFlip(False);
  SetVFlip(False);
  SetPivot(0.5, 0.5);
  SetAnchor(0.5, 0.5);
  SetPos(0.0, 0.0);
  ResetRegion();

  glBindTexture(GL_TEXTURE_2D, 0);

  FreeMem(LRGBAData);
  nsvgDeleteRasterizer(LSVGRast);
  nsvgDelete(LSVGImage);

  Result := True;
end;

procedure  TTexture.Unload();
begin
  if FHandle = 0 then Exit;

  glDeleteTextures(1, @FHandle);
  FHandle := 0;
  FSize := Default(TSize);
  FChannels := 0;
end;

function   TTexture.GetChannels(): Integer;
begin
  Result := FChannels;
end;

function   TTexture.GetSize(): TSize;
begin
  Result := FSize;
end;

function   TTexture.GetPivot(): TPoint;
begin
  Result := FPivot;
end;

procedure  TTexture.SetPivot(const APoint: TPoint);
begin
  SetPivot(APoint.x, APoint.y);
end;

procedure  TTexture.SetPivot(const X, Y: Single);
begin
  FPivot.x := EnsureRange(X, 0, 1);
  FPivot.y := EnsureRange(Y, 0, 1);
end;

function   TTexture.GetAnchor(): TPoint;
begin
  Result := FAnchor;
end;

procedure  TTexture.SetAnchor(const APoint: TPoint);
begin
  SetAnchor(APoint.x, APoint.y);
end;

procedure  TTexture.SetAnchor(const X, Y: Single);
begin
  FAnchor.x := EnsureRange(X, 0, 1);
  FAnchor.y := EnsureRange(Y, 0, 1);
end;

function   TTexture.GetBlend: TTextureBlend;
begin
  Result := FBlend;
end;

procedure  TTexture.SetBlend(const AValue: TTextureBlend);
begin
  FBlend:= AValue;
end;

function   TTexture.GetPos(): TPoint;
begin
  Result := FPos;
end;

procedure  TTexture.SetPos(const APos: TPoint);
begin
  FPos := APos;
end;

procedure  TTexture.SetPos(const X, Y: Single);
begin
  FPos.x := X;
  FPos.y := Y;
end;

function   TTexture.GetScale(): Single;
begin
  Result := FScale;
end;

procedure  TTexture.SetScale(const AScale: Single);
begin
  FScale := AScale;
end;

function   TTexture.GetColor(): TColor;
begin
  Result := FColor;
end;

procedure  TTexture.SetColor(const AColor: TColor);
begin
  FColor := AColor;
end;

procedure  TTexture.SetColor(const ARed, AGreen, ABlue, AAlpha: Single);
begin
  FColor.Red := EnsureRange(ARed, 0, 1);
  FColor.Green := EnsureRange(AGreen, 0, 1);
  FColor.Blue := EnsureRange(ABlue, 0, 1);
  FColor.Alpha := EnsureRange(AAlpha, 0, 1);
end;

function   TTexture.GetAngle(): Single;
begin
  Result := FAngle;
end;

procedure  TTexture.SetAngle(const AAngle: Single);
begin
  FAngle := AAngle;
  Math.ClipValueF(FAngle, 0, 360, True);
end;

function   TTexture.GetHFlip(): Boolean;
begin
  Result := FHFlip;
end;

procedure  TTexture.SetHFlip(const AFlip: Boolean);
begin
  FHFlip := AFlip;
end;

function   TTexture.GetVFlip(): Boolean;
begin
  Result := FVFlip;
end;

procedure  TTexture.SetVFlip(const AFlip: Boolean);
begin
  FVFlip := AFlip;
end;

function   TTexture.GetRegion(): TRect;
begin
  Result := FRegion;
end;

procedure  TTexture.SetRegion(const ARegion: TRect);
begin
  SetRegion(ARegion.X, ARegion.Y, ARegion.Width, ARegion.Height);
end;

procedure  TTexture.SetRegion(const X, Y, AWidth, AHeight: Single);
begin
  FRegion.X := X;
  FRegion.Y := Y;
  FRegion.Width := AWidth;
  FRegion.Height := AHeight;
end;

procedure  TTexture.ResetRegion();
begin
  FRegion.X := 0;
  FRegion.Y := 0;
  FRegion.Width := FSize.Width;
  FRegion.Height := FSize.Height;
end;

procedure  TTexture.Draw();
var
  FlipX, FlipY: Single;
begin
  if FHandle = 0 then Exit;

  glBindTexture(GL_TEXTURE_2D, FHandle);
  glEnable(GL_TEXTURE_2D);

  glPushMatrix();

  // Set the color
  glColor4f(FColor.Red, FColor.Green, FColor.Blue, FColor.Alpha);

  // set blending
  case FBlend of
    tbNone: // no blending
    begin
      glDisable(GL_BLEND);
      glBlendFunc(GL_ONE, GL_ZERO);
    end;

    tbAlpha: // alpha blending
    begin
      glEnable(GL_BLEND);
      glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    end;

    tbAdditiveAlpha: // addeditve blending
    begin
      glEnable(GL_BLEND);
      glBlendFunc(GL_SRC_ALPHA, GL_ONE);
    end;
  end;

  // Use the normalized anchor value
  glTranslatef(FPos.X - (FAnchor.X * FRegion.Width * FScale), FPos.Y - (FAnchor.Y * FRegion.Height * FScale), 0);
  glScalef(FScale, FScale, 1);

  // Apply rotation using the normalized pivot value
  glTranslatef(FPivot.X * FRegion.Width, FPivot.Y * FRegion.Height, 0);
  glRotatef(FAngle, 0, 0, 1);
  glTranslatef(-FPivot.X * FRegion.Width, -FPivot.Y * FRegion.Height, 0);

  // Apply flip
  if FHFlip then FlipX := -1 else FlipX := 1;
  if FVFlip then FlipY := -1 else FlipY := 1;
  glScalef(FlipX, FlipY, 1);

  // Adjusted texture coordinates and vertices for the specified rectangle
  glBegin(GL_QUADS);
    glTexCoord2f(FRegion.X/FSize.Width, FRegion.Y/FSize.Height); glVertex2f(0, 0);
    glTexCoord2f((FRegion.X + FRegion.Width)/FSize.Width, FRegion.Y/FSize.Height); glVertex2f(FRegion.Width, 0);
    glTexCoord2f((FRegion.X + FRegion.Width)/FSize.Width, (FRegion.Y + FRegion.Height)/FSize.Height); glVertex2f(FRegion.Width, FRegion.Height);
    glTexCoord2f(FRegion.X/FSize.Width, (FRegion.Y + FRegion.Height)/FSize.Height); glVertex2f(0, FRegion.Height);
  glEnd();

  glPopMatrix();

  glDisable(GL_TEXTURE_2D);
  glBindTexture(GL_TEXTURE_2D, 0);
end;

procedure  TTexture.DrawTiled(const AWindow: TWindow; const ADeltaX, ADeltaY: Single);
var
  LW,LH    : Integer;
  LOX,LOY  : Integer;
  LPX,LPY  : Single;
  LFX,LFY  : Single;
  LTX,LTY  : Integer;
  LVPW,LVPH: Integer;
  LVR,LVB  : Integer;
  LIX,LIY  : Integer;
  LViewport: TRect;
begin
  if FHandle = 0 then Exit;

  SetPivot(0, 0);
  SetAnchor(0, 0);

  AWindow.GetViewport(LViewport);
  LVPW := Round(LViewport.Width);
  LVPH := Round(LViewport.Height);

  LW := Round(FSize.Width);
  LH := Round(FSize.Height);

  LOX := -LW+1;
  LOY := -LH+1;

  LPX := aDeltaX;
  LPY := aDeltaY;

  LFX := LPX-floor(LPX);
  LFY := LPY-floor(LPY);

  LTX := floor(LPX)-LOX;
  LTY := floor(LPY)-LOY;

  if (LTX>=0) then LTX := LTX mod LW + LOX else LTX := LW - -LTX mod LW + LOX;
  if (LTY>=0) then LTY := LTY mod LH + LOY else LTY := LH - -LTY mod LH + LOY;

  LVR := LVPW;
  LVB := LVPH;
  LIY := LTY;

  while LIY<LVB do
  begin
    LIX := LTX;
    while LIX<LVR do
    begin
      //al_draw_bitmap(FHandle, LIX+LFX, LIY+LFY, 0);
      SetPos(LIX+LFX, LIY+LFY);
      Draw();
      LIX := LIX+LW;
    end;
   LIY := LIY+LH;
  end;
end;

function  TTexture.SaveToFile(const AFilename: string): Boolean;
var
  LData: array of Byte;
  LFilename: string;
begin
  Result := False;
  if FHandle = 0 then Exit;
  if AFilename.IsEmpty then Exit;

 // Allocate space for the texture data
  SetLength(LData, Round(FSize.Width * FSize.Height * 4)); // Assuming RGBA format

  // Bind the texture
  glBindTexture(GL_TEXTURE_2D, FHandle);

  // Read the texture data
  glGetTexImage(GL_TEXTURE_2D, 0, GL_RGBA, GL_UNSIGNED_BYTE, @LData[0]);

  LFilename := TPath.ChangeExtension(AFilename, 'png');

  // Use stb_image_write to save the texture to a PNG file
  Result := Boolean(stbi_write_png(Utils.AsUtf8(LFilename), Round(FSize.Width), Round(FSize.Height), 4, @LData[0], Round(FSize.Width * 4)));

  // Unbind the texture
  glBindTexture(GL_TEXTURE_2D, 0);
end;

function   TTexture.Lock(): Boolean;
begin
  Result := False;
  if Assigned(FLock) then Exit;

  GetMem(FLock, Round(FSize.Width*FSize.Height*4));
  if not Assigned(FLock) then Exit;

  glBindTexture(GL_TEXTURE_2D, FHandle);
  glGetTexImage(GL_TEXTURE_2D, 0, GL_RGBA, GL_UNSIGNED_BYTE, FLock);
  glBindTexture(GL_TEXTURE_2D, 0);

  Result := True;
end;

procedure  TTexture.Unlock();
begin
  if not Assigned(FLock) then Exit;

  glBindTexture(GL_TEXTURE_2D, FHandle);
  glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, Round(FSize.Width), Round(FSize.Height), GL_RGBA, GL_UNSIGNED_BYTE, FLock);
  glBindTexture(GL_TEXTURE_2D, 0);
  FreeMem(FLock);
  FLock := nil;
end;

function   TTexture.GetPixel(const X, Y: Single): TColor;
var
  FOffset: Integer;
  LPixel: Cardinal;
begin
  Result := BLANK;
  if not Assigned(FLock) then Exit;

  FOffset := Round((Y * FSize.Width + X) * 4);
  LPixel := PCardinal(FLock + FOffset)^;

  Result.Alpha := (LPixel shr 24) / $FF;
  Result.Blue := ((LPixel shr 16) and $FF) / $FF;
  Result.Green := ((LPixel shr 8) and $FF) / $FF;
  Result.Red := (LPixel and $FF) / $FF;
end;

procedure  TTexture.SetPixel(const X, Y: Single; const AColor: TColor);
var
  FOffset: Integer;
begin
  if not Assigned(FLock) then Exit;

  FOffset := Round((Y * FSize.Width + X) * 4);
  PCardinal(FLock + FOffset)^ :=
    (Round(AColor.Alpha*$FF) shl 24) or
    (Round(AColor.Blue*$FF) shl 16) or
    (Round(AColor.Green*$FF) shl 8) or
    Round(AColor.Red*$FF);
end;

procedure  TTexture.SetPixel(const X, Y: Single; const ARed, AGreen, ABlue, AAlpha: Byte);
var
  FOffset: Integer;
begin
  if not Assigned(FLock) then Exit;

  FOffset := Round((Y * FSize.Width + X) * 4);
  PCardinal(FLock + FOffset)^ :=
    (AAlpha shl 24) or
    (ABlue shl 16) or
    (AGreen shl 8) or
    ARed;
end;

function   TTexture.CollideAABB(const ATexture: TTexture): Boolean;
var
  boxA, boxB: c2AABB;

  function _c2v(x, y: Single): c2v;
  begin
    result.x := x;
    result.y := y;
  end;

begin
  // Set up AABB for this texture
  boxA.min := _c2V(FPos.X - (FAnchor.X * FRegion.Width * FScale), FPos.Y - (FAnchor.Y * FRegion.Height * FScale));
  boxA.max := _c2V((FPos.X - (FAnchor.X * FRegion.Width * FScale)) + FRegion.Width * FScale, (FPos.Y - (FAnchor.Y * FRegion.Height * FScale)) + FRegion.Height * FScale);

  // Set up AABB for the other texture
  boxB.min := _c2V(ATexture.FPos.X - (ATexture.FAnchor.X * ATexture.FRegion.Width * ATexture.FScale), ATexture.FPos.Y - (ATexture.FAnchor.Y * ATexture.FRegion.Height * ATexture.FScale));
  boxB.max := _c2V((ATexture.FPos.X - (ATexture.FAnchor.X * ATexture.FRegion.Width * ATexture.FScale)) + ATexture.FRegion.Width * ATexture.FScale, (ATexture.FPos.Y - (ATexture.FAnchor.Y * ATexture.FRegion.Height * ATexture.FScale)) + ATexture.FRegion.Height * ATexture.FScale);

  // Check for collision and return result
  Result := Boolean(c2AABBtoAABB(boxA, boxB));
end;

function TTexture.CollideOBB(const ATexture: TTexture): Boolean;
var
  obbA, obbB: TlgOBB;
begin
  // Set up OBB for this texture
  obbA.Center := Math.Point(FPos.X, FPos.Y);
  obbA.Extents := Math.Point(FRegion.Width * FScale / 2, FRegion.Height * FScale / 2);
  obbA.Rotation := FAngle;

  // Set up OBB for the other texture
  obbB.Center := Math.Point(ATexture.FPos.X, ATexture.FPos.Y);
  obbB.Extents := Math.Point(ATexture.FRegion.Width * ATexture.FScale / 2, ATexture.FRegion.Height * ATexture.FScale / 2);
  obbB.Rotation := ATexture.FAngle;

  // Check for collision and return result
  Result := Math.OBBIntersect(obbA, obbB);
end;

class function TTexture.LoadFromFile(const AFilename: string; const AColorKey: PColor): TTexture;
var
  LIO: TIO;
begin
  Result := TTexture.Create();

  LIO := TFileIO.Open(AFilename, iomRead);
  try
    Result.Load(LIO, AColorKey);
  finally
    LIO.Free();
  end;
end;

class function TTexture.LoadFromZipFile(const AZipFile: TZipFile; const AFilename: string; const AColorKey: PColor): TTexture;
var
  LIO: TIO;
begin
  Result := nil;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen() then Exit;

  Result := TTexture.Create();

  LIO := AZipFile.OpenFile(AFilename);
  try
    if not Assigned(LIO) then
    begin
      Result.Free();
      Result := nil;
      Exit;
    end;
    Result.Load(LIO, AColorKey);
  finally
    LIO.Free();
  end;
end;

class function TTexture.LoadSVGFromFile(const AFilename: string;  const AUnits: string; const ADPI: Single; const AColorKey: PColor): TTexture;
var
  LIO: TIO;
begin
  Result := TTexture.Create();

  LIO := TFileIO.Open(AFilename, iomRead);
  try
    Result.LoadSVG(LIO, AUnits, ADPI, AColorKey);
  finally
    LIO.Free();
  end;
end;

class function TTexture.LoadSVGFromZipFile(const AZipFile: TZipFile; const AFilename: string;  const AUnits: string; const ADPI: Single; const AColorKey: PColor): TTexture;
var
  LIO: TIO;
begin
  Result := nil;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen() then Exit;

  Result := TTexture.Create();

  LIO := AZipFile.OpenFile(AFilename);
  try
    if not Assigned(LIO) then
    begin
      Result.Free();
      Result := nil;
      Exit;
    end;
    Result.LoadSVG(LIO, AUnits, ADPI, AColorKey);
  finally
    LIO.Free();
  end;
end;

{ TFont }
constructor TFont.Create();
begin
  inherited;
  FGlyph := TDictionary<Integer, TGlyph>.Create();
end;

destructor TFont.Destroy();
begin
  Unload();
  FGlyph.Free();
  inherited;
end;

function  TFont.Load(const AWindow: TWindow; const AIO: TIO; const ASize: Cardinal; const AGlyphs: string): Boolean;

var
  LBuffer: TVirtualBuffer;
  LChars: TVirtualBuffer;
  LFileSize: Int64;
  LFontInfo: stbtt_fontinfo;
  NumOfGlyphs: Integer;
  LGlyphChars: string;
  LCodePoints: array of Integer;
  LBitmap: array of Byte;
  LPackContext: stbtt_pack_context;
  LPackRange: stbtt_pack_range;
  I: Integer;
  LGlyph: TGlyph;
  LChar: Pstbtt_packedchar;
  LScale: Single;
  LAscent: Integer;
  LSize: Single;
  LMaxTextureSize: Integer;
  LDpiScale: Single;
begin
  Result := False;
  if not Assigned(AWindow) then Exit;

  LDpiScale := AWindow.FScale.y;
  LMaxTextureSize := AWindow.FMaxTextureSize;

  LSize := aSize * LDpiScale;
  LFileSize := AIO.Size();
  LBuffer := TVirtualBuffer.Create(LFileSize);
  try
    AIO.Read(LBuffer.Memory, LFileSize);
    if stbtt_InitFont(@LFontInfo, LBuffer.Memory, 0) = 0 then Exit;
    LGlyphChars := DEFAULT_GLYPHS + aGlyphs;
    LGlyphChars := Utils.RemoveDuplicates(LGlyphChars);
    NumOfGlyphs := LGlyphChars.Length;
    SetLength(LCodePoints, NumOfGlyphs);

    for I := 1 to NumOfGlyphs do
    begin
      LCodePoints[I-1] := Integer(Char(LGlyphChars[I]));
    end;

    LChars := TVirtualBuffer.Create(SizeOf(stbtt_packedchar) * (NumOfGlyphs+1));
    try
      LPackRange.font_size := -LSize;
      LPackRange.first_unicode_codepoint_in_range := 0;
      LPackRange.array_of_unicode_codepoints := @LCodePoints[0];
      LPackRange.num_chars := NumOfGlyphs;
      LPackRange.chardata_for_range := LChars.Memory;
      LPackRange.h_oversample := 1;
      LPackRange.v_oversample := 1;

      FAtlasSize := 32;

      while True do
      begin
        SetLength(LBitmap, FAtlasSize * FAtlasSize);
        stbtt_PackBegin(@LPackContext, @LBitmap[0], FAtlasSize, FAtlasSize, 0, 1, nil);
        stbtt_PackSetOversampling(@LPackContext, 1, 1);
        if stbtt_PackFontRanges(@LPackContext, LBuffer.Memory, 0, @LPackRange, 1) = 0  then
          begin
            LBitmap := nil;
            stbtt_PackEnd(@LPackContext);
            FAtlasSize := FAtlasSize * 2;
            if (FAtlasSize > LMaxTextureSize) then
            begin
              raise Exception.Create(Format('Font texture too large. Max size: %d', [LMaxTextureSize]));
            end;
          end
        else
          begin
            stbtt_PackEnd(@LPackContext);
            break;
          end;
      end;

      FAtlas := TTexture.Create();
      FAtlas.Load(@LBitmap[0], FAtlasSize, FAtlasSize);
      FAtlas.SetPivot(0,0);
      FAtlas.SetAnchor(0,0);
      FAtlas.SetBlend(tbAlpha);
      FAtlas.SetColor(WHITE);

      LBitmap := nil;

      LScale := stbtt_ScaleForMappingEmToPixels(@LFontInfo, LSize);
      stbtt_GetFontVMetrics(@LFontInfo, @LAscent, nil, nil);
      FBaseline := LAscent * LScale;

      FGlyph.Clear();
      for I := Low(LCodePoints) to High(LCodePoints) do
      begin
        LChar := Pstbtt_packedchar(LChars.Memory);
        Inc(LChar, I);

        LGlyph.SrcRect.x := LChar.x0;
        LGlyph.SrcRect.y := LChar.y0;
        LGlyph.SrcRect.Width := LChar.x1-LChar.x0;
        LGlyph.SrcRect.Height := LChar.y1-LChar.y0;

        LGlyph.DstRect.x := 0 + LChar.xoff;
        LGlyph.DstRect.y := 0 + LChar.yoff + FBaseline;
        LGlyph.DstRect.Width := (LChar.x1-LChar.x0);
        LGlyph.DstRect.Height := (LChar.y1-LChar.y0);

        LGlyph.XAdvance := LChar.xadvance;

        FGlyph.Add(LCodePoints[I], LGlyph);
      end;

      Result := True;

    finally
      LChars.Free();
    end;

  finally
    LBuffer.Free();
  end;
end;

procedure TFont.Unload();
begin
  if Assigned(FAtlas) then
  begin
    FAtlas.Free();
    FAtlas := nil;
  end;
  FGlyph.Clear();
end;

procedure TFont.DrawText(const AWindow: TWindow; const aX, aY: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const);
var
  LText: string;
  LChar: Integer;
  LGlyph: TGlyph;
  I, LLen: Integer;
  LX, LY: Single;
  LViewport: TRect;
  LWidth: Single;
begin
  LText := Format(aMsg, aArgs);
  LLen := LText.Length;

  LX := aX;
  LY := aY;

  AWindow.GetViewport(LViewport);

  case aHAlign of
    haLeft:
      begin
      end;
    haCenter:
      begin
        LWidth := TextLength(aMsg, aArgs);
        LX := (LViewport.Width - LWidth)/2;
      end;
    haRight:
      begin
        LWidth := TextLength(aMsg, aArgs);
        LX := LViewport.Width - LWidth;
      end;
  end;

  FAtlas.SetColor(AColor);

  for I := 1 to LLen do
  begin
    LChar := Integer(Char(LText[I]));
    if FGlyph.TryGetValue(LChar, LGlyph) then
    begin
      LGlyph.DstRect.x := LGlyph.DstRect.x + LX;
      LGlyph.DstRect.y := LGlyph.DstRect.y + LY;

      FAtlas.SetRegion(LGlyph.SrcRect);
      FAtlas.SetPos(LGlyph.DstRect.x, LGlyph.DstRect.y);
      FAtlas.Draw();
      LX := LX + LGlyph.XAdvance;
    end;
  end;
end;

procedure TFont.DrawText(const AWindow: TWindow; const aX: Single; var aY: Single; const aLineSpace: Single; const aColor: TColor; aHAlign: THAlign; const aMsg: string; const aArgs: array of const);
begin
  DrawText(AWindow, aX, aY, aColor, aHAlign, aMsg, aArgs);
  aY := aY + FBaseLine + aLineSpace;
end;

function  TFont.TextLength(const aMsg: string; const aArgs: array of const): Single;
var
  LText: string;
  LChar: Integer;
  LGlyph: TGlyph;
  I, LLen: Integer;
  LWidth: Single;
begin
  LText := Format(aMsg, aArgs);
  LLen := LText.Length;

  LWidth := 0;

  for I := 1 to LLen do
  begin
    LChar := Integer(Char(LText[I]));
    if FGlyph.TryGetValue(LChar, LGlyph) then
    begin
      LWidth := LWidth + LGlyph.XAdvance;
    end;
  end;

  Result := LWidth;
end;

function  TFont.TextHeight: Single;
begin
  Result := FBaseLine;
end;

function TFont.SaveTexture(const AFilename: string): Boolean;
begin
  Result := FAtlas.SaveToFile(AFilename);
end;

class function TFont.LoadFromFile(const AWindow: TWindow; const AFilename: string; const ASize: Cardinal; const AGlyphs: string): TFont;
var
  LIO: TIO;
begin
  Result := nil;
  if not Assigned(AWindow) then Exit;

  LIO := TFileIO.Open(AFilename, iomRead);
  try
    if not Assigned(LIO) then Exit;
    Result := TFont.Create();
    if not Assigned(Result) then Exit;
    if not Result.Load(AWindow, LIO, ASize, AGlyphs) then
    begin
      Result.Free();
      Result := nil;
      Exit;
    end;
  finally
    LIO.Free();
  end;
end;

class function TFont.LoadFromZipFile(const AWindow: TWindow; const AZipFile: TZipFile; const AFilename: string; const ASize: Cardinal; const AGlyphs: string): TFont;
var
  LIO: TIO;
begin
  Result := nil;
  if not Assigned(AWindow) then Exit;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen() then Exit;

  LIO := AZipFile.OpenFile(AFilename);
  try
    if not Assigned(LIO) then Exit;
    Result := TFont.Create();
    if not Assigned(Result) then Exit;
    if not Result.Load(AWindow, LIO, ASize, AGlyphs) then
    begin
      Result.Free();
      Result := nil;
      Exit;
    end;
  finally
    LIO.Free();
  end;
end;

class function  TFont.LoadDefault(const AWindow: TWindow; const aSize: Cardinal; const aGlyphs: string=''): TFont;
const
  CDefaultFontResName = '0b0039416ae04dedaad41588e3751295';
var
  LResStream: TResourceStream;
  LIO: TIO;
begin
  Result := nil;
  if not Assigned(AWindow) then Exit;
  if not Utils.ResourceExist(HInstance, CDefaultFontResName) then Exit;

  LResStream := TResourceStream.Create(HInstance, CDefaultFontResName, RT_RCDATA);
  try
    LIO := TMemoryIO.Open(LResStream.Memory, LResStream.Size);
    try
      Result := TFont.Create();
      if not Assigned(Result) then Exit;
      if not Result.Load(AWindow, LIO, ASize, AGlyphs) then
      begin
        Result.Free();
        Result := nil;
        Exit;
      end;
    finally
      LIO.Free();
    end;
  finally
    LResStream.Free();
  end;
end;

{ Video }
procedure TVideo_MADataCallback(ADevice: Pma_device; AOutput: Pointer; AInput: Pointer; AFrameCount: ma_uint32); cdecl;
var
  LReadPtr: PSingle;
  LFramesNeeded: Integer;
begin
  LFramesNeeded := AFrameCount * 2;
  LReadPtr := PSingle(Video.FRingBuffer.DirectReadPointer(LFramesNeeded));

  if Video.FRingBuffer.AvailableBytes >= LFramesNeeded then
    begin
      Move(LReadPtr^, AOutput^, LFramesNeeded * SizeOf(Single));
    end
  else
    begin
      FillChar(AOutput^, LFramesNeeded * SizeOf(Single), 0);
    end;
end;

procedure TVideo_PLMAudioDecodeCallback(APLM: Pplm_t; ASamples: Pplm_samples_t; AUserData: Pointer); cdecl;
begin
  Video.FRingBuffer.Write(ASamples^.interleaved, ASamples^.count*2);
end;

procedure TVideo_PLMVideoDecodeCallback(APLM: Pplm_t; AFrame: Pplm_frame_t; AUserData: Pointer); cdecl;
begin
  // convert YUV to RGBA
  plm_frame_to_rgba(AFrame, @Video.FRGBABuffer[0], Round(Video.FTexture.FSize.Width*4));

  // update OGL texture
  glBindTexture(GL_TEXTURE_2D, Video.FTexture.FHandle);
  glTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, AFrame^.width, AFrame^.height, GL_RGBA, GL_UNSIGNED_BYTE, Video.FRGBABuffer);
end;

procedure TVideo_PLMLoadBufferCallback(ABuffer: pplm_buffer_t; AUserData: pointer); cdecl;
var
  LBytesRead: Int64;
begin
  // read data from inputstream
  LBytesRead := Video.FIO.Read(@Video.FStaticPlmBuffer[0], Video.BUFFERSIZE);

  // push LBytesRead to PLM buffer
  if LBytesRead > 0 then
    begin
      plm_buffer_write(aBuffer, @Video.FStaticPlmBuffer[0], LBytesRead);
    end
  else
    begin
      // set status to stopped
      Video.FStatus := vsStopped;
    end;
end;

class constructor Video.Create;
begin
end;

class destructor Video.Destroy;
begin
  Stop();
end;

class function  Video.Play(const AIO: TIO; const AVolume: Single; const ALoop: Boolean): Boolean;
var
  LBuffer: Pplm_buffer_t;
begin
  Result := False;

  Stop();

  // set volume & loop status
  FVolume := AVolume;
  FLoop := ALoop;

  // init ringbuffer
  FRingBuffer := TVirtualRingBuffer<Single>.Create(CSampleRate*2);
  if not Assigned(FRingBuffer) then Exit;

  // init device for audio playback
  FDeviceConfig := ma_device_config_init(ma_device_type_playback);
  FDeviceConfig.playback.format := ma_format_f32;
  FDeviceConfig.playback.channels := 2;
  FDeviceConfig.sampleRate := CSampleRate;
  FDeviceConfig.dataCallback := @TVideo_MADataCallback;
  if ma_device_init(nil, @FDeviceConfig, @FDevice) <> MA_SUCCESS then Exit;
  ma_device_start(@FDevice);
  SetVolume(AVolume);

  // set the input stream
  FIO := AIO;
  FStatus := vsPlaying;

  // init plm buffer
  LBuffer := plm_buffer_create_with_capacity(BUFFERSIZE);
  if not Assigned(LBuffer) then
  begin
    ma_device_uninit(@FDevice);
    FRingBuffer.Free;
    Exit;
  end;

  plm_buffer_set_load_callback(LBuffer, TVideo_PLMLoadBufferCallback, Self);
  FPLM := plm_create_with_buffer(LBuffer, 1);
  if not Assigned(FPLM) then
  begin
    plm_buffer_destroy(LBuffer);
    ma_device_uninit(@FDevice);
    FRingBuffer.Free;
    Exit;
  end;

  // create video render texture
  FTexture := TTexture.Create;
  FTexture.SetBlend(tbNone);
  FTexture.Allocate(plm_get_width(FPLM), plm_get_height(FPLM));

  // alloc the video rgba buffer
  SetLength(FRGBABuffer,
    Round(FTexture.GetSize.Width*FTexture.GetSize.Height*4));
  if not Assigned(FRGBABuffer) then
  begin
    plm_buffer_destroy(LBuffer);
    ma_device_uninit(@FDevice);
    FRingBuffer.Free;
    Exit;
  end;

  // set the audio lead time
  plm_set_audio_lead_time(FPLM, (CSampleSize*2)/FDeviceConfig.sampleRate);

  // set audio/video callbacks
  plm_set_audio_decode_callback(FPLM, TVideo_PLMAudioDecodeCallback, Self);
  plm_set_video_decode_callback(FPLM, TVideo_PLMVideoDecodeCallback, Self);

  FTexture.SetPivot(0, 0);
  FTexture.SetAnchor(0, 0);
  FTexture.SetBlend(tbNone);

  // return OK
  Result := True;
end;

class procedure Video.Stop();
begin
  if not Assigned(FPLM) then Exit;

  ma_device_stop(@FDevice);
  ma_device_uninit(@FDevice);

  plm_destroy(FPLM);

  FIO.Free;
  FTexture.Free;
  FRingBuffer.Free;

  FPLM := nil;
  FRingBuffer := nil;
  FStatus := vsStopped;
  FTexture := nil;
end;

class function  Video.Update(): Boolean;
begin
  Result := False;
  if not Assigned(FPLM) then Exit;
  if FStatus = vsStopped then
  begin
    ma_device_stop(@FDevice);

    if FLoop then
    begin
      plm_rewind(FPLM);
      FIO.Seek(0, smStart);
      FRingBuffer.Clear;
      ma_device_start(@FDevice);
      SetVolume(FVolume);
      FStatus := vsPlaying;
      plm_decode(FPLM, FrameLimitTimer.TargetTime());
      Exit;
    end;
    Result := True;
    Exit;
  end;

  plm_decode(FPLM, FrameLimitTimer.TargetTime());
end;

class procedure Video.Draw(const X, Y, AScale: Single);
begin
  if FStatus <> vsPlaying then Exit;
  FTexture.SetPos(X, Y);
  FTexture.SetScale(AScale);
  FTexture.Draw();
end;

class function  Video.GetStatus(): Status;
begin
  Result := FStatus;
end;

class function  Video.GetVolume(): Single;
begin
  Result := FVolume;
end;

class procedure Video.SetVolume(const AVolume: Single);
begin
  FVolume := EnsureRange(AVolume, 0, 1);
  ma_device_set_master_volume(@FDevice, Math.UnitToScalarValue(FVolume, 1));
end;

class function  Video.GetLooping(): Boolean;
begin
  Result := FLoop;
end;

class procedure Video.SetLooping(const ALoop: Boolean);
begin
  FLoop := ALoop;
end;

{ TCamera }
procedure TCamera.SetRotation(const AValue: Single);
begin
  FRotation := EnsureRange(AValue, 0, 360);
end;

constructor TCamera.Create();
begin
  inherited;
  FScale := 1;
end;

destructor TCamera.Destroy();
begin
  inherited;
end;

procedure TCamera.Move(const X, Y: Single);
begin
  FX := FX + (X / FScale);
  FY := FY + (Y / FScale);
end;

procedure TCamera.Zoom(const AScale: Single);
begin
  FScale := FScale + (AScale * FScale);
end;

procedure TCamera.Rotate(const ARotation: Single);
begin
  FRotation := FRotation + ARotation;
end;

procedure TCamera.Use(const AWindow: TWindow);
var
  LViewport: TRect;
begin
  if not Assigned(AWindow) then
  begin
    glPopMatrix();
    FWindow := nil;
    Exit;
  end;

  glPushMatrix();
  AWindow.GetViewport(LViewport);

  glTranslatef((LViewport.Width/2), (LViewport.Height/2), 0);
  glRotatef(FRotation, 0, 0, 1);
  glScalef(FScale, FScale, 1);
  glTranslatef(-FX, -FY, 0);
end;

procedure TCamera.Reset();
begin
  if Assigned(FWindow) then
  begin
    glPopMatrix();
  end;
  FX := 0;
  FY := 0;
  FRotation := 0;
  FScale := 1;
end;

{ TCloudDb }
procedure TCloudDb.SetMacroValue(const AName, AValue: string);
begin
  FPrepairedSQL := FPrepairedSQL.Replace('&'+AName, AValue);
end;

procedure TCloudDb.SetParamValue(const AName, AValue: string);
begin
  FPrepairedSQL := FPrepairedSQL.Replace(':'+AName, ''''+AValue+'''');
end;

procedure TCloudDb.Prepair();
var
  LKey: string;
begin
  FPrepairedSQL := FSQL.Text;

  // substitue macros
  for LKey in FMacros.Keys do
  begin
    SetMacroValue(LKey, FMacros.Items[LKey]);
  end;

  // substitue field params
  for LKey in FParams.Keys do
  begin
    SetParamValue(LKey, FParams.Items[LKey]);
  end;
end;

constructor  TCloudDb.Create();
begin
  inherited;
  FSQL := TStringList.Create;
  FHttp := THTTPClient.Create;
  FMacros := TDictionary<string, string>.Create;
  FParams := TDictionary<string, string>.Create;
end;

destructor TCloudDb.Destroy();
begin
  if Assigned(FJson) then
  begin
    FJson.Free();
    FJson := nil;
  end;
  FParams.Free();
  FMacros.Free();
  FHttp.Free();
  FSQL.Free();
  inherited;
end;

procedure TCloudDb.Setup(const AURL, AApiKey, ADatabase: string);
begin
  FUrl := AURL + cURL;
  FApiKey := AApiKey;
  FDatabase := ADatabase;
end;

procedure TCloudDb.ClearSQLText();
begin
  FSQL.Clear();
end;

procedure TCloudDb.AddSQLText(const AText: string;
  const AArgs: array of const);
begin
  FSQL.Add(Format(AText, AArgs));
end;

function  TCloudDb.GetSQLText: string;
begin
  Result := FSQL.Text;
end;

procedure TCloudDb.SetSQLText(const AText: string);
begin
  FSQL.Text := AText;
end;

function  TCloudDb.GetMacro(const AName: string): string;
begin
  FMacros.TryGetValue(AName, Result);
end;

procedure TCloudDb.SetMacro(const AName, AValue: string);
begin
  FMacros.AddOrSetValue(AName, AValue);
end;

function  TCloudDb.GetParam(const AName: string): string;
begin
  FParams.TryGetValue(AName, Result);
end;

procedure TCloudDb.SetParam(const AName, AValue: string);
begin
  FParams.AddOrSetValue(AName, AValue);
end;

function  TCloudDb.RecordCount(): Integer;
begin
  Result := 0;
  if not Assigned(FDataset) then Exit;
  Result := FDataset.Count;
end;

function  TCloudDb.GetField(const AIndex: Cardinal;
  const AName: string): string;
begin
  Result := '';
  if not Assigned(FDataset) then Exit;
  if AIndex > Cardinal(FDataset.Count-1) then Exit;
  Result := FDataset.Items[AIndex].GetValue<string>(AName);
end;

function  TCloudDb.GetQueryURL(const ASQL: string): string;
begin
  Result := Format(FUrl, [FApiKey, FDatabase, ASQL]);
end;

function  TCloudDb.GetPrepairedSQL: string;
begin
  Result := FPrepairedSQL;
end;

function TCloudDb.Execute(): Boolean;
begin
  Prepair;
  Result := ExecuteSQL(FPrepairedSQL);
end;

function  TCloudDb.ExecuteSQL(const ASQL: string): Boolean;
var
  LResponse: IHTTPResponse;
begin
  Result := False;
  if ASQL.IsEmpty then Exit;
  LResponse := FHttp.Get(GetQueryURL(ASQL));
  FResponseText := LResponse.ContentAsString;
  if Assigned(FJson) then
  begin
    if Assigned(FJSON) then
    begin
      FJson.Free();
      FJson := nil;
    end;

    FDataset := nil;
  end;
  FJson := TJSONObject.ParseJSONValue(FResponseText) as TJSONObject;
  FLastError := FJson.GetValue('response').Value;
  Result := Boolean(FLastError.IsEmpty or SameText(FLastError, 'true'));
  if FLastError.IsEmpty then
  begin
    if Assigned(FDataset) then
    begin
      FDataset.Free();
      FDataset := nil;
    end;
    FJson.TryGetValue('response', FDataset);
  end;
  if not Assigned(FDataset) then
  begin
    FJson.Free();
    FJson := nil;
  end;
end;

function TCloudDb.GetLastError(): string;
begin
  Result := FLastError;
end;

function TCloudDb.GetResponseText(): string;
begin
  Result:= FResponseText;
end;

{  Speech }
class procedure Speech.DoOnWord(ASender: TObject; AStreamNumber: Integer; AStreamPosition: OleVariant; ACharacterPosition, ALength: Integer);
var
  LWord: string;
begin
  if FText.IsEmpty then Exit;
  LWord := FText.Substring(ACharacterPosition, ALength);
  if not FSubList.TryGetValue(LWord, FWord) then
    FWord := LWord;
  if Assigned(FOnWord) then
  begin
    FOnWord(FWord, FText);
  end;
end;

class procedure Speech.DoSpeak(AText: string; AFlags: Integer);
begin
  if FSpVoice = nil then Exit;
  if AText.IsEmpty then Exit;
  if FPaused then Resume;
  FSpVoice.Speak(AText, AFlags);
  FText := AText;
end;

class procedure Speech.EnumVoices;
var
  LI: Integer;
  LSOToken: ISpeechObjectToken;
  LSOTokens: ISpeechObjectTokens;
begin
  FVoiceList := TInterfaceList.Create;
  FVoiceDescList := TStringList.Create;
  LSOTokens := FSpVoice.GetVoices('', '');
  for LI := 0 to LSOTokens.Count - 1 do
  begin
    LSOToken := LSOTokens.Item(LI);
    FVoiceDescList.Add(LSOToken.GetDescription(0));
    FVoiceList.Add(LSOToken);
  end;
end;

class procedure Speech.FreeVoices;
begin
  FreeAndNil(FVoiceDescList);
  FreeAndNil(FVoiceList);
end;

class constructor Speech.Create;
begin
  inherited;
  FPaused := False;
  FText := '';
  FWord := '';
  FVoice := 0;
  FSpVoice := TSpVoice.Create(nil);
  FSpVoice.EventInterests := SVEAllEvents;
  EnumVoices;
  //FSpVoice.OnStartStream := OnStartStream;
  FSpVoice.OnWord := DoOnWord;
  FSubList := TDictionary<string, string>.Create;
  FVolume := 1;
end;

class destructor Speech.Destroy;
begin
  FreeAndNil(FSubList);
  FreeVoices;
  FSpVoice.OnWord := nil;
  FSpVoice.Free;
  inherited;
end;

class function Speech.GetVoiceCount: Integer;
begin
  Result := FVoiceList.Count;
end;

class function Speech.GetVoiceAttribute(const AIndex: Integer; const AAttribute: VoiceAttributeEvent): string;
var
  LSOToken: ISpeechObjectToken;

  function GetAttr(const aItem: string): string;
  begin
    if aItem = 'Id' then
      Result := LSOToken.Id
    else
      Result := LSOToken.GetAttribute(aItem);
  end;

begin
  Result := '';
  if (AIndex < 0) or (AIndex > FVoiceList.Count - 1) then
    Exit;
  LSOToken := ISpeechObjectToken(FVoiceList.Items[AIndex]);
  case AAttribute of
    vaDescription:
      Result := FVoiceDescList[AIndex];
    vaName:
      Result := GetAttr('Name');
    vaVendor:
      Result := GetAttr('Vendor');
    vaAge:
      Result := GetAttr('Age');
    vaGender:
      Result := GetAttr('Gender');
    vaLanguage:
      Result := GetAttr('Language');
    vaId:
      Result := GetAttr('Id');
  end;
end;

class procedure Speech.ChangeVoice(const AIndex: Integer);
var
  LSOToken: ISpeechObjectToken;
begin
  if (AIndex < 0) or (AIndex > FVoiceList.Count - 1) then Exit;
  if AIndex = FVoice then Exit;
  LSOToken := ISpeechObjectToken(FVoiceList.Items[AIndex]);
  FSpVoice.Voice := LSOToken;
  FVoice := AIndex;
end;

class function Speech.GetVoice: Integer;
begin
  Result := FVoice;
end;

class procedure Speech.SetVolume(const AVolume: Single);
begin
  if FSpVoice = nil then   Exit;
  FVolume := EnsureRange(AVolume, 0, 1);
  FSpVoice.Volume := Round(Math.UnitToScalarValue(FVolume, 100));
end;

class function Speech.GetVolume: Single;
begin
  Result := 0;
  if FSpVoice = nil then Exit;
  Result := FVolume;
end;

class procedure Speech.SetRate(const ARate: Single);
var
  LVolume: Integer;
  LRate: Single;
begin
  if FSpVoice = nil then Exit;

  LRate := EnsureRange(ARate, 0, 1);

  LVolume := Round(20.0 * LRate) - 10;

  if LVolume < -10 then
    LVolume := -10
  else if LVolume > 10 then
    LVolume := 10;

  FSpVoice.Rate := LVolume;
end;

class function Speech.GetRate: Single;
begin
  Result := 0;
  if FSpVoice = nil then Exit;
  Result := (FSpVoice.Rate + 10.0) / 20.0;
end;

class procedure Speech.Say(const AText: string; const APurge: Boolean);
var
  LFlag: Integer;
  LText: string;
begin
  LFlag := SVSFlagsAsync;
  LText := AText;
  if APurge then
    LFlag := LFlag or SVSFPurgeBeforeSpeak;
  DoSpeak(LText, LFlag);
end;

class procedure Speech.SayXML(const AText: string; const APurge: Boolean);
var
  LFlag: Integer;
  LText: string;
begin
  LFlag := SVSFlagsAsync or SVSFIsXML;
  if APurge then
    LFlag := LFlag or SVSFPurgeBeforeSpeak;
  LText := AText;
  DoSpeak(AText, LFlag);
end;

class procedure Speech.Clear();
begin
  if FSpVoice = nil then Exit;
  if Active then
  begin
    FSpVoice.Skip('Sentence', MaxInt);
    Say(' ', True);
  end;
  FText := '';
end;

class function Speech.Active(): Boolean;
begin
  Result := False;
  if FSpVoice = nil then Exit;
  Result := Boolean(FSpVoice.Status.RunningState <> SRSEDone);
end;

class procedure Speech.Pause();
begin
  if FSpVoice = nil then Exit;
  FSpVoice.Pause;
  FPaused := True;
end;

class procedure Speech.Resume();
begin
  if FSpVoice = nil then Exit;
  FSpVoice.Resume;
  FPaused := False;
end;

class procedure Speech.Reset();
begin
  Clear;
  FreeAndNil(FSpVoice);
  FPaused := False;
  FText := '';
  FWord := '';
  FSpVoice := TSpVoice.Create(nil);
  FSpVoice.EventInterests := SVEAllEvents;
  EnumVoices;
  //FSpVoice.OnStartStream := OnStartStream;
  FSpVoice.OnWord := DoOnWord;
end;

class procedure Speech.SubstituteWord(const AWord: string; const ASubstituteWord: string);
var
  LWord: string;
  LSubstituteWord: string;
begin
  LWord := AWord;
  LSubstituteWord := ASubstituteWord;
  if LWord.IsEmpty then Exit;
  if LSubstituteWord.IsEmpty then Exit;
  FSubList.TryAdd(LWord, LSubstituteWord);
end;

constructor TPolygon.Create();
begin
  inherited;
end;

destructor TPolygon.Destroy();
begin
  Clear();
  inherited;
end;

procedure TPolygon.Save(const AFilename: string);
var
  LSize: Integer;
  LStream: TIO;
begin
  LStream := TFileIO.Open(AFilename, iomWrite);
  try
    // FItemCount
    LStream.Write(@FItemCount, SizeOf(FItemCount));

    // FItem
    LSize := SizeOf(FSegment[0]) * FItemCount;
    LStream.Write(@FSegment[0], LSize);

    // FWorldPoint
    LSize := SizeOf(FWorldPoint[0]) * FItemCount;
    LStream.Write(@FWorldPoint[0], LSize);

  finally
    LStream.Free();
  end;
end;

procedure TPolygon.Load(const AIO: TIO);
var
  LSize: Integer;
begin
  if Assigned(AIO) then Exit;

  Clear();

  // FItemCount
  AIO.Read(@FItemCount, SizeOf(FItemCount));

  // FItem
  SetLength(FSegment, FItemCount);
  LSize := SizeOf(FSegment[0]) * FItemCount;
  AIO.Read(@FSegment[0], LSize);

  // FWorldPoint
  SetLength(FWorldPoint, FItemCount);
  LSize := SizeOf(FWorldPoint[0]) * FItemCount;
  AIO.Read(@FWorldPoint[0], LSize);
end;

procedure TPolygon.CopyFrom(aPolygon: TPolygon);
var
  I: Integer;
begin
  Clear;
  for I := 0 to FItemCount-1 do
  begin
    with FSegment[I] do
    begin
      AddLocalPoint(Round(Point.X), Round(Point.Y), Visible);
    end;
  end;
end;

procedure TPolygon.Clear();
begin
  FSegment := nil;
  FWorldPoint := nil;
  FItemCount := 0;
end;

procedure TPolygon.AddLocalPoint(AX, AY: Single; aVisible: Boolean);
begin
  Inc(FItemCount);
  SetLength(FSegment, FItemCount);
  SetLength(FWorldPoint, FItemCount);
  FSegment[FItemCount-1].Point.X := aX;
  FSegment[FItemCount-1].Point.Y := aY;
  FSegment[FItemCount-1].Visible := aVisible;
  FWorldPoint[FItemCount-1].X := 0;
  FWorldPoint[FItemCount-1].Y := 0;
end;

function  TPolygon.Transform(AX, AY, AScale, AAngle: Single; AOrigin: PPoint; AHFlip, AVFlip: Boolean): Boolean;
var
  I: Integer;
  P: TPoint;
begin
  Result := False;

  if FItemCount < 2 then  Exit;

  for I := 0 to FItemCount-1 do
  begin
    // get local coord
    P.X := FSegment[I].Point.X;
    P.Y := FSegment[I].Point.Y;

    // move point to origin
    if aOrigin <> nil then
    begin
      P.X := P.X - aOrigin.X;
      P.Y := P.Y - aOrigin.Y;
    end;

    if aVFlip then
      P.Y := -P.Y;

    if aHFlip then
      P.X := -P.X;

    // scale
    P.X := P.X * aScale;
    P.Y := P.Y * aScale;

    // rotate
    Math.AngleRotatePos(aAngle, P.X, P.Y);

    // convert to world
    P.X := P.X + aX;
    P.Y := P.Y + aY;

    // set world point
    FWorldPoint[I].X := P.X;
    FWorldPoint[I].Y := P.Y;
  end;

  Result := True;
end;

procedure TPolygon.Render(const AWindow: TWindow; const AX, AY, AScale, AAngle: Single; AThickness: Integer; AColor: TColor; AOrigin: PPoint; AHFlip, AVFlip: Boolean);
var
  I: Integer;
  X0,Y0,X1,Y1: Single;
begin
  if not Transform(aX, aY, aScale, aAngle, aOrigin, aHFlip,  aVFlip) then Exit;

  // draw line segments
  for I := 0 to FItemCount-2 do
  begin
    if FSegment[I].Visible then
    begin
      X0 := FWorldPoint[I].X;
      Y0 := FWorldPoint[I].Y;
      X1 := FWorldPoint[I+1].X;
      Y1 := FWorldPoint[I+1].Y;
      AWindow.DrawLine(X0, Y0, X1, Y1, AColor, AThickness);
    end;
  end;
end;

procedure TPolygon.SetSegmentVisible(AIndex: Integer; aVisible: Boolean);
begin
  FSegment[aIndex].Visible := True;
end;

function  TPolygon.IsSegmentVisible(AIndex: Integer): Boolean;
begin
  Result := FSegment[aIndex].Visible;
end;

function  TPolygon.PointCount(): Integer;
begin
  Result := FItemCount;
end;

function  TPolygon.WorldPoint(AIndex: Integer): PPoint;
begin
  Result := @FWorldPoint[aIndex];
end;

function  TPolygon.LocalPoint(AIndex: Integer): PPoint;
begin
  Result := @FSegment[aIndex].Point;
end;

{ TStarfield }
procedure TStarfield.TransformDrawPoint(const X, Y, Z: Single; const AWindow: TWindow);
var
  LX, LY: Single;
  LSW, LSH: Single;
  LOOZ: Single;
  LCV: Byte;
  LColor: TColor;
  LViewport: TRect;
  LScale: SGT.Lib.TPoint;

  function IsVisible(vx, vy, vw, vh: Single): Boolean;
  begin
    Result := False;
    if ((vx - vw) < 0) then
      Exit;
    if (vx > (LViewport.Width - 1)) then
      Exit;
    if ((vy - vh) < 0) then
      Exit;
    if (vy > (LViewport.Height - 1)) then
      Exit;
    Result := True;
  end;

begin
  AWindow.GetViewport(LViewport);
  AWindow.GetScale(LScale);
  FViewScaleRatio := LViewport.Width / LViewport.Height;
  FCenter.X := (LViewport.Width / 2) + LViewport.X;
  FCenter.Y := (LViewport.Height / 2) + LViewport.Y;

  LOOZ := ((1.0 / Z) * FViewScale);
  LX := (FCenter.X - LViewport.X) - (X * LOOZ) * FViewScaleRatio;
  LY := (FCenter.Y - LViewport.Y) + (Y * LOOZ) * FViewScaleRatio;
  LSW := (1.0 * LOOZ);
  if LSW < 1 then LSW := 1;
  LSH := (1.0 * LOOZ);
  if LSH < 1 then LSH := 1;
  LSW := LSW * LScale.x;
  LSH := LSH * LScale.y;
  if not IsVisible(LX, LY, LSW, LSH) then
    Exit;
  LCV := round(255.0 - (((1.0 / FMax.Z) / (1.0 / Z)) * 255.0));

  LColor.Make(LCV, LCV, LCV, LCV);

  LX := LX - FVirtualPos.X;
  LY := LY - FVirtualPos.Y;

  AWindow.DrawFilledRect(LX, LY, LSW, LSH, LColor, 0);
end;

procedure TStarfield.Done();
begin
  FStar := nil;
end;

constructor TStarfield.Create();
begin
  inherited;
end;

destructor TStarfield.Destroy();
begin
  Done;

  inherited;
end;
procedure TStarfield.Init(const AWindow: TWindow; const aStarCount: Cardinal; const AMinX, AMinY, AMinZ, AMaxX, AMaxY, AMaxZ, AViewScale: Single);
var
  I: Integer;
  LViewport: TRect;
begin
  Done;

  FStarCount := aStarCount;
  SetLength(FStar, FStarCount);

  AWindow.GetViewport(LViewport);

  FViewScale := aViewScale;
  FViewScaleRatio := LViewport.Width / LViewport.Height;
  FCenter.X := (LViewport.Width / 2) + LViewport.X;
  FCenter.Y := (LViewport.Height / 2) + LViewport.Y;
  FCenter.Z := 0;

  FMin.X := aMinX;
  FMin.Y := aMinY;
  FMin.Z := aMinZ;
  FMax.X := aMaxX;
  FMax.Y := aMaxY;
  FMax.Z := aMaxZ;

  for I := 0 to FStarCount - 1 do
  begin
    FStar[I].X := Math.RandomRangef(FMin.X, FMax.X);
    FStar[I].Y := Math.RandomRangef(FMin.Y, FMax.Y);
    FStar[I].Z := Math.RandomRangef(FMin.Z, FMax.Z);
  end;

  SetXSpeed(0.0);
  SetYSpeed(0.0);
  SetZSpeed(-3);
  SetVirtualPos(0, 0);
end;

procedure TStarfield.SetVirtualPos(const X, Y: Single);
begin
  FVirtualPos.X := X;
  FVirtualPos.Y := Y;
end;

procedure TStarfield.GetVirtualPos(var X: Single; var Y: Single);
begin
  X := FVirtualPos.X;
  Y := FVirtualPos.Y;
end;

procedure TStarfield.SetXSpeed(const ASpeed: Single);
begin
  FSpeed.X := aSpeed;
end;

procedure TStarfield.SetYSpeed(const ASpeed: Single);
begin
  FSpeed.Y := aSpeed;
end;

procedure TStarfield.SetZSpeed(const ASpeed: Single);
begin
  FSpeed.Z := aSpeed;
end;

procedure TStarfield.Update();
var
  I: Integer;

  procedure SetRandomPos(aIndex: Integer);
  begin
    FStar[aIndex].X := Math.RandomRangef(FMin.X, FMax.X);
    FStar[aIndex].Y := Math.RandomRangef(FMin.Y, FMax.Y);
    FStar[aIndex].Z := Math.RandomRangef(FMin.Z, FMax.Z);
  end;

begin

  for I := 0 to FStarCount - 1 do
  begin
    FStar[I].X := FStar[I].X + FSpeed.X;
    FStar[I].Y := FStar[I].Y + FSpeed.Y;
    FStar[I].Z := FStar[I].Z + FSpeed.Z;

    if FStar[I].X < FMin.X then
    begin
      SetRandomPos(I);
      FStar[I].X := FMax.X;
    end;

    if FStar[I].X > FMax.X then
    begin
      SetRandomPos(I);
      FStar[I].X := FMin.X;
    end;

    if FStar[I].Y < FMin.Y then
    begin
      SetRandomPos(I);
      FStar[I].Y := FMax.Y;
    end;

    if FStar[I].Y > FMax.Y then
    begin
      SetRandomPos(I);
      FStar[I].Y := FMin.Y;
    end;

    if FStar[I].Z < FMin.Z then
    begin
      SetRandomPos(I);
      FStar[I].Z := FMax.Z;
    end;

    if FStar[I].Z > FMax.Z then
    begin
      SetRandomPos(I);
      FStar[I].Z := FMin.Z;
    end;
  end;
end;

procedure TStarfield.Render(const AWindow: TWindow);
var
  I: Integer;
begin
  for I := 0 to FStarCount - 1 do
  begin
    TransformDrawPoint(FStar[I].X, FStar[I].Y, FStar[I].Z, AWindow);
  end;
end;

class function TStarfield.New(const AWindow: TWindow): TStarfield;
begin
  Result := TStarfield.Create();
  Result.Init(AWindow, 250, -1000, -1000, 10, 1000, 1000, 1000, 120);
end;

{ TSprite }
constructor TSprite.Create();
begin
  inherited;
  FTextures := nil;
  FGroups := nil;
  FPageCount := 0;
  FGroupCount := 0;
end;

destructor TSprite.Destroy();
begin
  Clear();
  inherited;
end;

procedure TSprite.Clear();
var
  I: Integer;
begin
  if FTextures <> nil then
  begin
    // free group data
    for I := 0 to FGroupCount - 1 do
    begin
      // free image array
      FGroups[I].Image := nil;
    end;

    // free page
    for I := 0 to FPageCount - 1 do
    begin
      if Assigned(FTextures[I]) then
      begin
        FTextures[I].Free();
        FTextures[I] := nil;
      end;
    end;
  end;

  FTextures := nil;
  FGroups := nil;
  FPageCount := 0;
  FGroupCount := 0;
end;

function TSprite.LoadPageFromFile(const AFilename: string; AColorKey: PColor): Integer;
var
  LTexture: TTexture;
begin
  Result := -1;
  LTexture := TTexture.LoadFromFile(AFilename, AColorKey);
  if not Assigned(LTexture) then Exit;

  Result := FPageCount;
  Inc(FPageCount);
  SetLength(FTextures, FPageCount);
  FTextures[Result] := LTexture;
end;

function TSprite.LoadPageFromZipFile(const AZipFile: TZipFile; const AFilename: string; AColorKey: PColor): Integer;
var
  LTexture: TTexture;
begin
  Result := -1;
  LTexture := TTexture.LoadFromZipFile(AZipFile, AFilename, AColorKey);
  if not Assigned(LTexture) then Exit;

  Result := FPageCount;
  Inc(FPageCount);
  SetLength(FTextures, FPageCount);
  FTextures[Result] := LTexture;
end;

function TSprite.AddGroup(): Integer;
begin
  Result := FGroupCount;
  Inc(FGroupCount);
  SetLength(FGroups, FGroupCount);
end;

function TSprite.GetGroupCount(): Integer;
begin
  Result := FGroupCount;
end;

function TSprite.AddImageFromRect(const APage, AGroup: Integer; const ARect: TRect; const AXOffset: Integer; const AYOffset: Integer): Integer;
begin
  Result := -1;
  if not InRange(APage, 0, FPageCount-1) then Exit;
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;

  Result := FGroups[AGroup].Count;
  Inc(FGroups[AGroup].Count);
  SetLength(FGroups[AGroup].Image, FGroups[AGroup].Count);

  FGroups[AGroup].Image[Result].Rect.X := ARect.X + AXOffset;
  FGroups[AGroup].Image[Result].Rect.Y := ARect.Y + AYOffset;
  FGroups[AGroup].Image[Result].Rect.Width := aRect.Width;
  FGroups[AGroup].Image[Result].Rect.Height := aRect.Height;
  FGroups[AGroup].Image[Result].Page := APage;
end;

function TSprite.AddImageFromGrid(const APage, AGroup, AGridX, AGridY, AGridWidth, AGridHeight: Integer; const AXOffset: Integer; const AYOffset: Integer): Integer;
begin
  Result := -1;
  if not InRange(APage, 0, FPageCount-1) then Exit;
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;

  Result := FGroups[AGroup].Count;
  Inc(FGroups[AGroup].Count);
  SetLength(FGroups[AGroup].Image, FGroups[AGroup].Count);

  FGroups[AGroup].Image[Result].Rect.X := (aGridWidth * aGridX) + AXOffset;
  FGroups[AGroup].Image[Result].Rect.Y := (aGridHeight * aGridY) + AYOffset;
  FGroups[AGroup].Image[Result].Rect.Width := aGridWidth;
  FGroups[AGroup].Image[Result].Rect.Height := aGridHeight;
  FGroups[AGroup].Image[Result].Page := APage;
end;

function TSprite.AddImages(const APage, AGroup, AColCount, ARowCount, AImageWidth, AImageHeight: Integer; const AXOffset: Integer=0; const AYOffset: Integer=0): Boolean;
var
  X, Y: Integer;
begin
  Result := False;
  for Y  := 0 to ARowCount-1 do
  begin
    for X := 0 to AColCount-1 do
    begin
      if AddImageFromGrid(APage, AGroup, X, Y,  AImageWidth, AImageHeight, AXOffset, AYOffset) = -1 then Exit;
    end;
  end;
  Result := True;
end;

function TSprite.GetImageCount(const AGroup: Integer): Integer;
begin
  Result := -1;
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;
  Result := FGroups[AGroup].Count;
end;

function TSprite.GetImageWidth(const ANum, AGroup: Integer): Single;
begin
  Result := -1;
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;
  if not InRange(ANum, 0, FGroups[AGroup].Count-1) then Exit;
  Result := FGroups[AGroup].Image[ANum].Rect.Width;
end;

function TSprite.GetImageHeight(const ANum, AGroup: Integer): Single;
begin
  Result := 0;
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;
  if not InRange(ANum, 0, FGroups[AGroup].Count-1) then Exit;
  Result := FGroups[AGroup].Image[ANum].Rect.Height;
end;

function TSprite.GetImageTexture(const ANum, AGroup: Integer): TTexture;
begin
  Result := nil;
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;
  if not InRange(ANum, 0, FGroups[AGroup].Count-1) then Exit;
  Result := FTextures[FGroups[AGroup].Image[ANum].Page];
end;

function TSprite.GetImageRegion(const ANum, AGroup: Integer): TRect;
begin
  Result := Math.Rect(-1,-1,-1,-1);
  if not InRange(AGroup, 0, FGroupCount-1) then Exit;
  if not InRange(ANum, 0, FGroups[AGroup].Count-1) then Exit;
  Result := FGroups[AGroup].Image[ANum].Rect;
end;

{ TEntity }
constructor TEntity.Create();
begin
  inherited;
end;

destructor TEntity.Destroy();
begin
  inherited;
end;

function TEntity.Init(const ASprite: TSprite; const AGroup: Integer): Boolean;
begin
  Result := False;
  if not Assigned(ASprite) then Exit;
  if not InRange(AGroup, 0, ASprite.GetGroupCount()-1) then Exit;

  FSprite := aSprite;
  FGroup := AGroup;
  SetFrameRange(0, ASprite.GetImageCount(FGroup)-1);
  SetFrameSpeed(24);
  SetScaleAbs(1.0);
  RotateAbs(0);
  SetAngleOffset(0);
  SetColor(WHITE);
  SetHFlip(False);
  SetVFlip(False);
  SetLoopFrame(True);
  SetPosAbs(0, 0);
  SetBlend(tbAlpha);
  SetPivot(0.5, 0.5);
  SetAnchor(0.5, 0.5);
  SetFrame(0);

  Result := True;
end;

function  TEntity.GetPivot(): TPoint;
begin
  Result := FPivot;
end;

procedure TEntity.SetPivot(const APoint: TPoint);
begin
  FPivot := APoint;
end;

procedure TEntity.SetPivot(const X, Y: Single);
begin
  FPivot.x := X;
  FPivot.y := Y;
end;

function  TEntity.GetAnchor(): TPoint;
begin
  Result := FAnchor;
end;

procedure TEntity.SetAnchor(const APoint: TPoint);
begin
  FAnchor := APoint;
end;

procedure TEntity.SetAnchor(const X, Y: Single);
begin
  FAnchor.x := X;
  FAnchor.y := Y;
end;

procedure TEntity.SetFrameRange(const aFirst, aLast: Integer);
begin
  FFirstFrame := aFirst;
  FLastFrame  := aLast;
end;

function  TEntity.NextFrame(): Boolean;
begin
  Result := False;
  if FFrameTimer.Check() then
  begin
    Inc(FFrame);
    if FFrame > FLastFrame then
    begin
      if FLoopFrame then
        FFrame := FFirstFrame
      else
        FFrame := FLastFrame;
      Result := True;
    end;
    SetFrame(FFrame);
  end;
end;

function  TEntity.PrevFrame(): Boolean;
begin
  Result := False;
  if FFrameTimer.Check() then
  begin
    Dec(FFrame);
    if FFrame < FFirstFrame then
    begin
      if FLoopFrame then
        FFrame := FLastFrame
      else
        FFrame := FFirstFrame;
      Result := True;
    end;
    SetFrame(FFrame);
  end;
end;

function  TEntity.GetFrame(): Integer;
begin
  Result := FFrame;
end;

procedure TEntity.SetFrame(const AFrame: Integer);
var
  LW, LH, LR: Single;
begin
  FFrame := aFrame;
  EnsureRange(FFrame, 0, FSprite.GetImageCount(FGroup)-1);

  LW := FSprite.GetImageWidth(FFrame, FGroup);
  LH := FSprite.GetImageHeight(FFrame, FGroup);

  LR := (LW + LH) / 2;

  FWidth  := LW * FScale;
  FHeight := LH * FScale;
  FRadius := LR * FScale;
end;

function  TEntity.GetFrameSpeed(): Single;
begin
  Result := FFrameTimer.Speed();
end;

procedure TEntity.SetFrameSpeed(const AFrameSpeed: Single);
begin
  FFrameTimer.InitFPS(AFrameSpeed);
end;

function  TEntity.GetFirstFrame(): Integer;
begin
  Result := FFirstFrame;
end;

function  TEntity.GetLastFrame(): Integer;
begin
  Result := FLastFrame;
end;

procedure TEntity.SetPosAbs(const X, Y: Single);
begin
  FPos.X := X;
  FPos.Y := Y;
  FDir.X := 0;
  FDir.Y := 0;
end;

procedure TEntity.SetPosRel(const X, Y: Single);
begin
  FPos.X := FPos.X + X;
  FPos.Y := FPos.Y + Y;
  FDir.X := X;
  FDir.Y := Y;
end;

function  TEntity.GetPos(): TVector;
begin
  Result := Math.Vector(0,0);
end;

function  TEntity.GetDir(): TVector;
begin
  Result := Math.Vector(0,0);
end;

procedure TEntity.SetScaleAbs(const AScale: Single);
begin
  FScale := AScale;
  SetFrame(FFrame);
end;

procedure TEntity.SetScaleRel(const AScale: Single);
begin
  FScale := FScale + AScale;
  SetFrame(FFrame);
end;

function  TEntity.GetAngle(): Single;
begin
  Result := FAngle;
end;

function  TEntity.GetAngleOffset(): Single;
begin
  Result := FAngleOffset;
end;

procedure TEntity.SetAngleOffset(const AAngle: Single);
begin
  FAngleOffset := FAngleOffset + AAngle;
  Math.ClipValuef(FAngleOffset, 0, 360, True);
end;

procedure TEntity.RotateAbs(const AAngle: Single);
begin
  FAngle := AAngle;
  Math.ClipValuef(FAngle, 0, 360, True);
end;

procedure TEntity.RotateRel(const AAngle: Single);
begin
  FAngle := FAngle + AAngle;
  Math.ClipValuef(FAngle, 0, 360, True);
end;

function  TEntity.RotateToAngle(const AAngle, ASpeed: Single): Boolean;
var
  Step: Single;
  Len : Single;
  S   : Single;
begin
  Result := False;
  Step := Math.AngleDiff(FAngle, AAngle);
  Len  := Sqrt(Step*Step);
  if Len = 0 then
    Exit;
  S    := (Step / Len) * aSpeed;
  FAngle := FAngle + S;
  if Math.SameValuef(Step, 0, S) then
  begin
    RotateAbs(aAngle);
    Result := True;
  end;
end;

function  TEntity.RotateToPos(const X, Y, ASpeed: Single): Boolean;
var
  LAngle: Single;
  LStep: Single;
  LLen: Single;
  LS: Single;
  LTmpPos: TVector;
begin
  Result := False;
  LTmpPos.X  := X;
  LTmpPos.Y  := Y;

  LAngle := -FPos.Angle(LTmpPos);
  LStep := Math.AngleDiff(FAngle, LAngle);
  LLen  := Sqrt(LStep*LStep);
  if LLen = 0 then
    Exit;
  LS := (LStep / LLen) * aSpeed;

  if not Math.SameValuef(LStep, LS, aSpeed) then
    RotateRel(LS)
  else begin
    RotateRel(LStep);
    Result := True;
  end;
end;

function  TEntity.RotateToPosAt(const aSrcX, aSrcY, ADestX, ADestY, ASpeed: Single): Boolean;
var
  LAngle: Single;
  LStep : Single;
  LLen  : Single;
  LS    : Single;
  LSPos,LDPos : TVector;
begin
  Result := False;
  LSPos.X := aSrcX;
  LSPos.Y := aSrcY;
  LDPos.X  := aDestX;
  LDPos.Y  := aDestY;

  LAngle := LSPos.Angle(LDPos);
  LStep := Math.AngleDiff(FAngle, LAngle);
  LLen  := Sqrt(LStep*LStep);
  if LLen = 0 then
    Exit;
  LS := (LStep / LLen) * aSpeed;
  if not Math.SameValuef(LStep, LS, aSpeed) then
    RotateRel(LS)
  else begin
    RotateRel(LStep);
    Result := True;
  end;
end;

procedure TEntity.Thrust(const ASpeed: Single);
var
  LS: Single;
  LA: Integer;
begin
  LA := Abs(Round(FAngle + 90.0));
  LA := Math.ClipValue(LA, 0, 360, True);

  LS := -aSpeed;

  FDir.x := Math.AngleCos(LA) * LS;
  FDir.y := Math.AngleSin(LA) * LS;

  FPos.x := FPos.x + FDir.x;
  FPos.y := FPos.y + FDir.y;
end;

procedure TEntity.ThrustAngle(const AAngle, ASpeed: Single);
var
  LS: Single;
  LA: Integer;
begin
  LA := Abs(Round(AAngle));

  Math.ClipValue(LA, 0, 360, True);

  LS := -aSpeed;

  FDir.x := Math.AngleCos(LA) * LS;
  FDir.y := Math.AngleSin(LA) * LS;

  FPos.x := FPos.x + FDir.x;
  FPos.y := FPos.y + FDir.y;
end;

function  TEntity.ThrustToPos(const aThrustSpeed, ARotSpeed, ADestX, ADestY, ASlowdownDist, AStopDist, AStopSpeed, AStopSpeedEpsilon: Single): Boolean;
var
  LDist : Single;
  LStep : Single;
  LSpeed: Single;
  LDestPos: TVector;
  LStopDist: Single;
begin
  Result := False;

  if aSlowdownDist <= 0 then Exit;
  LStopDist := AStopDist;
  if LStopDist < 0 then LStopDist := 0;

  LDestPos.X := aDestX;
  LDestPos.Y := aDestY;
  LDist := FPos.Distance(LDestPos);

  LDist := LDist - LStopDist;

  if LDist > aSlowdownDist then
    begin
      LSpeed := aThrustSpeed;
    end
  else
    begin
      LStep := (LDist/aSlowdownDist);
      LSpeed := (aThrustSpeed * LStep);
      if LSpeed <= aStopSpeed then
      begin
        LSpeed := 0;
        Result := True;
      end;
    end;

  if RotateToPos(aDestX, aDestY, aRotSpeed) then
  begin
    Thrust(LSpeed);
  end;
end;

function  TEntity.IsVisible(const AWindow: TWindow): Boolean;
var
  LHW,LHH: Single;
  LVPX,LVPY,LVPW,LVPH: Integer;
  LX,LY: Single;
begin
  Result := False;

  LHW := FWidth / 2;
  LHH := FHeight / 2;

  AWindow.GetViewport(@LVPX, @LVPY, @LVPW, @LVPH);

  Dec(LVPW); Dec(LVPH);

  LX := FPos.X;
  LY := FPos.Y;

  if LX > (LVPW + LHW) then Exit;
  if LX < -LHW    then Exit;
  if LY > (LVPH + LHH) then Exit;
  if LY < -LHH    then Exit;

  Result := True;
end;

function  TEntity.IsFullyVisible(const AWindow: TWindow): Boolean;
var
  LHW,LHH: Single;
  LVPX,LVPY,LVPW,LVPH: Integer;
  LX,LY: Single;
begin
  Result := False;

  LHW := FWidth / 2;
  LHH := FHeight / 2;

  AWindow.GetViewport(@LVPX, @LVPY, @LVPW, @LVPH);

  Dec(LVPW); Dec(LVPH);

  LX := FPos.X;
  LY := FPos.Y;

  if LX > (LVPW - LHW) then Exit;
  if LX <  LHW       then Exit;
  if LY > (LVPH - LHH) then Exit;
  if LY <  LHH       then Exit;

  Result := True;
end;

function  TEntity.Collide(const X, Y, aRadius, aShrinkFactor: Single): Boolean;
var
  LDist: Single;
  LR1,LR2: Single;
  LV0,LV1: TVector;
begin
  LR1  := FRadius * aShrinkFactor;
  LR2  := aRadius * aShrinkFactor;

  LV0.X := FPos.X;
  LV0.Y := FPos.Y;

  LV1.x := X;
  LV1.y := Y;

  LDist := LV0.Distance(LV1);

  if (LDist < LR1) or (LDist < LR2) then
    Result := True
  else
   Result := False;
end;

function  TEntity.Collide(const AEntity: TEntity; const AOverlap: TEntity.Overlap): Boolean;
var
  LTextureA, LTextureB: TTexture;
begin
  Result := False;

  LTextureA := FSprite.GetImageTexture(FFrame, FGroup);
  LTextureB := AEntity.FSprite.GetImageTexture(AEntity.FFrame, AEntity.FGroup);

  LTextureA.SetPivot(FPivot);
  LTextureA.SetAnchor(FAnchor);
  LTextureA.SetPos(FPos.x, FPos.y);
  LTextureA.SetScale(FScale);
  LTextureA.SetAngle(FAngle);
  LTextureA.SetHFlip(FHFlip);
  LTextureA.SetVFlip(FVFlip);
  LTextureA.SetRegion(FSprite.GetImageRegion(FFrame, FGroup));

  LTextureB.SetPivot(AEntity.FPivot);
  LTextureB.SetAnchor(AEntity.FAnchor);
  LTextureB.SetPos(AEntity.FPos.x, AEntity.FPos.y);
  LTextureB.SetScale(AEntity.FScale);
  LTextureB.SetAngle(AEntity.FAngle);
  LTextureB.SetHFlip(AEntity.FHFlip);
  LTextureB.SetVFlip(AEntity.FVFlip);
  LTextureB.SetRegion(AEntity.FSprite.GetImageRegion(FFrame, FGroup));

  case AOverlap of
    eoAABB: Result := LTextureA.CollideAABB(LTextureB);
    eoOBB : Result := LTextureA.CollideOBB(LTextureB);
  end;

end;

procedure TEntity.Render();
var
  LTexture: TTexture;
begin
  LTexture := FSprite.GetImageTexture(FFrame, FGroup);
  LTexture.SetPivot(FPivot);
  LTexture.SetAnchor(FAnchor);
  LTexture.SetPos(FPos.x, FPos.y);
  LTexture.SetScale(FScale);
  LTexture.SetAngle(FAngle);
  LTexture.SetHFlip(FHFlip);
  LTexture.SetVFlip(FVFlip);
  LTexture.SetRegion(FSprite.GetImageRegion(FFrame, FGroup));
  LTexture.SetBlend(FBlend);
  LTexture.SetColor(FColor);
  LTexture.Draw();
end;

procedure TEntity.RenderAt(const X, Y: Single);
var
  LTexture: TTexture;
begin
  LTexture := FSprite.GetImageTexture(FFrame, FGroup);
  LTexture.SetPivot(FPivot);
  LTexture.SetAnchor(FAnchor);
  LTexture.SetPos(X, Y);
  LTexture.SetScale(FScale);
  LTexture.SetAngle(FAngle);
  LTexture.SetHFlip(FHFlip);
  LTexture.SetVFlip(FVFlip);
  LTexture.SetRegion(FSprite.GetImageRegion(FFrame, FGroup));
  LTexture.SetBlend(FBlend);
  LTexture.SetColor(FColor);
  LTexture.Draw();
end;

function  TEntity.GetSprite(): TSprite;
begin
  Result := FSprite;
end;

function  TEntity.GetGroup(): Integer;
begin
  Result := FGroup;
end;

function  TEntity.GetScale(): Single;
begin
  Result := FScale;
end;

function  TEntity.GetColor(): TColor;
begin
  Result := FColor;
end;

procedure TEntity.SetColor(const AColor: TColor);
begin
  FColor := AColor;
end;

function  TEntity.GetBlend(): TTextureBlend;
begin
  Result := FBlend;
end;

procedure TEntity.SetBlend(const AValue: TTextureBlend);
begin
  FBlend := AValue;
end;

function  TEntity.GetHFlip(): Boolean;
begin
  Result := FHFlip;
end;

procedure TEntity.SetHFlip(const AFlip: Boolean);
begin
  FHFlip := AFlip;
end;

function  TEntity.GetVFlip(): Boolean;
begin
  Result := FVFlip;
end;

procedure TEntity.SetVFlip(const AFlip: Boolean);
begin
  FVFlip := AFlip;
end;

function  TEntity.GetLoopFrame(): Boolean;
begin
  Result := FLoopFrame;
end;

procedure TEntity.SetLoopFrame(const aLoop: Boolean);
begin
  FLoopFrame := ALoop;
end;

function  TEntity.GetWidth(): Single;
begin
  Result := FWidth;
end;

function  TEntity.GetHeight(): Single;
begin
  Result := FHeight;
end;

function  TEntity.GetRadius(): Single;
begin
  Result := FRadius;
end;

class function TEntity.New(const ASprite: TSprite; const aGroup: Integer): TEntity;
begin
  Result := TEntity.Create();
  if not Result.Init(ASprite, AGroup) then
  begin
    Result.Free();
    Result := nil;
    Exit;
  end;
end;

{ TConfigFile }
constructor TConfigFile.Create;
begin
  inherited;
  FHandle := nil;
  FSection := TStringList.Create;
end;

destructor TConfigFile.Destroy;
begin
  Close;
  FSection.Free();
  inherited;
end;

function  TConfigFile.Open(const AFilename: string=''): Boolean;
var
  LFilename: string;
begin
  Close;
  LFilename := AFilename;
  if LFilename.IsEmpty then LFilename := TPath.ChangeExtension(ParamStr(0), 'ini');
  FHandle := TIniFile.Create(LFilename);
  Result := Boolean(FHandle <> nil);
  FFilename := LFilename;
end;

procedure TConfigFile.Close();
begin
  if not Opened then Exit;
  FHandle.UpdateFile;
  FreeAndNil(FHandle);
end;

function  TConfigFile.Opened(): Boolean;
begin
  Result := Boolean(FHandle <> nil);
end;

procedure TConfigFile.Update();
begin
  if not Opened then Exit;
  FHandle.UpdateFile;
end;

function  TConfigFile.RemoveSection(const AName: string): Boolean;
var
  LName: string;
begin
  Result := False;
  if not Opened then Exit;
  LName := AName;
  if LName.IsEmpty then Exit;
  FHandle.EraseSection(LName);
  Result := True;
end;

procedure TConfigFile.SetValue(const ASection, AKey, AValue: string);
begin
  if not Opened then Exit;
  FHandle.WriteString(ASection, AKey, AValue);
end;

procedure TConfigFile.SetValue(const ASection, AKey: string; AValue: Integer);
begin
  if not Opened then Exit;
  SetValue(ASection, AKey, AValue.ToString);
end;

procedure TConfigFile.SetValue(const ASection, AKey: string; AValue: Boolean);
begin
  if not Opened then Exit;
  SetValue(ASection, AKey, AValue.ToInteger);
end;

procedure TConfigFile.SetValue(const ASection, AKey: string; AValue: Pointer; AValueSize: Cardinal);
var
  LValue: TMemoryStream;
begin
  if not Opened then Exit;
  if AValue = nil then Exit;
  LValue := TMemoryStream.Create;
  try
    LValue.Position := 0;
    LValue.Write(AValue^, AValueSize);
    LValue.Position := 0;
    FHandle.WriteBinaryStream(ASection, AKey, LValue);
  finally
    FreeAndNil(LValue);
  end;
end;

function  TConfigFile.GetValue(const ASection, AKey, ADefaultValue: string): string;
begin
  Result := '';
  if not Opened then Exit;
  Result := FHandle.ReadString(ASection, AKey, ADefaultValue);
end;

function  TConfigFile.GetValue(const ASection, AKey: string; ADefaultValue: Integer): Integer;
var
  LResult: string;
begin
  Result := ADefaultValue;
  if not Opened then Exit;
  LResult := GetValue(ASection, AKey, ADefaultValue.ToString);
  Integer.TryParse(LResult, Result);
end;

function  TConfigFile.GetValue(const ASection, AKey: string; ADefaultValue: Boolean): Boolean;
begin
  Result := ADefaultValue;
  if not Opened then Exit;
  Result := GetValue(ASection, AKey, ADefaultValue.ToInteger).ToBoolean;
end;

procedure TConfigFile.GetValue(const ASection, AKey: string; AValue: Pointer; AValueSize: Cardinal);
var
  LValue: TMemoryStream;
  LSize: Cardinal;
begin
  if not Opened then Exit;
  if not Assigned(AValue) then Exit;
  if AValueSize = 0 then Exit;
  LValue := TMemoryStream.Create;
  try
    LValue.Position := 0;
    FHandle.ReadBinaryStream(ASection, AKey, LValue);
    LSize := AValueSize;
    if AValueSize > LValue.Size then
      LSize := LValue.Size;
    LValue.Position := 0;
    LValue.Write(AValue^, LSize);
  finally
    FreeAndNil(LValue);
  end;
end;

function  TConfigFile.RemoveKey(const ASection, AKey: string): Boolean;
var
  LSection: string;
  LKey: string;
begin
  Result := False;
  if not Opened then Exit;
  LSection := ASection;
  LKey := AKey;
  if LSection.IsEmpty then Exit;
  if LKey.IsEmpty then Exit;
  FHandle.DeleteKey(LSection, LKey);
  Result := True;
end;

function  TConfigFile.GetSectionValues(const ASection: string): Integer;
var
  LSection: string;
begin
  Result := 0;
  if not Opened then Exit;
  LSection := ASection;
  if LSection.IsEmpty then Exit;
  FSection.Clear;
  FHandle.ReadSectionValues(LSection, FSection);
  Result := FSection.Count;
end;

function  TConfigFile.GetSectionValue(const AIndex: Integer; const ADefaultValue: string): string;
begin
  Result := '';
  if not Opened then Exit;
  if (AIndex < 0) or (AIndex > FSection.Count - 1) then Exit;
  Result := FSection.ValueFromIndex[AIndex];
  if Result = '' then Result := ADefaultValue;
end;

function  TConfigFile.GetSectionValue(const AIndex, ADefaultValue: Integer): Integer;
begin
  Result := ADefaultValue;
  if not Opened then Exit;
  Result := string(GetSectionValue(AIndex, ADefaultValue.ToString)).ToInteger;
end;

function  TConfigFile.GetSectionValue(const AIndex: Integer; const ADefaultValue: Boolean): Boolean;
begin
  Result := ADefaultValue;
  if not Opened then Exit;
  Result := string(GetSectionValue(AIndex, ADefaultValue.ToString)).ToBoolean
end;


end.
