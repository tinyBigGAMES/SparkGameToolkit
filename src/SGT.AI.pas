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

unit SGT.AI;

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
  SGT.Core,
  SGT.Speech;

type

  { TAI }
  TAI = class(TBaseObject)
  protected type
    Role = (roSystem, roUser, roAssiant);
    TMessage = record
      Role: string;
      Content: string;
    end;
    TMessages = TList<TMessage>;
  protected
    FMessages: TMessages;
  public
    constructor Create(); override;
    destructor Destroy(); override;

    procedure AddMessage(const ARole, AContent: string);
    function  GetMessageCount(): Integer;
    function  DeleteMessage(const AIndex: Integer): Boolean;
    procedure ClearMessages();
  end;

implementation

{ TAI }
constructor TAI.Create();
begin
  inherited;
end;

destructor TAI.Destroy();
begin
  inherited;
end;

procedure TAI.AddMessage(const ARole, AContent: string);
begin
end;

function  TAI.GetMessageCount(): Integer;
begin
end;

function  TAI.DeleteMessage(const AIndex: Integer): Boolean;
begin
end;

procedure TAI.ClearMessages();
begin
end;



end.
