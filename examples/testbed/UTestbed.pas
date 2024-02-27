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
  SGT.Deps,
  SGT.OGL;

procedure RunTests();

implementation

var
  mem: TDictionary<Pointer, NativeUInt>;
  stat_total_allocs: NativeUInt;
  stat_total_mem: NativeUInt;

procedure Pause();
begin
  WriteLn;
  Write('Press ENTER to continue...');
  ReadLn;
  WriteLn;
end;


//void error_callback(int e, const char *d)
procedure glfw_error_callback(e: integer; const d: pansichar); cdecl;
begin
  writeln(Format('Error %d: %s ', [e, d]));
end;

function glfw_allocate(size: NativeUInt; user: Pointer): Pointer; cdecl;
begin
  GetMem(Result, size);
  mem.Add(Result, size);
  inc(stat_total_allocs);
  stat_total_mem := stat_total_mem + size;
end;

function glfw_reallocate(block: Pointer; size: NativeUInt; user: Pointer): Pointer; cdecl;
begin
  mem.Remove(block);
  ReallocMem(block, size);
  Result := block;
  mem.Add(block, size);
  inc(stat_total_allocs);
  stat_total_mem := stat_total_mem + size;
end;

procedure  glfw_deallocate(block: Pointer; user: Pointer); cdecl;
begin
  mem.Remove(block);
  FreeMem(block);
end;

procedure initmem;
begin
  mem := TDictionary<Pointer, NativeUInt>.Create;
  stat_total_allocs := 0;
  stat_total_mem := 0;
end;

procedure donemem;
var
  item: TPair<Pointer, NativeUint>;
begin
  if mem.Count > 0 then
  begin
    writeln;
    writeln('Dangling allocations auto released: ', mem.Count);
  end;

  for item in mem do
  begin
    FreeMem(item.Key);
    WriteLn('Size: ', item.Value, ' bytes');
  end;

  writeln;
  writeln('total allocations: ', stat_total_allocs);
  writeln('total memory used: ', stat_total_mem);

  mem.Free;
end;

procedure Test01();
const
  WINDOW_WIDTH = 1920 div 2;
  WINDOW_HEIGHT = 1080 div 2;
type
  TColor = record
    r,g,b,a: Single;
  end;
var
  window: PGLFWwindow;
  io: PImGuiIO;
  show_demo_window: Boolean;
  clear_color: ImVec4;
  display_w, display_h: Integer;
  color: TColor;
  scale,xscale,yscale: Single;
  allocator: GLFWallocator;

  procedure drawRect(x, y, width, height: Single);
  begin
    // Draw a rectangle
    glBegin(GL_QUADS);
    glVertex2f(x, y);
    glVertex2f(x + width, y);
    glVertex2f(x + width, y + height);
    glVertex2f(x, y + height);
    glEnd;
  end;

procedure DrawFilledRect(const X, Y, AWidth, AHeight: Single; const AColor: TColor; const AAngle: Single);
var
  HalfWidth, HalfHeight: Single;
begin

  HalfWidth := AWidth / 2;
  HalfHeight := AHeight / 2;

  glColor4f(AColor.r, AColor.g, AColor.b, AColor.a);

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

begin
  initmem();

  show_demo_window := True;
  clear_color.x := 0.45;
  clear_color.y := 0.55;
  clear_color.z := 0.60;
  clear_color.w := 1.0;

  glfwSetErrorCallback(glfw_error_callback);
  allocator.allocate := glfw_allocate;
  allocator.reallocate := glfw_reallocate;
  allocator.deallocate := glfw_deallocate;
  allocator.user := nil;
  glfwInitAllocator(@allocator);

  if glfwInit() = GLFW_FALSE then Exit;

  glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
  glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 1);
  glfwWindowHint(GLFW_SCALE_TO_MONITOR, GLFW_TRUE);

  window := glfwCreateWindow(WINDOW_WIDTH, WINDOW_HEIGHT, 'Hello World', nil, nil);
  if not Assigned(window) then
  begin
    glfwTerminate();
    Exit;
  end;

  glfwMakeContextCurrent(window);
  if not LoadOpenGL() then
  begin
    glfwDestroyWindow(window);
    glfwTerminate();
  end;

  glfwGetWindowContentScale(window, @xscale, @yscale); // Get DPI scale factor
  scale := (xscale + yscale) / 2.0;


  if GLAD_GL_VERSION_2_1 then
    writeln('opengl 2.1 supported');

  writeln(PAnsiChar(glGetString(GL_VERSION)));

  glfwSwapInterval(1);

  igCreateContext(nil);
  io := igGetIO();
  io.ConfigFlags := ImGuiConfigFlags_NavEnableKeyboard or
                      ImGuiConfigFlags_NavEnableGamepad or
                      ImGuiConfigFlags_DockingEnable;

  ImGui_ImplGlfw_InitForOpenGL(window, true);
  ImGui_ImplOpenGL2_Init();

  ImFontAtlas_AddFontFromFileTTF(io.Fonts, 'res/fonts/JetBrainsMono-Regular.ttf', 16*scale, nil, nil);

  while glfwWindowShouldClose(window) = GLFW_FALSE do
  begin
    glfwPollEvents();

    ImGui_ImplOpenGL2_NewFrame();
    ImGui_ImplGlfw_NewFrame();
    igNewFrame();

    if show_demo_window then
      igShowDemoWindow(@show_demo_window);

    igBegin('Hello, world!', nil, ImGuiWindowFlags_AlwaysAutoResize);
    igText('This is some useful text.');
    igCheckbox('Demo Window', @show_demo_window);
    igEnd();

    glfwGetWindowSize(window, @display_w, @display_h);
    glViewport(0, 0, display_w, display_h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0,display_w, display_h, 0, -1, 1);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glScalef(scale, scale, 1.0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

    glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);

    igRender();
    ImGui_ImplOpenGL2_RenderDrawData(igGetDrawData());

    color.r := 1;
    color.g := 0;
    color.b := 0;
    color.a := 1;
    DrawFilledRect(WINDOW_WIDTH-50, 50, 100, 100, color, 0);
    glfwSwapBuffers(window);
  end;

  ImGui_ImplOpenGL2_Shutdown();
  ImGui_ImplGlfw_Shutdown();
  igDestroyContext(nil);

  glfwMakeContextCurrent(nil);
  glfwDestroyWindow(window);
  glfwTerminate();

  donemem();
end;

procedure RunTests();
begin
  Test01();
  Pause();
end;

end.
