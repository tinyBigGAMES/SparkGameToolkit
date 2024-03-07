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

unit SGT.Deps.Ext;

{$I SGT.Defines.inc}

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  System.AnsiStrings,
  WinApi.Windows,
  SGT.Deps;

//=== CIMGUI ==================================================================
function  ImFontAtlas_AddFontFromResTTF(self: PImFontAtlas; const AInstance: HINST; const AResName: string; size_pixels: Single; const glyph_ranges: PImWchar): PImFont;
function  ImFontAtlas_AddDefaultFontTTF(self: PImFontAtlas; size_pixels: Single; const glyph_ranges: PImWchar): PImFont;
procedure ImFontAtlas_ResizeDefaultFont(self: PImFontAtlas; const ASize: Single);


implementation

uses
  SGT.Core;

function ImFontAtlas_AddFontFromResTTF(self: PImFontAtlas; const AInstance: HINST; const AResName: string; size_pixels: Single; const glyph_ranges: PImWchar): PImFont;
type
  TImWchar = Word;
var
  LResStream: TResourceStream;
  LConfig: ImFontConfig;
  LName: UTF8String;
begin
  Result := nil;
  if not Utils.ResourceExist(AInstance, AResName) then Exit;
  LResStream := TResourceStream.Create(AInstance, AResName, RT_RCDATA);
  try
    FillChar(LConfig, SizeOf(LConfig), 0);
    LConfig.FontData := LResStream.Memory;
    LConfig.FontDataSize := LResStream.Size;
    LConfig.SizePixels := size_pixels;
    LConfig.FontDataOwnedByAtlas := False;
    LConfig.OversampleH := 2;
    LConfig.OversampleV := 1;
    LConfig.GlyphMaxAdvanceX := MaxSingle;
    LConfig.RasterizerMultiply := 1.0;
    LConfig.RasterizerDensity := 1.0;
    LConfig.EllipsisChar := TImWchar(-1);
    LName := UTF8String(Format('Default Font, %0.gpx', [size_pixels]));

    System.AnsiStrings.StrLCopy(@LConfig.Name[0], PUTF8Char(LName), Length(LName));

    Result := ImFontAtlas_AddFontFromMemoryTTF(self, LResStream.Memory, LResStream.Size, size_pixels, @LConfig, glyph_ranges);
  finally
    LResStream.Free;
  end;
end;

function ImFontAtlas_AddDefaultFontTTF(self: PImFontAtlas; size_pixels: Single; const glyph_ranges: PImWchar): PImFont;
begin
  Result := ImFontAtlas_AddFontFromResTTF(self, HInstance, '0b0039416ae04dedaad41588e3751295', size_pixels, glyph_ranges);
end;

procedure ImFontAtlas_ResizeDefaultFont(self: PImFontAtlas; const ASize: Single);
begin
  ImFontAtlas_Clear(self);
  ImGui_ImplOpenGL2_DestroyFontsTexture();
  ImFontAtlas_AddDefaultFontTTF(self, ASize, nil);
  ImGui_ImplOpenGL2_CreateFontsTexture();
end;

end.
