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

unit SGT.ClaudeAI;

{$I SGT.Defines.inc}

interface

uses
  System.Generics.Collections,
  System.SysUtils,
  System.IOUtils,
  System.Classes,
  System.NetEncoding,
  System.JSON,
  System.Net.HttpClient,
  WinApi.Windows,
  SGT.Core,
  SGT.Speech;

type

  { TClaudeAI }
  TClaudeAI = class(TBaseObject)
  public const
    ENVVAR_APIKEY    = 'CLAUDE_API_KEY';
    USE_DOTENV_FILE = '';

    TEMPERATURE_PERCISE  = 0.0; // precise
    TEMPERATURE_BALANCED = 0.5; // balanced
    TEMPERATURE_CREATIVE = 1.0; // creative
  public type
    Image = (JPG, PNG, GIF, WEBP);
    Modal = (Haiku, Sonnet, Opus);
  protected type
    TRole = (roUser, roAssistant);
    TContent = (coText, coImage);
  protected type
    TMessage = record
      Role: TRole;
      Content: TContent;
      Data: string;
      DataType: string;
    end;
    TMessages = TList<TMessage>;
  protected
    FSystemMessages: TStringList;
    FStopSequences: TStringList;
    FMessages: TMessages;
    FInputTokens: NativeInt;
    FOutputTokens: NativeInt;
    FModal: TClaudeAI.Modal;
    FApiKey: string;
    FTemperature: Single;
    FMaxTokens: NativeInt;
    function GetModalNameStr(): string;
    function ProcessMessages(): TJsonArray;
    function ProcessStopSequences(): TJsonArray;
    function  DoQuery(var AResponse: string; var AIsFunctionCall: Boolean): Boolean;
  public
    constructor Create(); override;
    destructor Destroy(); override;

    function  GetInputTokens(): NativeInt;
    function  GetOutputTokens(): NativeInt;

    procedure SetModal(const AModal: TClaudeAI.Modal=Haiku);
    function  GetModal(): TClaudeAI.Modal;

    procedure SetApiKey(const AApiKey: string=TClaudeAI.USE_DOTENV_FILE);
    function  GetApiKey(): string;

    procedure SetTemperature(const ATemperature: Single=TClaudeAI.TEMPERATURE_BALANCED);
    function  GetTemperature(): Single;

    procedure SetMaxTokens(const AMaxTokens: NativeInt=1024);
    function  GetMaxTokens(): NativeInt;

    function  ClearSystemMessages(): Boolean;
    function  GetSystemMessageCount(): NativeInt;
    function  AddSystemMessage(const AMessage: string): Boolean;
    function  DeleteSystemMessage(const AIndex: NativeInt): Boolean;
    function  SaveSystemMessages(const AFilename: string): Boolean;
    function  LoadSystemMessages(const AIO: TIO): Boolean;
    function  LoadSystemMessagesFromFile(const AFilename: string): Boolean;
    function  LoadSystemMessagesFromZipFile(const AZipFile: TZipFile; const AFilename: string): Boolean;

    function  ClearStopSequences(): Boolean;
    function  GetStopSequenceCount(): NativeInt;
    function  AddStopSequence(const AStopSequence: string): Boolean;
    function  DeleteStopSequence(const AIndex: NativeInt): Boolean;

    function  ClearMessages(): Boolean;
    function  AddImageMessage(const AImage: TClaudeAI.Image; const AIO: TIO): Boolean;
    function  AddImageMessageFromFile(const AImage: TClaudeAI.Image; const AFilename: string): Boolean;
    function  AddImageMessageFromZipFile(const AImage: TClaudeAI.Image; const AZipFile: TZipFile; const AFilename: string): Boolean;
    function  AddTextMessage(const AText: string): Boolean;
    function  AddAssistantMessage(const AText: string): Boolean;
    function  DeleteMessage(const AIndex: NativeInt): Boolean;
    function  GetMessageCount(): NativeInt;
    function  LoadMessages(const AStream: TStream): Boolean;
    function  SaveMessages(const AStream: TStream): Boolean;

    function  Query(var AResponse: string): Boolean;

    procedure SimpleChat();
  end;

implementation

{ TAIEngine }
function TClaudeAI.GetModalNameStr(): string;
begin
  case FModal of
    Haiku : Result := 'claude-3-haiku-20240307';
    Sonnet: Result := 'claude-3-sonnet-20240229';
    Opus  : Result := 'claude-3-opus-20240229';
  else
    Result := '';
  end;
