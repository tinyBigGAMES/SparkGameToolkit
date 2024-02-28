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
  System.Variants,
  System.Win.ComObj,
  System.IniFiles,
  WinApi.Windows,
  WinApi.Messages,
  WinApi.ShellAPI,
  WinApi.ActiveX,
  SGT.Deps,
  SGT.OGL;

const
  NAME          = 'Spark Game Toolkit™';
  CODENAME      = 'Ignite';
  MAJOR_VERSION = '0';
  MINOR_VERSION = '1';
  PATCH_VERSION = '0';
  VERSION       = MAJOR_VERSION+'.'+MINOR_VERSION+'.'+PATCH_VERSION;
  PROJECT       = NAME+' ('+CODENAME+') v'+MAJOR_VERSION+'.'+MINOR_VERSION+'.'+PATCH_VERSION;

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
  public
    constructor Create(); virtual;
    destructor Destroy(); override;
    procedure Run(); virtual;
  end;

  { TUtils }
  TUtils = class
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

  { TConsole }
  TConsole = class
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
    class function  GetWidth(): Integer;
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
    class procedure Pause(aColor: DWORD=TConsole.WHITE; const aMsg: string=''; const AForcePause: Boolean=False);
    class procedure ClearKeyboardBuffer();
    class function  ReadKey(): Char;
    class function  ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer): string;
    class function  WrapTextEx(const ALine: string; AMaxCol: Integer; const ABreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
    class procedure Print(const AMsg: string; const AArgs: array of const; const AColor: DWORD=TConsole.WHITE); overload;
    class procedure Print(const AMsg: string; const AColor: DWORD=TConsole.WHITE); overload;
    class procedure PrintLn(const AMsg: string; const AArgs: array of const; const AColor: DWORD=TConsole.WHITE); overload;
    class procedure PrintLn(const AMsg: string; const AColor: DWORD=TConsole.WHITE); overload;
    class procedure PrintLn(); overload;
    class procedure Print(); overload;
    class procedure Teletype(const AText: string; const AColor: DWORD; const AMargin: Integer; const AMinDelay: Integer; const AMaxDelay: Integer; const ABreakKey: Byte);
  end;

  { TDeterministicTimer }
  TDeterministicTimer = class
  protected class var
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
  protected
    class constructor Create;
    class destructor Destroy;
  public const
    DEFAULT_FPS = 60;
  public
    class procedure Init(const ATargetFrameRate: Cardinal=DEFAULT_FPS);
    class function  TargetFrameRate(): Cardinal;
    class function  TargetTime(): Double;
    class procedure Reset();
    class procedure Start();
    class procedure Stop();
    class function  FrameRate(): Cardinal;
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
  TMath = class
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

  { TAsync }
  TAsync = record
  private type
    TBusyData = record
      Name: string;
      Thread: Pointer;
      Flag: Boolean;
    end;
  private class var
    FQueue: TList<TAsyncThread>;
    FBusy: TDictionary<string, TBusyData>;
  public
    class operator Initialize(out ADest: TAsync);
    class operator Finalize(var ADest: TAsync);
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

implementation

{ TBaseObject }
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

{ TUtils }
class constructor TUtils.Create();
begin
  // turn on memory leak detection
  ReportMemoryLeaksOnShutdown := True;


  // init critical section
  FCriticalSection := TCriticalSection.Create();
end;

class destructor TUtils.Destroy();
begin
  // free critical section object
  FCriticalSection.Free();
end;

class function  TUtils.AsUTF8(const AText: string): Pointer;
begin
  Result := FMarshaller.AsUtf8(AText).ToPointer;
end;

class function  TUtils.GetTempStaticBuffer(): PByte;
begin
  Result := @FTempStaticBuffer[0];
end;

class function  TUtils.GetTempStaticBufferSize(): Integer;
begin
  Result := CTempStaticBufferSize;
end;

class function  TUtils.ResourceExist(const AInstance: HINST; const AResName: string): Boolean;
begin
  Result := Boolean((FindResource(HInstance, PChar(AResName), RT_RCDATA) <> 0));
end;

class procedure TUtils.EnterCriticalSection();
begin
  FCriticalSection.Enter;
end;

class procedure TUtils.LeaveCriticalSection();
begin
  FCriticalSection.Leave;
end;

class procedure TUtils.SetDefaultIcon(AWindow: HWND);
var
  IconHandle: HICON;
begin
  IconHandle := LoadIcon(HInstance, 'MAINICON');
  if IconHandle <> 0 then
  begin
    SendMessage(aWindow, WM_SETICON, ICON_BIG, IconHandle);
  end;
end;

class procedure TUtils.SetDefaultIcon(AWindow: PGLFWwindow);
begin
  SetDefaultIcon(glfwGetWin32Window(AWindow))
end;

class function TUtils.RemoveDuplicates(const aText: string): string;
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

class function  TUtils.HudTextItem(const AKey: string; const AValue: string; const APaddingWidth: Cardinal=20; const ASeperator: string='-'): string;
begin
  Result := Format('%s %s %s', [aKey.PadRight(APaddingWidth), aSeperator, aValue]);
end;

class procedure TUtils.GotoURL(const AURL: string);
begin
  if AURL.IsEmpty then Exit;
  ShellExecute(0, 'OPEN', PChar(AURL), '', '', SW_SHOWNORMAL);
end;

class function  TUtils.GetComputerName(): string;
var
  LLength: dword;
begin
  LLength := 253;
  SetLength(Result, LLength+1);
  if not WinApi.Windows.GetComputerName(PChar(Result), LLength) then Result := 'Not detected!';
  Result := PChar(result);
end;

class function  TUtils.GetLoggedUserName(): string;
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

class function  TUtils.GetOSVersion(): string;
begin
  Result := TOSVersion.ToString;
end;

class function  TUtils.GetNow(): string;
begin
  Result := DateTimeToStr(Now());
end;

class procedure TUtils.GetDiskFreeSpace(const APath: string; var AFreeSpace: Int64; var ATotalSpace: Int64);
begin
  GetDiskFreeSpaceEx(PChar(aPath), aFreeSpace, aTotalSpace, nil);
end;

class procedure TUtils.GetMemoryFree(var AAvailMem: UInt64; var ATotalMem: UInt64);
var
  LMemStatus: MemoryStatusEx;
begin
 FillChar (LMemStatus, SizeOf(MemoryStatusEx), #0);
 LMemStatus.dwLength := SizeOf(MemoryStatusEx);
 GlobalMemoryStatusEx (LMemStatus);
 aAvailMem := LMemStatus.ullAvailPhys;
 aTotalMem := LMemStatus.ullTotalPhys;
end;

class function  TUtils.GetVideoCardName(): string;
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

class function  TUtils.GetAppName(): string;
begin
  Result := Format('%s %s',[TPath.GetFileNameWithoutExtension(ParamStr(0)),GetAppVersionFullStr]);
end;

class function  TUtils.GetAppPath(): string;
begin
  Result := ExtractFilePath(ParamStr(0));
end;

class function  TUtils.GetCPUCount(): Integer;
begin
  Result := CPUCount;
end;

class function  TUtils.GetAppVersionStr(): string;
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

class function  TUtils.GetAppVersionFullStr(): string;
begin
  GetModuleVersionFullStr(ParamStr(0));
end;

class function  TUtils.GetModuleVersionFullStr(): string;
begin
  Result := GetModuleVersionFullStr(GetModuleName(HInstance));
end;

class function  TUtils.GetModuleVersionFullStr(AFilename: string): string;
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

class function  TUtils.HttpGet(const aURL: string; const aStatus: PString=nil): string;
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

class function  TUtils.RemoveQuotes(const AText: string): string;
var
  S: string;
begin
  S := AnsiDequotedStr(aText, '"');
  Result := AnsiDequotedStr(S, '''');
end;

{ TConsole }
class constructor TConsole.Create();
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

class destructor TConsole.Destroy();
begin
  // restore code page
  SetConsoleCP(FInputCodePage);
  SetConsoleOutputCP(FOutputCodePage);
end;

class procedure TConsole.Clear();
begin
  // Clear the console screen
  Win32Check(ClearScreen(GetStdHandle(STD_OUTPUT_HANDLE)));
end;

class function  TConsole.ClearScreen(const AConsole: THandle): Boolean;
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

class procedure TConsole.SetTextColor(AColor: Word);
var
  LConsoleHandle: THandle;
begin
  LConsoleHandle := GetStdHandle(STD_OUTPUT_HANDLE);
  SetConsoleTextAttribute(LConsoleHandle, AColor);
end;

class procedure TConsole.ClearLine(AColor: Word);
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

class procedure TConsole.ClearLineFromCursor(AColor: Word);
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

class function  TConsole.GetWidth(): Integer;
var
  LConsoleInfo: TConsoleScreenBufferInfo;
begin
  GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), LConsoleInfo);
  Result := LConsoleInfo.dwSize.X;
end;

class procedure TConsole.SetTitle(const ATitle: string);
begin
  WinApi.Windows.SetConsoleTitle(PChar(ATitle));
end;

class function  TConsole.HasOutput(): Boolean;
var
  LStdOut: THandle;
  LMode: DWORD;
begin
  LStdOut := GetStdHandle(STD_OUTPUT_HANDLE);
  Result := (LStdOut <> INVALID_HANDLE_VALUE) and GetConsoleMode(LStdOut, LMode);
end;

class function  TConsole.WasRunFrom(): Boolean;
var
  LStartInfo: TStartupInfo;
begin
  LStartInfo.cb := SizeOf(TStartupInfo);
  GetStartupInfo(LStartInfo);
  Result := ((LStartInfo.dwFlags and STARTF_USESHOWWINDOW) = 0);
end;

class function  TConsole.IsStartedFromDelphiIDE(): Boolean;
begin
  Result := (GetEnvironmentVariable('BDS') <> '');
end;

class procedure TConsole.WaitForAnyKey();
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

class function  TConsole.AnyKeyPressed(): Boolean;
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

class procedure TConsole.ClearKeyStates();
begin
  FillChar(FKeyState, SizeOf(FKeyState), 0);
  ClearKeyboardBuffer;
end;

class function  TConsole.IsKeyPressed(AKey: Byte): Boolean;
begin
  Result := (GetAsyncKeyState(AKey) and $8000) <> 0;
end;

class function  TConsole.WasKeyReleased(AKey: Byte): Boolean;
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

class function  TConsole.WasKeyPressed(AKey: Byte): Boolean;
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

class procedure TConsole.Pause(aColor: DWORD; const aMsg: string; const AForcePause: Boolean);
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

class procedure TConsole.ClearKeyboardBuffer();
var
  LInputRecord: TInputRecord;
  LEventsRead: DWORD;
begin
  while PeekConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead) and (LEventsRead > 0) do
  begin
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead);
  end;
end;

class function  TConsole.ReadKey(): Char;
var
  LInputRecord: TInputRecord;
  LEventsRead: DWORD;
begin
  repeat
    ReadConsoleInput(GetStdHandle(STD_INPUT_HANDLE), LInputRecord, 1, LEventsRead);
  until (LInputRecord.EventType = KEY_EVENT) and LInputRecord.Event.KeyEvent.bKeyDown;
  Result := LInputRecord.Event.KeyEvent.UnicodeChar;
end;

class function  TConsole.ReadLnX(const AAllowedChars: TSysCharSet; AMaxLength: Integer): string;
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

class function  TConsole.WrapTextEx(const ALine: string; AMaxCol: Integer; const ABreakChars: TSysCharSet=[' ', '-', ',', ':', #9]): string;
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

class procedure TConsole.Print(const AMsg: string; const AArgs: array of const; const AColor: DWORD);
begin
  if not HasOutput then Exit;
  SetTextColor(Ord(AColor));
  Write(Format(AMsg, AArgs));
  SetTextColor(WHITE);
end;

class procedure TConsole.Print(const AMsg: string; const AColor: DWORD);
begin
  Print(AMsg, [], AColor);
end;

class procedure TConsole.PrintLn(const AMsg: string; const AArgs: array of const; const AColor: DWORD);
begin
  if not HasOutput then Exit;
  SetTextColor(Ord(AColor));
  WriteLn(Format(AMsg, AArgs));
  SetTextColor(WHITE);
end;

class procedure TConsole.PrintLn(const AMsg: string; const AColor: DWORD);
begin
  PrintLn(AMsg, [], AColor);
end;

class procedure TConsole.PrintLn();
begin
  PrintLn('');
end;

class procedure TConsole.Print();
begin
  Print('');
end;

class procedure TConsole.Teletype(const AText: string; const AColor: DWORD; const AMargin: Integer; const AMinDelay: Integer; const AMaxDelay: Integer; const ABreakKey: Byte);
const
  {$J+}
  LDelay: Integer = 0;
  {$J-}
var
  LText: string;
  LMaxCol: Integer;
  LChar: Char;
begin
  LMaxCol := GetWidth - AMargin;

  LText := WrapTextEx(AText, LMaxCol);

  for LChar in LText do
  begin
    Print(LChar, [], AColor);
    if not TMath.RandomBool then
      LDelay := RandomRange(AMinDelay, AMaxDelay);
    Sleep(LDelay);
    if IsKeyPressed(ABreakKey) then
    begin
      ClearKeyboardBuffer;
      Break;
    end;
  end;
end;

class constructor TDeterministicTimer.Create();
begin
end;

class destructor TDeterministicTimer.Destroy();
begin
end;

class  procedure TDeterministicTimer.Init(const ATargetFrameRate: Cardinal);
begin
  FLastTime := glfwGetTime();
  FLastFPSTime := FLastTime;
  FTargetFrameRate := ATargetFrameRate;
  FTargetTime := 1.0 / FTargetFrameRate;
  FFrameCount := 0;
  FFramerate :=0;
  FEndtime := 0;
end;

class function  TDeterministicTimer.TargetFrameRate(): Cardinal;
begin
  Result := FTargetFrameRate;
end;

class function  TDeterministicTimer.TargetTime(): Double;
begin
  Result := FTargetTime;
end;

class procedure TDeterministicTimer.Reset();
begin
  FLastTime := glfwGetTime();
  FLastFPSTime := FLastTime;
  FTargetTime := 1.0 / FTargetFrameRate;
  FFrameCount := 0;
  FFramerate :=0;
  FEndtime := 0;
end;

class procedure TDeterministicTimer.Start();
begin
  FCurrentTime := glfwGetTime();
  FElapsedTime := FCurrentTime - FLastTime;
end;

class procedure TDeterministicTimer.Stop();
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

class function  TDeterministicTimer.FrameRate(): Cardinal;
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

  Result := ArcTan(LXOY) * TMath.RADTODEG;
  if LR.Y < 0 then
    Result := Result + 180.0;
end;

procedure TVector.Thrust(AAngle: Single; aSpeed: Single);
var
  LA: Single;
begin
  LA := AAngle + 90.0;
  TMath.ClipValuef(LA, 0, 360, True);

  X := X + TMath.AngleCos(Round(LA)) * -(aSpeed);
  Y := Y + TMath.AngleSin(Round(LA)) * -(aSpeed);
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
class constructor TMath.Create();
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

class destructor TMath.Destroy();
begin
end;

class function  TMath.Point(const X, Y: Single): TPoint;
begin
  Result.X := X;
  Result.Y := Y;
end;

class function  TMath.Vector(const X, Y: Single): TVector;
begin
  Result.X := X;
  Result.Y := Y;
end;

class function  TMath.Size(const AWidth, AHeight: Single): TSize;
begin
  Result.Width := AWidth;
  Result.Height := AHeight;
end;

class function  TMath.Rect(const X, Y, AWidth, AHeight: Single): TRect;
begin
  Result.X := X;
  Result.Y := Y;
  Result.Width := AWidth;
  Result.Height := AHeight;
end;

class function  TMath.Extent(const AMinX, AMinY, AMaxX, AMaxY: Single): TExtent;
begin
  Result.MinX := AMinX;
  Result.MinY := AMinY;
  Result.MaxX := AMaxX;
  Result.MaxY := AMaxY;
end;

class function  TMath.AngleCos(const AAngle: Cardinal): Single;
var
  LAngle: Cardinal;
begin
  LAngle := EnsureRange(AAngle, 0, 360);
  Result := FCosTable[LAngle];
end;

class function  TMath.AngleSin(const AAngle: Cardinal): Single;
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

class function  TMath.RandomRange(const AMin, AMax: Integer): Integer;
begin
  Result := _RandomRange(AMin, AMax + 1);
end;

class function  TMath.RandomRangef(const AMin, AMax: Single): Single;
var
  LNum: Single;
begin
  LNum := _RandomRange(0, MaxInt) / MaxInt;
  Result := AMin + (LNum * (AMax - AMin));
end;

class function  TMath.RandomBool(): Boolean;
begin
  Result := Boolean(_RandomRange(0, 2) = 1);
end;

class function  TMath.GetRandomSeed(): Integer;
begin
  Result := System.RandSeed;
end;

class procedure TMath.SetRandomSeed(const AVaLue: Integer);
begin
  System.RandSeed := AVaLue;
end;

class function  TMath.ClipVaLuef(var AVaLue: Single; const AMin, AMax: Single; const AWrap: Boolean): Single;
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

class function  TMath.ClipVaLue(var AVaLue: Integer; const aMin, AMax: Integer; const AWrap: Boolean): Integer;
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

class function  TMath.SameSign(const AVaLue1, AVaLue2: Integer): Boolean;
begin
  if Sign(AVaLue1) = Sign(AVaLue2) then
    Result := True
  else
    Result := False;
end;

class function  TMath.SameSignf(const AVaLue1, AVaLue2: Single): Boolean;
begin
  if System.Math.Sign(AVaLue1) = System.Math.Sign(AVaLue2) then
    Result := True
  else
    Result := False;
end;

class function  TMath.SameValue(const AA, AB: Double; const AEpsilon: Double = 0): Boolean;
begin
  Result := System.Math.SameVaLue(AA, AB, AEpsilon);
end;

class function  TMath.SameVaLuef(const AA, AB: Single; const AEpsilon: Single = 0): Boolean;
begin
  Result := System.Math.SameVaLue(AA, AB, AEpsilon);
end;

class function  TMath.AngleDiff(const ASrcAngle, ADestAngle: Single): Single;
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

class procedure TMath.AngleRotatePos(const AAngle: Single; var AX, AY: Single);
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

class procedure TMath.SmoothMove(var AVaLue: Single; const AAmount, AMax, ADrag: Single);
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

class function  TMath.Lerp(const AFrom, ATo, ATime: Double): Double;
begin
  if ATime <= 0.5 then
    Result := AFrom + (ATo - AFrom) * ATime
  else
    Result := ATo - (ATo - AFrom) * (1.0 - ATime);
end;

class function  TMath.PointInRectangle(APoint: TVector; ARect: TRect): Boolean;
begin
  if ((APoint.x >= ARect.x) and (APoint.x <= (ARect.x + ARect.width)) and
    (APoint.y >= ARect.y) and (APoint.y <= (ARect.y + ARect.height))) then
    Result := True
  else
    Result := False;
end;

class function  TMath.PointInCircle(APoint, ACenter: TVector; ARadius: Single): Boolean;
begin
  Result := CirclesOverlap(APoint, 0, ACenter, ARadius);
end;

class function  TMath.PointInTriangle(APoint, AP1, AP2, AP3: TVector): Boolean;
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

class function  TMath.CirclesOverlap(ACenter1: TVector; ARadius1: Single; ACenter2: TVector; ARadius2: Single): Boolean;
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

class function  TMath.CircleInRectangle(ACenter: TVector; ARadius: Single; ARect: TRect): Boolean;
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

class function  TMath.RectanglesOverlap(ARect1: TRect; ARect2: TRect): Boolean;
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

class function  TMath.RectangleIntersection(ARect1, ARect2: TRect): TRect;
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

class function  TMath.LineIntersection(AX1, AY1, AX2, AY2, AX3, AY3, AX4, AY4: Integer; var AX: Integer; var AY: Integer): TLineIntersection;
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

class function  TMath.RadiusOverlap(ARadius1, AX1, AY1, ARadius2, AX2, AY2, AShrinkFactor: Single): Boolean;
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

class function  TMath.EaseValue(ACurrentTime: Double; AStartValue: Double; AChangeInValue: Double; ADuration: Double; AEaseType: TEaseType): Double;
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

class function  TMath.EasePosition(AStartPos: Double; AEndPos: Double; ACurrentPos: Double; AEaseType: TEaseType): Double;
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

class function  TMath.OBBIntersect(const AObbA, AObbB: TlgOBB): Boolean;
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
    s := TMath.AngleSin(LAngle);
    c := TMath.AngleCos(LAngle);
    Result.x := V.x * c - V.y * s;
    Result.y := V.x * s + V.y * c;
  end;

  function Project(const AObb: TlgOBB; const AAxis: TPoint): TPoint;
  var
    LCorners: array[0..3] of TPoint;
    I: Integer;
    LDot: Single;
  begin
    LCorners[0] := Rotate(TMath.Point(AObb.Extents.x, AObb.Extents.y), AObb.Rotation);
    LCorners[1] := Rotate(TMath.Point(-AObb.Extents.x, AObb.Extents.y), AObb.Rotation);
    LCorners[2] := Rotate(TMath.Point(AObb.Extents.x, -AObb.Extents.y), AObb.Rotation);
    LCorners[3] := Rotate(TMath.Point(-AObb.Extents.x, -AObb.Extents.y), AObb.Rotation);

    Result.x := Dot(AAxis, TMath.Point(AObb.Center.x + LCorners[0].x, AObb.Center.y + LCorners[0].y));
    Result.y := Result.x;

    for I := 1 to 3 do
    begin
      LDot := Dot(AAxis, TMath.Point(AObb.Center.x + LCorners[I].x, AObb.Center.y + LCorners[I].y));
      if LDot < Result.x then Result.x := LDot;
      if LDot > Result.y then Result.y := LDot;
    end;
  end;


begin
  LAxes[0] := Rotate(TMath.Point(1, 0), AObbA.Rotation);
  LAxes[1] := Rotate(TMath.Point(0, 1), AObbA.Rotation);
  LAxes[2] := Rotate(TMath.Point(1, 0), AObbB.Rotation);
  LAxes[3] := Rotate(TMath.Point(0, 1), AObbB.Rotation);

  for I := 0 to 3 do
  begin
    LProjA := Project(AObbA, LAxes[I]);
    LProjB := Project(AObbB, LAxes[I]);
    if (LProjA.y < LProjB.x) or (LProjB.y < LProjA.x) then Exit(False);
  end;

  Result := True;
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

{ --- TlgAsync -------------------------------------------------------------- }
class operator TAsync.Initialize(out ADest: TAsync);
begin
  ADest.FQueue := TList<TAsyncThread>.Create;
  ADest.FBusy := TDictionary<string, TBusyData>.Create;
end;

class operator TAsync.Finalize(var ADest: TAsync);
begin
  FreeAndNil(ADest.FBusy);
  FreeAndNil(ADest.FQueue);
end;

class procedure TAsync.Clear();
begin
  FBusy.Clear();
  FQueue.Clear();
end;

class procedure TAsync.Process();
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

class procedure TAsync.Run(const AName: string; const ABackgroundTask: TAsyncProc; const AWaitForgroundTask: TAsyncProc);
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

class function  TAsync.Busy(const AName: string): Boolean;
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

class procedure TAsync.Suspend();
var
  LAsyncThread: TAsyncThread;
begin
  for LAsyncThread in FQueue do
  begin
    if not LAsyncThread.Suspended then
      LAsyncThread.Suspend;
  end;
end;

class procedure TAsync.Resume();
var
  LAsyncThread: TAsyncThread;
begin
  for LAsyncThread in FQueue do
  begin
    if LAsyncThread.Suspended then
      LAsyncThread.Resume;
  end;
end;

class procedure TAsync.Enter();
begin
  TUtils.EnterCriticalSection();
end;

class procedure TAsync.Leave();
begin
  TUtils.LeaveCriticalSection();
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
  TUtils.EnterCriticalSection();
  try
    for i := 0 to ACount - 1 do
    begin
      WritePos := (FWriteIndex + i) mod FCapacity;
      FBuffer[WritePos] := AData[i];
    end;
    FWriteIndex := (FWriteIndex + ACount) mod FCapacity;
    Result := ACount;
  finally
    TUtils.LeaveCriticalSection();
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

  TUtils.EnterCriticalSection();
  try
    for I := Low(FBuffer) to High(FBuffer) do
    begin
     FBuffer[i] := Default(T);
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    TUtils.LeaveCriticalSection();
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
  TUtils.EnterCriticalSection();
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
    TUtils.LeaveCriticalSection();
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

  TUtils.EnterCriticalSection();
  try
    for I := 0 to FCapacity-1 do
    begin
     SetArrayValue(I, Default(T));
    end;

    FReadIndex := 0;
    FWriteIndex := 0;
  finally
    TUtils.LeaveCriticalSection();
  end;
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

end.
