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

program Testbed;

{$APPTYPE CONSOLE}

{$R *.res}

{$R *.dres}

uses
  System.SysUtils,
  UTestbed in 'UTestbed.pas',
  SGT.Deps in '..\..\src\SGT.Deps.pas',
  SGT.OGL in '..\..\src\SGT.OGL.pas',
  SGT.Core in '..\..\src\SGT.Core.pas',
  SGT.Game in '..\..\src\SGT.Game.pas',
  SGT.Deps.Ext in '..\..\src\SGT.Deps.Ext.pas',
  SGT.TreeMenuForm in '..\..\src\SGT.TreeMenuForm.pas' {TreeMenuForm},
  SGT.TreeMenu in '..\..\src\SGT.TreeMenu.pas',
  SGT.StartupDialog in '..\..\src\SGT.StartupDialog.pas',
  SGT.StartupDialogForm in '..\..\src\SGT.StartupDialogForm.pas' {StartupDialogForm},
  SGT.ClaudeAI in '..\..\src\SGT.ClaudeAI.pas',
  SGT.SpeechLib in '..\..\src\SGT.SpeechLib.pas',
  SGT.Speech in '..\..\src\SGT.Speech.pas',
  SGT.CloudDB in '..\..\src\SGT.CloudDB.pas',
  SGT.Lua in '..\..\src\SGT.Lua.pas';

begin
  try
    ReportMemoryLeaksOnShutdown := True;
    RunTests();
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
