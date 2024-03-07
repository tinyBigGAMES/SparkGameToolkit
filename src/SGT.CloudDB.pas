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

unit SGT.CloudDB;

{$I SGT.Defines.inc}

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.Classes,
  System.Math,
  System.Net.HttpClient,
  System.JSON,
  SGT.Core;

type

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

implementation

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


end.
