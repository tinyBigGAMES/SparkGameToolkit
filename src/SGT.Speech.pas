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

unit SGT.Speech;

{$I SGT.Defines.inc}

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  System.Math,
  SGT.SpeechLib,
  SGT.Core;

type

  { Speech }
  Speech = class
  public type
    VoiceAttributeEvent = (vaDescription, vaName, vaVendor, vaAge, vaGender, vaLanguage, vaId);
    WordEvent = procedure(const ASender: Pointer; const AWord: string; const AText: string);
  protected type
    TOnWordEvent = record
      Sender: Pointer;
      Handler: WordEvent;
    end;
  protected class var
    FSpVoice: TSpVoice;
    FVoiceList: TInterfaceList;
    FVoiceDescList: TStringList;
    FPaused: Boolean;
    FText: string;
    FWord: string;
    FVoice: Integer;
    FSubList: TDictionary<string, string>;
    FOnWord: TOnWordEvent;
    FVolume: Single;
    class procedure DoOnWord(ASender: TObject; AStreamNumber: Integer; AStreamPosition: OleVariant; ACharacterPosition, ALength: Integer);
    class procedure DoSpeak(AText: string; AFlags: Integer);
    class procedure EnumVoices();
    class procedure FreeVoices();
  public
    class constructor Create();
    class destructor Destroy();
  public
    class procedure SetOnWordEvent(const ASender: Pointer; const AHandler: Speech.WordEvent);
    class function  GetOnWordEvent(): Speech.WordEvent;
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

implementation

{  Speech }
class procedure Speech.DoOnWord(ASender: TObject; AStreamNumber: Integer; AStreamPosition: OleVariant; ACharacterPosition, ALength: Integer);
var
  LWord: string;
begin
  if FText.IsEmpty then Exit;
  LWord := FText.Substring(ACharacterPosition, ALength);
  if not FSubList.TryGetValue(LWord, FWord) then
    FWord := LWord;
  if Assigned(FOnWord.Handler) then
  begin
    FOnWord.Handler(FOnWord.Sender, FWord, FText);
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

class procedure Speech.SetOnWordEvent(const ASender: Pointer; const AHandler: Speech.WordEvent);
begin
  FOnWord.Sender := ASender;
  FOnWord.Handler := AHandler;
end;

class function  Speech.GetOnWordEvent(): Speech.WordEvent;
begin
  Result := FOnWord.Handler;
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



end.
