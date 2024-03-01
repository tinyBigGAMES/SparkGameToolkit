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

unit UZipArc;

interface

uses
  System.SysUtils,
  System.IOUtils,
  SGT.Lib;

type
  { TlgZipArc }
  TZipArc = class(TBaseObject)
  protected
    procedure ShowHeader;
    procedure ShowUsage;
  public
    procedure Run(); override;
  end;

implementation

{ TlgZipArc }
procedure TZipArc.ShowHeader;
begin
  Console.PrintLn('');
  Console.PrintLn('ZipArc™ - SGT Archive Utilty v%s', [SGT_VERSION]);
  Console.PrintLn('Copyright © 2024-present tinyBigGAMES™ LLC');
  Console.PrintLn('All Rights Reserved.');
end;

procedure TZipArc.ShowUsage;
begin
  Console.PrintLn('');
  Console.PrintLn('Usage: ZipArc archivename[.zip] directoryname [password]' );
  Console.PrintLn('  archivename   - compressed archive name');
  Console.PrintLn('  directoryname - directory to archive');
  Console.PrintLn('  password      - optional password');
end;

procedure TZipArc.Run();
var
  LArchiveFilename: string;
  LDirectoryName: string;
  LPassword: string;
begin
  if not InitLib() then Exit;
  try
    // init local vars
    LArchiveFilename := '';
    LDirectoryName := '';
    LPassword := TZipFileIO.DEFAULT_PASSWORD;

    // display header
    ShowHeader();

    // check for archive directory
    if ParamCount = 2 then
      begin
        LArchiveFilename := ParamStr(1);
        LDirectoryName := ParamStr(2);
        LArchiveFilename := Utils.RemoveQuotes(LArchiveFilename);
        LDirectoryName := Utils.RemoveQuotes(LDirectoryName);
      end
    else
    if ParamCount = 3 then
      begin
        LArchiveFilename := ParamStr(1);
        LDirectoryName := ParamStr(2);
        LPassword := ParamStr(3);
        LArchiveFilename := Utils.RemoveQuotes(LArchiveFilename);
        LDirectoryName := Utils.RemoveQuotes(LDirectoryName);
        LPassword := Utils.RemoveQuotes(LPassword);
      end
    else
      begin
        // show usage
        ShowUsage();
        Exit;
      end;

    // check if directory exist
    if not TDirectory.Exists(LDirectoryName) then
      begin
        Console.PrintLn('');
        Console.PrintLn('Directory was not found: %s', [LDirectoryName]);
        ShowUsage;
        Exit;
      end;

    // display params
    Console.PrintLn('');
    Console.PrintLn('Archive  : %s', [LArchiveFilename]);
    Console.PrintLn('Directory: %s', [LDirectoryName]);
    Console.PrintLn('Password : %s', [LPassword]);

    // try to build archive
    Console.PrintLn('');
    Console.PrintLn('Building...', []);

    if TZipFile.Build(LArchiveFilename, LDirectoryName, nil, nil, LPassword) then
      Console.PrintLn(Console.LF+Console.LF+'Success!', [])
    else
      Console.PrintLn(Console.LF+Console.LF+'Failed!', []);
  finally
    QuitLib();
  end;
end;

end.