end;

function  TClaudeAI.ProcessMessages(): TJsonArray;
var
  I, LCount: Integer;
  LObject: TJsonObject;

  function AddUserMsgs(): TJsonArray;
  var
    LObject: TJsonObject;
    LSource: TJsonObject;
  begin
    Result := TJsonArray.Create();

    while true do
    begin
      if  (I >= LCount) or (FMessages[I].Role <> roUser) then
        break;

      case FMessages[I].Content of
        coText:
          begin
            LObject := TJsonObject.Create();
            LObject.AddPair('type', 'text');
            LObject.AddPair('text', FMessages[I].Data);
            Result.Add(LObject);
            Inc(I);
          end;
        coImage:
          begin
            LSource := TJsonObject.Create();
            LSource.AddPair('type', 'base64');
            LSource.AddPair('media_type', FMessages[I].DataType);
            LSource.AddPair('data', FMessages[I].Data);

            LObject := TJsonObject.Create();
            LObject.AddPair('type', 'image');
            LObject.AddPair('source', LSource);
            Result.Add(LObject);
            Inc(I);
          end;
      end;
    end;
  end;

begin
  Result := nil;
  if not Assigned(FMessages) then Exit;
  if GetMessageCount() < 1 then Exit;
  LCount := GetMessageCount();

  Result := TJsonArray.Create();

  I := 0;
  while I < LCount do
  begin

    case FMessages[I].Role of
      roUser:
      begin
        LObject := TJsonObject.Create();
        LObject.AddPair('role', 'user');
        LObject.AddPair('content', AddUserMsgs());
        Result.Add(LObject);
      end;

      roAssistant:
      begin
        LObject := TJsonObject.Create();
        LObject.AddPair('role', 'assistant');
        LObject.AddPair('content', FMessages[I].Data);
        Result.Add(LObject);
        Inc(I);
      end;
    end;

  end;
end;

function TClaudeAI.ProcessStopSequences(): TJsonArray;
var
  LItem: string;
begin
  Result := TJsonArray.Create();

  for LItem in FStopSequences do
  begin
    Result.Add(LItem);
  end;

end;

constructor TClaudeAI.Create();
begin
  inherited;
  FMessages := TMessages.Create();
  FSystemMessages := TStringList.Create();
  FStopSequences := TStringList.Create();
  FApiKey := TClaudeAI.USE_DOTENV_FILE;
  FModal := Haiku;
  FTemperature := TEMPERATURE_BALANCED;
  FMaxTokens := 1024;
  ClearMessages();
  AddStopSequence('</function_calls>');
  Utils.LoadEnvVariablesFromfile(TPath.Combine(Utils.GetAppPath(), '.env'));
end;

destructor TClaudeAI.Destroy();
begin
  ClearStopSequences();
  ClearMessages();
  ClearSystemMessages();
  FStopSequences.Free();
  FSystemMessages.Free();
  FMessages.Free();
  inherited;
end;

function  TClaudeAI.GetInputTokens(): NativeInt;
begin
  Result := FInputTokens;
end;

function  TClaudeAI.GetOutputTokens(): NativeInt;
begin
  Result := FOutputTokens;
end;

procedure TClaudeAI.SetModal(const AModal: TClaudeAI.Modal);
begin
  FModal := AModal;
end;

function  TClaudeAI.GetModal(): TClaudeAI.Modal;
begin
  Result := FModal;
end;

procedure TClaudeAI.SetApiKey(const AApiKey: string);
begin
  FApiKey := AApiKey;
end;

function  TClaudeAI.GetApiKey(): string;
begin
  if FApiKey.IsEmpty then
    begin
      Result := Utils.GetEnvVarValue(ENVVAR_APIKEY)
    end
  else
    Result := FApiKey;
end;

procedure  TClaudeAI.SetTemperature(const ATemperature: Single);
begin
  FTemperature := ATemperature;
end;

function   TClaudeAI.GetTemperature(): Single;
begin
  Result := FTemperature;
end;

procedure TClaudeAI.SetMaxTokens(const AMaxTokens: NativeInt);
begin
  FMaxTokens := AMaxTokens;
end;

function  TClaudeAI.GetMaxTokens(): NativeInt;
begin
  Result := FMaxTokens;
end;

function  TClaudeAI.ClearSystemMessages(): Boolean;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  FSystemMessages.Clear();
  Result := True;
end;

function  TClaudeAI.GetSystemMessageCount(): NativeInt;
begin
  Result := 0;
  if not Assigned(FSystemMessages) then Exit;

  Result := FSystemMessages.Count;
end;

function  TClaudeAI.AddSystemMessage(const AMessage: string): Boolean;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  FSystemMessages.Add(AMessage);
  Result := True;
end;

function  TClaudeAI.DeleteSystemMessage(const AIndex: NativeInt): Boolean;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  FSystemMessages.Delete(AIndex);
  Result := True;
end;

function  TClaudeAI.SaveSystemMessages(const AFilename: string): Boolean;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  FSystemMessages.SaveToFile(AFilename, TEncoding.UTF8);
  Result := TFile.Exists(AFilename);
end;

function  TClaudeAI.LoadSystemMessages(const AIO: TIO): Boolean;
var
  LStream: TStringStream;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  if not Assigned(AIO) then Exit;
  if AIO.Size < 1 then Exit;

  LStream := TStringStream.Create();
  try
    LStream.SetSize(AIO.Size);
    AIO.Read(LStream.Memory, AIO.Size);
    LStream.Position := 0;
    FSystemMessages.LoadFromStream(LStream, TEncoding.UTF8);
    Result := not FSystemMessages.Text.IsEmpty;
  finally
    LStream.Free();
  end;
end;

function  TClaudeAI.LoadSystemMessagesFromFile(const AFilename: string): Boolean;
var
  LIO: TFileIO;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  if not TFile.Exists(AFilename) then Exit;

  LIO := TFileIO.Open(AFilename, iomRead);
  if not Assigned(LIO) then Exit;
  try
    Result := LoadSystemMessages(LIO);
  finally
    LIO.Free();
  end;
end;

function  TClaudeAI.LoadSystemMessagesFromZipFile(const AZipFile: TZipFile; const AFilename: string): Boolean;
var
  LIO: TIO;
begin
  Result := False;
  if not Assigned(FSystemMessages) then Exit;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen then Exit;

  LIO := AZipFile.OpenFile(AFilename);
  if not Assigned(LIO) then Exit;
  try
    Result := LoadSystemMessages(LIO);
  finally
    LIO.Free();
  end;

end;

function  TClaudeAI.ClearStopSequences(): Boolean;
begin
  Result := False;
  if not Assigned(FStopSequences) then Exit;
  FStopSequences.Clear();
  Result := True;
end;

function  TClaudeAI.GetStopSequenceCount(): NativeInt;
begin
  Result := 0;
  if not Assigned(FStopSequences) then Exit;
  Result := FStopSequences.Count;
end;

function  TClaudeAI.AddStopSequence(const AStopSequence: string): Boolean;
begin
  Result := False;
  if not Assigned(FStopSequences) then Exit;
  FStopSequences.Add(AStopSequence);
  Result := True;
end;

function  TClaudeAI.DeleteStopSequence(const AIndex: NativeInt): Boolean;
begin
  Result := False;
  if not Assigned(FStopSequences) then Exit;
  FStopSequences.Delete(AIndex);
  Result := True;
end;

function  TClaudeAI.ClearMessages(): Boolean;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
  FMessages.Clear();
  FInputTokens := 0;
  FOutputTokens := 0;
  Result := True;
end;

function  TClaudeAI.AddImageMessage(const AImage: TClaudeAI.Image; const AIO: TIO): Boolean;
var
  LStream: TBytesStream;
  LMessage: TMessage;
  LImage: string;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
  if not Assigned(AIO) then Exit;
  if AIO.Size < 1 then Exit;

  LStream := TBytesStream.Create();
  try
    LStream.SetSize(AIO.Size);
    AIO.Read(LStream.Memory, AIO.Size);
    LImage := TNetEncoding.Base64String.EncodeBytesToString(LStream.Memory, LStream.Size);
    if LImage.IsEmpty then Exit;
    LMessage.Role := roUser;
    LMessage.Content := coImage;
    LMessage.Data := LImage;
    case AImage of
      JPG: LMessage.DataType := 'image/jpeg';
      PNG: LMessage.DataType := 'image/png';
      GIF: LMessage.DataType := 'image/gif';
      WEBP: LMessage.DataType := 'image/webp';
    end;
    FMessages.Add(LMessage);
    Result := True;
  finally
    LStream.Free();
  end;
end;

function  TClaudeAI.AddImageMessageFromFile(const AImage: TClaudeAI.Image; const AFilename: string): Boolean;
var
  LIO: TFileIO;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;

  LIO := TFileIO.Open(AFilename, iomRead);
  try
    Result := AddImageMessage(AImage, LIO);
  finally
    LIO.Free();
  end;
end;

function  TClaudeAI.AddImageMessageFromZipFile(const AImage: TClaudeAI.Image; const AZipFile: TZipFile; const AFilename: string): Boolean;
var
  LIO: TIO;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
  if not Assigned(AZipFile) then Exit;
  if not AZipFile.IsOpen then Exit;

  LIO := AZipFile.OpenFile(AFilename);
  if not Assigned(LIO) then Exit;
  try
    Result := AddImageMessage(AIMage, LIO);
  finally
    LIO.Free();
  end;
end;

function  TClaudeAI.AddTextMessage(const AText: string): Boolean;
var
  LMessage: TMessage;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
  LMessage.Role := roUser;
  LMessage.Content := coText;
  LMessage.Data := AText;
  LMessage.DataType := '';
  FMessages.Add(LMessage);
  Result := True;
end;

function  TClaudeAI.AddAssistantMessage(const AText: string): Boolean;
var
  LMessage: TMessage;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
  LMessage.Role := roAssistant;
  LMessage.Content := coText;
  LMessage.Data := AText;
  FMessages.Add(LMessage);
  Result := True;
end;

function  TClaudeAI.DeleteMessage(const AIndex: NativeInt): Boolean;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
  FMessages.Delete(AIndex);
  Result := True;
end;

function  TClaudeAI.GetMessageCount(): NativeInt;
begin
  Result := 0;
  if not Assigned(FMessages) then Exit;
  Result := FMessages.Count;
end;

function  TClaudeAI.LoadMessages(const AStream: TStream): Boolean;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
end;

function  TClaudeAI.SaveMessages(const AStream: TStream): Boolean;
begin
  Result := False;
  if not Assigned(FMessages) then Exit;
end;

function  TClaudeAI.DoQuery(var AResponse: string; var AIsFunctionCall: Boolean): Boolean;
const
  CApiURL = 'https://api.anthropic.com/v1/messages';
var
  LHttpClient: THTTPClient;
  LString: string;
  LJson: TJsonObject;
  LMessages: TJsonArray;
  LContent: TJsonArray;
  LText: TJsonObject;
  LPostDataStream: TStringStream;
  LResponse: IHTTPResponse;
begin
  LHttpClient := THTTPClient.Create;
  try
    LHttpClient.CustomHeaders['x-api-key'] := GetApiKey();
    LHttpClient.CustomHeaders['anthropic-version'] := '2023-06-01';
    LHttpClient.CustomHeaders['Content-Type'] := 'application/json';
    LJson := TJsonObject.Create;
    try
      LMessages := ProcessMessages();
      try
        LJson.AddPair('system', FSystemMessages.Text);
        LJson.AddPair('model', GetModalNameStr());
        LJson.AddPair('max_tokens', FMaxTokens);
        if GetStopSequenceCount() > 0 then
          LJson.AddPair('stop_sequences', ProcessStopSequences());
        LJson.AddPair('messages', LMessages.Clone as TJsonArray);
        LJson.AddPair('temperature', FTemperature);
        LString := LJson.ToString;
      finally
        LMessages.Free;
      end;
    finally
      LJson.Free;
    end;

    LPostDataStream := TStringStream.Create(LString, TEncoding.UTF8);
    try
      LPostDataStream.Position := 0;
      LResponse := LHttpClient.Post(CApiURL, LPostDataStream);
      LString := LResponse.ContentAsString;
    finally
      LPostDataStream.Free;
    end;
    LJson := TJsonObject.ParseJSONValue(LString) as TJsonObject;
    try
      if LResponse.StatusCode = 200 then
        begin
          LContent := LJson.GetValue('content') as TJsonArray;
          LText := LContent.Items[0] as TJsonObject;
          AResponse := LText.GetValue('text').Value;

          LText := LJson.GetValue('usage') as TJsonObject;
          FInputTokens := LText.GetValue('input_tokens').Value.ToInteger;
          FOutputTokens := LText.GetValue('output_tokens').Value.ToInteger;
          AIsFunctionCall := Boolean(LJson.GetValue('stop_sequence').Value = '</function_calls>');

          Result := True;
        end
      else
        begin
          LText := LJson.GetValue('error') as TJsonObject;
          AResponse := 'Error: ' + LText.GetValue('message').Value;
          Result := False;
        end;
    finally
      LJson.Free;
    end;
  finally
    LHttpClient.Free;
  end;
end;

(* TODO: implement function callings upport
function  TClaudeAI.Query(var AResponse: string): Boolean;
var
  LIsFunctionCall: Boolean;
begin
  LIsFunctionCall := False;
  Result := DoQuery(AResponse, LIsFunctionCall);
  if LIsFunctionCall then
  begin
    //writeln('is a function call');
    AddTextMessage('<function_results><result><tool_name>get_weather</tool_name><stdout>{"temperature": 86.0, "conditions": "heavy rain, lightning"}</stdout></result></function_results>');
    LIsFunctionCall := False;
    Result := DoQuery(AResponse, LIsFunctionCall);
  end;
end;
*)

function  TClaudeAI.Query(var AResponse: string): Boolean;
var
  LIsFunctionCall: Boolean;
begin
  LIsFunctionCall := False;
  Result := DoQuery(AResponse, LIsFunctionCall);
end;

procedure TClaudeAI.SimpleChat();
var
  LQuestion: string;
  LResponse: string;
  LDone: Boolean;
  LSpeech: Boolean;
  LCmd: string;
begin
  Console.Clear();

  SetTemperature(TClaudeAI.TEMPERATURE_PERCISE);

  LSpeech := True;

  Console.PrintLn('Spark Game Toolkit: ClaudeAI Chat', Console.CYAN);
  Console.PrintLn(Console.CRLF+'   Powered by Claude 3 from Anthropic!', Console.BRIGHTWHITE);
  Console.PrintLn('   1. Go to https://console.anthropic.com/dashboard to get your API key.', Console.WHITE);
  Console.PrintLn('   2. Edit template.env.txt with your API key.', Console.WHITE);
  Console.PrintLn('   3. Rename to .env and place in project root folder.', Console.WHITE);
  Console.PrintLn(Console.CRLF+'   Enter /help for help, /quit to quit', Console.BRIGHTYELLOW);

  AddSystemMessage('you are a helpful AI assitant, you will answer every question asked by user to the best of your ability');

  LDone := False;
  while not LDone do
  begin
    Console.PrintLn(Console.CRLF+'Question: ', Console.DARKGREEN);
    LQuestion := Console.ReadLnX([#0..#255], 255, Console.YELLOW);

    LCmd := LQuestion.ToLower.Trim;

    // process commands
    if LCmd.StartsWith('/') then
    begin
      if SameText(LQuestion.ToLower, '/quit') then
        begin
          LDone := True;
          continue;
        end
      else
      if SameText(LQuestion.ToLower, '/speech') then
        begin
          LSpeech := not LSpeech;
          if LSpeech then
            Console.PrintLn('Speech enabled', Console.BRIGHTYELLOW)
          else
            Console.PrintLn('Speech disabled', Console.BRIGHTYELLOW)
        end
      else
      if SameText(LQuestion.ToLower, '/help') then
        begin
          Console.PrintLn();
          Console.PrintLn('[ === COMMANDS === ]', Console.BRIGHTWHITE);
          Console.PrintLn('/help   - show help', Console.CYAN);
          Console.PrintLn('/new    - new conversation', Console.CYAN);
          Console.PrintLn('/quit   - quit', Console.CYAN);
          Console.PrintLn('/speech - toggle speech', Console.CYAN);
        end
      else
      if SameText(LQuestion.ToLower, '/new') then
        begin
          Speech.Clear();
          ClearMessages();
          Console.PrintLn('Starting new conversation', Console.BRIGHTYELLOW);
        end
      else
        begin
          Console.PrintLn('Invalid command', Console.RED);
        end;

      continue;
    end;

    LQuestion := LQuestion.Trim;
    if LQuestion.IsEmpty then
      continue;

    AddTextMessage(LQuestion);

    if Query(LResponse) then
    begin
      if LSpeech then
      begin
        Speech.SetRate(0.55);
        Speech.Say(LResponse, True);
      end;
      AddAssistantMessage(LResponse);
    end;

    Console.PrintLn(Console.CRLF+'Answer: ', Console.DARKGREEN);
    Console.Teletype(LResponse, Console.WHITE);
    Console.PrintLn(Console.CRLF+'Input tokens: %d Output tokens: %d', [GetInputTokens(), GetOutputTokens()], Console.BRIGHTYELLOW);
  end;

  Speech.Clear();

  Console.PrintLn(Console.CRLF+'Thanks for using ClaudeAI, have a nice day!', Console.BRIGHTYELLOW);

  Console.Pause(True);
end;

end.
