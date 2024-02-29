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

unit SGT.Deps;

{$I SGT.Defines.inc}

interface

uses
  WinApi.Windows,
  WinApi.Winsock2;

const
  {$IF Defined(WIN64)}
  SGT_DLL = 'SGT.dll';
  _PU = '';
  {$ELSE}
    {$MESSAGE Error 'Unsupported platform'}
  {$ENDIF}

const
  GLFW_EXPOSE_NATIVE_WIN32 = 1;
  NK_INCLUDE_FIXED_TYPES = 1;
  NK_INCLUDE_STANDARD_IO = 1;
  NK_INCLUDE_STANDARD_VARARGS = 1;
  NK_INCLUDE_DEFAULT_ALLOCATOR = 1;
  NK_INCLUDE_VERTEX_BUFFER_OUTPUT = 1;
  NK_INCLUDE_FONT_BAKING = 1;
  NK_INCLUDE_DEFAULT_FONT = 1;
  NK_KEYSTATE_BASED_INPUT = 1;
  CIMGUI_DEFINE_ENUMS_AND_STRUCTS = 1;
  GLFW_VERSION_MAJOR = 3;
  GLFW_VERSION_MINOR = 4;
  GLFW_VERSION_REVISION = 0;
  GLFW_TRUE = 1;
  GLFW_FALSE = 0;
  GLFW_RELEASE = 0;
  GLFW_PRESS = 1;
  GLFW_REPEAT = 2;
  GLFW_HAT_CENTERED = 0;
  GLFW_HAT_UP = 1;
  GLFW_HAT_RIGHT = 2;
  GLFW_HAT_DOWN = 4;
  GLFW_HAT_LEFT = 8;
  GLFW_HAT_RIGHT_UP = (GLFW_HAT_RIGHT or GLFW_HAT_UP);
  GLFW_HAT_RIGHT_DOWN = (GLFW_HAT_RIGHT or GLFW_HAT_DOWN);
  GLFW_HAT_LEFT_UP = (GLFW_HAT_LEFT or GLFW_HAT_UP);
  GLFW_HAT_LEFT_DOWN = (GLFW_HAT_LEFT or GLFW_HAT_DOWN);
  GLFW_KEY_UNKNOWN = -1;
  GLFW_KEY_SPACE = 32;
  GLFW_KEY_APOSTROPHE = 39;
  GLFW_KEY_COMMA = 44;
  GLFW_KEY_MINUS = 45;
  GLFW_KEY_PERIOD = 46;
  GLFW_KEY_SLASH = 47;
  GLFW_KEY_0 = 48;
  GLFW_KEY_1 = 49;
  GLFW_KEY_2 = 50;
  GLFW_KEY_3 = 51;
  GLFW_KEY_4 = 52;
  GLFW_KEY_5 = 53;
  GLFW_KEY_6 = 54;
  GLFW_KEY_7 = 55;
  GLFW_KEY_8 = 56;
  GLFW_KEY_9 = 57;
  GLFW_KEY_SEMICOLON = 59;
  GLFW_KEY_EQUAL = 61;
  GLFW_KEY_A = 65;
  GLFW_KEY_B = 66;
  GLFW_KEY_C = 67;
  GLFW_KEY_D = 68;
  GLFW_KEY_E = 69;
  GLFW_KEY_F = 70;
  GLFW_KEY_G = 71;
  GLFW_KEY_H = 72;
  GLFW_KEY_I = 73;
  GLFW_KEY_J = 74;
  GLFW_KEY_K = 75;
  GLFW_KEY_L = 76;
  GLFW_KEY_M = 77;
  GLFW_KEY_N = 78;
  GLFW_KEY_O = 79;
  GLFW_KEY_P = 80;
  GLFW_KEY_Q = 81;
  GLFW_KEY_R = 82;
  GLFW_KEY_S = 83;
  GLFW_KEY_T = 84;
  GLFW_KEY_U = 85;
  GLFW_KEY_V = 86;
  GLFW_KEY_W = 87;
  GLFW_KEY_X = 88;
  GLFW_KEY_Y = 89;
  GLFW_KEY_Z = 90;
  GLFW_KEY_LEFT_BRACKET = 91;
  GLFW_KEY_BACKSLASH = 92;
  GLFW_KEY_RIGHT_BRACKET = 93;
  GLFW_KEY_GRAVE_ACCENT = 96;
  GLFW_KEY_WORLD_1 = 161;
  GLFW_KEY_WORLD_2 = 162;
  GLFW_KEY_ESCAPE = 256;
  GLFW_KEY_ENTER = 257;
  GLFW_KEY_TAB = 258;
  GLFW_KEY_BACKSPACE = 259;
  GLFW_KEY_INSERT = 260;
  GLFW_KEY_DELETE = 261;
  GLFW_KEY_RIGHT = 262;
  GLFW_KEY_LEFT = 263;
  GLFW_KEY_DOWN = 264;
  GLFW_KEY_UP = 265;
  GLFW_KEY_PAGE_UP = 266;
  GLFW_KEY_PAGE_DOWN = 267;
  GLFW_KEY_HOME = 268;
  GLFW_KEY_END = 269;
  GLFW_KEY_CAPS_LOCK = 280;
  GLFW_KEY_SCROLL_LOCK = 281;
  GLFW_KEY_NUM_LOCK = 282;
  GLFW_KEY_PRINT_SCREEN = 283;
  GLFW_KEY_PAUSE = 284;
  GLFW_KEY_F1 = 290;
  GLFW_KEY_F2 = 291;
  GLFW_KEY_F3 = 292;
  GLFW_KEY_F4 = 293;
  GLFW_KEY_F5 = 294;
  GLFW_KEY_F6 = 295;
  GLFW_KEY_F7 = 296;
  GLFW_KEY_F8 = 297;
  GLFW_KEY_F9 = 298;
  GLFW_KEY_F10 = 299;
  GLFW_KEY_F11 = 300;
  GLFW_KEY_F12 = 301;
  GLFW_KEY_F13 = 302;
  GLFW_KEY_F14 = 303;
  GLFW_KEY_F15 = 304;
  GLFW_KEY_F16 = 305;
  GLFW_KEY_F17 = 306;
  GLFW_KEY_F18 = 307;
  GLFW_KEY_F19 = 308;
  GLFW_KEY_F20 = 309;
  GLFW_KEY_F21 = 310;
  GLFW_KEY_F22 = 311;
  GLFW_KEY_F23 = 312;
  GLFW_KEY_F24 = 313;
  GLFW_KEY_F25 = 314;
  GLFW_KEY_KP_0 = 320;
  GLFW_KEY_KP_1 = 321;
  GLFW_KEY_KP_2 = 322;
  GLFW_KEY_KP_3 = 323;
  GLFW_KEY_KP_4 = 324;
  GLFW_KEY_KP_5 = 325;
  GLFW_KEY_KP_6 = 326;
  GLFW_KEY_KP_7 = 327;
  GLFW_KEY_KP_8 = 328;
  GLFW_KEY_KP_9 = 329;
  GLFW_KEY_KP_DECIMAL = 330;
  GLFW_KEY_KP_DIVIDE = 331;
  GLFW_KEY_KP_MULTIPLY = 332;
  GLFW_KEY_KP_SUBTRACT = 333;
  GLFW_KEY_KP_ADD = 334;
  GLFW_KEY_KP_ENTER = 335;
  GLFW_KEY_KP_EQUAL = 336;
  GLFW_KEY_LEFT_SHIFT = 340;
  GLFW_KEY_LEFT_CONTROL = 341;
  GLFW_KEY_LEFT_ALT = 342;
  GLFW_KEY_LEFT_SUPER = 343;
  GLFW_KEY_RIGHT_SHIFT = 344;
  GLFW_KEY_RIGHT_CONTROL = 345;
  GLFW_KEY_RIGHT_ALT = 346;
  GLFW_KEY_RIGHT_SUPER = 347;
  GLFW_KEY_MENU = 348;
  GLFW_KEY_LAST = GLFW_KEY_MENU;
  GLFW_MOD_SHIFT = $0001;
  GLFW_MOD_CONTROL = $0002;
  GLFW_MOD_ALT = $0004;
  GLFW_MOD_SUPER = $0008;
  GLFW_MOD_CAPS_LOCK = $0010;
  GLFW_MOD_NUM_LOCK = $0020;
  GLFW_MOUSE_BUTTON_1 = 0;
  GLFW_MOUSE_BUTTON_2 = 1;
  GLFW_MOUSE_BUTTON_3 = 2;
  GLFW_MOUSE_BUTTON_4 = 3;
  GLFW_MOUSE_BUTTON_5 = 4;
  GLFW_MOUSE_BUTTON_6 = 5;
  GLFW_MOUSE_BUTTON_7 = 6;
  GLFW_MOUSE_BUTTON_8 = 7;
  GLFW_MOUSE_BUTTON_LAST = GLFW_MOUSE_BUTTON_8;
  GLFW_MOUSE_BUTTON_LEFT = GLFW_MOUSE_BUTTON_1;
  GLFW_MOUSE_BUTTON_RIGHT = GLFW_MOUSE_BUTTON_2;
  GLFW_MOUSE_BUTTON_MIDDLE = GLFW_MOUSE_BUTTON_3;
  GLFW_JOYSTICK_1 = 0;
  GLFW_JOYSTICK_2 = 1;
  GLFW_JOYSTICK_3 = 2;
  GLFW_JOYSTICK_4 = 3;
  GLFW_JOYSTICK_5 = 4;
  GLFW_JOYSTICK_6 = 5;
  GLFW_JOYSTICK_7 = 6;
  GLFW_JOYSTICK_8 = 7;
  GLFW_JOYSTICK_9 = 8;
  GLFW_JOYSTICK_10 = 9;
  GLFW_JOYSTICK_11 = 10;
  GLFW_JOYSTICK_12 = 11;
  GLFW_JOYSTICK_13 = 12;
  GLFW_JOYSTICK_14 = 13;
  GLFW_JOYSTICK_15 = 14;
  GLFW_JOYSTICK_16 = 15;
  GLFW_JOYSTICK_LAST = GLFW_JOYSTICK_16;
  GLFW_GAMEPAD_BUTTON_A = 0;
  GLFW_GAMEPAD_BUTTON_B = 1;
  GLFW_GAMEPAD_BUTTON_X = 2;
  GLFW_GAMEPAD_BUTTON_Y = 3;
  GLFW_GAMEPAD_BUTTON_LEFT_BUMPER = 4;
  GLFW_GAMEPAD_BUTTON_RIGHT_BUMPER = 5;
  GLFW_GAMEPAD_BUTTON_BACK = 6;
  GLFW_GAMEPAD_BUTTON_START = 7;
  GLFW_GAMEPAD_BUTTON_GUIDE = 8;
  GLFW_GAMEPAD_BUTTON_LEFT_THUMB = 9;
  GLFW_GAMEPAD_BUTTON_RIGHT_THUMB = 10;
  GLFW_GAMEPAD_BUTTON_DPAD_UP = 11;
  GLFW_GAMEPAD_BUTTON_DPAD_RIGHT = 12;
  GLFW_GAMEPAD_BUTTON_DPAD_DOWN = 13;
  GLFW_GAMEPAD_BUTTON_DPAD_LEFT = 14;
  GLFW_GAMEPAD_BUTTON_LAST = GLFW_GAMEPAD_BUTTON_DPAD_LEFT;
  GLFW_GAMEPAD_BUTTON_CROSS = GLFW_GAMEPAD_BUTTON_A;
  GLFW_GAMEPAD_BUTTON_CIRCLE = GLFW_GAMEPAD_BUTTON_B;
  GLFW_GAMEPAD_BUTTON_SQUARE = GLFW_GAMEPAD_BUTTON_X;
  GLFW_GAMEPAD_BUTTON_TRIANGLE = GLFW_GAMEPAD_BUTTON_Y;
  GLFW_GAMEPAD_AXIS_LEFT_X = 0;
  GLFW_GAMEPAD_AXIS_LEFT_Y = 1;
  GLFW_GAMEPAD_AXIS_RIGHT_X = 2;
  GLFW_GAMEPAD_AXIS_RIGHT_Y = 3;
  GLFW_GAMEPAD_AXIS_LEFT_TRIGGER = 4;
  GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER = 5;
  GLFW_GAMEPAD_AXIS_LAST = GLFW_GAMEPAD_AXIS_RIGHT_TRIGGER;
  GLFW_NO_ERROR = 0;
  GLFW_NOT_INITIALIZED = $00010001;
  GLFW_NO_CURRENT_CONTEXT = $00010002;
  GLFW_INVALID_ENUM = $00010003;
  GLFW_INVALID_VALUE = $00010004;
  GLFW_OUT_OF_MEMORY = $00010005;
  GLFW_API_UNAVAILABLE = $00010006;
  GLFW_VERSION_UNAVAILABLE = $00010007;
  GLFW_PLATFORM_ERROR = $00010008;
  GLFW_FORMAT_UNAVAILABLE = $00010009;
  GLFW_NO_WINDOW_CONTEXT = $0001000A;
  GLFW_CURSOR_UNAVAILABLE = $0001000B;
  GLFW_FEATURE_UNAVAILABLE = $0001000C;
  GLFW_FEATURE_UNIMPLEMENTED = $0001000D;
  GLFW_PLATFORM_UNAVAILABLE = $0001000E;
  GLFW_FOCUSED = $00020001;
  GLFW_ICONIFIED = $00020002;
  GLFW_RESIZABLE = $00020003;
  GLFW_VISIBLE = $00020004;
  GLFW_DECORATED = $00020005;
  GLFW_AUTO_ICONIFY = $00020006;
  GLFW_FLOATING = $00020007;
  GLFW_MAXIMIZED = $00020008;
  GLFW_CENTER_CURSOR = $00020009;
  GLFW_TRANSPARENT_FRAMEBUFFER = $0002000A;
  GLFW_HOVERED = $0002000B;
  GLFW_FOCUS_ON_SHOW = $0002000C;
  GLFW_MOUSE_PASSTHROUGH = $0002000D;
  GLFW_POSITION_X = $0002000E;
  GLFW_POSITION_Y = $0002000F;
  GLFW_RED_BITS = $00021001;
  GLFW_GREEN_BITS = $00021002;
  GLFW_BLUE_BITS = $00021003;
  GLFW_ALPHA_BITS = $00021004;
  GLFW_DEPTH_BITS = $00021005;
  GLFW_STENCIL_BITS = $00021006;
  GLFW_ACCUM_RED_BITS = $00021007;
  GLFW_ACCUM_GREEN_BITS = $00021008;
  GLFW_ACCUM_BLUE_BITS = $00021009;
  GLFW_ACCUM_ALPHA_BITS = $0002100A;
  GLFW_AUX_BUFFERS = $0002100B;
  GLFW_STEREO = $0002100C;
  GLFW_SAMPLES = $0002100D;
  GLFW_SRGB_CAPABLE = $0002100E;
  GLFW_REFRESH_RATE = $0002100F;
  GLFW_DOUBLEBUFFER = $00021010;
  GLFW_CLIENT_API = $00022001;
  GLFW_CONTEXT_VERSION_MAJOR = $00022002;
  GLFW_CONTEXT_VERSION_MINOR = $00022003;
  GLFW_CONTEXT_REVISION = $00022004;
  GLFW_CONTEXT_ROBUSTNESS = $00022005;
  GLFW_OPENGL_FORWARD_COMPAT = $00022006;
  GLFW_CONTEXT_DEBUG = $00022007;
  GLFW_OPENGL_DEBUG_CONTEXT = GLFW_CONTEXT_DEBUG;
  GLFW_OPENGL_PROFILE = $00022008;
  GLFW_CONTEXT_RELEASE_BEHAVIOR = $00022009;
  GLFW_CONTEXT_NO_ERROR = $0002200A;
  GLFW_CONTEXT_CREATION_API = $0002200B;
  GLFW_SCALE_TO_MONITOR = $0002200C;
  GLFW_SCALE_FRAMEBUFFER = $0002200D;
  GLFW_COCOA_RETINA_FRAMEBUFFER = $00023001;
  GLFW_COCOA_FRAME_NAME = $00023002;
  GLFW_COCOA_GRAPHICS_SWITCHING = $00023003;
  GLFW_X11_CLASS_NAME = $00024001;
  GLFW_X11_INSTANCE_NAME = $00024002;
  GLFW_WIN32_KEYBOARD_MENU = $00025001;
  GLFW_WIN32_SHOWDEFAULT = $00025002;
  GLFW_WAYLAND_APP_ID = $00026001;
  GLFW_NO_API = 0;
  GLFW_OPENGL_API = $00030001;
  GLFW_OPENGL_ES_API = $00030002;
  GLFW_NO_ROBUSTNESS = 0;
  GLFW_NO_RESET_NOTIFICATION = $00031001;
  GLFW_LOSE_CONTEXT_ON_RESET = $00031002;
  GLFW_OPENGL_ANY_PROFILE = 0;
  GLFW_OPENGL_CORE_PROFILE = $00032001;
  GLFW_OPENGL_COMPAT_PROFILE = $00032002;
  GLFW_CURSOR = $00033001;
  GLFW_STICKY_KEYS = $00033002;
  GLFW_STICKY_MOUSE_BUTTONS = $00033003;
  GLFW_LOCK_KEY_MODS = $00033004;
  GLFW_RAW_MOUSE_MOTION = $00033005;
  GLFW_CURSOR_NORMAL = $00034001;
  GLFW_CURSOR_HIDDEN = $00034002;
  GLFW_CURSOR_DISABLED = $00034003;
  GLFW_CURSOR_CAPTURED = $00034004;
  GLFW_ANY_RELEASE_BEHAVIOR = 0;
  GLFW_RELEASE_BEHAVIOR_FLUSH = $00035001;
  GLFW_RELEASE_BEHAVIOR_NONE = $00035002;
  GLFW_NATIVE_CONTEXT_API = $00036001;
  GLFW_EGL_CONTEXT_API = $00036002;
  GLFW_OSMESA_CONTEXT_API = $00036003;
  GLFW_ANGLE_PLATFORM_TYPE_NONE = $00037001;
  GLFW_ANGLE_PLATFORM_TYPE_OPENGL = $00037002;
  GLFW_ANGLE_PLATFORM_TYPE_OPENGLES = $00037003;
  GLFW_ANGLE_PLATFORM_TYPE_D3D9 = $00037004;
  GLFW_ANGLE_PLATFORM_TYPE_D3D11 = $00037005;
  GLFW_ANGLE_PLATFORM_TYPE_VULKAN = $00037007;
  GLFW_ANGLE_PLATFORM_TYPE_METAL = $00037008;
  GLFW_WAYLAND_PREFER_LIBDECOR = $00038001;
  GLFW_WAYLAND_DISABLE_LIBDECOR = $00038002;
  GLFW_ANY_POSITION = $80000000;
  GLFW_ARROW_CURSOR = $00036001;
  GLFW_IBEAM_CURSOR = $00036002;
  GLFW_CROSSHAIR_CURSOR = $00036003;
  GLFW_POINTING_HAND_CURSOR = $00036004;
  GLFW_RESIZE_EW_CURSOR = $00036005;
  GLFW_RESIZE_NS_CURSOR = $00036006;
  GLFW_RESIZE_NWSE_CURSOR = $00036007;
  GLFW_RESIZE_NESW_CURSOR = $00036008;
  GLFW_RESIZE_ALL_CURSOR = $00036009;
  GLFW_NOT_ALLOWED_CURSOR = $0003600A;
  GLFW_HRESIZE_CURSOR = GLFW_RESIZE_EW_CURSOR;
  GLFW_VRESIZE_CURSOR = GLFW_RESIZE_NS_CURSOR;
  GLFW_HAND_CURSOR = GLFW_POINTING_HAND_CURSOR;
  GLFW_CONNECTED = $00040001;
  GLFW_DISCONNECTED = $00040002;
  GLFW_JOYSTICK_HAT_BUTTONS = $00050001;
  GLFW_ANGLE_PLATFORM_TYPE = $00050002;
  GLFW_PLATFORM = $00050003;
  GLFW_COCOA_CHDIR_RESOURCES = $00051001;
  GLFW_COCOA_MENUBAR = $00051002;
  GLFW_X11_XCB_VULKAN_SURFACE = $00052001;
  GLFW_WAYLAND_LIBDECOR = $00053001;
  GLFW_ANY_PLATFORM = $00060000;
  GLFW_PLATFORM_WIN32 = $00060001;
  GLFW_PLATFORM_COCOA = $00060002;
  GLFW_PLATFORM_WAYLAND = $00060003;
  GLFW_PLATFORM_X11 = $00060004;
  GLFW_PLATFORM_NULL = $00060005;
  GLFW_DONT_CARE = -1;
  ENET_VERSION_MAJOR = 2;
  ENET_VERSION_MINOR = 3;
  ENET_VERSION_PATCH = 7;
  ENET_TIME_OVERFLOW = 86400000;
  CLOCK_MONOTONIC = 0;
  ENET_SOCKET_NULL = INVALID_SOCKET;
  ENET_IPV6 = 1;
  ENET_HOST_BROADCAST_ = $FFFFFFFF;
  ENET_PORT_ANY = 0;
  Z_ERRNO = -1;
  Z_OK = 0;
  Z_DEFLATED = 8;
  Z_DEFAULT_STRATEGY = 0;
  ZIP_OK = (0);
  ZIP_EOF = (0);
  ZIP_ERRNO = (Z_ERRNO);
  ZIP_PARAMERROR = (-102);
  ZIP_BADZIPFILE = (-103);
  ZIP_INTERNALERROR = (-104);
  UNZ_OK = (0);
  UNZ_END_OF_LIST_OF_FILE = (-100);
  UNZ_ERRNO = (Z_ERRNO);
  UNZ_EOF = (0);
  UNZ_PARAMERROR = (-102);
  UNZ_BADZIPFILE = (-103);
  UNZ_INTERNALERROR = (-104);
  UNZ_CRCERROR = (-105);
  APPEND_STATUS_CREATE = (0);
  APPEND_STATUS_CREATEAFTER = (1);
  APPEND_STATUS_ADDINZIP = (2);
  STBI_VERSION = 1;
  STB_RECT_PACK_VERSION = 1;
  STBRP__MAXVAL = $7fffffff;
  STBTT_MACSTYLE_DONTCARE = 0;
  STBTT_MACSTYLE_BOLD = 1;
  STBTT_MACSTYLE_ITALIC = 2;
  STBTT_MACSTYLE_UNDERSCORE = 4;
  STBTT_MACSTYLE_NONE = 8;
  PLM_PACKET_INVALID_TS = -1;
  PLM_AUDIO_SAMPLES_PER_FRAME = 1152;
  PLM_BUFFER_DEFAULT_SIZE = (128*1024);
  MA_VERSION_MAJOR = 0;
  MA_VERSION_MINOR = 11;
  MA_VERSION_REVISION = 21;
  MA_SIZEOF_PTR = 8;
  MA_TRUE = 1;
  MA_FALSE = 0;
  SIZE_MAX = $ffffffffffffffff;
  MA_SIZE_MAX = SIZE_MAX;
  MA_SIMD_ALIGNMENT = 32;
  MA_MIN_CHANNELS = 1;
  MA_MAX_CHANNELS = 254;
  MA_MAX_FILTER_ORDER = 8;
  MA_MAX_LOG_CALLBACKS = 4;
  MA_CHANNEL_INDEX_NULL = 255;
  MA_DATA_SOURCE_SELF_MANAGED_RANGE_AND_LOOP_POINT = $00000001;
  MA_DATA_FORMAT_FLAG_EXCLUSIVE_MODE = (1 shl 1);
  MA_MAX_DEVICE_NAME_LENGTH = 255;
  MA_RESOURCE_MANAGER_MAX_JOB_THREAD_COUNT = 64;
  MA_MAX_NODE_BUS_COUNT = 254;
  MA_MAX_NODE_LOCAL_BUS_COUNT = 2;
  MA_NODE_BUS_COUNT_UNKNOWN = 255;
  MA_ENGINE_MAX_LISTENERS = 4;
  MA_SOUND_SOURCE_CHANNEL_COUNT = $FFFFFFFF;
  IMGUI_HAS_DOCK = 1;
  ImDrawCallback_ResetRenderState = Pointer(-8);

const
  ENET_PROTOCOL_MINIMUM_MTU = 576;
  ENET_PROTOCOL_MAXIMUM_MTU = 4096;
  ENET_PROTOCOL_MAXIMUM_PACKET_COMMANDS = 32;
  ENET_PROTOCOL_MINIMUM_WINDOW_SIZE = 4096;
  ENET_PROTOCOL_MAXIMUM_WINDOW_SIZE = 65536;
  ENET_PROTOCOL_MINIMUM_CHANNEL_COUNT = 1;
  ENET_PROTOCOL_MAXIMUM_CHANNEL_COUNT = 255;
  ENET_PROTOCOL_MAXIMUM_PEER_ID = 4095;
  ENET_PROTOCOL_MAXIMUM_FRAGMENT_COUNT = 1048576;

const
  ENET_BUFFER_MAXIMUM = (1+2*ENET_PROTOCOL_MAXIMUM_PACKET_COMMANDS);

type
  _ENetProtocolCommand = Integer;
  P_ENetProtocolCommand = ^_ENetProtocolCommand;

const
  ENET_PROTOCOL_COMMAND_NONE = 0;
  ENET_PROTOCOL_COMMAND_ACKNOWLEDGE = 1;
  ENET_PROTOCOL_COMMAND_CONNECT = 2;
  ENET_PROTOCOL_COMMAND_VERIFY_CONNECT = 3;
  ENET_PROTOCOL_COMMAND_DISCONNECT = 4;
  ENET_PROTOCOL_COMMAND_PING = 5;
  ENET_PROTOCOL_COMMAND_SEND_RELIABLE = 6;
  ENET_PROTOCOL_COMMAND_SEND_UNRELIABLE = 7;
  ENET_PROTOCOL_COMMAND_SEND_FRAGMENT = 8;
  ENET_PROTOCOL_COMMAND_SEND_UNSEQUENCED = 9;
  ENET_PROTOCOL_COMMAND_BANDWIDTH_LIMIT = 10;
  ENET_PROTOCOL_COMMAND_THROTTLE_CONFIGURE = 11;
  ENET_PROTOCOL_COMMAND_SEND_UNRELIABLE_FRAGMENT = 12;
  ENET_PROTOCOL_COMMAND_COUNT = 13;
  ENET_PROTOCOL_COMMAND_MASK = 15;

type
  _ENetProtocolFlag = Integer;
  P_ENetProtocolFlag = ^_ENetProtocolFlag;

const
  ENET_PROTOCOL_COMMAND_FLAG_ACKNOWLEDGE = 128;
  ENET_PROTOCOL_COMMAND_FLAG_UNSEQUENCED = 64;
  ENET_PROTOCOL_HEADER_FLAG_COMPRESSED = 16384;
  ENET_PROTOCOL_HEADER_FLAG_SENT_TIME = 32768;
  ENET_PROTOCOL_HEADER_FLAG_MASK = 49152;
  ENET_PROTOCOL_HEADER_SESSION_MASK = 12288;
  ENET_PROTOCOL_HEADER_SESSION_SHIFT = 12;

type
  _ENetSocketType = Integer;
  P_ENetSocketType = ^_ENetSocketType;

const
  ENET_SOCKET_TYPE_STREAM = 1;
  ENET_SOCKET_TYPE_DATAGRAM = 2;

type
  _ENetSocketWait = Integer;
  P_ENetSocketWait = ^_ENetSocketWait;

const
  ENET_SOCKET_WAIT_NONE = 0;
  ENET_SOCKET_WAIT_SEND = 1;
  ENET_SOCKET_WAIT_RECEIVE = 2;
  ENET_SOCKET_WAIT_INTERRUPT = 4;

type
  _ENetSocketOption = Integer;
  P_ENetSocketOption = ^_ENetSocketOption;

const
  ENET_SOCKOPT_NONBLOCK = 1;
  ENET_SOCKOPT_BROADCAST = 2;
  ENET_SOCKOPT_RCVBUF = 3;
  ENET_SOCKOPT_SNDBUF = 4;
  ENET_SOCKOPT_REUSEADDR = 5;
  ENET_SOCKOPT_RCVTIMEO = 6;
  ENET_SOCKOPT_SNDTIMEO = 7;
  ENET_SOCKOPT_ERROR = 8;
  ENET_SOCKOPT_NODELAY = 9;
  ENET_SOCKOPT_IPV6_V6ONLY = 10;

type
  _ENetSocketShutdown = Integer;
  P_ENetSocketShutdown = ^_ENetSocketShutdown;

const
  ENET_SOCKET_SHUTDOWN_READ = 0;
  ENET_SOCKET_SHUTDOWN_WRITE = 1;
  ENET_SOCKET_SHUTDOWN_READ_WRITE = 2;

type
  _ENetPacketFlag = Integer;
  P_ENetPacketFlag = ^_ENetPacketFlag;

const
  ENET_PACKET_FLAG_RELIABLE = 1;
  ENET_PACKET_FLAG_UNSEQUENCED = 2;
  ENET_PACKET_FLAG_NO_ALLOCATE = 4;
  ENET_PACKET_FLAG_UNRELIABLE_FRAGMENT = 8;
  ENET_PACKET_FLAG_SENT = 256;

type
  _ENetPeerState = Integer;
  P_ENetPeerState = ^_ENetPeerState;

const
  ENET_PEER_STATE_DISCONNECTED = 0;
  ENET_PEER_STATE_CONNECTING = 1;
  ENET_PEER_STATE_ACKNOWLEDGING_CONNECT = 2;
  ENET_PEER_STATE_CONNECTION_PENDING = 3;
  ENET_PEER_STATE_CONNECTION_SUCCEEDED = 4;
  ENET_PEER_STATE_CONNECTED = 5;
  ENET_PEER_STATE_DISCONNECT_LATER = 6;
  ENET_PEER_STATE_DISCONNECTING = 7;
  ENET_PEER_STATE_ACKNOWLEDGING_DISCONNECT = 8;
  ENET_PEER_STATE_ZOMBIE = 9;

const
  ENET_HOST_RECEIVE_BUFFER_SIZE = 262144;
  ENET_HOST_SEND_BUFFER_SIZE = 262144;
  ENET_HOST_BANDWIDTH_THROTTLE_INTERVAL = 1000;
  ENET_HOST_DEFAULT_MTU = 1392;
  ENET_HOST_DEFAULT_MAXIMUM_PACKET_SIZE = 33554432;
  ENET_HOST_DEFAULT_MAXIMUM_WAITING_DATA = 33554432;
  ENET_PEER_DEFAULT_ROUND_TRIP_TIME = 500;
  ENET_PEER_DEFAULT_PACKET_THROTTLE = 32;
  ENET_PEER_PACKET_THROTTLE_SCALE = 32;
  ENET_PEER_PACKET_THROTTLE_COUNTER = 7;
  ENET_PEER_PACKET_THROTTLE_ACCELERATION = 2;
  ENET_PEER_PACKET_THROTTLE_DECELERATION = 2;
  ENET_PEER_PACKET_THROTTLE_INTERVAL = 5000;
  ENET_PEER_PACKET_LOSS_SCALE = 65536;
  ENET_PEER_PACKET_LOSS_INTERVAL = 10000;
  ENET_PEER_WINDOW_SIZE_SCALE = 65536;
  ENET_PEER_TIMEOUT_LIMIT = 32;
  ENET_PEER_TIMEOUT_MINIMUM = 5000;
  ENET_PEER_TIMEOUT_MAXIMUM = 30000;
  ENET_PEER_PING_INTERVAL_ = 500;
  ENET_PEER_UNSEQUENCED_WINDOWS = 64;
  ENET_PEER_UNSEQUENCED_WINDOW_SIZE = 1024;
  ENET_PEER_FREE_UNSEQUENCED_WINDOWS = 32;
  ENET_PEER_RELIABLE_WINDOWS = 16;
  ENET_PEER_RELIABLE_WINDOW_SIZE = 4096;
  ENET_PEER_FREE_RELIABLE_WINDOWS = 8;

type
  _ENetEventType = Integer;
  P_ENetEventType = ^_ENetEventType;

const
  ENET_EVENT_TYPE_NONE = 0;
  ENET_EVENT_TYPE_CONNECT = 1;
  ENET_EVENT_TYPE_DISCONNECT = 2;
  ENET_EVENT_TYPE_RECEIVE = 3;
  ENET_EVENT_TYPE_DISCONNECT_TIMEOUT = 4;

const
  STBI_default = 0;
  STBI_grey = 1;
  STBI_grey_alpha = 2;
  STBI_rgb = 3;
  STBI_rgb_alpha = 4;

const
  STBRP_HEURISTIC_Skyline_default = 0;
  STBRP_HEURISTIC_Skyline_BL_sortHeight = 0;
  STBRP_HEURISTIC_Skyline_BF_sortHeight = 1;

const
  STBTT_vmove = 1;
  STBTT_vline = 2;
  STBTT_vcurve = 3;
  STBTT_vcubic = 4;

const
  STBTT_PLATFORM_ID_UNICODE = 0;
  STBTT_PLATFORM_ID_MAC = 1;
  STBTT_PLATFORM_ID_ISO = 2;
  STBTT_PLATFORM_ID_MICROSOFT = 3;

const
  STBTT_UNICODE_EID_UNICODE_1_0 = 0;
  STBTT_UNICODE_EID_UNICODE_1_1 = 1;
  STBTT_UNICODE_EID_ISO_10646 = 2;
  STBTT_UNICODE_EID_UNICODE_2_0_BMP = 3;
  STBTT_UNICODE_EID_UNICODE_2_0_FULL = 4;

const
  STBTT_MS_EID_SYMBOL = 0;
  STBTT_MS_EID_UNICODE_BMP = 1;
  STBTT_MS_EID_SHIFTJIS = 2;
  STBTT_MS_EID_UNICODE_FULL = 10;

const
  STBTT_MAC_EID_ROMAN = 0;
  STBTT_MAC_EID_ARABIC = 4;
  STBTT_MAC_EID_JAPANESE = 1;
  STBTT_MAC_EID_HEBREW = 5;
  STBTT_MAC_EID_CHINESE_TRAD = 2;
  STBTT_MAC_EID_GREEK = 6;
  STBTT_MAC_EID_KOREAN = 3;
  STBTT_MAC_EID_RUSSIAN = 7;

const
  STBTT_MS_LANG_ENGLISH = 1033;
  STBTT_MS_LANG_ITALIAN = 1040;
  STBTT_MS_LANG_CHINESE = 2052;
  STBTT_MS_LANG_JAPANESE = 1041;
  STBTT_MS_LANG_DUTCH = 1043;
  STBTT_MS_LANG_KOREAN = 1042;
  STBTT_MS_LANG_FRENCH = 1036;
  STBTT_MS_LANG_RUSSIAN = 1049;
  STBTT_MS_LANG_GERMAN = 1031;
  STBTT_MS_LANG_SPANISH = 1033;
  STBTT_MS_LANG_HEBREW = 1037;
  STBTT_MS_LANG_SWEDISH = 1053;

const
  STBTT_MAC_LANG_ENGLISH = 0;
  STBTT_MAC_LANG_JAPANESE = 11;
  STBTT_MAC_LANG_ARABIC = 12;
  STBTT_MAC_LANG_KOREAN = 23;
  STBTT_MAC_LANG_DUTCH = 4;
  STBTT_MAC_LANG_RUSSIAN = 32;
  STBTT_MAC_LANG_FRENCH = 1;
  STBTT_MAC_LANG_SPANISH = 6;
  STBTT_MAC_LANG_GERMAN = 2;
  STBTT_MAC_LANG_SWEDISH = 5;
  STBTT_MAC_LANG_HEBREW = 10;
  STBTT_MAC_LANG_CHINESE_SIMPLIFIED = 33;
  STBTT_MAC_LANG_ITALIAN = 3;
  STBTT_MAC_LANG_CHINESE_TRAD = 19;

type
  ma_log_level = Integer;
  Pma_log_level = ^ma_log_level;

const
  MA_LOG_LEVEL_DEBUG = 4;
  MA_LOG_LEVEL_INFO = 3;
  MA_LOG_LEVEL_WARNING = 2;
  MA_LOG_LEVEL_ERROR = 1;

type
  _ma_channel_position = Integer;
  P_ma_channel_position = ^_ma_channel_position;

const
  MA_CHANNEL_NONE = 0;
  MA_CHANNEL_MONO = 1;
  MA_CHANNEL_FRONT_LEFT = 2;
  MA_CHANNEL_FRONT_RIGHT = 3;
  MA_CHANNEL_FRONT_CENTER = 4;
  MA_CHANNEL_LFE = 5;
  MA_CHANNEL_BACK_LEFT = 6;
  MA_CHANNEL_BACK_RIGHT = 7;
  MA_CHANNEL_FRONT_LEFT_CENTER = 8;
  MA_CHANNEL_FRONT_RIGHT_CENTER = 9;
  MA_CHANNEL_BACK_CENTER = 10;
  MA_CHANNEL_SIDE_LEFT = 11;
  MA_CHANNEL_SIDE_RIGHT = 12;
  MA_CHANNEL_TOP_CENTER = 13;
  MA_CHANNEL_TOP_FRONT_LEFT = 14;
  MA_CHANNEL_TOP_FRONT_CENTER = 15;
  MA_CHANNEL_TOP_FRONT_RIGHT = 16;
  MA_CHANNEL_TOP_BACK_LEFT = 17;
  MA_CHANNEL_TOP_BACK_CENTER = 18;
  MA_CHANNEL_TOP_BACK_RIGHT = 19;
  MA_CHANNEL_AUX_0 = 20;
  MA_CHANNEL_AUX_1 = 21;
  MA_CHANNEL_AUX_2 = 22;
  MA_CHANNEL_AUX_3 = 23;
  MA_CHANNEL_AUX_4 = 24;
  MA_CHANNEL_AUX_5 = 25;
  MA_CHANNEL_AUX_6 = 26;
  MA_CHANNEL_AUX_7 = 27;
  MA_CHANNEL_AUX_8 = 28;
  MA_CHANNEL_AUX_9 = 29;
  MA_CHANNEL_AUX_10 = 30;
  MA_CHANNEL_AUX_11 = 31;
  MA_CHANNEL_AUX_12 = 32;
  MA_CHANNEL_AUX_13 = 33;
  MA_CHANNEL_AUX_14 = 34;
  MA_CHANNEL_AUX_15 = 35;
  MA_CHANNEL_AUX_16 = 36;
  MA_CHANNEL_AUX_17 = 37;
  MA_CHANNEL_AUX_18 = 38;
  MA_CHANNEL_AUX_19 = 39;
  MA_CHANNEL_AUX_20 = 40;
  MA_CHANNEL_AUX_21 = 41;
  MA_CHANNEL_AUX_22 = 42;
  MA_CHANNEL_AUX_23 = 43;
  MA_CHANNEL_AUX_24 = 44;
  MA_CHANNEL_AUX_25 = 45;
  MA_CHANNEL_AUX_26 = 46;
  MA_CHANNEL_AUX_27 = 47;
  MA_CHANNEL_AUX_28 = 48;
  MA_CHANNEL_AUX_29 = 49;
  MA_CHANNEL_AUX_30 = 50;
  MA_CHANNEL_AUX_31 = 51;
  MA_CHANNEL_LEFT = 2;
  MA_CHANNEL_RIGHT = 3;
  MA_CHANNEL_POSITION_COUNT = 52;

type
  ma_result = Integer;
  Pma_result = ^ma_result;

const
  MA_SUCCESS = 0;
  MA_ERROR = -1;
  MA_INVALID_ARGS = -2;
  MA_INVALID_OPERATION = -3;
  MA_OUT_OF_MEMORY = -4;
  MA_OUT_OF_RANGE = -5;
  MA_ACCESS_DENIED = -6;
  MA_DOES_NOT_EXIST = -7;
  MA_ALREADY_EXISTS = -8;
  MA_TOO_MANY_OPEN_FILES = -9;
  MA_INVALID_FILE = -10;
  MA_TOO_BIG = -11;
  MA_PATH_TOO_LONG = -12;
  MA_NAME_TOO_LONG = -13;
  MA_NOT_DIRECTORY = -14;
  MA_IS_DIRECTORY = -15;
  MA_DIRECTORY_NOT_EMPTY = -16;
  MA_AT_END = -17;
  MA_NO_SPACE = -18;
  MA_BUSY = -19;
  MA_IO_ERROR = -20;
  MA_INTERRUPT = -21;
  MA_UNAVAILABLE = -22;
  MA_ALREADY_IN_USE = -23;
  MA_BAD_ADDRESS = -24;
  MA_BAD_SEEK = -25;
  MA_BAD_PIPE = -26;
  MA_DEADLOCK = -27;
  MA_TOO_MANY_LINKS = -28;
  MA_NOT_IMPLEMENTED = -29;
  MA_NO_MESSAGE = -30;
  MA_BAD_MESSAGE = -31;
  MA_NO_DATA_AVAILABLE = -32;
  MA_INVALID_DATA = -33;
  MA_TIMEOUT = -34;
  MA_NO_NETWORK = -35;
  MA_NOT_UNIQUE = -36;
  MA_NOT_SOCKET = -37;
  MA_NO_ADDRESS = -38;
  MA_BAD_PROTOCOL = -39;
  MA_PROTOCOL_UNAVAILABLE = -40;
  MA_PROTOCOL_NOT_SUPPORTED = -41;
  MA_PROTOCOL_FAMILY_NOT_SUPPORTED = -42;
  MA_ADDRESS_FAMILY_NOT_SUPPORTED = -43;
  MA_SOCKET_NOT_SUPPORTED = -44;
  MA_CONNECTION_RESET = -45;
  MA_ALREADY_CONNECTED = -46;
  MA_NOT_CONNECTED = -47;
  MA_CONNECTION_REFUSED = -48;
  MA_NO_HOST = -49;
  MA_IN_PROGRESS = -50;
  MA_CANCELLED = -51;
  MA_MEMORY_ALREADY_MAPPED = -52;
  MA_CRC_MISMATCH = -100;
  MA_FORMAT_NOT_SUPPORTED = -200;
  MA_DEVICE_TYPE_NOT_SUPPORTED = -201;
  MA_SHARE_MODE_NOT_SUPPORTED = -202;
  MA_NO_BACKEND = -203;
  MA_NO_DEVICE = -204;
  MA_API_NOT_FOUND = -205;
  MA_INVALID_DEVICE_CONFIG = -206;
  MA_LOOP = -207;
  MA_BACKEND_NOT_ENABLED = -208;
  MA_DEVICE_NOT_INITIALIZED = -300;
  MA_DEVICE_ALREADY_INITIALIZED = -301;
  MA_DEVICE_NOT_STARTED = -302;
  MA_DEVICE_NOT_STOPPED = -303;
  MA_FAILED_TO_INIT_BACKEND = -400;
  MA_FAILED_TO_OPEN_BACKEND_DEVICE = -401;
  MA_FAILED_TO_START_BACKEND_DEVICE = -402;
  MA_FAILED_TO_STOP_BACKEND_DEVICE = -403;

type
  ma_stream_format = Integer;
  Pma_stream_format = ^ma_stream_format;

const
  ma_stream_format_pcm = 0;

type
  ma_stream_layout = Integer;
  Pma_stream_layout = ^ma_stream_layout;

const
  ma_stream_layout_interleaved = 0;
  ma_stream_layout_deinterleaved = 1;

type
  ma_dither_mode = Integer;
  Pma_dither_mode = ^ma_dither_mode;

const
  ma_dither_mode_none = 0;
  ma_dither_mode_rectangle = 1;
  ma_dither_mode_triangle = 2;

type
  ma_format = Integer;
  Pma_format = ^ma_format;

const
  ma_format_unknown = 0;
  ma_format_u8 = 1;
  ma_format_s16 = 2;
  ma_format_s24 = 3;
  ma_format_s32 = 4;
  ma_format_f32 = 5;
  ma_format_count = 6;

type
  ma_standard_sample_rate = Integer;
  Pma_standard_sample_rate = ^ma_standard_sample_rate;

const
  ma_standard_sample_rate_48000 = 48000;
  ma_standard_sample_rate_44100 = 44100;
  ma_standard_sample_rate_32000 = 32000;
  ma_standard_sample_rate_24000 = 24000;
  ma_standard_sample_rate_22050 = 22050;
  ma_standard_sample_rate_88200 = 88200;
  ma_standard_sample_rate_96000 = 96000;
  ma_standard_sample_rate_176400 = 176400;
  ma_standard_sample_rate_192000 = 192000;
  ma_standard_sample_rate_16000 = 16000;
  ma_standard_sample_rate_11025 = 11025;
  ma_standard_sample_rate_8000 = 8000;
  ma_standard_sample_rate_352800 = 352800;
  ma_standard_sample_rate_384000 = 384000;
  ma_standard_sample_rate_min = 8000;
  ma_standard_sample_rate_max = 384000;
  ma_standard_sample_rate_count = 14;

type
  ma_channel_mix_mode = Integer;
  Pma_channel_mix_mode = ^ma_channel_mix_mode;

const
  ma_channel_mix_mode_rectangular = 0;
  ma_channel_mix_mode_simple = 1;
  ma_channel_mix_mode_custom_weights = 2;
  ma_channel_mix_mode_default = 0;

type
  ma_standard_channel_map = Integer;
  Pma_standard_channel_map = ^ma_standard_channel_map;

const
  ma_standard_channel_map_microsoft = 0;
  ma_standard_channel_map_alsa = 1;
  ma_standard_channel_map_rfc3551 = 2;
  ma_standard_channel_map_flac = 3;
  ma_standard_channel_map_vorbis = 4;
  ma_standard_channel_map_sound4 = 5;
  ma_standard_channel_map_sndio = 6;
  ma_standard_channel_map_webaudio = 3;
  ma_standard_channel_map_default = 0;

type
  ma_performance_profile = Integer;
  Pma_performance_profile = ^ma_performance_profile;

const
  ma_performance_profile_low_latency = 0;
  ma_performance_profile_conservative = 1;

type
  ma_thread_priority = Integer;
  Pma_thread_priority = ^ma_thread_priority;

const
  ma_thread_priority_idle = -5;
  ma_thread_priority_lowest = -4;
  ma_thread_priority_low = -3;
  ma_thread_priority_normal = -2;
  ma_thread_priority_high = -1;
  ma_thread_priority_highest = 0;
  ma_thread_priority_realtime = 1;
  ma_thread_priority_default = 0;

type
  ma_pan_mode = Integer;
  Pma_pan_mode = ^ma_pan_mode;

const
  ma_pan_mode_balance = 0;
  ma_pan_mode_pan = 1;

type
  ma_attenuation_model = Integer;
  Pma_attenuation_model = ^ma_attenuation_model;

const
  ma_attenuation_model_none = 0;
  ma_attenuation_model_inverse = 1;
  ma_attenuation_model_linear = 2;
  ma_attenuation_model_exponential = 3;

type
  ma_positioning = Integer;
  Pma_positioning = ^ma_positioning;

const
  ma_positioning_absolute = 0;
  ma_positioning_relative = 1;

type
  ma_handedness = Integer;
  Pma_handedness = ^ma_handedness;

const
  ma_handedness_right = 0;
  ma_handedness_left = 1;

type
  ma_resample_algorithm = Integer;
  Pma_resample_algorithm = ^ma_resample_algorithm;

const
  ma_resample_algorithm_linear = 0;
  ma_resample_algorithm_custom = 1;

type
  ma_channel_conversion_path = Integer;
  Pma_channel_conversion_path = ^ma_channel_conversion_path;

const
  ma_channel_conversion_path_unknown = 0;
  ma_channel_conversion_path_passthrough = 1;
  ma_channel_conversion_path_mono_out = 2;
  ma_channel_conversion_path_mono_in = 3;
  ma_channel_conversion_path_shuffle = 4;
  ma_channel_conversion_path_weights = 5;

type
  ma_mono_expansion_mode = Integer;
  Pma_mono_expansion_mode = ^ma_mono_expansion_mode;

const
  ma_mono_expansion_mode_duplicate = 0;
  ma_mono_expansion_mode_average = 1;
  ma_mono_expansion_mode_stereo_only = 2;
  ma_mono_expansion_mode_default = 0;

type
  ma_data_converter_execution_path = Integer;
  Pma_data_converter_execution_path = ^ma_data_converter_execution_path;

const
  ma_data_converter_execution_path_passthrough = 0;
  ma_data_converter_execution_path_format_only = 1;
  ma_data_converter_execution_path_channels_only = 2;
  ma_data_converter_execution_path_resample_only = 3;
  ma_data_converter_execution_path_resample_first = 4;
  ma_data_converter_execution_path_channels_first = 5;

type
  ma_job_type = Integer;
  Pma_job_type = ^ma_job_type;

const
  MA_JOB_TYPE_QUIT = 0;
  MA_JOB_TYPE_CUSTOM = 1;
  MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_BUFFER_NODE = 2;
  MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_BUFFER_NODE = 3;
  MA_JOB_TYPE_RESOURCE_MANAGER_PAGE_DATA_BUFFER_NODE = 4;
  MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_BUFFER = 5;
  MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_BUFFER = 6;
  MA_JOB_TYPE_RESOURCE_MANAGER_LOAD_DATA_STREAM = 7;
  MA_JOB_TYPE_RESOURCE_MANAGER_FREE_DATA_STREAM = 8;
  MA_JOB_TYPE_RESOURCE_MANAGER_PAGE_DATA_STREAM = 9;
  MA_JOB_TYPE_RESOURCE_MANAGER_SEEK_DATA_STREAM = 10;
  MA_JOB_TYPE_DEVICE_AAUDIO_REROUTE = 11;
  MA_JOB_TYPE_COUNT = 12;

type
  ma_job_queue_flags = Integer;
  Pma_job_queue_flags = ^ma_job_queue_flags;

const
  MA_JOB_QUEUE_FLAG_NON_BLOCKING = 1;

const
  MA_JOB_TYPE_RESOURCE_MANAGER_QUEUE_FLAG_NON_BLOCKING = MA_JOB_QUEUE_FLAG_NON_BLOCKING;

type
  ma_device_state = Integer;
  Pma_device_state = ^ma_device_state;

const
  ma_device_state_uninitialized = 0;
  ma_device_state_stopped = 1;
  ma_device_state_started = 2;
  ma_device_state_starting = 3;
  ma_device_state_stopping = 4;

type
  ma_backend = Integer;
  Pma_backend = ^ma_backend;

const
  ma_backend_wasapi = 0;
  ma_backend_dsound = 1;
  ma_backend_winmm = 2;
  ma_backend_coreaudio = 3;
  ma_backend_sndio = 4;
  ma_backend_audio4 = 5;
  ma_backend_oss = 6;
  ma_backend_pulseaudio = 7;
  ma_backend_alsa = 8;
  ma_backend_jack = 9;
  ma_backend_aaudio = 10;
  ma_backend_opensl = 11;
  ma_backend_webaudio = 12;
  ma_backend_custom = 13;
  ma_backend_null = 14;

type
  ma_device_notification_type = Integer;
  Pma_device_notification_type = ^ma_device_notification_type;

const
  ma_device_notification_type_started = 0;
  ma_device_notification_type_stopped = 1;
  ma_device_notification_type_rerouted = 2;
  ma_device_notification_type_interruption_began = 3;
  ma_device_notification_type_interruption_ended = 4;
  ma_device_notification_type_unlocked = 5;

type
  ma_device_type = Integer;
  Pma_device_type = ^ma_device_type;

const
  ma_device_type_playback = 1;
  ma_device_type_capture = 2;
  ma_device_type_duplex = 3;
  ma_device_type_loopback = 4;

type
  ma_share_mode = Integer;
  Pma_share_mode = ^ma_share_mode;

const
  ma_share_mode_shared = 0;
  ma_share_mode_exclusive = 1;

type
  ma_ios_session_category = Integer;
  Pma_ios_session_category = ^ma_ios_session_category;

const
  ma_ios_session_category_default = 0;
  ma_ios_session_category_none = 1;
  ma_ios_session_category_ambient = 2;
  ma_ios_session_category_solo_ambient = 3;
  ma_ios_session_category_playback = 4;
  ma_ios_session_category_record = 5;
  ma_ios_session_category_play_and_record = 6;
  ma_ios_session_category_multi_route = 7;

type
  ma_ios_session_category_option = Integer;
  Pma_ios_session_category_option = ^ma_ios_session_category_option;

const
  ma_ios_session_category_option_mix_with_others = 1;
  ma_ios_session_category_option_duck_others = 2;
  ma_ios_session_category_option_allow_bluetooth = 4;
  ma_ios_session_category_option_default_to_speaker = 8;
  ma_ios_session_category_option_interrupt_spoken_audio_and_mix_with_others = 17;
  ma_ios_session_category_option_allow_bluetooth_a2dp = 32;
  ma_ios_session_category_option_allow_air_play = 64;

type
  ma_opensl_stream_type = Integer;
  Pma_opensl_stream_type = ^ma_opensl_stream_type;

const
  ma_opensl_stream_type_default = 0;
  ma_opensl_stream_type_voice = 1;
  ma_opensl_stream_type_system = 2;
  ma_opensl_stream_type_ring = 3;
  ma_opensl_stream_type_media = 4;
  ma_opensl_stream_type_alarm = 5;
  ma_opensl_stream_type_notification = 6;

type
  ma_opensl_recording_preset = Integer;
  Pma_opensl_recording_preset = ^ma_opensl_recording_preset;

const
  ma_opensl_recording_preset_default = 0;
  ma_opensl_recording_preset_generic = 1;
  ma_opensl_recording_preset_camcorder = 2;
  ma_opensl_recording_preset_voice_recognition = 3;
  ma_opensl_recording_preset_voice_communication = 4;
  ma_opensl_recording_preset_voice_unprocessed = 5;

type
  ma_wasapi_usage = Integer;
  Pma_wasapi_usage = ^ma_wasapi_usage;

const
  ma_wasapi_usage_default = 0;
  ma_wasapi_usage_games = 1;
  ma_wasapi_usage_pro_audio = 2;

type
  ma_aaudio_usage = Integer;
  Pma_aaudio_usage = ^ma_aaudio_usage;

const
  ma_aaudio_usage_default = 0;
  ma_aaudio_usage_media = 1;
  ma_aaudio_usage_voice_communication = 2;
  ma_aaudio_usage_voice_communication_signalling = 3;
  ma_aaudio_usage_alarm = 4;
  ma_aaudio_usage_notification = 5;
  ma_aaudio_usage_notification_ringtone = 6;
  ma_aaudio_usage_notification_event = 7;
  ma_aaudio_usage_assistance_accessibility = 8;
  ma_aaudio_usage_assistance_navigation_guidance = 9;
  ma_aaudio_usage_assistance_sonification = 10;
  ma_aaudio_usage_game = 11;
  ma_aaudio_usage_assitant = 12;
  ma_aaudio_usage_emergency = 13;
  ma_aaudio_usage_safety = 14;
  ma_aaudio_usage_vehicle_status = 15;
  ma_aaudio_usage_announcement = 16;

type
  ma_aaudio_content_type = Integer;
  Pma_aaudio_content_type = ^ma_aaudio_content_type;

const
  ma_aaudio_content_type_default = 0;
  ma_aaudio_content_type_speech = 1;
  ma_aaudio_content_type_music = 2;
  ma_aaudio_content_type_movie = 3;
  ma_aaudio_content_type_sonification = 4;

type
  ma_aaudio_input_preset = Integer;
  Pma_aaudio_input_preset = ^ma_aaudio_input_preset;

const
  ma_aaudio_input_preset_default = 0;
  ma_aaudio_input_preset_generic = 1;
  ma_aaudio_input_preset_camcorder = 2;
  ma_aaudio_input_preset_voice_recognition = 3;
  ma_aaudio_input_preset_voice_communication = 4;
  ma_aaudio_input_preset_unprocessed = 5;
  ma_aaudio_input_preset_voice_performance = 6;

type
  ma_aaudio_allowed_capture_policy = Integer;
  Pma_aaudio_allowed_capture_policy = ^ma_aaudio_allowed_capture_policy;

const
  ma_aaudio_allow_capture_default = 0;
  ma_aaudio_allow_capture_by_all = 1;
  ma_aaudio_allow_capture_by_system = 2;
  ma_aaudio_allow_capture_by_none = 3;

type
  ma_open_mode_flags = Integer;
  Pma_open_mode_flags = ^ma_open_mode_flags;

const
  MA_OPEN_MODE_READ = 1;
  MA_OPEN_MODE_WRITE = 2;

type
  ma_seek_origin = Integer;
  Pma_seek_origin = ^ma_seek_origin;

const
  ma_seek_origin_start = 0;
  ma_seek_origin_current = 1;
  ma_seek_origin_end = 2;

type
  ma_encoding_format = Integer;
  Pma_encoding_format = ^ma_encoding_format;

const
  ma_encoding_format_unknown = 0;
  ma_encoding_format_wav = 1;
  ma_encoding_format_flac = 2;
  ma_encoding_format_mp3 = 3;
  ma_encoding_format_vorbis = 4;

type
  ma_waveform_type = Integer;
  Pma_waveform_type = ^ma_waveform_type;

const
  ma_waveform_type_sine = 0;
  ma_waveform_type_square = 1;
  ma_waveform_type_triangle = 2;
  ma_waveform_type_sawtooth = 3;

type
  ma_noise_type = Integer;
  Pma_noise_type = ^ma_noise_type;

const
  ma_noise_type_white = 0;
  ma_noise_type_pink = 1;
  ma_noise_type_brownian = 2;

type
  ma_resource_manager_data_source_flags = Integer;
  Pma_resource_manager_data_source_flags = ^ma_resource_manager_data_source_flags;

const
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_STREAM = 1;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_DECODE = 2;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_ASYNC = 4;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_WAIT_INIT = 8;
  MA_RESOURCE_MANAGER_DATA_SOURCE_FLAG_UNKNOWN_LENGTH = 16;

type
  ma_resource_manager_flags = Integer;
  Pma_resource_manager_flags = ^ma_resource_manager_flags;

const
  MA_RESOURCE_MANAGER_FLAG_NON_BLOCKING = 1;
  MA_RESOURCE_MANAGER_FLAG_NO_THREADING = 2;

type
  ma_resource_manager_data_supply_type = Integer;
  Pma_resource_manager_data_supply_type = ^ma_resource_manager_data_supply_type;

const
  ma_resource_manager_data_supply_type_unknown = 0;
  ma_resource_manager_data_supply_type_encoded = 1;
  ma_resource_manager_data_supply_type_decoded = 2;
  ma_resource_manager_data_supply_type_decoded_paged = 3;

type
  ma_node_flags = Integer;
  Pma_node_flags = ^ma_node_flags;

const
  MA_NODE_FLAG_PASSTHROUGH = 1;
  MA_NODE_FLAG_CONTINUOUS_PROCESSING = 2;
  MA_NODE_FLAG_ALLOW_NULL_INPUT = 4;
  MA_NODE_FLAG_DIFFERENT_PROCESSING_RATES = 8;
  MA_NODE_FLAG_SILENT_OUTPUT = 16;

type
  ma_node_state = Integer;
  Pma_node_state = ^ma_node_state;

const
  ma_node_state_started = 0;
  ma_node_state_stopped = 1;

type
  ma_sound_flags = Integer;
  Pma_sound_flags = ^ma_sound_flags;

const
  MA_SOUND_FLAG_STREAM = 1;
  MA_SOUND_FLAG_DECODE = 2;
  MA_SOUND_FLAG_ASYNC = 4;
  MA_SOUND_FLAG_WAIT_INIT = 8;
  MA_SOUND_FLAG_UNKNOWN_LENGTH = 16;
  MA_SOUND_FLAG_NO_DEFAULT_ATTACHMENT = 4096;
  MA_SOUND_FLAG_NO_PITCH = 8192;
  MA_SOUND_FLAG_NO_SPATIALIZATION = 16384;

type
  ma_engine_node_type = Integer;
  Pma_engine_node_type = ^ma_engine_node_type;

const
  ma_engine_node_type_sound = 0;
  ma_engine_node_type_group = 1;

type
  ImGuiWindowFlags_ = Integer;
  PImGuiWindowFlags_ = ^ImGuiWindowFlags_;

const
  ImGuiWindowFlags_None = 0;
  ImGuiWindowFlags_NoTitleBar = 1;
  ImGuiWindowFlags_NoResize = 2;
  ImGuiWindowFlags_NoMove = 4;
  ImGuiWindowFlags_NoScrollbar = 8;
  ImGuiWindowFlags_NoScrollWithMouse = 16;
  ImGuiWindowFlags_NoCollapse = 32;
  ImGuiWindowFlags_AlwaysAutoResize = 64;
  ImGuiWindowFlags_NoBackground = 128;
  ImGuiWindowFlags_NoSavedSettings = 256;
  ImGuiWindowFlags_NoMouseInputs = 512;
  ImGuiWindowFlags_MenuBar = 1024;
  ImGuiWindowFlags_HorizontalScrollbar = 2048;
  ImGuiWindowFlags_NoFocusOnAppearing = 4096;
  ImGuiWindowFlags_NoBringToFrontOnFocus = 8192;
  ImGuiWindowFlags_AlwaysVerticalScrollbar = 16384;
  ImGuiWindowFlags_AlwaysHorizontalScrollbar = 32768;
  ImGuiWindowFlags_NoNavInputs = 65536;
  ImGuiWindowFlags_NoNavFocus = 131072;
  ImGuiWindowFlags_UnsavedDocument = 262144;
  ImGuiWindowFlags_NoDocking = 524288;
  ImGuiWindowFlags_NoNav = 196608;
  ImGuiWindowFlags_NoDecoration = 43;
  ImGuiWindowFlags_NoInputs = 197120;
  ImGuiWindowFlags_NavFlattened = 8388608;
  ImGuiWindowFlags_ChildWindow = 16777216;
  ImGuiWindowFlags_Tooltip = 33554432;
  ImGuiWindowFlags_Popup = 67108864;
  ImGuiWindowFlags_Modal = 134217728;
  ImGuiWindowFlags_ChildMenu = 268435456;
  ImGuiWindowFlags_DockNodeHost = 536870912;

type
  ImGuiChildFlags_ = Integer;
  PImGuiChildFlags_ = ^ImGuiChildFlags_;

const
  ImGuiChildFlags_None = 0;
  ImGuiChildFlags_Border = 1;
  ImGuiChildFlags_AlwaysUseWindowPadding = 2;
  ImGuiChildFlags_ResizeX = 4;
  ImGuiChildFlags_ResizeY = 8;
  ImGuiChildFlags_AutoResizeX = 16;
  ImGuiChildFlags_AutoResizeY = 32;
  ImGuiChildFlags_AlwaysAutoResize = 64;
  ImGuiChildFlags_FrameStyle = 128;

type
  ImGuiInputTextFlags_ = Integer;
  PImGuiInputTextFlags_ = ^ImGuiInputTextFlags_;

const
  ImGuiInputTextFlags_None = 0;
  ImGuiInputTextFlags_CharsDecimal = 1;
  ImGuiInputTextFlags_CharsHexadecimal = 2;
  ImGuiInputTextFlags_CharsUppercase = 4;
  ImGuiInputTextFlags_CharsNoBlank = 8;
  ImGuiInputTextFlags_AutoSelectAll = 16;
  ImGuiInputTextFlags_EnterReturnsTrue = 32;
  ImGuiInputTextFlags_CallbackCompletion = 64;
  ImGuiInputTextFlags_CallbackHistory = 128;
  ImGuiInputTextFlags_CallbackAlways = 256;
  ImGuiInputTextFlags_CallbackCharFilter = 512;
  ImGuiInputTextFlags_AllowTabInput = 1024;
  ImGuiInputTextFlags_CtrlEnterForNewLine = 2048;
  ImGuiInputTextFlags_NoHorizontalScroll = 4096;
  ImGuiInputTextFlags_AlwaysOverwrite = 8192;
  ImGuiInputTextFlags_ReadOnly = 16384;
  ImGuiInputTextFlags_Password = 32768;
  ImGuiInputTextFlags_NoUndoRedo = 65536;
  ImGuiInputTextFlags_CharsScientific = 131072;
  ImGuiInputTextFlags_CallbackResize = 262144;
  ImGuiInputTextFlags_CallbackEdit = 524288;
  ImGuiInputTextFlags_EscapeClearsAll = 1048576;

type
  ImGuiTreeNodeFlags_ = Integer;
  PImGuiTreeNodeFlags_ = ^ImGuiTreeNodeFlags_;

const
  ImGuiTreeNodeFlags_None = 0;
  ImGuiTreeNodeFlags_Selected = 1;
  ImGuiTreeNodeFlags_Framed = 2;
  ImGuiTreeNodeFlags_AllowOverlap = 4;
  ImGuiTreeNodeFlags_NoTreePushOnOpen = 8;
  ImGuiTreeNodeFlags_NoAutoOpenOnLog = 16;
  ImGuiTreeNodeFlags_DefaultOpen = 32;
  ImGuiTreeNodeFlags_OpenOnDoubleClick = 64;
  ImGuiTreeNodeFlags_OpenOnArrow = 128;
  ImGuiTreeNodeFlags_Leaf = 256;
  ImGuiTreeNodeFlags_Bullet = 512;
  ImGuiTreeNodeFlags_FramePadding = 1024;
  ImGuiTreeNodeFlags_SpanAvailWidth = 2048;
  ImGuiTreeNodeFlags_SpanFullWidth = 4096;
  ImGuiTreeNodeFlags_SpanAllColumns = 8192;
  ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 16384;
  ImGuiTreeNodeFlags_CollapsingHeader = 26;

type
  ImGuiPopupFlags_ = Integer;
  PImGuiPopupFlags_ = ^ImGuiPopupFlags_;

const
  ImGuiPopupFlags_None = 0;
  ImGuiPopupFlags_MouseButtonLeft = 0;
  ImGuiPopupFlags_MouseButtonRight = 1;
  ImGuiPopupFlags_MouseButtonMiddle = 2;
  ImGuiPopupFlags_MouseButtonMask_ = 31;
  ImGuiPopupFlags_MouseButtonDefault_ = 1;
  ImGuiPopupFlags_NoReopen = 32;
  ImGuiPopupFlags_NoOpenOverExistingPopup = 128;
  ImGuiPopupFlags_NoOpenOverItems = 256;
  ImGuiPopupFlags_AnyPopupId = 1024;
  ImGuiPopupFlags_AnyPopupLevel = 2048;
  ImGuiPopupFlags_AnyPopup = 3072;

type
  ImGuiSelectableFlags_ = Integer;
  PImGuiSelectableFlags_ = ^ImGuiSelectableFlags_;

const
  ImGuiSelectableFlags_None = 0;
  ImGuiSelectableFlags_DontClosePopups = 1;
  ImGuiSelectableFlags_SpanAllColumns = 2;
  ImGuiSelectableFlags_AllowDoubleClick = 4;
  ImGuiSelectableFlags_Disabled = 8;
  ImGuiSelectableFlags_AllowOverlap = 16;

type
  ImGuiComboFlags_ = Integer;
  PImGuiComboFlags_ = ^ImGuiComboFlags_;

const
  ImGuiComboFlags_None = 0;
  ImGuiComboFlags_PopupAlignLeft = 1;
  ImGuiComboFlags_HeightSmall = 2;
  ImGuiComboFlags_HeightRegular = 4;
  ImGuiComboFlags_HeightLarge = 8;
  ImGuiComboFlags_HeightLargest = 16;
  ImGuiComboFlags_NoArrowButton = 32;
  ImGuiComboFlags_NoPreview = 64;
  ImGuiComboFlags_WidthFitPreview = 128;
  ImGuiComboFlags_HeightMask_ = 30;

type
  ImGuiTabBarFlags_ = Integer;
  PImGuiTabBarFlags_ = ^ImGuiTabBarFlags_;

const
  ImGuiTabBarFlags_None = 0;
  ImGuiTabBarFlags_Reorderable = 1;
  ImGuiTabBarFlags_AutoSelectNewTabs = 2;
  ImGuiTabBarFlags_TabListPopupButton = 4;
  ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 8;
  ImGuiTabBarFlags_NoTabListScrollingButtons = 16;
  ImGuiTabBarFlags_NoTooltip = 32;
  ImGuiTabBarFlags_FittingPolicyResizeDown = 64;
  ImGuiTabBarFlags_FittingPolicyScroll = 128;
  ImGuiTabBarFlags_FittingPolicyMask_ = 192;
  ImGuiTabBarFlags_FittingPolicyDefault_ = 64;

type
  ImGuiTabItemFlags_ = Integer;
  PImGuiTabItemFlags_ = ^ImGuiTabItemFlags_;

const
  ImGuiTabItemFlags_None = 0;
  ImGuiTabItemFlags_UnsavedDocument = 1;
  ImGuiTabItemFlags_SetSelected = 2;
  ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 4;
  ImGuiTabItemFlags_NoPushId = 8;
  ImGuiTabItemFlags_NoTooltip = 16;
  ImGuiTabItemFlags_NoReorder = 32;
  ImGuiTabItemFlags_Leading = 64;
  ImGuiTabItemFlags_Trailing = 128;
  ImGuiTabItemFlags_NoAssumedClosure = 256;

type
  ImGuiFocusedFlags_ = Integer;
  PImGuiFocusedFlags_ = ^ImGuiFocusedFlags_;

const
  ImGuiFocusedFlags_None = 0;
  ImGuiFocusedFlags_ChildWindows = 1;
  ImGuiFocusedFlags_RootWindow = 2;
  ImGuiFocusedFlags_AnyWindow = 4;
  ImGuiFocusedFlags_NoPopupHierarchy = 8;
  ImGuiFocusedFlags_DockHierarchy = 16;
  ImGuiFocusedFlags_RootAndChildWindows = 3;

type
  ImGuiHoveredFlags_ = Integer;
  PImGuiHoveredFlags_ = ^ImGuiHoveredFlags_;

const
  ImGuiHoveredFlags_None = 0;
  ImGuiHoveredFlags_ChildWindows = 1;
  ImGuiHoveredFlags_RootWindow = 2;
  ImGuiHoveredFlags_AnyWindow = 4;
  ImGuiHoveredFlags_NoPopupHierarchy = 8;
  ImGuiHoveredFlags_DockHierarchy = 16;
  ImGuiHoveredFlags_AllowWhenBlockedByPopup = 32;
  ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 128;
  ImGuiHoveredFlags_AllowWhenOverlappedByItem = 256;
  ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 512;
  ImGuiHoveredFlags_AllowWhenDisabled = 1024;
  ImGuiHoveredFlags_NoNavOverride = 2048;
  ImGuiHoveredFlags_AllowWhenOverlapped = 768;
  ImGuiHoveredFlags_RectOnly = 928;
  ImGuiHoveredFlags_RootAndChildWindows = 3;
  ImGuiHoveredFlags_ForTooltip = 4096;
  ImGuiHoveredFlags_Stationary = 8192;
  ImGuiHoveredFlags_DelayNone = 16384;
  ImGuiHoveredFlags_DelayShort = 32768;
  ImGuiHoveredFlags_DelayNormal = 65536;
  ImGuiHoveredFlags_NoSharedDelay = 131072;

type
  ImGuiDockNodeFlags_ = Integer;
  PImGuiDockNodeFlags_ = ^ImGuiDockNodeFlags_;

const
  ImGuiDockNodeFlags_None = 0;
  ImGuiDockNodeFlags_KeepAliveOnly = 1;
  ImGuiDockNodeFlags_NoDockingOverCentralNode = 4;
  ImGuiDockNodeFlags_PassthruCentralNode = 8;
  ImGuiDockNodeFlags_NoDockingSplit = 16;
  ImGuiDockNodeFlags_NoResize = 32;
  ImGuiDockNodeFlags_AutoHideTabBar = 64;
  ImGuiDockNodeFlags_NoUndocking = 128;

type
  ImGuiDragDropFlags_ = Integer;
  PImGuiDragDropFlags_ = ^ImGuiDragDropFlags_;

const
  ImGuiDragDropFlags_None = 0;
  ImGuiDragDropFlags_SourceNoPreviewTooltip = 1;
  ImGuiDragDropFlags_SourceNoDisableHover = 2;
  ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 4;
  ImGuiDragDropFlags_SourceAllowNullID = 8;
  ImGuiDragDropFlags_SourceExtern = 16;
  ImGuiDragDropFlags_SourceAutoExpirePayload = 32;
  ImGuiDragDropFlags_AcceptBeforeDelivery = 1024;
  ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 2048;
  ImGuiDragDropFlags_AcceptNoPreviewTooltip = 4096;
  ImGuiDragDropFlags_AcceptPeekOnly = 3072;

type
  ImGuiDataType_ = Integer;
  PImGuiDataType_ = ^ImGuiDataType_;

const
  ImGuiDataType_S8 = 0;
  ImGuiDataType_U8 = 1;
  ImGuiDataType_S16 = 2;
  ImGuiDataType_U16 = 3;
  ImGuiDataType_S32 = 4;
  ImGuiDataType_U32 = 5;
  ImGuiDataType_S64 = 6;
  ImGuiDataType_U64 = 7;
  ImGuiDataType_Float = 8;
  ImGuiDataType_Double = 9;
  ImGuiDataType_COUNT = 10;

type
  ImGuiDir_ = Integer;
  PImGuiDir_ = ^ImGuiDir_;

const
  ImGuiDir_None = -1;
  ImGuiDir_Left = 0;
  ImGuiDir_Right = 1;
  ImGuiDir_Up = 2;
  ImGuiDir_Down = 3;
  ImGuiDir_COUNT = 4;

type
  ImGuiSortDirection_ = Integer;
  PImGuiSortDirection_ = ^ImGuiSortDirection_;

const
  ImGuiSortDirection_None = 0;
  ImGuiSortDirection_Ascending = 1;
  ImGuiSortDirection_Descending = 2;

type
  ImGuiKey = Integer;
  PImGuiKey = ^ImGuiKey;

const
  ImGuiKey_None = 0;
  ImGuiKey_Tab = 512;
  ImGuiKey_LeftArrow = 513;
  ImGuiKey_RightArrow = 514;
  ImGuiKey_UpArrow = 515;
  ImGuiKey_DownArrow = 516;
  ImGuiKey_PageUp = 517;
  ImGuiKey_PageDown = 518;
  ImGuiKey_Home = 519;
  ImGuiKey_End = 520;
  ImGuiKey_Insert = 521;
  ImGuiKey_Delete = 522;
  ImGuiKey_Backspace = 523;
  ImGuiKey_Space = 524;
  ImGuiKey_Enter = 525;
  ImGuiKey_Escape = 526;
  ImGuiKey_LeftCtrl = 527;
  ImGuiKey_LeftShift = 528;
  ImGuiKey_LeftAlt = 529;
  ImGuiKey_LeftSuper = 530;
  ImGuiKey_RightCtrl = 531;
  ImGuiKey_RightShift = 532;
  ImGuiKey_RightAlt = 533;
  ImGuiKey_RightSuper = 534;
  ImGuiKey_Menu = 535;
  ImGuiKey_0 = 536;
  ImGuiKey_1 = 537;
  ImGuiKey_2 = 538;
  ImGuiKey_3 = 539;
  ImGuiKey_4 = 540;
  ImGuiKey_5 = 541;
  ImGuiKey_6 = 542;
  ImGuiKey_7 = 543;
  ImGuiKey_8 = 544;
  ImGuiKey_9 = 545;
  ImGuiKey_A = 546;
  ImGuiKey_B = 547;
  ImGuiKey_C = 548;
  ImGuiKey_D = 549;
  ImGuiKey_E = 550;
  ImGuiKey_F = 551;
  ImGuiKey_G = 552;
  ImGuiKey_H = 553;
  ImGuiKey_I = 554;
  ImGuiKey_J = 555;
  ImGuiKey_K = 556;
  ImGuiKey_L = 557;
  ImGuiKey_M = 558;
  ImGuiKey_N = 559;
  ImGuiKey_O = 560;
  ImGuiKey_P = 561;
  ImGuiKey_Q = 562;
  ImGuiKey_R = 563;
  ImGuiKey_S = 564;
  ImGuiKey_T = 565;
  ImGuiKey_U = 566;
  ImGuiKey_V = 567;
  ImGuiKey_W = 568;
  ImGuiKey_X = 569;
  ImGuiKey_Y = 570;
  ImGuiKey_Z = 571;
  ImGuiKey_F1 = 572;
  ImGuiKey_F2 = 573;
  ImGuiKey_F3 = 574;
  ImGuiKey_F4 = 575;
  ImGuiKey_F5 = 576;
  ImGuiKey_F6 = 577;
  ImGuiKey_F7 = 578;
  ImGuiKey_F8 = 579;
  ImGuiKey_F9 = 580;
  ImGuiKey_F10 = 581;
  ImGuiKey_F11 = 582;
  ImGuiKey_F12 = 583;
  ImGuiKey_F13 = 584;
  ImGuiKey_F14 = 585;
  ImGuiKey_F15 = 586;
  ImGuiKey_F16 = 587;
  ImGuiKey_F17 = 588;
  ImGuiKey_F18 = 589;
  ImGuiKey_F19 = 590;
  ImGuiKey_F20 = 591;
  ImGuiKey_F21 = 592;
  ImGuiKey_F22 = 593;
  ImGuiKey_F23 = 594;
  ImGuiKey_F24 = 595;
  ImGuiKey_Apostrophe = 596;
  ImGuiKey_Comma = 597;
  ImGuiKey_Minus = 598;
  ImGuiKey_Period = 599;
  ImGuiKey_Slash = 600;
  ImGuiKey_Semicolon = 601;
  ImGuiKey_Equal = 602;
  ImGuiKey_LeftBracket = 603;
  ImGuiKey_Backslash = 604;
  ImGuiKey_RightBracket = 605;
  ImGuiKey_GraveAccent = 606;
  ImGuiKey_CapsLock = 607;
  ImGuiKey_ScrollLock = 608;
  ImGuiKey_NumLock = 609;
  ImGuiKey_PrintScreen = 610;
  ImGuiKey_Pause = 611;
  ImGuiKey_Keypad0 = 612;
  ImGuiKey_Keypad1 = 613;
  ImGuiKey_Keypad2 = 614;
  ImGuiKey_Keypad3 = 615;
  ImGuiKey_Keypad4 = 616;
  ImGuiKey_Keypad5 = 617;
  ImGuiKey_Keypad6 = 618;
  ImGuiKey_Keypad7 = 619;
  ImGuiKey_Keypad8 = 620;
  ImGuiKey_Keypad9 = 621;
  ImGuiKey_KeypadDecimal = 622;
  ImGuiKey_KeypadDivide = 623;
  ImGuiKey_KeypadMultiply = 624;
  ImGuiKey_KeypadSubtract = 625;
  ImGuiKey_KeypadAdd = 626;
  ImGuiKey_KeypadEnter = 627;
  ImGuiKey_KeypadEqual = 628;
  ImGuiKey_AppBack = 629;
  ImGuiKey_AppForward = 630;
  ImGuiKey_GamepadStart = 631;
  ImGuiKey_GamepadBack = 632;
  ImGuiKey_GamepadFaceLeft = 633;
  ImGuiKey_GamepadFaceRight = 634;
  ImGuiKey_GamepadFaceUp = 635;
  ImGuiKey_GamepadFaceDown = 636;
  ImGuiKey_GamepadDpadLeft = 637;
  ImGuiKey_GamepadDpadRight = 638;
  ImGuiKey_GamepadDpadUp = 639;
  ImGuiKey_GamepadDpadDown = 640;
  ImGuiKey_GamepadL1 = 641;
  ImGuiKey_GamepadR1 = 642;
  ImGuiKey_GamepadL2 = 643;
  ImGuiKey_GamepadR2 = 644;
  ImGuiKey_GamepadL3 = 645;
  ImGuiKey_GamepadR3 = 646;
  ImGuiKey_GamepadLStickLeft = 647;
  ImGuiKey_GamepadLStickRight = 648;
  ImGuiKey_GamepadLStickUp = 649;
  ImGuiKey_GamepadLStickDown = 650;
  ImGuiKey_GamepadRStickLeft = 651;
  ImGuiKey_GamepadRStickRight = 652;
  ImGuiKey_GamepadRStickUp = 653;
  ImGuiKey_GamepadRStickDown = 654;
  ImGuiKey_MouseLeft = 655;
  ImGuiKey_MouseRight = 656;
  ImGuiKey_MouseMiddle = 657;
  ImGuiKey_MouseX1 = 658;
  ImGuiKey_MouseX2 = 659;
  ImGuiKey_MouseWheelX = 660;
  ImGuiKey_MouseWheelY = 661;
  ImGuiKey_ReservedForModCtrl = 662;
  ImGuiKey_ReservedForModShift = 663;
  ImGuiKey_ReservedForModAlt = 664;
  ImGuiKey_ReservedForModSuper = 665;
  ImGuiKey_COUNT = 666;
  ImGuiMod_None = 0;
  ImGuiMod_Ctrl = 4096;
  ImGuiMod_Shift = 8192;
  ImGuiMod_Alt = 16384;
  ImGuiMod_Super = 32768;
  ImGuiMod_Shortcut = 2048;
  ImGuiMod_Mask_ = 63488;
  ImGuiKey_NamedKey_BEGIN = 512;
  ImGuiKey_NamedKey_END = 666;
  ImGuiKey_NamedKey_COUNT = 154;
  ImGuiKey_KeysData_SIZE = 154;
  ImGuiKey_KeysData_OFFSET = 512;

type
  ImGuiConfigFlags_ = Integer;
  PImGuiConfigFlags_ = ^ImGuiConfigFlags_;

const
  ImGuiConfigFlags_None = 0;
  ImGuiConfigFlags_NavEnableKeyboard = 1;
  ImGuiConfigFlags_NavEnableGamepad = 2;
  ImGuiConfigFlags_NavEnableSetMousePos = 4;
  ImGuiConfigFlags_NavNoCaptureKeyboard = 8;
  ImGuiConfigFlags_NoMouse = 16;
  ImGuiConfigFlags_NoMouseCursorChange = 32;
  ImGuiConfigFlags_DockingEnable = 64;
  ImGuiConfigFlags_ViewportsEnable = 1024;
  ImGuiConfigFlags_DpiEnableScaleViewports = 16384;
  ImGuiConfigFlags_DpiEnableScaleFonts = 32768;
  ImGuiConfigFlags_IsSRGB = 1048576;
  ImGuiConfigFlags_IsTouchScreen = 2097152;

type
  ImGuiBackendFlags_ = Integer;
  PImGuiBackendFlags_ = ^ImGuiBackendFlags_;

const
  ImGuiBackendFlags_None = 0;
  ImGuiBackendFlags_HasGamepad = 1;
  ImGuiBackendFlags_HasMouseCursors = 2;
  ImGuiBackendFlags_HasSetMousePos = 4;
  ImGuiBackendFlags_RendererHasVtxOffset = 8;
  ImGuiBackendFlags_PlatformHasViewports = 1024;
  ImGuiBackendFlags_HasMouseHoveredViewport = 2048;
  ImGuiBackendFlags_RendererHasViewports = 4096;

type
  ImGuiCol_ = Integer;
  PImGuiCol_ = ^ImGuiCol_;

const
  ImGuiCol_Text = 0;
  ImGuiCol_TextDisabled = 1;
  ImGuiCol_WindowBg = 2;
  ImGuiCol_ChildBg = 3;
  ImGuiCol_PopupBg = 4;
  ImGuiCol_Border = 5;
  ImGuiCol_BorderShadow = 6;
  ImGuiCol_FrameBg = 7;
  ImGuiCol_FrameBgHovered = 8;
  ImGuiCol_FrameBgActive = 9;
  ImGuiCol_TitleBg = 10;
  ImGuiCol_TitleBgActive = 11;
  ImGuiCol_TitleBgCollapsed = 12;
  ImGuiCol_MenuBarBg = 13;
  ImGuiCol_ScrollbarBg = 14;
  ImGuiCol_ScrollbarGrab = 15;
  ImGuiCol_ScrollbarGrabHovered = 16;
  ImGuiCol_ScrollbarGrabActive = 17;
  ImGuiCol_CheckMark = 18;
  ImGuiCol_SliderGrab = 19;
  ImGuiCol_SliderGrabActive = 20;
  ImGuiCol_Button = 21;
  ImGuiCol_ButtonHovered = 22;
  ImGuiCol_ButtonActive = 23;
  ImGuiCol_Header = 24;
  ImGuiCol_HeaderHovered = 25;
  ImGuiCol_HeaderActive = 26;
  ImGuiCol_Separator = 27;
  ImGuiCol_SeparatorHovered = 28;
  ImGuiCol_SeparatorActive = 29;
  ImGuiCol_ResizeGrip = 30;
  ImGuiCol_ResizeGripHovered = 31;
  ImGuiCol_ResizeGripActive = 32;
  ImGuiCol_Tab = 33;
  ImGuiCol_TabHovered = 34;
  ImGuiCol_TabActive = 35;
  ImGuiCol_TabUnfocused = 36;
  ImGuiCol_TabUnfocusedActive = 37;
  ImGuiCol_DockingPreview = 38;
  ImGuiCol_DockingEmptyBg = 39;
  ImGuiCol_PlotLines = 40;
  ImGuiCol_PlotLinesHovered = 41;
  ImGuiCol_PlotHistogram = 42;
  ImGuiCol_PlotHistogramHovered = 43;
  ImGuiCol_TableHeaderBg = 44;
  ImGuiCol_TableBorderStrong = 45;
  ImGuiCol_TableBorderLight = 46;
  ImGuiCol_TableRowBg = 47;
  ImGuiCol_TableRowBgAlt = 48;
  ImGuiCol_TextSelectedBg = 49;
  ImGuiCol_DragDropTarget = 50;
  ImGuiCol_NavHighlight = 51;
  ImGuiCol_NavWindowingHighlight = 52;
  ImGuiCol_NavWindowingDimBg = 53;
  ImGuiCol_ModalWindowDimBg = 54;
  ImGuiCol_COUNT = 55;

type
  ImGuiStyleVar_ = Integer;
  PImGuiStyleVar_ = ^ImGuiStyleVar_;

const
  ImGuiStyleVar_Alpha = 0;
  ImGuiStyleVar_DisabledAlpha = 1;
  ImGuiStyleVar_WindowPadding = 2;
  ImGuiStyleVar_WindowRounding = 3;
  ImGuiStyleVar_WindowBorderSize = 4;
  ImGuiStyleVar_WindowMinSize = 5;
  ImGuiStyleVar_WindowTitleAlign = 6;
  ImGuiStyleVar_ChildRounding = 7;
  ImGuiStyleVar_ChildBorderSize = 8;
  ImGuiStyleVar_PopupRounding = 9;
  ImGuiStyleVar_PopupBorderSize = 10;
  ImGuiStyleVar_FramePadding = 11;
  ImGuiStyleVar_FrameRounding = 12;
  ImGuiStyleVar_FrameBorderSize = 13;
  ImGuiStyleVar_ItemSpacing = 14;
  ImGuiStyleVar_ItemInnerSpacing = 15;
  ImGuiStyleVar_IndentSpacing = 16;
  ImGuiStyleVar_CellPadding = 17;
  ImGuiStyleVar_ScrollbarSize = 18;
  ImGuiStyleVar_ScrollbarRounding = 19;
  ImGuiStyleVar_GrabMinSize = 20;
  ImGuiStyleVar_GrabRounding = 21;
  ImGuiStyleVar_TabRounding = 22;
  ImGuiStyleVar_TabBarBorderSize = 23;
  ImGuiStyleVar_ButtonTextAlign = 24;
  ImGuiStyleVar_SelectableTextAlign = 25;
  ImGuiStyleVar_SeparatorTextBorderSize = 26;
  ImGuiStyleVar_SeparatorTextAlign = 27;
  ImGuiStyleVar_SeparatorTextPadding = 28;
  ImGuiStyleVar_DockingSeparatorSize = 29;
  ImGuiStyleVar_COUNT = 30;

type
  ImGuiButtonFlags_ = Integer;
  PImGuiButtonFlags_ = ^ImGuiButtonFlags_;

const
  ImGuiButtonFlags_None = 0;
  ImGuiButtonFlags_MouseButtonLeft = 1;
  ImGuiButtonFlags_MouseButtonRight = 2;
  ImGuiButtonFlags_MouseButtonMiddle = 4;
  ImGuiButtonFlags_MouseButtonMask_ = 7;
  ImGuiButtonFlags_MouseButtonDefault_ = 1;

type
  ImGuiColorEditFlags_ = Integer;
  PImGuiColorEditFlags_ = ^ImGuiColorEditFlags_;

const
  ImGuiColorEditFlags_None = 0;
  ImGuiColorEditFlags_NoAlpha = 2;
  ImGuiColorEditFlags_NoPicker = 4;
  ImGuiColorEditFlags_NoOptions = 8;
  ImGuiColorEditFlags_NoSmallPreview = 16;
  ImGuiColorEditFlags_NoInputs = 32;
  ImGuiColorEditFlags_NoTooltip = 64;
  ImGuiColorEditFlags_NoLabel = 128;
  ImGuiColorEditFlags_NoSidePreview = 256;
  ImGuiColorEditFlags_NoDragDrop = 512;
  ImGuiColorEditFlags_NoBorder = 1024;
  ImGuiColorEditFlags_AlphaBar = 65536;
  ImGuiColorEditFlags_AlphaPreview = 131072;
  ImGuiColorEditFlags_AlphaPreviewHalf = 262144;
  ImGuiColorEditFlags_HDR = 524288;
  ImGuiColorEditFlags_DisplayRGB = 1048576;
  ImGuiColorEditFlags_DisplayHSV = 2097152;
  ImGuiColorEditFlags_DisplayHex = 4194304;
  ImGuiColorEditFlags_Uint8 = 8388608;
  ImGuiColorEditFlags_Float = 16777216;
  ImGuiColorEditFlags_PickerHueBar = 33554432;
  ImGuiColorEditFlags_PickerHueWheel = 67108864;
  ImGuiColorEditFlags_InputRGB = 134217728;
  ImGuiColorEditFlags_InputHSV = 268435456;
  ImGuiColorEditFlags_DefaultOptions_ = 177209344;
  ImGuiColorEditFlags_DisplayMask_ = 7340032;
  ImGuiColorEditFlags_DataTypeMask_ = 25165824;
  ImGuiColorEditFlags_PickerMask_ = 100663296;
  ImGuiColorEditFlags_InputMask_ = 402653184;

type
  ImGuiSliderFlags_ = Integer;
  PImGuiSliderFlags_ = ^ImGuiSliderFlags_;

const
  ImGuiSliderFlags_None = 0;
  ImGuiSliderFlags_AlwaysClamp = 16;
  ImGuiSliderFlags_Logarithmic = 32;
  ImGuiSliderFlags_NoRoundToFormat = 64;
  ImGuiSliderFlags_NoInput = 128;
  ImGuiSliderFlags_InvalidMask_ = 1879048207;

type
  ImGuiMouseButton_ = Integer;
  PImGuiMouseButton_ = ^ImGuiMouseButton_;

const
  ImGuiMouseButton_Left = 0;
  ImGuiMouseButton_Right = 1;
  ImGuiMouseButton_Middle = 2;
  ImGuiMouseButton_COUNT = 5;

type
  ImGuiMouseCursor_ = Integer;
  PImGuiMouseCursor_ = ^ImGuiMouseCursor_;

const
  ImGuiMouseCursor_None = -1;
  ImGuiMouseCursor_Arrow = 0;
  ImGuiMouseCursor_TextInput = 1;
  ImGuiMouseCursor_ResizeAll = 2;
  ImGuiMouseCursor_ResizeNS = 3;
  ImGuiMouseCursor_ResizeEW = 4;
  ImGuiMouseCursor_ResizeNESW = 5;
  ImGuiMouseCursor_ResizeNWSE = 6;
  ImGuiMouseCursor_Hand = 7;
  ImGuiMouseCursor_NotAllowed = 8;
  ImGuiMouseCursor_COUNT = 9;

type
  ImGuiMouseSource = Integer;
  PImGuiMouseSource = ^ImGuiMouseSource;

const
  ImGuiMouseSource_Mouse = 0;
  ImGuiMouseSource_TouchScreen = 1;
  ImGuiMouseSource_Pen = 2;
  ImGuiMouseSource_COUNT = 3;

type
  ImGuiCond_ = Integer;
  PImGuiCond_ = ^ImGuiCond_;

const
  ImGuiCond_None = 0;
  ImGuiCond_Always = 1;
  ImGuiCond_Once = 2;
  ImGuiCond_FirstUseEver = 4;
  ImGuiCond_Appearing = 8;

type
  ImGuiTableFlags_ = Integer;
  PImGuiTableFlags_ = ^ImGuiTableFlags_;

const
  ImGuiTableFlags_None = 0;
  ImGuiTableFlags_Resizable = 1;
  ImGuiTableFlags_Reorderable = 2;
  ImGuiTableFlags_Hideable = 4;
  ImGuiTableFlags_Sortable = 8;
  ImGuiTableFlags_NoSavedSettings = 16;
  ImGuiTableFlags_ContextMenuInBody = 32;
  ImGuiTableFlags_RowBg = 64;
  ImGuiTableFlags_BordersInnerH = 128;
  ImGuiTableFlags_BordersOuterH = 256;
  ImGuiTableFlags_BordersInnerV = 512;
  ImGuiTableFlags_BordersOuterV = 1024;
  ImGuiTableFlags_BordersH = 384;
  ImGuiTableFlags_BordersV = 1536;
  ImGuiTableFlags_BordersInner = 640;
  ImGuiTableFlags_BordersOuter = 1280;
  ImGuiTableFlags_Borders = 1920;
  ImGuiTableFlags_NoBordersInBody = 2048;
  ImGuiTableFlags_NoBordersInBodyUntilResize = 4096;
  ImGuiTableFlags_SizingFixedFit = 8192;
  ImGuiTableFlags_SizingFixedSame = 16384;
  ImGuiTableFlags_SizingStretchProp = 24576;
  ImGuiTableFlags_SizingStretchSame = 32768;
  ImGuiTableFlags_NoHostExtendX = 65536;
  ImGuiTableFlags_NoHostExtendY = 131072;
  ImGuiTableFlags_NoKeepColumnsVisible = 262144;
  ImGuiTableFlags_PreciseWidths = 524288;
  ImGuiTableFlags_NoClip = 1048576;
  ImGuiTableFlags_PadOuterX = 2097152;
  ImGuiTableFlags_NoPadOuterX = 4194304;
  ImGuiTableFlags_NoPadInnerX = 8388608;
  ImGuiTableFlags_ScrollX = 16777216;
  ImGuiTableFlags_ScrollY = 33554432;
  ImGuiTableFlags_SortMulti = 67108864;
  ImGuiTableFlags_SortTristate = 134217728;
  ImGuiTableFlags_HighlightHoveredColumn = 268435456;
  ImGuiTableFlags_SizingMask_ = 57344;

type
  ImGuiTableColumnFlags_ = Integer;
  PImGuiTableColumnFlags_ = ^ImGuiTableColumnFlags_;

const
  ImGuiTableColumnFlags_None = 0;
  ImGuiTableColumnFlags_Disabled = 1;
  ImGuiTableColumnFlags_DefaultHide = 2;
  ImGuiTableColumnFlags_DefaultSort = 4;
  ImGuiTableColumnFlags_WidthStretch = 8;
  ImGuiTableColumnFlags_WidthFixed = 16;
  ImGuiTableColumnFlags_NoResize = 32;
  ImGuiTableColumnFlags_NoReorder = 64;
  ImGuiTableColumnFlags_NoHide = 128;
  ImGuiTableColumnFlags_NoClip = 256;
  ImGuiTableColumnFlags_NoSort = 512;
  ImGuiTableColumnFlags_NoSortAscending = 1024;
  ImGuiTableColumnFlags_NoSortDescending = 2048;
  ImGuiTableColumnFlags_NoHeaderLabel = 4096;
  ImGuiTableColumnFlags_NoHeaderWidth = 8192;
  ImGuiTableColumnFlags_PreferSortAscending = 16384;
  ImGuiTableColumnFlags_PreferSortDescending = 32768;
  ImGuiTableColumnFlags_IndentEnable = 65536;
  ImGuiTableColumnFlags_IndentDisable = 131072;
  ImGuiTableColumnFlags_AngledHeader = 262144;
  ImGuiTableColumnFlags_IsEnabled = 16777216;
  ImGuiTableColumnFlags_IsVisible = 33554432;
  ImGuiTableColumnFlags_IsSorted = 67108864;
  ImGuiTableColumnFlags_IsHovered = 134217728;
  ImGuiTableColumnFlags_WidthMask_ = 24;
  ImGuiTableColumnFlags_IndentMask_ = 196608;
  ImGuiTableColumnFlags_StatusMask_ = 251658240;
  ImGuiTableColumnFlags_NoDirectResize_ = 1073741824;

type
  ImGuiTableRowFlags_ = Integer;
  PImGuiTableRowFlags_ = ^ImGuiTableRowFlags_;

const
  ImGuiTableRowFlags_None = 0;
  ImGuiTableRowFlags_Headers = 1;

type
  ImGuiTableBgTarget_ = Integer;
  PImGuiTableBgTarget_ = ^ImGuiTableBgTarget_;

const
  ImGuiTableBgTarget_None = 0;
  ImGuiTableBgTarget_RowBg0 = 1;
  ImGuiTableBgTarget_RowBg1 = 2;
  ImGuiTableBgTarget_CellBg = 3;

type
  ImDrawFlags_ = Integer;
  PImDrawFlags_ = ^ImDrawFlags_;

const
  ImDrawFlags_None = 0;
  ImDrawFlags_Closed = 1;
  ImDrawFlags_RoundCornersTopLeft = 16;
  ImDrawFlags_RoundCornersTopRight = 32;
  ImDrawFlags_RoundCornersBottomLeft = 64;
  ImDrawFlags_RoundCornersBottomRight = 128;
  ImDrawFlags_RoundCornersNone = 256;
  ImDrawFlags_RoundCornersTop = 48;
  ImDrawFlags_RoundCornersBottom = 192;
  ImDrawFlags_RoundCornersLeft = 80;
  ImDrawFlags_RoundCornersRight = 160;
  ImDrawFlags_RoundCornersAll = 240;
  ImDrawFlags_RoundCornersDefault_ = 240;
  ImDrawFlags_RoundCornersMask_ = 496;

type
  ImDrawListFlags_ = Integer;
  PImDrawListFlags_ = ^ImDrawListFlags_;

const
  ImDrawListFlags_None = 0;
  ImDrawListFlags_AntiAliasedLines = 1;
  ImDrawListFlags_AntiAliasedLinesUseTex = 2;
  ImDrawListFlags_AntiAliasedFill = 4;
  ImDrawListFlags_AllowVtxOffset = 8;

type
  ImFontAtlasFlags_ = Integer;
  PImFontAtlasFlags_ = ^ImFontAtlasFlags_;

const
  ImFontAtlasFlags_None = 0;
  ImFontAtlasFlags_NoPowerOfTwoHeight = 1;
  ImFontAtlasFlags_NoMouseCursors = 2;
  ImFontAtlasFlags_NoBakedLines = 4;

type
  ImGuiViewportFlags_ = Integer;
  PImGuiViewportFlags_ = ^ImGuiViewportFlags_;

const
  ImGuiViewportFlags_None = 0;
  ImGuiViewportFlags_IsPlatformWindow = 1;
  ImGuiViewportFlags_IsPlatformMonitor = 2;
  ImGuiViewportFlags_OwnedByApp = 4;
  ImGuiViewportFlags_NoDecoration = 8;
  ImGuiViewportFlags_NoTaskBarIcon = 16;
  ImGuiViewportFlags_NoFocusOnAppearing = 32;
  ImGuiViewportFlags_NoFocusOnClick = 64;
  ImGuiViewportFlags_NoInputs = 128;
  ImGuiViewportFlags_NoRendererClear = 256;
  ImGuiViewportFlags_NoAutoMerge = 512;
  ImGuiViewportFlags_TopMost = 1024;
  ImGuiViewportFlags_CanHostOtherWindows = 2048;
  ImGuiViewportFlags_IsMinimized = 4096;
  ImGuiViewportFlags_IsFocused = 8192;

type
  ImGuiItemFlags_ = Integer;
  PImGuiItemFlags_ = ^ImGuiItemFlags_;

const
  ImGuiItemFlags_None = 0;
  ImGuiItemFlags_NoTabStop = 1;
  ImGuiItemFlags_ButtonRepeat = 2;
  ImGuiItemFlags_Disabled = 4;
  ImGuiItemFlags_NoNav = 8;
  ImGuiItemFlags_NoNavDefaultFocus = 16;
  ImGuiItemFlags_SelectableDontClosePopup = 32;
  ImGuiItemFlags_MixedValue = 64;
  ImGuiItemFlags_ReadOnly = 128;
  ImGuiItemFlags_NoWindowHoverableCheck = 256;
  ImGuiItemFlags_AllowOverlap = 512;
  ImGuiItemFlags_Inputable = 1024;
  ImGuiItemFlags_HasSelectionUserData = 2048;

type
  ImGuiItemStatusFlags_ = Integer;
  PImGuiItemStatusFlags_ = ^ImGuiItemStatusFlags_;

const
  ImGuiItemStatusFlags_None = 0;
  ImGuiItemStatusFlags_HoveredRect = 1;
  ImGuiItemStatusFlags_HasDisplayRect = 2;
  ImGuiItemStatusFlags_Edited = 4;
  ImGuiItemStatusFlags_ToggledSelection = 8;
  ImGuiItemStatusFlags_ToggledOpen = 16;
  ImGuiItemStatusFlags_HasDeactivated = 32;
  ImGuiItemStatusFlags_Deactivated = 64;
  ImGuiItemStatusFlags_HoveredWindow = 128;
  ImGuiItemStatusFlags_Visible = 256;
  ImGuiItemStatusFlags_HasClipRect = 512;

type
  ImGuiHoveredFlagsPrivate_ = Integer;
  PImGuiHoveredFlagsPrivate_ = ^ImGuiHoveredFlagsPrivate_;

const
  ImGuiHoveredFlags_DelayMask_ = 245760;
  ImGuiHoveredFlags_AllowedMaskForIsWindowHovered = 12479;
  ImGuiHoveredFlags_AllowedMaskForIsItemHovered = 262048;

type
  ImGuiInputTextFlagsPrivate_ = Integer;
  PImGuiInputTextFlagsPrivate_ = ^ImGuiInputTextFlagsPrivate_;

const
  ImGuiInputTextFlags_Multiline = 67108864;
  ImGuiInputTextFlags_NoMarkEdited = 134217728;
  ImGuiInputTextFlags_MergedItem = 268435456;

type
  ImGuiButtonFlagsPrivate_ = Integer;
  PImGuiButtonFlagsPrivate_ = ^ImGuiButtonFlagsPrivate_;

const
  ImGuiButtonFlags_PressedOnClick = 16;
  ImGuiButtonFlags_PressedOnClickRelease = 32;
  ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 64;
  ImGuiButtonFlags_PressedOnRelease = 128;
  ImGuiButtonFlags_PressedOnDoubleClick = 256;
  ImGuiButtonFlags_PressedOnDragDropHold = 512;
  ImGuiButtonFlags_Repeat = 1024;
  ImGuiButtonFlags_FlattenChildren = 2048;
  ImGuiButtonFlags_AllowOverlap = 4096;
  ImGuiButtonFlags_DontClosePopups = 8192;
  ImGuiButtonFlags_AlignTextBaseLine = 32768;
  ImGuiButtonFlags_NoKeyModifiers = 65536;
  ImGuiButtonFlags_NoHoldingActiveId = 131072;
  ImGuiButtonFlags_NoNavFocus = 262144;
  ImGuiButtonFlags_NoHoveredOnFocus = 524288;
  ImGuiButtonFlags_NoSetKeyOwner = 1048576;
  ImGuiButtonFlags_NoTestKeyOwner = 2097152;
  ImGuiButtonFlags_PressedOnMask_ = 1008;
  ImGuiButtonFlags_PressedOnDefault_ = 32;

type
  ImGuiComboFlagsPrivate_ = Integer;
  PImGuiComboFlagsPrivate_ = ^ImGuiComboFlagsPrivate_;

const
  ImGuiComboFlags_CustomPreview = 1048576;

type
  ImGuiSliderFlagsPrivate_ = Integer;
  PImGuiSliderFlagsPrivate_ = ^ImGuiSliderFlagsPrivate_;

const
  ImGuiSliderFlags_Vertical = 1048576;
  ImGuiSliderFlags_ReadOnly = 2097152;

type
  ImGuiSelectableFlagsPrivate_ = Integer;
  PImGuiSelectableFlagsPrivate_ = ^ImGuiSelectableFlagsPrivate_;

const
  ImGuiSelectableFlags_NoHoldingActiveID = 1048576;
  ImGuiSelectableFlags_SelectOnNav = 2097152;
  ImGuiSelectableFlags_SelectOnClick = 4194304;
  ImGuiSelectableFlags_SelectOnRelease = 8388608;
  ImGuiSelectableFlags_SpanAvailWidth = 16777216;
  ImGuiSelectableFlags_SetNavIdOnHover = 33554432;
  ImGuiSelectableFlags_NoPadWithHalfSpacing = 67108864;
  ImGuiSelectableFlags_NoSetKeyOwner = 134217728;

type
  ImGuiTreeNodeFlagsPrivate_ = Integer;
  PImGuiTreeNodeFlagsPrivate_ = ^ImGuiTreeNodeFlagsPrivate_;

const
  ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1048576;
  ImGuiTreeNodeFlags_UpsideDownArrow = 2097152;

type
  ImGuiSeparatorFlags_ = Integer;
  PImGuiSeparatorFlags_ = ^ImGuiSeparatorFlags_;

const
  ImGuiSeparatorFlags_None = 0;
  ImGuiSeparatorFlags_Horizontal = 1;
  ImGuiSeparatorFlags_Vertical = 2;
  ImGuiSeparatorFlags_SpanAllColumns = 4;

type
  ImGuiFocusRequestFlags_ = Integer;
  PImGuiFocusRequestFlags_ = ^ImGuiFocusRequestFlags_;

const
  ImGuiFocusRequestFlags_None = 0;
  ImGuiFocusRequestFlags_RestoreFocusedChild = 1;
  ImGuiFocusRequestFlags_UnlessBelowModal = 2;

type
  ImGuiTextFlags_ = Integer;
  PImGuiTextFlags_ = ^ImGuiTextFlags_;

const
  ImGuiTextFlags_None = 0;
  ImGuiTextFlags_NoWidthForLargeClippedText = 1;

type
  ImGuiTooltipFlags_ = Integer;
  PImGuiTooltipFlags_ = ^ImGuiTooltipFlags_;

const
  ImGuiTooltipFlags_None = 0;
  ImGuiTooltipFlags_OverridePrevious = 2;

type
  ImGuiLayoutType_ = Integer;
  PImGuiLayoutType_ = ^ImGuiLayoutType_;

const
  ImGuiLayoutType_Horizontal = 0;
  ImGuiLayoutType_Vertical = 1;

type
  ImGuiLogType = Integer;
  PImGuiLogType = ^ImGuiLogType;

const
  ImGuiLogType_None = 0;
  ImGuiLogType_TTY = 1;
  ImGuiLogType_File = 2;
  ImGuiLogType_Buffer = 3;
  ImGuiLogType_Clipboard = 4;

type
  ImGuiAxis = Integer;
  PImGuiAxis = ^ImGuiAxis;

const
  ImGuiAxis_None = -1;
  ImGuiAxis_X = 0;
  ImGuiAxis_Y = 1;

type
  ImGuiPlotType = Integer;
  PImGuiPlotType = ^ImGuiPlotType;

const
  ImGuiPlotType_Lines = 0;
  ImGuiPlotType_Histogram = 1;

type
  ImGuiNextWindowDataFlags_ = Integer;
  PImGuiNextWindowDataFlags_ = ^ImGuiNextWindowDataFlags_;

const
  ImGuiNextWindowDataFlags_None = 0;
  ImGuiNextWindowDataFlags_HasPos = 1;
  ImGuiNextWindowDataFlags_HasSize = 2;
  ImGuiNextWindowDataFlags_HasContentSize = 4;
  ImGuiNextWindowDataFlags_HasCollapsed = 8;
  ImGuiNextWindowDataFlags_HasSizeConstraint = 16;
  ImGuiNextWindowDataFlags_HasFocus = 32;
  ImGuiNextWindowDataFlags_HasBgAlpha = 64;
  ImGuiNextWindowDataFlags_HasScroll = 128;
  ImGuiNextWindowDataFlags_HasChildFlags = 256;
  ImGuiNextWindowDataFlags_HasViewport = 512;
  ImGuiNextWindowDataFlags_HasDock = 1024;
  ImGuiNextWindowDataFlags_HasWindowClass = 2048;

type
  ImGuiNextItemDataFlags_ = Integer;
  PImGuiNextItemDataFlags_ = ^ImGuiNextItemDataFlags_;

const
  ImGuiNextItemDataFlags_None = 0;
  ImGuiNextItemDataFlags_HasWidth = 1;
  ImGuiNextItemDataFlags_HasOpen = 2;
  ImGuiNextItemDataFlags_HasShortcut = 4;

type
  ImGuiDataTypePrivate_ = Integer;
  PImGuiDataTypePrivate_ = ^ImGuiDataTypePrivate_;

const
  ImGuiDataType_String = 11;
  ImGuiDataType_Pointer = 12;
  ImGuiDataType_ID = 13;

type
  ImGuiPopupPositionPolicy = Integer;
  PImGuiPopupPositionPolicy = ^ImGuiPopupPositionPolicy;

const
  ImGuiPopupPositionPolicy_Default = 0;
  ImGuiPopupPositionPolicy_ComboBox = 1;
  ImGuiPopupPositionPolicy_Tooltip = 2;

type
  ImGuiInputEventType = Integer;
  PImGuiInputEventType = ^ImGuiInputEventType;

const
  ImGuiInputEventType_None = 0;
  ImGuiInputEventType_MousePos = 1;
  ImGuiInputEventType_MouseWheel = 2;
  ImGuiInputEventType_MouseButton = 3;
  ImGuiInputEventType_MouseViewport = 4;
  ImGuiInputEventType_Key = 5;
  ImGuiInputEventType_Text = 6;
  ImGuiInputEventType_Focus = 7;
  ImGuiInputEventType_COUNT = 8;

type
  ImGuiInputSource = Integer;
  PImGuiInputSource = ^ImGuiInputSource;

const
  ImGuiInputSource_None = 0;
  ImGuiInputSource_Mouse = 1;
  ImGuiInputSource_Keyboard = 2;
  ImGuiInputSource_Gamepad = 3;
  ImGuiInputSource_Clipboard = 4;
  ImGuiInputSource_COUNT = 5;

type
  ImGuiInputFlags_ = Integer;
  PImGuiInputFlags_ = ^ImGuiInputFlags_;

const
  ImGuiInputFlags_None = 0;
  ImGuiInputFlags_Repeat = 1;
  ImGuiInputFlags_RepeatRateDefault = 2;
  ImGuiInputFlags_RepeatRateNavMove = 4;
  ImGuiInputFlags_RepeatRateNavTweak = 8;
  ImGuiInputFlags_RepeatUntilRelease = 16;
  ImGuiInputFlags_RepeatUntilKeyModsChange = 32;
  ImGuiInputFlags_RepeatUntilKeyModsChangeFromNone = 64;
  ImGuiInputFlags_RepeatUntilOtherKeyPress = 128;
  ImGuiInputFlags_CondHovered = 256;
  ImGuiInputFlags_CondActive = 512;
  ImGuiInputFlags_CondDefault_ = 768;
  ImGuiInputFlags_LockThisFrame = 1024;
  ImGuiInputFlags_LockUntilRelease = 2048;
  ImGuiInputFlags_RouteFocused = 4096;
  ImGuiInputFlags_RouteGlobalLow = 8192;
  ImGuiInputFlags_RouteGlobal = 16384;
  ImGuiInputFlags_RouteGlobalHigh = 32768;
  ImGuiInputFlags_RouteAlways = 65536;
  ImGuiInputFlags_RouteUnlessBgFocused = 131072;
  ImGuiInputFlags_RepeatRateMask_ = 14;
  ImGuiInputFlags_RepeatUntilMask_ = 240;
  ImGuiInputFlags_RepeatMask_ = 255;
  ImGuiInputFlags_CondMask_ = 768;
  ImGuiInputFlags_RouteMask_ = 61440;
  ImGuiInputFlags_SupportedByIsKeyPressed = 255;
  ImGuiInputFlags_SupportedByIsMouseClicked = 1;
  ImGuiInputFlags_SupportedByShortcut = 258303;
  ImGuiInputFlags_SupportedBySetKeyOwner = 3072;
  ImGuiInputFlags_SupportedBySetItemKeyOwner = 3840;

type
  ImGuiActivateFlags_ = Integer;
  PImGuiActivateFlags_ = ^ImGuiActivateFlags_;

const
  ImGuiActivateFlags_None = 0;
  ImGuiActivateFlags_PreferInput = 1;
  ImGuiActivateFlags_PreferTweak = 2;
  ImGuiActivateFlags_TryToPreserveState = 4;
  ImGuiActivateFlags_FromTabbing = 8;
  ImGuiActivateFlags_FromShortcut = 16;

type
  ImGuiScrollFlags_ = Integer;
  PImGuiScrollFlags_ = ^ImGuiScrollFlags_;

const
  ImGuiScrollFlags_None = 0;
  ImGuiScrollFlags_KeepVisibleEdgeX = 1;
  ImGuiScrollFlags_KeepVisibleEdgeY = 2;
  ImGuiScrollFlags_KeepVisibleCenterX = 4;
  ImGuiScrollFlags_KeepVisibleCenterY = 8;
  ImGuiScrollFlags_AlwaysCenterX = 16;
  ImGuiScrollFlags_AlwaysCenterY = 32;
  ImGuiScrollFlags_NoScrollParent = 64;
  ImGuiScrollFlags_MaskX_ = 21;
  ImGuiScrollFlags_MaskY_ = 42;

type
  ImGuiNavHighlightFlags_ = Integer;
  PImGuiNavHighlightFlags_ = ^ImGuiNavHighlightFlags_;

const
  ImGuiNavHighlightFlags_None = 0;
  ImGuiNavHighlightFlags_Compact = 2;
  ImGuiNavHighlightFlags_AlwaysDraw = 4;
  ImGuiNavHighlightFlags_NoRounding = 8;

type
  ImGuiNavMoveFlags_ = Integer;
  PImGuiNavMoveFlags_ = ^ImGuiNavMoveFlags_;

const
  ImGuiNavMoveFlags_None = 0;
  ImGuiNavMoveFlags_LoopX = 1;
  ImGuiNavMoveFlags_LoopY = 2;
  ImGuiNavMoveFlags_WrapX = 4;
  ImGuiNavMoveFlags_WrapY = 8;
  ImGuiNavMoveFlags_WrapMask_ = 15;
  ImGuiNavMoveFlags_AllowCurrentNavId = 16;
  ImGuiNavMoveFlags_AlsoScoreVisibleSet = 32;
  ImGuiNavMoveFlags_ScrollToEdgeY = 64;
  ImGuiNavMoveFlags_Forwarded = 128;
  ImGuiNavMoveFlags_DebugNoResult = 256;
  ImGuiNavMoveFlags_FocusApi = 512;
  ImGuiNavMoveFlags_IsTabbing = 1024;
  ImGuiNavMoveFlags_IsPageMove = 2048;
  ImGuiNavMoveFlags_Activate = 4096;
  ImGuiNavMoveFlags_NoSelect = 8192;
  ImGuiNavMoveFlags_NoSetNavHighlight = 16384;

type
  ImGuiNavLayer = Integer;
  PImGuiNavLayer = ^ImGuiNavLayer;

const
  ImGuiNavLayer_Main = 0;
  ImGuiNavLayer_Menu = 1;
  ImGuiNavLayer_COUNT = 2;

type
  ImGuiTypingSelectFlags_ = Integer;
  PImGuiTypingSelectFlags_ = ^ImGuiTypingSelectFlags_;

const
  ImGuiTypingSelectFlags_None = 0;
  ImGuiTypingSelectFlags_AllowBackspace = 1;
  ImGuiTypingSelectFlags_AllowSingleCharMode = 2;

type
  ImGuiOldColumnFlags_ = Integer;
  PImGuiOldColumnFlags_ = ^ImGuiOldColumnFlags_;

const
  ImGuiOldColumnFlags_None = 0;
  ImGuiOldColumnFlags_NoBorder = 1;
  ImGuiOldColumnFlags_NoResize = 2;
  ImGuiOldColumnFlags_NoPreserveWidths = 4;
  ImGuiOldColumnFlags_NoForceWithinWindow = 8;
  ImGuiOldColumnFlags_GrowParentContentsSize = 16;

type
  ImGuiDockNodeFlagsPrivate_ = Integer;
  PImGuiDockNodeFlagsPrivate_ = ^ImGuiDockNodeFlagsPrivate_;

const
  ImGuiDockNodeFlags_DockSpace = 1024;
  ImGuiDockNodeFlags_CentralNode = 2048;
  ImGuiDockNodeFlags_NoTabBar = 4096;
  ImGuiDockNodeFlags_HiddenTabBar = 8192;
  ImGuiDockNodeFlags_NoWindowMenuButton = 16384;
  ImGuiDockNodeFlags_NoCloseButton = 32768;
  ImGuiDockNodeFlags_NoResizeX = 65536;
  ImGuiDockNodeFlags_NoResizeY = 131072;
  ImGuiDockNodeFlags_DockedWindowsInFocusRoute = 262144;
  ImGuiDockNodeFlags_NoDockingSplitOther = 524288;
  ImGuiDockNodeFlags_NoDockingOverMe = 1048576;
  ImGuiDockNodeFlags_NoDockingOverOther = 2097152;
  ImGuiDockNodeFlags_NoDockingOverEmpty = 4194304;
  ImGuiDockNodeFlags_NoDocking = 7864336;
  ImGuiDockNodeFlags_SharedFlagsInheritMask_ = -1;
  ImGuiDockNodeFlags_NoResizeFlagsMask_ = 196640;
  ImGuiDockNodeFlags_LocalFlagsTransferMask_ = 260208;
  ImGuiDockNodeFlags_SavedFlagsMask_ = 261152;

type
  ImGuiDataAuthority_ = Integer;
  PImGuiDataAuthority_ = ^ImGuiDataAuthority_;

const
  ImGuiDataAuthority_Auto = 0;
  ImGuiDataAuthority_DockNode = 1;
  ImGuiDataAuthority_Window = 2;

type
  ImGuiDockNodeState = Integer;
  PImGuiDockNodeState = ^ImGuiDockNodeState;

const
  ImGuiDockNodeState_Unknown = 0;
  ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow = 1;
  ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing = 2;
  ImGuiDockNodeState_HostWindowVisible = 3;

type
  ImGuiWindowDockStyleCol = Integer;
  PImGuiWindowDockStyleCol = ^ImGuiWindowDockStyleCol;

const
  ImGuiWindowDockStyleCol_Text = 0;
  ImGuiWindowDockStyleCol_Tab = 1;
  ImGuiWindowDockStyleCol_TabHovered = 2;
  ImGuiWindowDockStyleCol_TabActive = 3;
  ImGuiWindowDockStyleCol_TabUnfocused = 4;
  ImGuiWindowDockStyleCol_TabUnfocusedActive = 5;
  ImGuiWindowDockStyleCol_COUNT = 6;

type
  ImGuiLocKey = Integer;
  PImGuiLocKey = ^ImGuiLocKey;

const
  ImGuiLocKey_VersionStr = 0;
  ImGuiLocKey_TableSizeOne = 1;
  ImGuiLocKey_TableSizeAllFit = 2;
  ImGuiLocKey_TableSizeAllDefault = 3;
  ImGuiLocKey_TableResetOrder = 4;
  ImGuiLocKey_WindowingMainMenuBar = 5;
  ImGuiLocKey_WindowingPopup = 6;
  ImGuiLocKey_WindowingUntitled = 7;
  ImGuiLocKey_DockingHideTabBar = 8;
  ImGuiLocKey_DockingHoldShiftToDock = 9;
  ImGuiLocKey_DockingDragToUndockOrMoveNode = 10;
  ImGuiLocKey_COUNT = 11;

type
  ImGuiDebugLogFlags_ = Integer;
  PImGuiDebugLogFlags_ = ^ImGuiDebugLogFlags_;

const
  ImGuiDebugLogFlags_None = 0;
  ImGuiDebugLogFlags_EventActiveId = 1;
  ImGuiDebugLogFlags_EventFocus = 2;
  ImGuiDebugLogFlags_EventPopup = 4;
  ImGuiDebugLogFlags_EventNav = 8;
  ImGuiDebugLogFlags_EventClipper = 16;
  ImGuiDebugLogFlags_EventSelection = 32;
  ImGuiDebugLogFlags_EventIO = 64;
  ImGuiDebugLogFlags_EventInputRouting = 128;
  ImGuiDebugLogFlags_EventDocking = 256;
  ImGuiDebugLogFlags_EventViewport = 512;
  ImGuiDebugLogFlags_EventMask_ = 1023;
  ImGuiDebugLogFlags_OutputToTTY = 1048576;
  ImGuiDebugLogFlags_OutputToTestEngine = 2097152;

type
  ImGuiContextHookType = Integer;
  PImGuiContextHookType = ^ImGuiContextHookType;

const
  ImGuiContextHookType_NewFramePre = 0;
  ImGuiContextHookType_NewFramePost = 1;
  ImGuiContextHookType_EndFramePre = 2;
  ImGuiContextHookType_EndFramePost = 3;
  ImGuiContextHookType_RenderPre = 4;
  ImGuiContextHookType_RenderPost = 5;
  ImGuiContextHookType_Shutdown = 6;
  ImGuiContextHookType_PendingRemoval_ = 7;

type
  ImGuiTabBarFlagsPrivate_ = Integer;
  PImGuiTabBarFlagsPrivate_ = ^ImGuiTabBarFlagsPrivate_;

const
  ImGuiTabBarFlags_DockNode = 1048576;
  ImGuiTabBarFlags_IsFocused = 2097152;
  ImGuiTabBarFlags_SaveSettings = 4194304;

type
  ImGuiTabItemFlagsPrivate_ = Integer;
  PImGuiTabItemFlagsPrivate_ = ^ImGuiTabItemFlagsPrivate_;

const
  ImGuiTabItemFlags_SectionMask_ = 192;
  ImGuiTabItemFlags_NoCloseButton = 1048576;
  ImGuiTabItemFlags_Button = 2097152;
  ImGuiTabItemFlags_Unsorted = 4194304;

type
  NSVGpaintType = Integer;
  PNSVGpaintType = ^NSVGpaintType;

const
  NSVG_PAINT_UNDEF = -1;
  NSVG_PAINT_NONE = 0;
  NSVG_PAINT_COLOR = 1;
  NSVG_PAINT_LINEAR_GRADIENT = 2;
  NSVG_PAINT_RADIAL_GRADIENT = 3;

type
  NSVGspreadType = Integer;
  PNSVGspreadType = ^NSVGspreadType;

const
  NSVG_SPREAD_PAD = 0;
  NSVG_SPREAD_REFLECT = 1;
  NSVG_SPREAD_REPEAT = 2;

type
  NSVGlineJoin = Integer;
  PNSVGlineJoin = ^NSVGlineJoin;

const
  NSVG_JOIN_MITER = 0;
  NSVG_JOIN_ROUND = 1;
  NSVG_JOIN_BEVEL = 2;

type
  NSVGlineCap = Integer;
  PNSVGlineCap = ^NSVGlineCap;

const
  NSVG_CAP_BUTT = 0;
  NSVG_CAP_ROUND = 1;
  NSVG_CAP_SQUARE = 2;

type
  NSVGfillRule = Integer;
  PNSVGfillRule = ^NSVGfillRule;

const
  NSVG_FILLRULE_NONZERO = 0;
  NSVG_FILLRULE_EVENODD = 1;

type
  NSVGflags = Integer;
  PNSVGflags = ^NSVGflags;

const
  NSVG_FLAGS_VISIBLE = 1;

type
  // Forward declarations
  PPUTF8Char = ^PUTF8Char;
  PPByte = ^PByte;
  PPInteger = ^PInteger;
  PPSingle = ^PSingle;
  PPDouble = ^PDouble;
  PUInt8 = ^UInt8;
  PUInt32 = ^UInt32;
  PWideChar = ^WideChar;
  PPointer = ^Pointer;
  PNativeUInt = ^NativeUInt;
  PGLFWvidmode = ^GLFWvidmode;
  PGLFWgammaramp = ^GLFWgammaramp;
  PGLFWimage = ^GLFWimage;
  PGLFWgamepadstate = ^GLFWgamepadstate;
  PGLFWallocator = ^GLFWallocator;
  PENetBuffer = ^ENetBuffer;
  P_ENetCallbacks = ^_ENetCallbacks;
  P_ENetListNode = ^_ENetListNode;
  P_ENetList = ^_ENetList;
  P_ENetProtocolHeader = ^_ENetProtocolHeader;
  P_ENetProtocolCommandHeader = ^_ENetProtocolCommandHeader;
  P_ENetProtocolAcknowledge = ^_ENetProtocolAcknowledge;
  P_ENetProtocolConnect = ^_ENetProtocolConnect;
  P_ENetProtocolVerifyConnect = ^_ENetProtocolVerifyConnect;
  P_ENetProtocolBandwidthLimit = ^_ENetProtocolBandwidthLimit;
  P_ENetProtocolThrottleConfigure = ^_ENetProtocolThrottleConfigure;
  P_ENetProtocolDisconnect = ^_ENetProtocolDisconnect;
  P_ENetProtocolPing = ^_ENetProtocolPing;
  P_ENetProtocolSendReliable = ^_ENetProtocolSendReliable;
  P_ENetProtocolSendUnreliable = ^_ENetProtocolSendUnreliable;
  P_ENetProtocolSendUnsequenced = ^_ENetProtocolSendUnsequenced;
  P_ENetProtocolSendFragment = ^_ENetProtocolSendFragment;
  P_ENetAddress = ^_ENetAddress;
  P_ENetPacket = ^_ENetPacket;
  P_ENetAcknowledgement = ^_ENetAcknowledgement;
  P_ENetOutgoingCommand = ^_ENetOutgoingCommand;
  P_ENetIncomingCommand = ^_ENetIncomingCommand;
  P_ENetChannel = ^_ENetChannel;
  P_ENetPeer = ^_ENetPeer;
  P_ENetCompressor = ^_ENetCompressor;
  P_ENetHost = ^_ENetHost;
  P_ENetEvent = ^_ENetEvent;
  Ptm_zip_s = ^tm_zip_s;
  Pzip_fileinfo = ^zip_fileinfo;
  Ptm_unz_s = ^tm_unz_s;
  Punz_file_info64_s = ^unz_file_info64_s;
  Pstbi_io_callbacks = ^stbi_io_callbacks;
  Pstbrp_rect = ^stbrp_rect;
  Pstbrp_node = ^stbrp_node;
  Pstbrp_context = ^stbrp_context;
  Pstbtt__buf = ^stbtt__buf;
  Pstbtt_bakedchar = ^stbtt_bakedchar;
  Pstbtt_aligned_quad = ^stbtt_aligned_quad;
  Pstbtt_packedchar = ^stbtt_packedchar;
  Pstbtt_pack_range = ^stbtt_pack_range;
  Pstbtt_pack_context = ^stbtt_pack_context;
  Pstbtt_fontinfo = ^stbtt_fontinfo;
  Pstbtt_kerningentry = ^stbtt_kerningentry;
  Pstbtt_vertex = ^stbtt_vertex;
  PPstbtt_vertex = ^Pstbtt_vertex;
  Pstbtt__bitmap = ^stbtt__bitmap;
  Pplm_packet_t = ^plm_packet_t;
  Pplm_plane_t = ^plm_plane_t;
  Pplm_frame_t = ^plm_frame_t;
  Pplm_samples_t = ^plm_samples_t;
  Pma_allocation_callbacks = ^ma_allocation_callbacks;
  Pma_lcg = ^ma_lcg;
  Pma_atomic_uint32 = ^ma_atomic_uint32;
  Pma_atomic_int32 = ^ma_atomic_int32;
  Pma_atomic_uint64 = ^ma_atomic_uint64;
  Pma_atomic_float = ^ma_atomic_float;
  Pma_atomic_bool32 = ^ma_atomic_bool32;
  Pma_log_callback = ^ma_log_callback;
  Pma_log = ^ma_log;
  Pma_biquad_config = ^ma_biquad_config;
  Pma_biquad = ^ma_biquad;
  Pma_lpf1_config = ^ma_lpf1_config;
  Pma_lpf1 = ^ma_lpf1;
  Pma_lpf2 = ^ma_lpf2;
  Pma_lpf_config = ^ma_lpf_config;
  Pma_lpf = ^ma_lpf;
  Pma_hpf1_config = ^ma_hpf1_config;
  Pma_hpf1 = ^ma_hpf1;
  Pma_hpf2 = ^ma_hpf2;
  Pma_hpf_config = ^ma_hpf_config;
  Pma_hpf = ^ma_hpf;
  Pma_bpf2_config = ^ma_bpf2_config;
  Pma_bpf2 = ^ma_bpf2;
  Pma_bpf_config = ^ma_bpf_config;
  Pma_bpf = ^ma_bpf;
  Pma_notch2_config = ^ma_notch2_config;
  Pma_notch2 = ^ma_notch2;
  Pma_peak2_config = ^ma_peak2_config;
  Pma_peak2 = ^ma_peak2;
  Pma_loshelf2_config = ^ma_loshelf2_config;
  Pma_loshelf2 = ^ma_loshelf2;
  Pma_hishelf2_config = ^ma_hishelf2_config;
  Pma_hishelf2 = ^ma_hishelf2;
  Pma_delay_config = ^ma_delay_config;
  Pma_delay = ^ma_delay;
  Pma_gainer_config = ^ma_gainer_config;
  Pma_gainer = ^ma_gainer;
  Pma_panner_config = ^ma_panner_config;
  Pma_panner = ^ma_panner;
  Pma_fader_config = ^ma_fader_config;
  Pma_fader = ^ma_fader;
  Pma_vec3f = ^ma_vec3f;
  Pma_atomic_vec3f = ^ma_atomic_vec3f;
  Pma_spatializer_listener_config = ^ma_spatializer_listener_config;
  Pma_spatializer_listener = ^ma_spatializer_listener;
  Pma_spatializer_config = ^ma_spatializer_config;
  Pma_spatializer = ^ma_spatializer;
  Pma_linear_resampler_config = ^ma_linear_resampler_config;
  Pma_linear_resampler = ^ma_linear_resampler;
  Pma_resampling_backend_vtable = ^ma_resampling_backend_vtable;
  Pma_resampler_config = ^ma_resampler_config;
  Pma_resampler = ^ma_resampler;
  Pma_channel_converter_config = ^ma_channel_converter_config;
  Pma_channel_converter = ^ma_channel_converter;
  Pma_data_converter_config = ^ma_data_converter_config;
  Pma_data_converter = ^ma_data_converter;
  Pma_data_source_vtable = ^ma_data_source_vtable;
  Pma_data_source_config = ^ma_data_source_config;
  Pma_data_source_base = ^ma_data_source_base;
  Pma_audio_buffer_ref = ^ma_audio_buffer_ref;
  Pma_audio_buffer_config = ^ma_audio_buffer_config;
  Pma_audio_buffer = ^ma_audio_buffer;
  PPma_audio_buffer = ^Pma_audio_buffer;
  Pma_paged_audio_buffer_page = ^ma_paged_audio_buffer_page;
  PPma_paged_audio_buffer_page = ^Pma_paged_audio_buffer_page;
  Pma_paged_audio_buffer_data = ^ma_paged_audio_buffer_data;
  Pma_paged_audio_buffer_config = ^ma_paged_audio_buffer_config;
  Pma_paged_audio_buffer = ^ma_paged_audio_buffer;
  Pma_rb = ^ma_rb;
  Pma_pcm_rb = ^ma_pcm_rb;
  Pma_duplex_rb = ^ma_duplex_rb;
  Pma_fence = ^ma_fence;
  Pma_async_notification_callbacks = ^ma_async_notification_callbacks;
  Pma_async_notification_poll = ^ma_async_notification_poll;
  Pma_async_notification_event = ^ma_async_notification_event;
  Pma_slot_allocator_config = ^ma_slot_allocator_config;
  Pma_slot_allocator_group = ^ma_slot_allocator_group;
  Pma_slot_allocator = ^ma_slot_allocator;
  Pma_job = ^ma_job;
  Pma_job_queue_config = ^ma_job_queue_config;
  Pma_job_queue = ^ma_job_queue;
  Pma_atomic_device_state = ^ma_atomic_device_state;
  Pma_IMMNotificationClient = ^ma_IMMNotificationClient;
  Pma_device_job_thread_config = ^ma_device_job_thread_config;
  Pma_device_job_thread = ^ma_device_job_thread;
  Pma_device_notification = ^ma_device_notification;
  Pma_device_info = ^ma_device_info;
  PPma_device_info = ^Pma_device_info;
  Pma_device_config = ^ma_device_config;
  Pma_device_descriptor = ^ma_device_descriptor;
  Pma_backend_callbacks = ^ma_backend_callbacks;
  Pma_context_config = ^ma_context_config;
  Pma_context_command__wasapi = ^ma_context_command__wasapi;
  Pma_context = ^ma_context;
  Pma_device = ^ma_device;
  Pma_file_info = ^ma_file_info;
  Pma_vfs_callbacks = ^ma_vfs_callbacks;
  Pma_default_vfs = ^ma_default_vfs;
  Pma_decoding_backend_config = ^ma_decoding_backend_config;
  Pma_decoding_backend_vtable = ^ma_decoding_backend_vtable;
  PPma_decoding_backend_vtable = ^Pma_decoding_backend_vtable;
  Pma_decoder_config = ^ma_decoder_config;
  Pma_decoder = ^ma_decoder;
  Pma_encoder_config = ^ma_encoder_config;
  Pma_encoder = ^ma_encoder;
  Pma_waveform_config = ^ma_waveform_config;
  Pma_waveform = ^ma_waveform;
  Pma_pulsewave_config = ^ma_pulsewave_config;
  Pma_pulsewave = ^ma_pulsewave;
  Pma_noise_config = ^ma_noise_config;
  Pma_noise = ^ma_noise;
  Pma_resource_manager_pipeline_stage_notification = ^ma_resource_manager_pipeline_stage_notification;
  Pma_resource_manager_pipeline_notifications = ^ma_resource_manager_pipeline_notifications;
  Pma_resource_manager_data_source_config = ^ma_resource_manager_data_source_config;
  Pma_resource_manager_data_supply = ^ma_resource_manager_data_supply;
  Pma_resource_manager_data_buffer_node = ^ma_resource_manager_data_buffer_node;
  Pma_resource_manager_data_buffer = ^ma_resource_manager_data_buffer;
  Pma_resource_manager_data_stream = ^ma_resource_manager_data_stream;
  Pma_resource_manager_data_source = ^ma_resource_manager_data_source;
  Pma_resource_manager_config = ^ma_resource_manager_config;
  Pma_resource_manager = ^ma_resource_manager;
  Pma_node_vtable = ^ma_node_vtable;
  Pma_node_config = ^ma_node_config;
  Pma_node_output_bus = ^ma_node_output_bus;
  Pma_node_input_bus = ^ma_node_input_bus;
  Pma_node_base = ^ma_node_base;
  Pma_node_graph_config = ^ma_node_graph_config;
  Pma_node_graph = ^ma_node_graph;
  Pma_data_source_node_config = ^ma_data_source_node_config;
  Pma_data_source_node = ^ma_data_source_node;
  Pma_splitter_node_config = ^ma_splitter_node_config;
  Pma_splitter_node = ^ma_splitter_node;
  Pma_biquad_node_config = ^ma_biquad_node_config;
  Pma_biquad_node = ^ma_biquad_node;
  Pma_lpf_node_config = ^ma_lpf_node_config;
  Pma_lpf_node = ^ma_lpf_node;
  Pma_hpf_node_config = ^ma_hpf_node_config;
  Pma_hpf_node = ^ma_hpf_node;
  Pma_bpf_node_config = ^ma_bpf_node_config;
  Pma_bpf_node = ^ma_bpf_node;
  Pma_notch_node_config = ^ma_notch_node_config;
  Pma_notch_node = ^ma_notch_node;
  Pma_peak_node_config = ^ma_peak_node_config;
  Pma_peak_node = ^ma_peak_node;
  Pma_loshelf_node_config = ^ma_loshelf_node_config;
  Pma_loshelf_node = ^ma_loshelf_node;
  Pma_hishelf_node_config = ^ma_hishelf_node_config;
  Pma_hishelf_node = ^ma_hishelf_node;
  Pma_delay_node_config = ^ma_delay_node_config;
  Pma_delay_node = ^ma_delay_node;
  Pma_engine_node_config = ^ma_engine_node_config;
  Pma_engine_node = ^ma_engine_node;
  Pma_sound_config = ^ma_sound_config;
  Pma_sound = ^ma_sound;
  Pma_sound_inlined = ^ma_sound_inlined;
  Pma_engine_config = ^ma_engine_config;
  Pma_engine = ^ma_engine;
  PImVector_const_charPtr = ^ImVector_const_charPtr;
  PImVec2 = ^ImVec2;
  PImVec4 = ^ImVec4;
  PImGuiTableSortSpecs = ^ImGuiTableSortSpecs;
  PImGuiTableColumnSortSpecs = ^ImGuiTableColumnSortSpecs;
  PImGuiStyle = ^ImGuiStyle;
  PImGuiKeyData = ^ImGuiKeyData;
  PImVector_ImWchar = ^ImVector_ImWchar;
  PImGuiIO = ^ImGuiIO;
  PImGuiInputTextCallbackData = ^ImGuiInputTextCallbackData;
  PImGuiSizeCallbackData = ^ImGuiSizeCallbackData;
  PImGuiWindowClass = ^ImGuiWindowClass;
  PImGuiPayload = ^ImGuiPayload;
  PImGuiOnceUponAFrame = ^ImGuiOnceUponAFrame;
  PImGuiTextRange = ^ImGuiTextRange;
  PImVector_ImGuiTextRange = ^ImVector_ImGuiTextRange;
  PImGuiTextFilter = ^ImGuiTextFilter;
  PImVector_char = ^ImVector_char;
  PImGuiTextBuffer = ^ImGuiTextBuffer;
  PImGuiStoragePair = ^ImGuiStoragePair;
  PImVector_ImGuiStoragePair = ^ImVector_ImGuiStoragePair;
  PImGuiStorage = ^ImGuiStorage;
  PImGuiListClipper = ^ImGuiListClipper;
  PImColor = ^ImColor;
  PImDrawCmd = ^ImDrawCmd;
  PImDrawVert = ^ImDrawVert;
  PImDrawCmdHeader = ^ImDrawCmdHeader;
  PImVector_ImDrawCmd = ^ImVector_ImDrawCmd;
  PImVector_ImDrawIdx = ^ImVector_ImDrawIdx;
  PImDrawChannel = ^ImDrawChannel;
  PImVector_ImDrawChannel = ^ImVector_ImDrawChannel;
  PImDrawListSplitter = ^ImDrawListSplitter;
  PImVector_ImDrawVert = ^ImVector_ImDrawVert;
  PImVector_ImVec4 = ^ImVector_ImVec4;
  PImVector_ImTextureID = ^ImVector_ImTextureID;
  PImVector_ImVec2 = ^ImVector_ImVec2;
  PImDrawList = ^ImDrawList;
  PPImDrawList = ^PImDrawList;
  PImVector_ImDrawListPtr = ^ImVector_ImDrawListPtr;
  PImDrawData = ^ImDrawData;
  PImFontConfig = ^ImFontConfig;
  PImFontGlyph = ^ImFontGlyph;
  PImVector_ImU32 = ^ImVector_ImU32;
  PImFontGlyphRangesBuilder = ^ImFontGlyphRangesBuilder;
  PImFontAtlasCustomRect = ^ImFontAtlasCustomRect;
  PImVector_ImFontPtr = ^ImVector_ImFontPtr;
  PImVector_ImFontAtlasCustomRect = ^ImVector_ImFontAtlasCustomRect;
  PImVector_ImFontConfig = ^ImVector_ImFontConfig;
  PImFontAtlas = ^ImFontAtlas;
  PImVector_float = ^ImVector_float;
  PImVector_ImFontGlyph = ^ImVector_ImFontGlyph;
  PImFont = ^ImFont;
  PPImFont = ^PImFont;
  PImGuiViewport = ^ImGuiViewport;
  PPImGuiViewport = ^PImGuiViewport;
  PImVector_ImGuiPlatformMonitor = ^ImVector_ImGuiPlatformMonitor;
  PImVector_ImGuiViewportPtr = ^ImVector_ImGuiViewportPtr;
  PImGuiPlatformIO = ^ImGuiPlatformIO;
  PImGuiPlatformMonitor = ^ImGuiPlatformMonitor;
  PImGuiPlatformImeData = ^ImGuiPlatformImeData;
  PStbUndoRecord = ^StbUndoRecord;
  PStbUndoState = ^StbUndoState;
  PSTB_TexteditState = ^STB_TexteditState;
  PStbTexteditRow = ^StbTexteditRow;
  PImVec1 = ^ImVec1;
  PImVec2ih = ^ImVec2ih;
  PImRect = ^ImRect;
  PImBitVector = ^ImBitVector;
  PImVector_int = ^ImVector_int;
  PImGuiTextIndex = ^ImGuiTextIndex;
  PImDrawListSharedData = ^ImDrawListSharedData;
  PImDrawDataBuilder = ^ImDrawDataBuilder;
  PImGuiColorMod = ^ImGuiColorMod;
  PImGuiStyleMod = ^ImGuiStyleMod;
  PImGuiComboPreviewData = ^ImGuiComboPreviewData;
  PImGuiGroupData = ^ImGuiGroupData;
  PImGuiMenuColumns = ^ImGuiMenuColumns;
  PImGuiInputTextDeactivatedState = ^ImGuiInputTextDeactivatedState;
  PImGuiInputTextState = ^ImGuiInputTextState;
  PImGuiNextWindowData = ^ImGuiNextWindowData;
  PImGuiNextItemData = ^ImGuiNextItemData;
  PImGuiLastItemData = ^ImGuiLastItemData;
  PImGuiNavTreeNodeData = ^ImGuiNavTreeNodeData;
  PImGuiStackSizes = ^ImGuiStackSizes;
  PImGuiWindowStackData = ^ImGuiWindowStackData;
  PImGuiShrinkWidthItem = ^ImGuiShrinkWidthItem;
  PImGuiPtrOrIndex = ^ImGuiPtrOrIndex;
  PImGuiDataVarInfo = ^ImGuiDataVarInfo;
  PImGuiDataTypeTempStorage = ^ImGuiDataTypeTempStorage;
  PImGuiDataTypeInfo = ^ImGuiDataTypeInfo;
  PImGuiPopupData = ^ImGuiPopupData;
  PImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN = ^ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;
  PImGuiInputEventMousePos = ^ImGuiInputEventMousePos;
  PImGuiInputEventMouseWheel = ^ImGuiInputEventMouseWheel;
  PImGuiInputEventMouseButton = ^ImGuiInputEventMouseButton;
  PImGuiInputEventMouseViewport = ^ImGuiInputEventMouseViewport;
  PImGuiInputEventKey = ^ImGuiInputEventKey;
  PImGuiInputEventText = ^ImGuiInputEventText;
  PImGuiInputEventAppFocused = ^ImGuiInputEventAppFocused;
  PImGuiInputEvent = ^ImGuiInputEvent;
  PImGuiKeyRoutingData = ^ImGuiKeyRoutingData;
  PImVector_ImGuiKeyRoutingData = ^ImVector_ImGuiKeyRoutingData;
  PImGuiKeyRoutingTable = ^ImGuiKeyRoutingTable;
  PImGuiKeyOwnerData = ^ImGuiKeyOwnerData;
  PImGuiListClipperRange = ^ImGuiListClipperRange;
  PImVector_ImGuiListClipperRange = ^ImVector_ImGuiListClipperRange;
  PImGuiListClipperData = ^ImGuiListClipperData;
  PImGuiNavItemData = ^ImGuiNavItemData;
  PImGuiFocusScopeData = ^ImGuiFocusScopeData;
  PImGuiTypingSelectRequest = ^ImGuiTypingSelectRequest;
  PImGuiTypingSelectState = ^ImGuiTypingSelectState;
  PImGuiOldColumnData = ^ImGuiOldColumnData;
  PImVector_ImGuiOldColumnData = ^ImVector_ImGuiOldColumnData;
  PImGuiOldColumns = ^ImGuiOldColumns;
  PImVector_ImGuiWindowPtr = ^ImVector_ImGuiWindowPtr;
  PImGuiDockNode = ^ImGuiDockNode;
  PImGuiWindowDockStyle = ^ImGuiWindowDockStyle;
  PImVector_ImGuiDockRequest = ^ImVector_ImGuiDockRequest;
  PImVector_ImGuiDockNodeSettings = ^ImVector_ImGuiDockNodeSettings;
  PImGuiDockContext = ^ImGuiDockContext;
  PImGuiViewportP = ^ImGuiViewportP;
  PPImGuiViewportP = ^PImGuiViewportP;
  PImGuiWindowSettings = ^ImGuiWindowSettings;
  PImGuiSettingsHandler = ^ImGuiSettingsHandler;
  PImGuiLocEntry = ^ImGuiLocEntry;
  PImGuiDebugAllocEntry = ^ImGuiDebugAllocEntry;
  PImGuiDebugAllocInfo = ^ImGuiDebugAllocInfo;
  PImGuiMetricsConfig = ^ImGuiMetricsConfig;
  PImGuiStackLevelInfo = ^ImGuiStackLevelInfo;
  PImVector_ImGuiStackLevelInfo = ^ImVector_ImGuiStackLevelInfo;
  PImGuiIDStackTool = ^ImGuiIDStackTool;
  PImGuiContextHook = ^ImGuiContextHook;
  PImVector_ImGuiInputEvent = ^ImVector_ImGuiInputEvent;
  PImVector_ImGuiWindowStackData = ^ImVector_ImGuiWindowStackData;
  PImVector_ImGuiColorMod = ^ImVector_ImGuiColorMod;
  PImVector_ImGuiStyleMod = ^ImVector_ImGuiStyleMod;
  PImVector_ImGuiFocusScopeData = ^ImVector_ImGuiFocusScopeData;
  PImVector_ImGuiItemFlags = ^ImVector_ImGuiItemFlags;
  PImVector_ImGuiGroupData = ^ImVector_ImGuiGroupData;
  PImVector_ImGuiPopupData = ^ImVector_ImGuiPopupData;
  PImVector_ImGuiNavTreeNodeData = ^ImVector_ImGuiNavTreeNodeData;
  PImVector_ImGuiViewportPPtr = ^ImVector_ImGuiViewportPPtr;
  PImVector_unsigned_char = ^ImVector_unsigned_char;
  PImVector_ImGuiListClipperData = ^ImVector_ImGuiListClipperData;
  PImVector_ImGuiTableTempData = ^ImVector_ImGuiTableTempData;
  PImVector_ImGuiTable = ^ImVector_ImGuiTable;
  PImPool_ImGuiTable = ^ImPool_ImGuiTable;
  PImVector_ImGuiTabBar = ^ImVector_ImGuiTabBar;
  PImPool_ImGuiTabBar = ^ImPool_ImGuiTabBar;
  PImVector_ImGuiPtrOrIndex = ^ImVector_ImGuiPtrOrIndex;
  PImVector_ImGuiShrinkWidthItem = ^ImVector_ImGuiShrinkWidthItem;
  PImVector_ImGuiID = ^ImVector_ImGuiID;
  PImVector_ImGuiSettingsHandler = ^ImVector_ImGuiSettingsHandler;
  PImChunkStream_ImGuiWindowSettings = ^ImChunkStream_ImGuiWindowSettings;
  PImChunkStream_ImGuiTableSettings = ^ImChunkStream_ImGuiTableSettings;
  PImVector_ImGuiContextHook = ^ImVector_ImGuiContextHook;
  PImGuiContext = ^ImGuiContext;
  PImGuiWindowTempData = ^ImGuiWindowTempData;
  PImVector_ImGuiOldColumns = ^ImVector_ImGuiOldColumns;
  PImGuiWindow = ^ImGuiWindow;
  PPImGuiWindow = ^PImGuiWindow;
  PImGuiTabItem = ^ImGuiTabItem;
  PImVector_ImGuiTabItem = ^ImVector_ImGuiTabItem;
  PImGuiTabBar = ^ImGuiTabBar;
  PImGuiTableColumn = ^ImGuiTableColumn;
  PImGuiTableCellData = ^ImGuiTableCellData;
  PImGuiTableInstanceData = ^ImGuiTableInstanceData;
  PImSpan_ImGuiTableColumn = ^ImSpan_ImGuiTableColumn;
  PImSpan_ImGuiTableColumnIdx = ^ImSpan_ImGuiTableColumnIdx;
  PImSpan_ImGuiTableCellData = ^ImSpan_ImGuiTableCellData;
  PImVector_ImGuiTableInstanceData = ^ImVector_ImGuiTableInstanceData;
  PImVector_ImGuiTableColumnSortSpecs = ^ImVector_ImGuiTableColumnSortSpecs;
  PImGuiTable = ^ImGuiTable;
  PImGuiTableTempData = ^ImGuiTableTempData;
  PImGuiTableColumnSettings = ^ImGuiTableColumnSettings;
  PImGuiTableSettings = ^ImGuiTableSettings;
  PImFontBuilderIO = ^ImFontBuilderIO;
  PNSVGgradientStop = ^NSVGgradientStop;
  PNSVGgradient = ^NSVGgradient;
  PNSVGpaint = ^NSVGpaint;
  PNSVGpath = ^NSVGpath;
  PNSVGshape = ^NSVGshape;
  PNSVGimage = ^NSVGimage;

  GLFWglproc = procedure(); cdecl;

  GLFWvkproc = procedure(); cdecl;
  PGLFWmonitor = Pointer;
  PPGLFWmonitor = ^PGLFWmonitor;
  PGLFWwindow = Pointer;
  PPGLFWwindow = ^PGLFWwindow;
  PGLFWcursor = Pointer;
  PPGLFWcursor = ^PGLFWcursor;

  GLFWallocatefun = function(size: NativeUInt; user: Pointer): Pointer; cdecl;

  GLFWreallocatefun = function(block: Pointer; size: NativeUInt; user: Pointer): Pointer; cdecl;

  GLFWdeallocatefun = procedure(block: Pointer; user: Pointer); cdecl;

  GLFWerrorfun = procedure(error_code: Integer; const description: PUTF8Char); cdecl;

  GLFWwindowposfun = procedure(window: PGLFWwindow; xpos: Integer; ypos: Integer); cdecl;

  GLFWwindowsizefun = procedure(window: PGLFWwindow; width: Integer; height: Integer); cdecl;

  GLFWwindowclosefun = procedure(window: PGLFWwindow); cdecl;

  GLFWwindowrefreshfun = procedure(window: PGLFWwindow); cdecl;

  GLFWwindowfocusfun = procedure(window: PGLFWwindow; focused: Integer); cdecl;

  GLFWwindowiconifyfun = procedure(window: PGLFWwindow; iconified: Integer); cdecl;

  GLFWwindowmaximizefun = procedure(window: PGLFWwindow; maximized: Integer); cdecl;

  GLFWframebuffersizefun = procedure(window: PGLFWwindow; width: Integer; height: Integer); cdecl;

  GLFWwindowcontentscalefun = procedure(window: PGLFWwindow; xscale: Single; yscale: Single); cdecl;

  GLFWmousebuttonfun = procedure(window: PGLFWwindow; button: Integer; action: Integer; mods: Integer); cdecl;

  GLFWcursorposfun = procedure(window: PGLFWwindow; xpos: Double; ypos: Double); cdecl;

  GLFWcursorenterfun = procedure(window: PGLFWwindow; entered: Integer); cdecl;

  GLFWscrollfun = procedure(window: PGLFWwindow; xoffset: Double; yoffset: Double); cdecl;

  GLFWkeyfun = procedure(window: PGLFWwindow; key: Integer; scancode: Integer; action: Integer; mods: Integer); cdecl;

  GLFWcharfun = procedure(window: PGLFWwindow; codepoint: Cardinal); cdecl;

  GLFWcharmodsfun = procedure(window: PGLFWwindow; codepoint: Cardinal; mods: Integer); cdecl;

  GLFWdropfun = procedure(window: PGLFWwindow; path_count: Integer; paths: PPUTF8Char); cdecl;

  GLFWmonitorfun = procedure(monitor: PGLFWmonitor; event: Integer); cdecl;

  GLFWjoystickfun = procedure(jid: Integer; event: Integer); cdecl;

  GLFWvidmode = record
    width: Integer;
    height: Integer;
    redBits: Integer;
    greenBits: Integer;
    blueBits: Integer;
    refreshRate: Integer;
  end;

  GLFWgammaramp = record
    red: PWord;
    green: PWord;
    blue: PWord;
    size: Cardinal;
  end;

  GLFWimage = record
    width: Integer;
    height: Integer;
    pixels: PByte;
  end;

  GLFWgamepadstate = record
    buttons: array [0..14] of Byte;
    axes: array [0..5] of Single;
  end;

  GLFWallocator = record
    allocate: GLFWallocatefun;
    reallocate: GLFWreallocatefun;
    deallocate: GLFWdeallocatefun;
    user: Pointer;
  end;

  ENetSocket = TSocket;

  ENetBuffer = record
    dataLength: NativeUInt;
    data: Pointer;
  end;

  ENetSocketSet = fd_set;
  PENetSocketSet = ^ENetSocketSet;
  enet_uint8 = UInt8;
  Penet_uint8 = ^enet_uint8;
  PPenet_uint8 = ^Penet_uint8;
  enet_uint16 = UInt16;
  enet_uint32 = UInt32;
  Penet_uint32 = ^enet_uint32;
  enet_uint64 = UInt64;
  ENetVersion = enet_uint32;
  PENetPacket = ^ENetPacket;

  _ENetCallbacks = record
    malloc: function(size: NativeUInt): Pointer; cdecl;
    free: procedure(memory: Pointer); cdecl;
    no_memory: procedure(); cdecl;
    packet_create: function(const data: Pointer; dataLength: NativeUInt; flags: enet_uint32): PENetPacket; cdecl;
    packet_destroy: procedure(packet: PENetPacket); cdecl;
  end;

  ENetCallbacks = _ENetCallbacks;
  PENetCallbacks = ^ENetCallbacks;

  _ENetListNode = record
    next: P_ENetListNode;
    previous: P_ENetListNode;
  end;

  PENetListNode = ^ENetListNode;
  ENetListNode = _ENetListNode;
  ENetListIterator = PENetListNode;

  _ENetList = record
    sentinel: ENetListNode;
  end;

  ENetList = _ENetList;
  PENetList = ^ENetList;
  ENetProtocolCommand = _ENetProtocolCommand;
  ENetProtocolFlag = _ENetProtocolFlag;

  _ENetProtocolHeader = record
    peerID: enet_uint16;
    sentTime: enet_uint16;
  end;

  ENetProtocolHeader = _ENetProtocolHeader;

  _ENetProtocolCommandHeader = record
    command: enet_uint8;
    channelID: enet_uint8;
    reliableSequenceNumber: enet_uint16;
  end;

  ENetProtocolCommandHeader = _ENetProtocolCommandHeader;

  _ENetProtocolAcknowledge = record
    header: ENetProtocolCommandHeader;
    receivedReliableSequenceNumber: enet_uint16;
    receivedSentTime: enet_uint16;
  end;

  ENetProtocolAcknowledge = _ENetProtocolAcknowledge;

  _ENetProtocolConnect = record
    header: ENetProtocolCommandHeader;
    outgoingPeerID: enet_uint16;
    incomingSessionID: enet_uint8;
    outgoingSessionID: enet_uint8;
    mtu: enet_uint32;
    windowSize: enet_uint32;
    channelCount: enet_uint32;
    incomingBandwidth: enet_uint32;
    outgoingBandwidth: enet_uint32;
    packetThrottleInterval: enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
    connectID: enet_uint32;
    data: enet_uint32;
  end;

  ENetProtocolConnect = _ENetProtocolConnect;

  _ENetProtocolVerifyConnect = record
    header: ENetProtocolCommandHeader;
    outgoingPeerID: enet_uint16;
    incomingSessionID: enet_uint8;
    outgoingSessionID: enet_uint8;
    mtu: enet_uint32;
    windowSize: enet_uint32;
    channelCount: enet_uint32;
    incomingBandwidth: enet_uint32;
    outgoingBandwidth: enet_uint32;
    packetThrottleInterval: enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
    connectID: enet_uint32;
  end;

  ENetProtocolVerifyConnect = _ENetProtocolVerifyConnect;

  _ENetProtocolBandwidthLimit = record
    header: ENetProtocolCommandHeader;
    incomingBandwidth: enet_uint32;
    outgoingBandwidth: enet_uint32;
  end;

  ENetProtocolBandwidthLimit = _ENetProtocolBandwidthLimit;

  _ENetProtocolThrottleConfigure = record
    header: ENetProtocolCommandHeader;
    packetThrottleInterval: enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
  end;

  ENetProtocolThrottleConfigure = _ENetProtocolThrottleConfigure;

  _ENetProtocolDisconnect = record
    header: ENetProtocolCommandHeader;
    data: enet_uint32;
  end;

  ENetProtocolDisconnect = _ENetProtocolDisconnect;

  _ENetProtocolPing = record
    header: ENetProtocolCommandHeader;
  end;

  ENetProtocolPing = _ENetProtocolPing;

  _ENetProtocolSendReliable = record
    header: ENetProtocolCommandHeader;
    dataLength: enet_uint16;
  end;

  ENetProtocolSendReliable = _ENetProtocolSendReliable;

  _ENetProtocolSendUnreliable = record
    header: ENetProtocolCommandHeader;
    unreliableSequenceNumber: enet_uint16;
    dataLength: enet_uint16;
  end;

  ENetProtocolSendUnreliable = _ENetProtocolSendUnreliable;

  _ENetProtocolSendUnsequenced = record
    header: ENetProtocolCommandHeader;
    unsequencedGroup: enet_uint16;
    dataLength: enet_uint16;
  end;

  ENetProtocolSendUnsequenced = _ENetProtocolSendUnsequenced;

  _ENetProtocolSendFragment = record
    header: ENetProtocolCommandHeader;
    startSequenceNumber: enet_uint16;
    dataLength: enet_uint16;
    fragmentCount: enet_uint32;
    fragmentNumber: enet_uint32;
    totalLength: enet_uint32;
    fragmentOffset: enet_uint32;
  end;

  ENetProtocolSendFragment = _ENetProtocolSendFragment;

  _ENetProtocol = record
    case Integer of
      0: (header: ENetProtocolCommandHeader);
      1: (acknowledge: ENetProtocolAcknowledge);
      2: (connect: ENetProtocolConnect);
      3: (verifyConnect: ENetProtocolVerifyConnect);
      4: (disconnect: ENetProtocolDisconnect);
      5: (ping: ENetProtocolPing);
      6: (sendReliable: ENetProtocolSendReliable);
      7: (sendUnreliable: ENetProtocolSendUnreliable);
      8: (sendUnsequenced: ENetProtocolSendUnsequenced);
      9: (sendFragment: ENetProtocolSendFragment);
      10: (bandwidthLimit: ENetProtocolBandwidthLimit);
      11: (throttleConfigure: ENetProtocolThrottleConfigure);
  end;

  ENetProtocol = _ENetProtocol;
  PENetProtocol = ^ENetProtocol;
  ENetSocketType = _ENetSocketType;
  ENetSocketWait = _ENetSocketWait;
  ENetSocketOption = _ENetSocketOption;
  ENetSocketShutdown = _ENetSocketShutdown;

  in6_addr = record
    case Integer of
      0: (Bytes: array[0..15] of Byte);
      1: (Words: array[0..7] of Word);
  end;

  _ENetAddress = record
    host: in6_addr;
    port: enet_uint16;
    sin6_scope_id: enet_uint16;
  end;

  ENetAddress = _ENetAddress;
  PENetAddress = ^ENetAddress;
  ENetPacketFlag = _ENetPacketFlag;

  ENetPacketFreeCallback = procedure(p1: Pointer); cdecl;

  _ENetPacket = record
    referenceCount: NativeUInt;
    flags: enet_uint32;
    data: Penet_uint8;
    dataLength: NativeUInt;
    freeCallback: ENetPacketFreeCallback;
    userData: Pointer;
  end;

  ENetPacket = _ENetPacket;
  _ENetAcknowledgement = record
    acknowledgementList: ENetListNode;
    sentTime: enet_uint32;
    command: ENetProtocol;
  end;

  ENetAcknowledgement = _ENetAcknowledgement;
  PENetAcknowledgement = ^ENetAcknowledgement;

  _ENetOutgoingCommand = record
    outgoingCommandList: ENetListNode;
    reliableSequenceNumber: enet_uint16;
    unreliableSequenceNumber: enet_uint16;
    sentTime: enet_uint32;
    roundTripTimeout: enet_uint32;
    roundTripTimeoutLimit: enet_uint32;
    fragmentOffset: enet_uint32;
    fragmentLength: enet_uint16;
    sendAttempts: enet_uint16;
    command: ENetProtocol;
    packet: PENetPacket;
  end;

  ENetOutgoingCommand = _ENetOutgoingCommand;
  PENetOutgoingCommand = ^ENetOutgoingCommand;

  _ENetIncomingCommand = record
    incomingCommandList: ENetListNode;
    reliableSequenceNumber: enet_uint16;
    unreliableSequenceNumber: enet_uint16;
    command: ENetProtocol;
    fragmentCount: enet_uint32;
    fragmentsRemaining: enet_uint32;
    fragments: Penet_uint32;
    packet: PENetPacket;
  end;

  ENetIncomingCommand = _ENetIncomingCommand;
  PENetIncomingCommand = ^ENetIncomingCommand;
  ENetPeerState = _ENetPeerState;

  _ENetChannel = record
    outgoingReliableSequenceNumber: enet_uint16;
    outgoingUnreliableSequenceNumber: enet_uint16;
    usedReliableWindows: enet_uint16;
    reliableWindows: array [0..15] of enet_uint16;
    incomingReliableSequenceNumber: enet_uint16;
    incomingUnreliableSequenceNumber: enet_uint16;
    incomingReliableCommands: ENetList;
    incomingUnreliableCommands: ENetList;
  end;

  ENetChannel = _ENetChannel;
  PENetChannel = ^ENetChannel;

  _ENetPeer = record
    dispatchList: ENetListNode;
    host: P_ENetHost;
    outgoingPeerID: enet_uint16;
    incomingPeerID: enet_uint16;
    connectID: enet_uint32;
    outgoingSessionID: enet_uint8;
    incomingSessionID: enet_uint8;
    address: ENetAddress;
    data: Pointer;
    state: ENetPeerState;
    channels: PENetChannel;
    channelCount: NativeUInt;
    incomingBandwidth: enet_uint32;
    outgoingBandwidth: enet_uint32;
    incomingBandwidthThrottleEpoch: enet_uint32;
    outgoingBandwidthThrottleEpoch: enet_uint32;
    incomingDataTotal: enet_uint32;
    totalDataReceived: enet_uint64;
    outgoingDataTotal: enet_uint32;
    totalDataSent: enet_uint64;
    lastSendTime: enet_uint32;
    lastReceiveTime: enet_uint32;
    nextTimeout: enet_uint32;
    earliestTimeout: enet_uint32;
    packetLossEpoch: enet_uint32;
    packetsSent: enet_uint32;
    totalPacketsSent: enet_uint64;
    packetsLost: enet_uint32;
    totalPacketsLost: enet_uint32;
    packetLoss: enet_uint32;
    packetLossVariance: enet_uint32;
    packetThrottle: enet_uint32;
    packetThrottleLimit: enet_uint32;
    packetThrottleCounter: enet_uint32;
    packetThrottleEpoch: enet_uint32;
    packetThrottleAcceleration: enet_uint32;
    packetThrottleDeceleration: enet_uint32;
    packetThrottleInterval: enet_uint32;
    pingInterval: enet_uint32;
    timeoutLimit: enet_uint32;
    timeoutMinimum: enet_uint32;
    timeoutMaximum: enet_uint32;
    lastRoundTripTime: enet_uint32;
    lowestRoundTripTime: enet_uint32;
    lastRoundTripTimeVariance: enet_uint32;
    highestRoundTripTimeVariance: enet_uint32;
    roundTripTime: enet_uint32;
    roundTripTimeVariance: enet_uint32;
    mtu: enet_uint32;
    windowSize: enet_uint32;
    reliableDataInTransit: enet_uint32;
    outgoingReliableSequenceNumber: enet_uint16;
    acknowledgements: ENetList;
    sentReliableCommands: ENetList;
    sentUnreliableCommands: ENetList;
    outgoingReliableCommands: ENetList;
    outgoingUnreliableCommands: ENetList;
    dispatchedCommands: ENetList;
    needsDispatch: Integer;
    incomingUnsequencedGroup: enet_uint16;
    outgoingUnsequencedGroup: enet_uint16;
    unsequencedWindow: array [0..31] of enet_uint32;
    eventData: enet_uint32;
    totalWaitingData: NativeUInt;
  end;

  ENetPeer = _ENetPeer;
  PENetPeer = ^ENetPeer;

  _ENetCompressor = record
    context: Pointer;
    compress: function(context: Pointer; const inBuffers: PENetBuffer; inBufferCount: NativeUInt; inLimit: NativeUInt; outData: Penet_uint8; outLimit: NativeUInt): NativeUInt; cdecl;
    decompress: function(context: Pointer; const inData: Penet_uint8; inLimit: NativeUInt; outData: Penet_uint8; outLimit: NativeUInt): NativeUInt; cdecl;
    destroy: procedure(context: Pointer); cdecl;
  end;

  ENetCompressor = _ENetCompressor;
  PENetCompressor = ^ENetCompressor;

  ENetChecksumCallback = function(const buffers: PENetBuffer; bufferCount: NativeUInt): enet_uint32; cdecl;

  ENetInterceptCallback = function(host: P_ENetHost; event: Pointer): Integer; cdecl;

  _ENetHost = record
    socket: ENetSocket;
    address: ENetAddress;
    incomingBandwidth: enet_uint32;
    outgoingBandwidth: enet_uint32;
    bandwidthThrottleEpoch: enet_uint32;
    mtu: enet_uint32;
    randomSeed: enet_uint32;
    recalculateBandwidthLimits: Integer;
    peers: PENetPeer;
    peerCount: NativeUInt;
    channelLimit: NativeUInt;
    serviceTime: enet_uint32;
    dispatchQueue: ENetList;
    continueSending: Integer;
    packetSize: NativeUInt;
    headerFlags: enet_uint16;
    commands: array [0..31] of ENetProtocol;
    commandCount: NativeUInt;
    buffers: array [0..64] of ENetBuffer;
    bufferCount: NativeUInt;
    checksum: ENetChecksumCallback;
    compressor: ENetCompressor;
    packetData: array [0..1] of array [0..4095] of enet_uint8;
    receivedAddress: ENetAddress;
    receivedData: Penet_uint8;
    receivedDataLength: NativeUInt;
    totalSentData: enet_uint32;
    totalSentPackets: enet_uint32;
    totalReceivedData: enet_uint32;
    totalReceivedPackets: enet_uint32;
    intercept: ENetInterceptCallback;
    connectedPeers: NativeUInt;
    bandwidthLimitedPeers: NativeUInt;
    duplicatePeers: NativeUInt;
    maximumPacketSize: NativeUInt;
    maximumWaitingData: NativeUInt;
  end;

  ENetHost = _ENetHost;
  PENetHost = ^ENetHost;
  ENetEventType = _ENetEventType;

  _ENetEvent = record
    &type: ENetEventType;
    peer: PENetPeer;
    channelID: enet_uint8;
    data: enet_uint32;
    packet: PENetPacket;
  end;

  ENetEvent = _ENetEvent;
  PENetEvent = ^ENetEvent;
  voidp = Pointer;
  unzFile = voidp;
  zipFile = voidp;
  uInt = Cardinal;
  uLong = Cardinal;
  Bytef = &Byte;
  PBytef = ^Bytef;

  tm_zip_s = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
  end;

  tm_zip = tm_zip_s;

  zip_fileinfo = record
    tmz_date: tm_zip;
    dosDate: uLong;
    internal_fa: uLong;
    external_fa: uLong;
  end;

  tm_unz_s = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
  end;

  tm_unz = tm_unz_s;

  unz_file_info64_s = record
    version: uLong;
    version_needed: uLong;
    flag: uLong;
    compression_method: uLong;
    dosDate: uLong;
    crc: uLong;
    compressed_size: UInt64;
    uncompressed_size: UInt64;
    size_filename: uLong;
    size_file_extra: uLong;
    size_file_comment: uLong;
    disk_num_start: uLong;
    internal_fa: uLong;
    external_fa: uLong;
    tmu_date: tm_unz;
  end;

  unz_file_info64 = unz_file_info64_s;
  Punz_file_info64 = ^unz_file_info64;
  stbi_uc = Byte;
  Pstbi_uc = ^stbi_uc;
  stbi_us = Word;
  Pstbi_us = ^stbi_us;

  stbi_io_callbacks = record
    read: function(user: Pointer; data: PUTF8Char; size: Integer): Integer; cdecl;
    skip: procedure(user: Pointer; n: Integer); cdecl;
    eof: function(user: Pointer): Integer; cdecl;
  end;

  Pstbi_write_func = procedure(context: Pointer; data: Pointer; size: Integer); cdecl;
  stbrp_coord = Integer;

  stbrp_rect = record
    id: Integer;
    w: stbrp_coord;
    h: stbrp_coord;
    x: stbrp_coord;
    y: stbrp_coord;
    was_packed: Integer;
  end;

  stbrp_node = record
    x: stbrp_coord;
    y: stbrp_coord;
    next: Pstbrp_node;
  end;

  stbrp_context = record
    width: Integer;
    height: Integer;
    align: Integer;
    init_mode: Integer;
    heuristic: Integer;
    num_nodes: Integer;
    active_head: Pstbrp_node;
    free_head: Pstbrp_node;
    extra: array [0..1] of stbrp_node;
  end;

  stbtt__buf = record
    data: PByte;
    cursor: Integer;
    size: Integer;
  end;

  stbtt_bakedchar = record
    x0: Word;
    y0: Word;
    x1: Word;
    y1: Word;
    xoff: Single;
    yoff: Single;
    xadvance: Single;
  end;

  stbtt_aligned_quad = record
    x0: Single;
    y0: Single;
    s0: Single;
    t0: Single;
    x1: Single;
    y1: Single;
    s1: Single;
    t1: Single;
  end;

  stbtt_packedchar = record
    x0: Word;
    y0: Word;
    x1: Word;
    y1: Word;
    xoff: Single;
    yoff: Single;
    xadvance: Single;
    xoff2: Single;
    yoff2: Single;
  end;

  stbtt_pack_range = record
    font_size: Single;
    first_unicode_codepoint_in_range: Integer;
    array_of_unicode_codepoints: PInteger;
    num_chars: Integer;
    chardata_for_range: Pstbtt_packedchar;
    h_oversample: Byte;
    v_oversample: Byte;
  end;

  stbtt_pack_context = record
    user_allocator_context: Pointer;
    pack_info: Pointer;
    width: Integer;
    height: Integer;
    stride_in_bytes: Integer;
    padding: Integer;
    skip_missing: Integer;
    h_oversample: Cardinal;
    v_oversample: Cardinal;
    pixels: PByte;
    nodes: Pointer;
  end;

  stbtt_fontinfo = record
    userdata: Pointer;
    data: PByte;
    fontstart: Integer;
    numGlyphs: Integer;
    loca: Integer;
    head: Integer;
    glyf: Integer;
    hhea: Integer;
    hmtx: Integer;
    kern: Integer;
    gpos: Integer;
    svg: Integer;
    index_map: Integer;
    indexToLocFormat: Integer;
    cff: stbtt__buf;
    charstrings: stbtt__buf;
    gsubrs: stbtt__buf;
    subrs: stbtt__buf;
    fontdicts: stbtt__buf;
    fdselect: stbtt__buf;
  end;

  stbtt_kerningentry = record
    glyph1: Integer;
    glyph2: Integer;
    advance: Integer;
  end;

  stbtt_vertex = record
    x: Smallint;
    y: Smallint;
    cx: Smallint;
    cy: Smallint;
    cx1: Smallint;
    cy1: Smallint;
    &type: Byte;
    padding: Byte;
  end;

  stbtt__bitmap = record
    w: Integer;
    h: Integer;
    stride: Integer;
    pixels: PByte;
  end;

  Pplm_t = Pointer;
  PPplm_t = ^Pplm_t;
  Pplm_buffer_t = Pointer;
  PPplm_buffer_t = ^Pplm_buffer_t;
  Pplm_demux_t = Pointer;
  PPplm_demux_t = ^Pplm_demux_t;
  Pplm_video_t = Pointer;
  PPplm_video_t = ^Pplm_video_t;
  Pplm_audio_t = Pointer;
  PPplm_audio_t = ^Pplm_audio_t;

  plm_packet_t = record
    &type: Integer;
    pts: Double;
    length: NativeUInt;
    data: PUInt8;
  end;

  plm_plane_t = record
    width: Cardinal;
    height: Cardinal;
    data: PUInt8;
  end;

  plm_frame_t = record
    time: Double;
    width: Cardinal;
    height: Cardinal;
    y: plm_plane_t;
    cr: plm_plane_t;
    cb: plm_plane_t;
  end;

  plm_video_decode_callback = procedure(self: Pplm_t; frame: Pplm_frame_t; user: Pointer); cdecl;

  plm_samples_t = record
    time: Double;
    count: Cardinal;
    interleaved: array [0..2303] of Single;
  end;

  plm_audio_decode_callback = procedure(self: Pplm_t; samples: Pplm_samples_t; user: Pointer); cdecl;

  plm_buffer_load_callback = procedure(self: Pplm_buffer_t; user: Pointer); cdecl;
  ma_int8 = UTF8Char;
  ma_uint8 = Byte;
  Pma_uint8 = ^ma_uint8;
  ma_int16 = Smallint;
  Pma_int16 = ^ma_int16;
  ma_uint16 = Word;
  ma_int32 = Integer;
  Pma_int32 = ^ma_int32;
  PPma_int32 = ^Pma_int32;
  ma_uint32 = Cardinal;
  Pma_uint32 = ^ma_uint32;
  ma_int64 = Int64;
  Pma_int64 = ^ma_int64;
  ma_uint64 = UInt64;
  Pma_uint64 = ^ma_uint64;
  ma_uintptr = ma_uint64;
  ma_bool8 = ma_uint8;
  ma_bool32 = ma_uint32;
  ma_float = Single;
  ma_double = Double;
  ma_handle = Pointer;
  ma_ptr = Pointer;
  Pma_ptr = ^ma_ptr;
  ma_proc = Pointer;
  ma_wchar_win32 = WideChar;
  ma_channel = ma_uint8;
  Pma_channel = ^ma_channel;

  ma_allocation_callbacks = record
    pUserData: Pointer;
    onMalloc: function(sz: NativeUInt; pUserData: Pointer): Pointer; cdecl;
    onRealloc: function(p: Pointer; sz: NativeUInt; pUserData: Pointer): Pointer; cdecl;
    onFree: procedure(p: Pointer; pUserData: Pointer); cdecl;
  end;

  ma_lcg = record
    state: ma_int32;
  end;

  ma_atomic_uint32 = record
    value: ma_uint32;
  end;

  ma_atomic_int32 = record
    value: ma_int32;
  end;

  ma_atomic_uint64 = record
    value: ma_uint64;
  end;

  ma_atomic_float = record
    value: ma_float;
  end;

  ma_atomic_bool32 = record
    value: ma_bool32;
  end;

  ma_spinlock = ma_uint32;
  Pma_spinlock = ^ma_spinlock;
  ma_thread = ma_handle;
  ma_mutex = ma_handle;
  Pma_mutex = ^ma_mutex;
  ma_event = ma_handle;
  Pma_event = ^ma_event;
  ma_semaphore = ma_handle;

  ma_log_callback_proc = procedure(pUserData: Pointer; level: ma_uint32; const pMessage: PUTF8Char); cdecl;

  ma_log_callback = record
    onLog: ma_log_callback_proc;
    pUserData: Pointer;
  end;

  ma_log = record
    callbacks: array [0..3] of ma_log_callback;
    callbackCount: ma_uint32;
    allocationCallbacks: ma_allocation_callbacks;
    lock: ma_mutex;
  end;

  Pma_biquad_coefficient = ^ma_biquad_coefficient;
  ma_biquad_coefficient = record
    case Integer of
      0: (f32: Single);
      1: (s32: ma_int32);
  end;

  ma_biquad_config = record
    format: ma_format;
    channels: ma_uint32;
    b0: Double;
    b1: Double;
    b2: Double;
    a0: Double;
    a1: Double;
    a2: Double;
  end;

  ma_biquad = record
    format: ma_format;
    channels: ma_uint32;
    b0: ma_biquad_coefficient;
    b1: ma_biquad_coefficient;
    b2: ma_biquad_coefficient;
    a1: ma_biquad_coefficient;
    a2: ma_biquad_coefficient;
    pR1: Pma_biquad_coefficient;
    pR2: Pma_biquad_coefficient;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_lpf1_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    q: Double;
  end;

  ma_lpf2_config = ma_lpf1_config;
  Pma_lpf2_config = ^ma_lpf2_config;

  ma_lpf1 = record
    format: ma_format;
    channels: ma_uint32;
    a: ma_biquad_coefficient;
    pR1: Pma_biquad_coefficient;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_lpf2 = record
    bq: ma_biquad;
  end;

  ma_lpf_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    order: ma_uint32;
  end;

  ma_lpf = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    lpf1Count: ma_uint32;
    lpf2Count: ma_uint32;
    pLPF1: Pma_lpf1;
    pLPF2: Pma_lpf2;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_hpf1_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    q: Double;
  end;

  ma_hpf2_config = ma_hpf1_config;
  Pma_hpf2_config = ^ma_hpf2_config;

  ma_hpf1 = record
    format: ma_format;
    channels: ma_uint32;
    a: ma_biquad_coefficient;
    pR1: Pma_biquad_coefficient;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_hpf2 = record
    bq: ma_biquad;
  end;

  ma_hpf_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    order: ma_uint32;
  end;

  ma_hpf = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    hpf1Count: ma_uint32;
    hpf2Count: ma_uint32;
    pHPF1: Pma_hpf1;
    pHPF2: Pma_hpf2;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_bpf2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    q: Double;
  end;

  ma_bpf2 = record
    bq: ma_biquad;
  end;

  ma_bpf_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cutoffFrequency: Double;
    order: ma_uint32;
  end;

  ma_bpf = record
    format: ma_format;
    channels: ma_uint32;
    bpf2Count: ma_uint32;
    pBPF2: Pma_bpf2;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_notch2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    q: Double;
    frequency: Double;
  end;

  ma_notch_config = ma_notch2_config;
  Pma_notch_config = ^ma_notch_config;

  ma_notch2 = record
    bq: ma_biquad;
  end;

  ma_peak2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    gainDB: Double;
    q: Double;
    frequency: Double;
  end;

  ma_peak_config = ma_peak2_config;
  Pma_peak_config = ^ma_peak_config;

  ma_peak2 = record
    bq: ma_biquad;
  end;

  ma_loshelf2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    gainDB: Double;
    shelfSlope: Double;
    frequency: Double;
  end;

  ma_loshelf_config = ma_loshelf2_config;
  Pma_loshelf_config = ^ma_loshelf_config;

  ma_loshelf2 = record
    bq: ma_biquad;
  end;

  ma_hishelf2_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    gainDB: Double;
    shelfSlope: Double;
    frequency: Double;
  end;

  ma_hishelf_config = ma_hishelf2_config;
  Pma_hishelf_config = ^ma_hishelf_config;

  ma_hishelf2 = record
    bq: ma_biquad;
  end;

  ma_delay_config = record
    channels: ma_uint32;
    sampleRate: ma_uint32;
    delayInFrames: ma_uint32;
    delayStart: ma_bool32;
    wet: Single;
    dry: Single;
    decay: Single;
  end;

  ma_delay = record
    config: ma_delay_config;
    cursor: ma_uint32;
    bufferSizeInFrames: ma_uint32;
    pBuffer: PSingle;
  end;

  ma_gainer_config = record
    channels: ma_uint32;
    smoothTimeInFrames: ma_uint32;
  end;

  ma_gainer = record
    config: ma_gainer_config;
    t: ma_uint32;
    masterVolume: Single;
    pOldGains: PSingle;
    pNewGains: PSingle;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_panner_config = record
    format: ma_format;
    channels: ma_uint32;
    mode: ma_pan_mode;
    pan: Single;
  end;

  ma_panner = record
    format: ma_format;
    channels: ma_uint32;
    mode: ma_pan_mode;
    pan: Single;
  end;

  ma_fader_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
  end;

  ma_fader = record
    config: ma_fader_config;
    volumeBeg: Single;
    volumeEnd: Single;
    lengthInFrames: ma_uint64;
    cursorInFrames: ma_int64;
  end;

  ma_vec3f = record
    x: Single;
    y: Single;
    z: Single;
  end;

  ma_atomic_vec3f = record
    v: ma_vec3f;
    lock: ma_spinlock;
  end;

  ma_spatializer_listener_config = record
    channelsOut: ma_uint32;
    pChannelMapOut: Pma_channel;
    handedness: ma_handedness;
    coneInnerAngleInRadians: Single;
    coneOuterAngleInRadians: Single;
    coneOuterGain: Single;
    speedOfSound: Single;
    worldUp: ma_vec3f;
  end;

  ma_spatializer_listener = record
    config: ma_spatializer_listener_config;
    position: ma_atomic_vec3f;
    direction: ma_atomic_vec3f;
    velocity: ma_atomic_vec3f;
    isEnabled: ma_bool32;
    _ownsHeap: ma_bool32;
    _pHeap: Pointer;
  end;

  ma_spatializer_config = record
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    attenuationModel: ma_attenuation_model;
    positioning: ma_positioning;
    handedness: ma_handedness;
    minGain: Single;
    maxGain: Single;
    minDistance: Single;
    maxDistance: Single;
    rolloff: Single;
    coneInnerAngleInRadians: Single;
    coneOuterAngleInRadians: Single;
    coneOuterGain: Single;
    dopplerFactor: Single;
    directionalAttenuationFactor: Single;
    minSpatializationChannelGain: Single;
    gainSmoothTimeInFrames: ma_uint32;
  end;

  ma_spatializer = record
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    attenuationModel: ma_attenuation_model;
    positioning: ma_positioning;
    handedness: ma_handedness;
    minGain: Single;
    maxGain: Single;
    minDistance: Single;
    maxDistance: Single;
    rolloff: Single;
    coneInnerAngleInRadians: Single;
    coneOuterAngleInRadians: Single;
    coneOuterGain: Single;
    dopplerFactor: Single;
    directionalAttenuationFactor: Single;
    gainSmoothTimeInFrames: ma_uint32;
    position: ma_atomic_vec3f;
    direction: ma_atomic_vec3f;
    velocity: ma_atomic_vec3f;
    dopplerPitch: Single;
    minSpatializationChannelGain: Single;
    gainer: ma_gainer;
    pNewChannelGainsOut: PSingle;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_linear_resampler_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    lpfOrder: ma_uint32;
    lpfNyquistFactor: Double;
  end;

  P_anonymous_type_12 = ^_anonymous_type_12;
  _anonymous_type_12 = record
    case Integer of
      0: (f32: PSingle);
      1: (s16: Pma_int16);
  end;

  P_anonymous_type_13 = ^_anonymous_type_13;
  _anonymous_type_13 = record
    case Integer of
      0: (f32: PSingle);
      1: (s16: Pma_int16);
  end;

  ma_linear_resampler = record
    config: ma_linear_resampler_config;
    inAdvanceInt: ma_uint32;
    inAdvanceFrac: ma_uint32;
    inTimeInt: ma_uint32;
    inTimeFrac: ma_uint32;
    x0: _anonymous_type_12;
    x1: _anonymous_type_13;
    lpf: ma_lpf;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  Pma_resampling_backend = Pointer;
  PPma_resampling_backend = ^Pma_resampling_backend;

  ma_resampling_backend_vtable = record
    onGetHeapSize: function(pUserData: Pointer; const pConfig: Pma_resampler_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
    onInit: function(pUserData: Pointer; const pConfig: Pma_resampler_config; pHeap: Pointer; ppBackend: PPma_resampling_backend): ma_result; cdecl;
    onUninit: procedure(pUserData: Pointer; pBackend: Pma_resampling_backend; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
    onProcess: function(pUserData: Pointer; pBackend: Pma_resampling_backend; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl;
    onSetRate: function(pUserData: Pointer; pBackend: Pma_resampling_backend; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl;
    onGetInputLatency: function(pUserData: Pointer; const pBackend: Pma_resampling_backend): ma_uint64; cdecl;
    onGetOutputLatency: function(pUserData: Pointer; const pBackend: Pma_resampling_backend): ma_uint64; cdecl;
    onGetRequiredInputFrameCount: function(pUserData: Pointer; const pBackend: Pma_resampling_backend; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl;
    onGetExpectedOutputFrameCount: function(pUserData: Pointer; const pBackend: Pma_resampling_backend; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl;
    onReset: function(pUserData: Pointer; pBackend: Pma_resampling_backend): ma_result; cdecl;
  end;

  P_anonymous_type_14 = ^_anonymous_type_14;
  _anonymous_type_14 = record
    lpfOrder: ma_uint32;
  end;

  ma_resampler_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    algorithm: ma_resample_algorithm;
    pBackendVTable: Pma_resampling_backend_vtable;
    pBackendUserData: Pointer;
    linear: _anonymous_type_14;
  end;

  P_anonymous_type_15 = ^_anonymous_type_15;
  _anonymous_type_15 = record
    case Integer of
      0: (linear: ma_linear_resampler);
  end;

  ma_resampler = record
    pBackend: Pma_resampling_backend;
    pBackendVTable: Pma_resampling_backend_vtable;
    pBackendUserData: Pointer;
    format: ma_format;
    channels: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    state: _anonymous_type_15;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_channel_converter_config = record
    format: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    pChannelMapOut: Pma_channel;
    mixingMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    ppWeights: PPSingle;
  end;

  P_anonymous_type_16 = ^_anonymous_type_16;
  _anonymous_type_16 = record
    case Integer of
      0: (f32: PPSingle);
      1: (s16: PPma_int32);
  end;

  ma_channel_converter = record
    format: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    mixingMode: ma_channel_mix_mode;
    conversionPath: ma_channel_conversion_path;
    pChannelMapIn: Pma_channel;
    pChannelMapOut: Pma_channel;
    pShuffleTable: Pma_uint8;
    weights: _anonymous_type_16;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_data_converter_config = record
    formatIn: ma_format;
    formatOut: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    pChannelMapIn: Pma_channel;
    pChannelMapOut: Pma_channel;
    ditherMode: ma_dither_mode;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    ppChannelWeights: PPSingle;
    allowDynamicSampleRate: ma_bool32;
    resampling: ma_resampler_config;
  end;

  ma_data_converter = record
    formatIn: ma_format;
    formatOut: ma_format;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    sampleRateIn: ma_uint32;
    sampleRateOut: ma_uint32;
    ditherMode: ma_dither_mode;
    executionPath: ma_data_converter_execution_path;
    channelConverter: ma_channel_converter;
    resampler: ma_resampler;
    hasPreFormatConversion: ma_bool8;
    hasPostFormatConversion: ma_bool8;
    hasChannelConverter: ma_bool8;
    hasResampler: ma_bool8;
    isPassthrough: ma_bool8;
    _ownsHeap: ma_bool8;
    _pHeap: Pointer;
  end;

  Pma_data_source = Pointer;
  PPma_data_source = ^Pma_data_source;

  ma_data_source_vtable = record
    onRead: function(pDataSource: Pma_data_source; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
    onSeek: function(pDataSource: Pma_data_source; frameIndex: ma_uint64): ma_result; cdecl;
    onGetDataFormat: function(pDataSource: Pma_data_source; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
    onGetCursor: function(pDataSource: Pma_data_source; pCursor: Pma_uint64): ma_result; cdecl;
    onGetLength: function(pDataSource: Pma_data_source; pLength: Pma_uint64): ma_result; cdecl;
    onSetLooping: function(pDataSource: Pma_data_source; isLooping: ma_bool32): ma_result; cdecl;
    flags: ma_uint32;
  end;

  ma_data_source_get_next_proc = function(pDataSource: Pma_data_source): Pma_data_source; cdecl;

  ma_data_source_config = record
    vtable: Pma_data_source_vtable;
  end;

  ma_data_source_base = record
    vtable: Pma_data_source_vtable;
    rangeBegInFrames: ma_uint64;
    rangeEndInFrames: ma_uint64;
    loopBegInFrames: ma_uint64;
    loopEndInFrames: ma_uint64;
    pCurrent: Pma_data_source;
    pNext: Pma_data_source;
    onGetNext: ma_data_source_get_next_proc;
    isLooping: ma_bool32;
  end;

  ma_audio_buffer_ref = record
    ds: ma_data_source_base;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    cursor: ma_uint64;
    sizeInFrames: ma_uint64;
    pData: Pointer;
  end;

  ma_audio_buffer_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    sizeInFrames: ma_uint64;
    pData: Pointer;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  ma_audio_buffer = record
    ref: ma_audio_buffer_ref;
    allocationCallbacks: ma_allocation_callbacks;
    ownsData: ma_bool32;
    _pExtraData: array [0..0] of ma_uint8;
  end;

  ma_paged_audio_buffer_page = record
    pNext: Pma_paged_audio_buffer_page;
    sizeInFrames: ma_uint64;
    pAudioData: array [0..0] of ma_uint8;
  end;

  ma_paged_audio_buffer_data = record
    format: ma_format;
    channels: ma_uint32;
    head: ma_paged_audio_buffer_page;
    pTail: Pma_paged_audio_buffer_page;
  end;

  ma_paged_audio_buffer_config = record
    pData: Pma_paged_audio_buffer_data;
  end;

  ma_paged_audio_buffer = record
    ds: ma_data_source_base;
    pData: Pma_paged_audio_buffer_data;
    pCurrent: Pma_paged_audio_buffer_page;
    relativeCursor: ma_uint64;
    absoluteCursor: ma_uint64;
  end;

  ma_rb = record
    pBuffer: Pointer;
    subbufferSizeInBytes: ma_uint32;
    subbufferCount: ma_uint32;
    subbufferStrideInBytes: ma_uint32;
    encodedReadOffset: ma_uint32;
    encodedWriteOffset: ma_uint32;
    ownsBuffer: ma_bool8;
    clearOnWriteAcquire: ma_bool8;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  ma_pcm_rb = record
    ds: ma_data_source_base;
    rb: ma_rb;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
  end;

  ma_duplex_rb = record
    rb: ma_pcm_rb;
  end;

  ma_fence = record
    e: ma_event;
    counter: ma_uint32;
  end;

  Pma_async_notification = Pointer;
  PPma_async_notification = ^Pma_async_notification;

  ma_async_notification_callbacks = record
    onSignal: procedure(pNotification: Pma_async_notification); cdecl;
  end;

  ma_async_notification_poll = record
    cb: ma_async_notification_callbacks;
    signalled: ma_bool32;
  end;

  ma_async_notification_event = record
    cb: ma_async_notification_callbacks;
    e: ma_event;
  end;

  ma_slot_allocator_config = record
    capacity: ma_uint32;
  end;

  ma_slot_allocator_group = record
    bitfield: ma_uint32;
  end;

  ma_slot_allocator = record
    pGroups: Pma_slot_allocator_group;
    pSlots: Pma_uint32;
    count: ma_uint32;
    capacity: ma_uint32;
    _ownsHeap: ma_bool32;
    _pHeap: Pointer;
  end;

  ma_job_proc = function(pJob: Pma_job): ma_result; cdecl;

  P_anonymous_type_17 = ^_anonymous_type_17;
  _anonymous_type_17 = record
    code: ma_uint16;
    slot: ma_uint16;
    refcount: ma_uint32;
  end;

  P_anonymous_type_18 = ^_anonymous_type_18;
  _anonymous_type_18 = record
    case Integer of
      0: (breakup: _anonymous_type_17);
      1: (allocation: ma_uint64);
  end;

  P_anonymous_type_19 = ^_anonymous_type_19;
  _anonymous_type_19 = record
    proc: ma_job_proc;
    data0: ma_uintptr;
    data1: ma_uintptr;
  end;

  P_anonymous_type_20 = ^_anonymous_type_20;
  _anonymous_type_20 = record
    pResourceManager: Pointer;
    pDataBufferNode: Pointer;
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    flags: ma_uint32;
    pInitNotification: Pma_async_notification;
    pDoneNotification: Pma_async_notification;
    pInitFence: Pma_fence;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_21 = ^_anonymous_type_21;
  _anonymous_type_21 = record
    pResourceManager: Pointer;
    pDataBufferNode: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_22 = ^_anonymous_type_22;
  _anonymous_type_22 = record
    pResourceManager: Pointer;
    pDataBufferNode: Pointer;
    pDecoder: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_23 = ^_anonymous_type_23;
  _anonymous_type_23 = record
    pDataBuffer: Pointer;
    pInitNotification: Pma_async_notification;
    pDoneNotification: Pma_async_notification;
    pInitFence: Pma_fence;
    pDoneFence: Pma_fence;
    rangeBegInPCMFrames: ma_uint64;
    rangeEndInPCMFrames: ma_uint64;
    loopPointBegInPCMFrames: ma_uint64;
    loopPointEndInPCMFrames: ma_uint64;
    isLooping: ma_uint32;
  end;

  P_anonymous_type_24 = ^_anonymous_type_24;
  _anonymous_type_24 = record
    pDataBuffer: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_25 = ^_anonymous_type_25;
  _anonymous_type_25 = record
    pDataStream: Pointer;
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    initialSeekPoint: ma_uint64;
    pInitNotification: Pma_async_notification;
    pInitFence: Pma_fence;
  end;

  P_anonymous_type_26 = ^_anonymous_type_26;
  _anonymous_type_26 = record
    pDataStream: Pointer;
    pDoneNotification: Pma_async_notification;
    pDoneFence: Pma_fence;
  end;

  P_anonymous_type_27 = ^_anonymous_type_27;
  _anonymous_type_27 = record
    pDataStream: Pointer;
    pageIndex: ma_uint32;
  end;

  P_anonymous_type_28 = ^_anonymous_type_28;
  _anonymous_type_28 = record
    pDataStream: Pointer;
    frameIndex: ma_uint64;
  end;

  P_anonymous_type_29 = ^_anonymous_type_29;
  _anonymous_type_29 = record
    case Integer of
      0: (loadDataBufferNode: _anonymous_type_20);
      1: (freeDataBufferNode: _anonymous_type_21);
      2: (pageDataBufferNode: _anonymous_type_22);
      3: (loadDataBuffer: _anonymous_type_23);
      4: (freeDataBuffer: _anonymous_type_24);
      5: (loadDataStream: _anonymous_type_25);
      6: (freeDataStream: _anonymous_type_26);
      7: (pageDataStream: _anonymous_type_27);
      8: (seekDataStream: _anonymous_type_28);
  end;

  P_anonymous_type_30 = ^_anonymous_type_30;
  _anonymous_type_30 = record
    pDevice: Pointer;
    deviceType: ma_uint32;
  end;

  P_anonymous_type_31 = ^_anonymous_type_31;
  _anonymous_type_31 = record
    case Integer of
      0: (reroute: _anonymous_type_30);
  end;

  P_anonymous_type_32 = ^_anonymous_type_32;
  _anonymous_type_32 = record
    case Integer of
      0: (aaudio: _anonymous_type_31);
  end;

  P_anonymous_type_33 = ^_anonymous_type_33;
  _anonymous_type_33 = record
    case Integer of
      0: (custom: _anonymous_type_19);
      1: (resourceManager: _anonymous_type_29);
      2: (device: _anonymous_type_32);
  end;

  ma_job = record
    toc: _anonymous_type_18;
    next: ma_uint64;
    order: ma_uint32;
    data: _anonymous_type_33;
  end;

  ma_job_queue_config = record
    flags: ma_uint32;
    capacity: ma_uint32;
  end;

  ma_job_queue = record
    flags: ma_uint32;
    capacity: ma_uint32;
    head: ma_uint64;
    tail: ma_uint64;
    sem: ma_semaphore;
    allocator: ma_slot_allocator;
    pJobs: Pma_job;
    lock: ma_spinlock;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_atomic_device_state = record
    value: ma_device_state;
  end;

  ma_IMMNotificationClient = record
    lpVtbl: Pointer;
    counter: ma_uint32;
    pDevice: Pma_device;
  end;

  ma_device_job_thread_config = record
    noThread: ma_bool32;
    jobQueueCapacity: ma_uint32;
    jobQueueFlags: ma_uint32;
  end;

  ma_device_job_thread = record
    thread: ma_thread;
    jobQueue: ma_job_queue;
    _hasThread: ma_bool32;
  end;

  P_anonymous_type_34 = ^_anonymous_type_34;
  _anonymous_type_34 = record
    _unused: Integer;
  end;

  P_anonymous_type_35 = ^_anonymous_type_35;
  _anonymous_type_35 = record
    _unused: Integer;
  end;

  P_anonymous_type_36 = ^_anonymous_type_36;
  _anonymous_type_36 = record
    _unused: Integer;
  end;

  P_anonymous_type_37 = ^_anonymous_type_37;
  _anonymous_type_37 = record
    _unused: Integer;
  end;

  P_anonymous_type_38 = ^_anonymous_type_38;
  _anonymous_type_38 = record
    case Integer of
      0: (started: _anonymous_type_34);
      1: (stopped: _anonymous_type_35);
      2: (rerouted: _anonymous_type_36);
      3: (interruption: _anonymous_type_37);
  end;

  ma_device_notification = record
    pDevice: Pma_device;
    &type: ma_device_notification_type;
    data: _anonymous_type_38;
  end;

  ma_device_notification_proc = procedure(const pNotification: Pma_device_notification); cdecl;

  ma_device_data_proc = procedure(pDevice: Pma_device; pOutput: Pointer; const pInput: Pointer; frameCount: ma_uint32); cdecl;

  ma_stop_proc = procedure(pDevice: Pma_device); cdecl;

  ma_timer = record
    case Integer of
      0: (counter: ma_int64);
      1: (counterD: Double);
  end;

  P_anonymous_type_39 = ^_anonymous_type_39;
  _anonymous_type_39 = record
    case Integer of
      0: (i: Integer);
      1: (s: array [0..255] of UTF8Char);
      2: (p: Pointer);
  end;

  Pma_device_id = ^ma_device_id;
  ma_device_id = record
    case Integer of
      0: (wasapi: array [0..63] of ma_wchar_win32);
      1: (dsound: array [0..15] of ma_uint8);
      2: (winmm: ma_uint32);
      3: (alsa: array [0..255] of UTF8Char);
      4: (pulse: array [0..255] of UTF8Char);
      5: (jack: Integer);
      6: (coreaudio: array [0..255] of UTF8Char);
      7: (sndio: array [0..255] of UTF8Char);
      8: (audio4: array [0..255] of UTF8Char);
      9: (oss: array [0..63] of UTF8Char);
      10: (aaudio: ma_int32);
      11: (opensl: ma_uint32);
      12: (webaudio: array [0..31] of UTF8Char);
      13: (custom: _anonymous_type_39);
      14: (nullbackend: Integer);
  end;

  P_anonymous_type_40 = ^_anonymous_type_40;
  _anonymous_type_40 = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    flags: ma_uint32;
  end;

  ma_device_info = record
    id: ma_device_id;
    name: array [0..255] of UTF8Char;
    isDefault: ma_bool32;
    nativeDataFormatCount: ma_uint32;
    nativeDataFormats: array [0..63] of _anonymous_type_40;
  end;

  P_anonymous_type_41 = ^_anonymous_type_41;
  _anonymous_type_41 = record
    pDeviceID: Pma_device_id;
    format: ma_format;
    channels: ma_uint32;
    pChannelMap: Pma_channel;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    shareMode: ma_share_mode;
  end;

  P_anonymous_type_42 = ^_anonymous_type_42;
  _anonymous_type_42 = record
    pDeviceID: Pma_device_id;
    format: ma_format;
    channels: ma_uint32;
    pChannelMap: Pma_channel;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    shareMode: ma_share_mode;
  end;

  P_anonymous_type_43 = ^_anonymous_type_43;
  _anonymous_type_43 = record
    usage: ma_wasapi_usage;
    noAutoConvertSRC: ma_bool8;
    noDefaultQualitySRC: ma_bool8;
    noAutoStreamRouting: ma_bool8;
    noHardwareOffloading: ma_bool8;
    loopbackProcessID: ma_uint32;
    loopbackProcessExclude: ma_bool8;
  end;

  P_anonymous_type_44 = ^_anonymous_type_44;
  _anonymous_type_44 = record
    noMMap: ma_bool32;
    noAutoFormat: ma_bool32;
    noAutoChannels: ma_bool32;
    noAutoResample: ma_bool32;
  end;

  P_anonymous_type_45 = ^_anonymous_type_45;
  _anonymous_type_45 = record
    pStreamNamePlayback: PUTF8Char;
    pStreamNameCapture: PUTF8Char;
  end;

  P_anonymous_type_46 = ^_anonymous_type_46;
  _anonymous_type_46 = record
    allowNominalSampleRateChange: ma_bool32;
  end;

  P_anonymous_type_47 = ^_anonymous_type_47;
  _anonymous_type_47 = record
    streamType: ma_opensl_stream_type;
    recordingPreset: ma_opensl_recording_preset;
    enableCompatibilityWorkarounds: ma_bool32;
  end;

  P_anonymous_type_48 = ^_anonymous_type_48;
  _anonymous_type_48 = record
    usage: ma_aaudio_usage;
    contentType: ma_aaudio_content_type;
    inputPreset: ma_aaudio_input_preset;
    allowedCapturePolicy: ma_aaudio_allowed_capture_policy;
    noAutoStartAfterReroute: ma_bool32;
    enableCompatibilityWorkarounds: ma_bool32;
  end;

  ma_device_config = record
    deviceType: ma_device_type;
    sampleRate: ma_uint32;
    periodSizeInFrames: ma_uint32;
    periodSizeInMilliseconds: ma_uint32;
    periods: ma_uint32;
    performanceProfile: ma_performance_profile;
    noPreSilencedOutputBuffer: ma_bool8;
    noClip: ma_bool8;
    noDisableDenormals: ma_bool8;
    noFixedSizedCallback: ma_bool8;
    dataCallback: ma_device_data_proc;
    notificationCallback: ma_device_notification_proc;
    stopCallback: ma_stop_proc;
    pUserData: Pointer;
    resampling: ma_resampler_config;
    playback: _anonymous_type_41;
    capture: _anonymous_type_42;
    wasapi: _anonymous_type_43;
    alsa: _anonymous_type_44;
    pulse: _anonymous_type_45;
    coreaudio: _anonymous_type_46;
    opensl: _anonymous_type_47;
    aaudio: _anonymous_type_48;
  end;

  ma_enum_devices_callback_proc = function(pContext: Pma_context; deviceType: ma_device_type; const pInfo: Pma_device_info; pUserData: Pointer): ma_bool32; cdecl;

  ma_device_descriptor = record
    pDeviceID: Pma_device_id;
    shareMode: ma_share_mode;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    channelMap: array [0..253] of ma_channel;
    periodSizeInFrames: ma_uint32;
    periodSizeInMilliseconds: ma_uint32;
    periodCount: ma_uint32;
  end;

  ma_backend_callbacks = record
    onContextInit: function(pContext: Pma_context; const pConfig: Pma_context_config; pCallbacks: Pma_backend_callbacks): ma_result; cdecl;
    onContextUninit: function(pContext: Pma_context): ma_result; cdecl;
    onContextEnumerateDevices: function(pContext: Pma_context; callback: ma_enum_devices_callback_proc; pUserData: Pointer): ma_result; cdecl;
    onContextGetDeviceInfo: function(pContext: Pma_context; deviceType: ma_device_type; const pDeviceID: Pma_device_id; pDeviceInfo: Pma_device_info): ma_result; cdecl;
    onDeviceInit: function(pDevice: Pma_device; const pConfig: Pma_device_config; pDescriptorPlayback: Pma_device_descriptor; pDescriptorCapture: Pma_device_descriptor): ma_result; cdecl;
    onDeviceUninit: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceStart: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceStop: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceRead: function(pDevice: Pma_device; pFrames: Pointer; frameCount: ma_uint32; pFramesRead: Pma_uint32): ma_result; cdecl;
    onDeviceWrite: function(pDevice: Pma_device; const pFrames: Pointer; frameCount: ma_uint32; pFramesWritten: Pma_uint32): ma_result; cdecl;
    onDeviceDataLoop: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceDataLoopWakeup: function(pDevice: Pma_device): ma_result; cdecl;
    onDeviceGetInfo: function(pDevice: Pma_device; &type: ma_device_type; pDeviceInfo: Pma_device_info): ma_result; cdecl;
  end;

  P_anonymous_type_49 = ^_anonymous_type_49;
  _anonymous_type_49 = record
    useVerboseDeviceEnumeration: ma_bool32;
  end;

  P_anonymous_type_50 = ^_anonymous_type_50;
  _anonymous_type_50 = record
    pApplicationName: PUTF8Char;
    pServerName: PUTF8Char;
    tryAutoSpawn: ma_bool32;
  end;

  P_anonymous_type_51 = ^_anonymous_type_51;
  _anonymous_type_51 = record
    sessionCategory: ma_ios_session_category;
    sessionCategoryOptions: ma_uint32;
    noAudioSessionActivate: ma_bool32;
    noAudioSessionDeactivate: ma_bool32;
  end;

  P_anonymous_type_52 = ^_anonymous_type_52;
  _anonymous_type_52 = record
    pClientName: PUTF8Char;
    tryStartServer: ma_bool32;
  end;

  ma_context_config = record
    pLog: Pma_log;
    threadPriority: ma_thread_priority;
    threadStackSize: NativeUInt;
    pUserData: Pointer;
    allocationCallbacks: ma_allocation_callbacks;
    alsa: _anonymous_type_49;
    pulse: _anonymous_type_50;
    coreaudio: _anonymous_type_51;
    jack: _anonymous_type_52;
    custom: ma_backend_callbacks;
  end;

  P_anonymous_type_53 = ^_anonymous_type_53;
  _anonymous_type_53 = record
    _unused: Integer;
  end;

  P_anonymous_type_54 = ^_anonymous_type_54;
  _anonymous_type_54 = record
    deviceType: ma_device_type;
    pAudioClient: Pointer;
    ppAudioClientService: PPointer;
    pResult: Pma_result;
  end;

  P_anonymous_type_55 = ^_anonymous_type_55;
  _anonymous_type_55 = record
    pDevice: Pma_device;
    deviceType: ma_device_type;
  end;

  P_anonymous_type_56 = ^_anonymous_type_56;
  _anonymous_type_56 = record
    case Integer of
      0: (quit: _anonymous_type_53);
      1: (createAudioClient: _anonymous_type_54);
      2: (releaseAudioClient: _anonymous_type_55);
  end;

  ma_context_command__wasapi = record
    code: Integer;
    pEvent: Pma_event;
    data: _anonymous_type_56;
  end;

  P_anonymous_type_57 = ^_anonymous_type_57;
  _anonymous_type_57 = record
    commandThread: ma_thread;
    commandLock: ma_mutex;
    commandSem: ma_semaphore;
    commandIndex: ma_uint32;
    commandCount: ma_uint32;
    commands: array [0..3] of ma_context_command__wasapi;
    hAvrt: ma_handle;
    AvSetMmThreadCharacteristicsA: ma_proc;
    AvRevertMmThreadcharacteristics: ma_proc;
    hMMDevapi: ma_handle;
    ActivateAudioInterfaceAsync: ma_proc;
  end;

  P_anonymous_type_58 = ^_anonymous_type_58;
  _anonymous_type_58 = record
    hDSoundDLL: ma_handle;
    DirectSoundCreate: ma_proc;
    DirectSoundEnumerateA: ma_proc;
    DirectSoundCaptureCreate: ma_proc;
    DirectSoundCaptureEnumerateA: ma_proc;
  end;

  P_anonymous_type_59 = ^_anonymous_type_59;
  _anonymous_type_59 = record
    hWinMM: ma_handle;
    waveOutGetNumDevs: ma_proc;
    waveOutGetDevCapsA: ma_proc;
    waveOutOpen: ma_proc;
    waveOutClose: ma_proc;
    waveOutPrepareHeader: ma_proc;
    waveOutUnprepareHeader: ma_proc;
    waveOutWrite: ma_proc;
    waveOutReset: ma_proc;
    waveInGetNumDevs: ma_proc;
    waveInGetDevCapsA: ma_proc;
    waveInOpen: ma_proc;
    waveInClose: ma_proc;
    waveInPrepareHeader: ma_proc;
    waveInUnprepareHeader: ma_proc;
    waveInAddBuffer: ma_proc;
    waveInStart: ma_proc;
    waveInReset: ma_proc;
  end;

  P_anonymous_type_60 = ^_anonymous_type_60;
  _anonymous_type_60 = record
    jackSO: ma_handle;
    jack_client_open: ma_proc;
    jack_client_close: ma_proc;
    jack_client_name_size: ma_proc;
    jack_set_process_callback: ma_proc;
    jack_set_buffer_size_callback: ma_proc;
    jack_on_shutdown: ma_proc;
    jack_get_sample_rate: ma_proc;
    jack_get_buffer_size: ma_proc;
    jack_get_ports: ma_proc;
    jack_activate: ma_proc;
    jack_deactivate: ma_proc;
    jack_connect: ma_proc;
    jack_port_register: ma_proc;
    jack_port_name: ma_proc;
    jack_port_get_buffer: ma_proc;
    jack_free: ma_proc;
    pClientName: PUTF8Char;
    tryStartServer: ma_bool32;
  end;

  P_anonymous_type_61 = ^_anonymous_type_61;
  _anonymous_type_61 = record
    _unused: Integer;
  end;

  P_anonymous_type_62 = ^_anonymous_type_62;
  _anonymous_type_62 = record
    case Integer of
      0: (wasapi: _anonymous_type_57);
      1: (dsound: _anonymous_type_58);
      2: (winmm: _anonymous_type_59);
      3: (jack: _anonymous_type_60);
      4: (null_backend: _anonymous_type_61);
  end;

  P_anonymous_type_63 = ^_anonymous_type_63;
  _anonymous_type_63 = record
    hOle32DLL: ma_handle;
    CoInitialize: ma_proc;
    CoInitializeEx: ma_proc;
    CoUninitialize: ma_proc;
    CoCreateInstance: ma_proc;
    CoTaskMemFree: ma_proc;
    PropVariantClear: ma_proc;
    StringFromGUID2: ma_proc;
    hUser32DLL: ma_handle;
    GetForegroundWindow: ma_proc;
    GetDesktopWindow: ma_proc;
    hAdvapi32DLL: ma_handle;
    RegOpenKeyExA: ma_proc;
    RegCloseKey: ma_proc;
    RegQueryValueExA: ma_proc;
    CoInitializeResult: Integer;
  end;

  P_anonymous_type_64 = ^_anonymous_type_64;
  _anonymous_type_64 = record
    case Integer of
      0: (win32: _anonymous_type_63);
      1: (_unused: Integer);
  end;

  ma_context = record
    callbacks: ma_backend_callbacks;
    backend: ma_backend;
    pLog: Pma_log;
    log: ma_log;
    threadPriority: ma_thread_priority;
    threadStackSize: NativeUInt;
    pUserData: Pointer;
    allocationCallbacks: ma_allocation_callbacks;
    deviceEnumLock: ma_mutex;
    deviceInfoLock: ma_mutex;
    deviceInfoCapacity: ma_uint32;
    playbackDeviceInfoCount: ma_uint32;
    captureDeviceInfoCount: ma_uint32;
    pDeviceInfos: Pma_device_info;
    f15: _anonymous_type_62;
    f16: _anonymous_type_64;
  end;

  P_anonymous_type_65 = ^_anonymous_type_65;
  _anonymous_type_65 = record
    lpfOrder: ma_uint32;
  end;

  P_anonymous_type_66 = ^_anonymous_type_66;
  _anonymous_type_66 = record
    algorithm: ma_resample_algorithm;
    pBackendVTable: Pma_resampling_backend_vtable;
    pBackendUserData: Pointer;
    linear: _anonymous_type_65;
  end;

  P_anonymous_type_67 = ^_anonymous_type_67;
  _anonymous_type_67 = record
    pID: Pma_device_id;
    id: ma_device_id;
    name: array [0..255] of UTF8Char;
    shareMode: ma_share_mode;
    format: ma_format;
    channels: ma_uint32;
    channelMap: array [0..253] of ma_channel;
    internalFormat: ma_format;
    internalChannels: ma_uint32;
    internalSampleRate: ma_uint32;
    internalChannelMap: array [0..253] of ma_channel;
    internalPeriodSizeInFrames: ma_uint32;
    internalPeriods: ma_uint32;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    converter: ma_data_converter;
    pIntermediaryBuffer: Pointer;
    intermediaryBufferCap: ma_uint32;
    intermediaryBufferLen: ma_uint32;
    pInputCache: Pointer;
    inputCacheCap: ma_uint64;
    inputCacheConsumed: ma_uint64;
    inputCacheRemaining: ma_uint64;
  end;

  P_anonymous_type_68 = ^_anonymous_type_68;
  _anonymous_type_68 = record
    pID: Pma_device_id;
    id: ma_device_id;
    name: array [0..255] of UTF8Char;
    shareMode: ma_share_mode;
    format: ma_format;
    channels: ma_uint32;
    channelMap: array [0..253] of ma_channel;
    internalFormat: ma_format;
    internalChannels: ma_uint32;
    internalSampleRate: ma_uint32;
    internalChannelMap: array [0..253] of ma_channel;
    internalPeriodSizeInFrames: ma_uint32;
    internalPeriods: ma_uint32;
    channelMixMode: ma_channel_mix_mode;
    calculateLFEFromSpatialChannels: ma_bool32;
    converter: ma_data_converter;
    pIntermediaryBuffer: Pointer;
    intermediaryBufferCap: ma_uint32;
    intermediaryBufferLen: ma_uint32;
  end;

  P_anonymous_type_69 = ^_anonymous_type_69;
  _anonymous_type_69 = record
    pAudioClientPlayback: ma_ptr;
    pAudioClientCapture: ma_ptr;
    pRenderClient: ma_ptr;
    pCaptureClient: ma_ptr;
    pDeviceEnumerator: ma_ptr;
    notificationClient: ma_IMMNotificationClient;
    hEventPlayback: ma_handle;
    hEventCapture: ma_handle;
    actualBufferSizeInFramesPlayback: ma_uint32;
    actualBufferSizeInFramesCapture: ma_uint32;
    originalPeriodSizeInFrames: ma_uint32;
    originalPeriodSizeInMilliseconds: ma_uint32;
    originalPeriods: ma_uint32;
    originalPerformanceProfile: ma_performance_profile;
    periodSizeInFramesPlayback: ma_uint32;
    periodSizeInFramesCapture: ma_uint32;
    pMappedBufferCapture: Pointer;
    mappedBufferCaptureCap: ma_uint32;
    mappedBufferCaptureLen: ma_uint32;
    pMappedBufferPlayback: Pointer;
    mappedBufferPlaybackCap: ma_uint32;
    mappedBufferPlaybackLen: ma_uint32;
    isStartedCapture: ma_atomic_bool32;
    isStartedPlayback: ma_atomic_bool32;
    loopbackProcessID: ma_uint32;
    loopbackProcessExclude: ma_bool8;
    noAutoConvertSRC: ma_bool8;
    noDefaultQualitySRC: ma_bool8;
    noHardwareOffloading: ma_bool8;
    allowCaptureAutoStreamRouting: ma_bool8;
    allowPlaybackAutoStreamRouting: ma_bool8;
    isDetachedPlayback: ma_bool8;
    isDetachedCapture: ma_bool8;
    usage: ma_wasapi_usage;
    hAvrtHandle: Pointer;
    rerouteLock: ma_mutex;
  end;

  P_anonymous_type_70 = ^_anonymous_type_70;
  _anonymous_type_70 = record
    pPlayback: ma_ptr;
    pPlaybackPrimaryBuffer: ma_ptr;
    pPlaybackBuffer: ma_ptr;
    pCapture: ma_ptr;
    pCaptureBuffer: ma_ptr;
  end;

  P_anonymous_type_71 = ^_anonymous_type_71;
  _anonymous_type_71 = record
    hDevicePlayback: ma_handle;
    hDeviceCapture: ma_handle;
    hEventPlayback: ma_handle;
    hEventCapture: ma_handle;
    fragmentSizeInFrames: ma_uint32;
    iNextHeaderPlayback: ma_uint32;
    iNextHeaderCapture: ma_uint32;
    headerFramesConsumedPlayback: ma_uint32;
    headerFramesConsumedCapture: ma_uint32;
    pWAVEHDRPlayback: Pma_uint8;
    pWAVEHDRCapture: Pma_uint8;
    pIntermediaryBufferPlayback: Pma_uint8;
    pIntermediaryBufferCapture: Pma_uint8;
    _pHeapData: Pma_uint8;
  end;

  P_anonymous_type_72 = ^_anonymous_type_72;
  _anonymous_type_72 = record
    pClient: ma_ptr;
    ppPortsPlayback: Pma_ptr;
    ppPortsCapture: Pma_ptr;
    pIntermediaryBufferPlayback: PSingle;
    pIntermediaryBufferCapture: PSingle;
  end;

  P_anonymous_type_73 = ^_anonymous_type_73;
  _anonymous_type_73 = record
    deviceThread: ma_thread;
    operationEvent: ma_event;
    operationCompletionEvent: ma_event;
    operationSemaphore: ma_semaphore;
    operation: ma_uint32;
    operationResult: ma_result;
    timer: ma_timer;
    priorRunTime: Double;
    currentPeriodFramesRemainingPlayback: ma_uint32;
    currentPeriodFramesRemainingCapture: ma_uint32;
    lastProcessedFramePlayback: ma_uint64;
    lastProcessedFrameCapture: ma_uint64;
    isStarted: ma_atomic_bool32;
  end;

  P_anonymous_type_74 = ^_anonymous_type_74;
  _anonymous_type_74 = record
    case Integer of
      0: (wasapi: _anonymous_type_69);
      1: (dsound: _anonymous_type_70);
      2: (winmm: _anonymous_type_71);
      3: (jack: _anonymous_type_72);
      4: (null_device: _anonymous_type_73);
  end;

  ma_device = record
    pContext: Pma_context;
    &type: ma_device_type;
    sampleRate: ma_uint32;
    state: ma_atomic_device_state;
    onData: ma_device_data_proc;
    onNotification: ma_device_notification_proc;
    onStop: ma_stop_proc;
    pUserData: Pointer;
    startStopLock: ma_mutex;
    wakeupEvent: ma_event;
    startEvent: ma_event;
    stopEvent: ma_event;
    thread: ma_thread;
    workResult: ma_result;
    isOwnerOfContext: ma_bool8;
    noPreSilencedOutputBuffer: ma_bool8;
    noClip: ma_bool8;
    noDisableDenormals: ma_bool8;
    noFixedSizedCallback: ma_bool8;
    masterVolumeFactor: ma_atomic_float;
    duplexRB: ma_duplex_rb;
    resampling: _anonymous_type_66;
    playback: _anonymous_type_67;
    capture: _anonymous_type_68;
    f25: _anonymous_type_74;
  end;

  Pma_vfs = Pointer;
  PPma_vfs = ^Pma_vfs;
  ma_vfs_file = ma_handle;
  Pma_vfs_file = ^ma_vfs_file;

  ma_file_info = record
    sizeInBytes: ma_uint64;
  end;

  ma_vfs_callbacks = record
    onOpen: function(pVFS: Pma_vfs; const pFilePath: PUTF8Char; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
    onOpenW: function(pVFS: Pma_vfs; const pFilePath: PWideChar; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
    onClose: function(pVFS: Pma_vfs; &file: ma_vfs_file): ma_result; cdecl;
    onRead: function(pVFS: Pma_vfs; &file: ma_vfs_file; pDst: Pointer; sizeInBytes: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;
    onWrite: function(pVFS: Pma_vfs; &file: ma_vfs_file; const pSrc: Pointer; sizeInBytes: NativeUInt; pBytesWritten: PNativeUInt): ma_result; cdecl;
    onSeek: function(pVFS: Pma_vfs; &file: ma_vfs_file; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;
    onTell: function(pVFS: Pma_vfs; &file: ma_vfs_file; pCursor: Pma_int64): ma_result; cdecl;
    onInfo: function(pVFS: Pma_vfs; &file: ma_vfs_file; pInfo: Pma_file_info): ma_result; cdecl;
  end;

  ma_default_vfs = record
    cb: ma_vfs_callbacks;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  ma_read_proc = function(pUserData: Pointer; pBufferOut: Pointer; bytesToRead: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;

  ma_seek_proc = function(pUserData: Pointer; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;

  ma_tell_proc = function(pUserData: Pointer; pCursor: Pma_int64): ma_result; cdecl;

  ma_decoding_backend_config = record
    preferredFormat: ma_format;
    seekPointCount: ma_uint32;
  end;

  ma_decoding_backend_vtable = record
    onInit: function(pUserData: Pointer; onRead: ma_read_proc; onSeek: ma_seek_proc; onTell: ma_tell_proc; pReadSeekTellUserData: Pointer; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onInitFile: function(pUserData: Pointer; const pFilePath: PUTF8Char; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onInitFileW: function(pUserData: Pointer; const pFilePath: PWideChar; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onInitMemory: function(pUserData: Pointer; const pData: Pointer; dataSize: NativeUInt; const pConfig: Pma_decoding_backend_config; const pAllocationCallbacks: Pma_allocation_callbacks; ppBackend: PPma_data_source): ma_result; cdecl;
    onUninit: procedure(pUserData: Pointer; pBackend: Pma_data_source; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  end;

  ma_decoder_read_proc = function(pDecoder: Pma_decoder; pBufferOut: Pointer; bytesToRead: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;

  ma_decoder_seek_proc = function(pDecoder: Pma_decoder; byteOffset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;

  ma_decoder_tell_proc = function(pDecoder: Pma_decoder; pCursor: Pma_int64): ma_result; cdecl;

  ma_decoder_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    pChannelMap: Pma_channel;
    channelMixMode: ma_channel_mix_mode;
    ditherMode: ma_dither_mode;
    resampling: ma_resampler_config;
    allocationCallbacks: ma_allocation_callbacks;
    encodingFormat: ma_encoding_format;
    seekPointCount: ma_uint32;
    ppCustomBackendVTables: PPma_decoding_backend_vtable;
    customBackendCount: ma_uint32;
    pCustomBackendUserData: Pointer;
  end;

  P_anonymous_type_75 = ^_anonymous_type_75;
  _anonymous_type_75 = record
    pVFS: Pma_vfs;
    &file: ma_vfs_file;
  end;

  P_anonymous_type_76 = ^_anonymous_type_76;
  _anonymous_type_76 = record
    pData: Pma_uint8;
    dataSize: NativeUInt;
    currentReadPos: NativeUInt;
  end;

  P_anonymous_type_77 = ^_anonymous_type_77;
  _anonymous_type_77 = record
    case Integer of
      0: (vfs: _anonymous_type_75);
      1: (memory: _anonymous_type_76);
  end;

  ma_decoder = record
    ds: ma_data_source_base;
    pBackend: Pma_data_source;
    pBackendVTable: Pma_decoding_backend_vtable;
    pBackendUserData: Pointer;
    onRead: ma_decoder_read_proc;
    onSeek: ma_decoder_seek_proc;
    onTell: ma_decoder_tell_proc;
    pUserData: Pointer;
    readPointerInPCMFrames: ma_uint64;
    outputFormat: ma_format;
    outputChannels: ma_uint32;
    outputSampleRate: ma_uint32;
    converter: ma_data_converter;
    pInputCache: Pointer;
    inputCacheCap: ma_uint64;
    inputCacheConsumed: ma_uint64;
    inputCacheRemaining: ma_uint64;
    allocationCallbacks: ma_allocation_callbacks;
    data: _anonymous_type_77;
  end;

  ma_encoder_write_proc = function(pEncoder: Pma_encoder; const pBufferIn: Pointer; bytesToWrite: NativeUInt; pBytesWritten: PNativeUInt): ma_result; cdecl;

  ma_encoder_seek_proc = function(pEncoder: Pma_encoder; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;

  ma_encoder_init_proc = function(pEncoder: Pma_encoder): ma_result; cdecl;

  ma_encoder_uninit_proc = procedure(pEncoder: Pma_encoder); cdecl;

  ma_encoder_write_pcm_frames_proc = function(pEncoder: Pma_encoder; const pFramesIn: Pointer; frameCount: ma_uint64; pFramesWritten: Pma_uint64): ma_result; cdecl;

  ma_encoder_config = record
    encodingFormat: ma_encoding_format;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    allocationCallbacks: ma_allocation_callbacks;
  end;

  P_anonymous_type_78 = ^_anonymous_type_78;
  _anonymous_type_78 = record
    pVFS: Pma_vfs;
    &file: ma_vfs_file;
  end;

  P_anonymous_type_79 = ^_anonymous_type_79;
  _anonymous_type_79 = record
    case Integer of
      0: (vfs: _anonymous_type_78);
  end;

  ma_encoder = record
    config: ma_encoder_config;
    onWrite: ma_encoder_write_proc;
    onSeek: ma_encoder_seek_proc;
    onInit: ma_encoder_init_proc;
    onUninit: ma_encoder_uninit_proc;
    onWritePCMFrames: ma_encoder_write_pcm_frames_proc;
    pUserData: Pointer;
    pInternalEncoder: Pointer;
    data: _anonymous_type_79;
  end;

  ma_waveform_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    &type: ma_waveform_type;
    amplitude: Double;
    frequency: Double;
  end;

  ma_waveform = record
    ds: ma_data_source_base;
    config: ma_waveform_config;
    advance: Double;
    time: Double;
  end;

  ma_pulsewave_config = record
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    dutyCycle: Double;
    amplitude: Double;
    frequency: Double;
  end;

  ma_pulsewave = record
    waveform: ma_waveform;
    config: ma_pulsewave_config;
  end;

  ma_noise_config = record
    format: ma_format;
    channels: ma_uint32;
    &type: ma_noise_type;
    seed: ma_int32;
    amplitude: Double;
    duplicateChannels: ma_bool32;
  end;

  P_anonymous_type_80 = ^_anonymous_type_80;
  _anonymous_type_80 = record
    bin: PPDouble;
    accumulation: PDouble;
    counter: Pma_uint32;
  end;

  P_anonymous_type_81 = ^_anonymous_type_81;
  _anonymous_type_81 = record
    accumulation: PDouble;
  end;

  P_anonymous_type_82 = ^_anonymous_type_82;
  _anonymous_type_82 = record
    case Integer of
      0: (pink: _anonymous_type_80);
      1: (brownian: _anonymous_type_81);
  end;

  ma_noise = record
    ds: ma_data_source_base;
    config: ma_noise_config;
    lcg: ma_lcg;
    state: _anonymous_type_82;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_resource_manager_pipeline_stage_notification = record
    pNotification: Pma_async_notification;
    pFence: Pma_fence;
  end;

  ma_resource_manager_pipeline_notifications = record
    init: ma_resource_manager_pipeline_stage_notification;
    done: ma_resource_manager_pipeline_stage_notification;
  end;

  ma_resource_manager_data_source_config = record
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    pNotifications: Pma_resource_manager_pipeline_notifications;
    initialSeekPointInPCMFrames: ma_uint64;
    rangeBegInPCMFrames: ma_uint64;
    rangeEndInPCMFrames: ma_uint64;
    loopPointBegInPCMFrames: ma_uint64;
    loopPointEndInPCMFrames: ma_uint64;
    isLooping: ma_bool32;
    flags: ma_uint32;
  end;

  P_anonymous_type_83 = ^_anonymous_type_83;
  _anonymous_type_83 = record
    pData: Pointer;
    sizeInBytes: NativeUInt;
  end;

  P_anonymous_type_84 = ^_anonymous_type_84;
  _anonymous_type_84 = record
    pData: Pointer;
    totalFrameCount: ma_uint64;
    decodedFrameCount: ma_uint64;
    format: ma_format;
    channels: ma_uint32;
    sampleRate: ma_uint32;
  end;

  P_anonymous_type_85 = ^_anonymous_type_85;
  _anonymous_type_85 = record
    data: ma_paged_audio_buffer_data;
    decodedFrameCount: ma_uint64;
    sampleRate: ma_uint32;
  end;

  P_anonymous_type_86 = ^_anonymous_type_86;
  _anonymous_type_86 = record
    case Integer of
      0: (encoded: _anonymous_type_83);
      1: (decoded: _anonymous_type_84);
      2: (decodedPaged: _anonymous_type_85);
  end;

  ma_resource_manager_data_supply = record
    &type: ma_resource_manager_data_supply_type;
    backend: _anonymous_type_86;
  end;

  ma_resource_manager_data_buffer_node = record
    hashedName32: ma_uint32;
    refCount: ma_uint32;
    result: ma_result;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
    isDataOwnedByResourceManager: ma_bool32;
    data: ma_resource_manager_data_supply;
    pParent: Pma_resource_manager_data_buffer_node;
    pChildLo: Pma_resource_manager_data_buffer_node;
    pChildHi: Pma_resource_manager_data_buffer_node;
  end;

  P_anonymous_type_87 = ^_anonymous_type_87;
  _anonymous_type_87 = record
    case Integer of
      0: (decoder: ma_decoder);
      1: (buffer: ma_audio_buffer);
      2: (pagedBuffer: ma_paged_audio_buffer);
  end;

  ma_resource_manager_data_buffer = record
    ds: ma_data_source_base;
    pResourceManager: Pma_resource_manager;
    pNode: Pma_resource_manager_data_buffer_node;
    flags: ma_uint32;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
    seekTargetInPCMFrames: ma_uint64;
    seekToCursorOnNextRead: ma_bool32;
    result: ma_result;
    isLooping: ma_bool32;
    isConnectorInitialized: ma_atomic_bool32;
    connector: _anonymous_type_87;
  end;

  ma_resource_manager_data_stream = record
    ds: ma_data_source_base;
    pResourceManager: Pma_resource_manager;
    flags: ma_uint32;
    decoder: ma_decoder;
    isDecoderInitialized: ma_bool32;
    totalLengthInPCMFrames: ma_uint64;
    relativeCursor: ma_uint32;
    absoluteCursor: ma_uint64;
    currentPageIndex: ma_uint32;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
    isLooping: ma_bool32;
    pPageData: Pointer;
    pageFrameCount: array [0..1] of ma_uint32;
    result: ma_result;
    isDecoderAtEnd: ma_bool32;
    isPageValid: array [0..1] of ma_bool32;
    seekCounter: ma_bool32;
  end;

  P_anonymous_type_88 = ^_anonymous_type_88;
  _anonymous_type_88 = record
    case Integer of
      0: (buffer: ma_resource_manager_data_buffer);
      1: (stream: ma_resource_manager_data_stream);
  end;

  ma_resource_manager_data_source = record
    backend: _anonymous_type_88;
    flags: ma_uint32;
    executionCounter: ma_uint32;
    executionPointer: ma_uint32;
  end;

  ma_resource_manager_config = record
    allocationCallbacks: ma_allocation_callbacks;
    pLog: Pma_log;
    decodedFormat: ma_format;
    decodedChannels: ma_uint32;
    decodedSampleRate: ma_uint32;
    jobThreadCount: ma_uint32;
    jobThreadStackSize: NativeUInt;
    jobQueueCapacity: ma_uint32;
    flags: ma_uint32;
    pVFS: Pma_vfs;
    ppCustomDecodingBackendVTables: PPma_decoding_backend_vtable;
    customDecodingBackendCount: ma_uint32;
    pCustomDecodingBackendUserData: Pointer;
  end;

  ma_resource_manager = record
    config: ma_resource_manager_config;
    pRootDataBufferNode: Pma_resource_manager_data_buffer_node;
    dataBufferBSTLock: ma_mutex;
    jobThreads: array [0..63] of ma_thread;
    jobQueue: ma_job_queue;
    defaultVFS: ma_default_vfs;
    log: ma_log;
  end;

  Pma_node = Pointer;
  PPma_node = ^Pma_node;

  ma_node_vtable = record
    onProcess: procedure(pNode: Pma_node; ppFramesIn: PPSingle; pFrameCountIn: Pma_uint32; ppFramesOut: PPSingle; pFrameCountOut: Pma_uint32); cdecl;
    onGetRequiredInputFrameCount: function(pNode: Pma_node; outputFrameCount: ma_uint32; pInputFrameCount: Pma_uint32): ma_result; cdecl;
    inputBusCount: ma_uint8;
    outputBusCount: ma_uint8;
    flags: ma_uint32;
  end;

  ma_node_config = record
    vtable: Pma_node_vtable;
    initialState: ma_node_state;
    inputBusCount: ma_uint32;
    outputBusCount: ma_uint32;
    pInputChannels: Pma_uint32;
    pOutputChannels: Pma_uint32;
  end;

  ma_node_output_bus = record
    pNode: Pma_node;
    outputBusIndex: ma_uint8;
    channels: ma_uint8;
    inputNodeInputBusIndex: ma_uint8;
    flags: ma_uint32;
    refCount: ma_uint32;
    isAttached: ma_bool32;
    lock: ma_spinlock;
    volume: Single;
    pNext: Pma_node_output_bus;
    pPrev: Pma_node_output_bus;
    pInputNode: Pma_node;
  end;

  ma_node_input_bus = record
    head: ma_node_output_bus;
    nextCounter: ma_uint32;
    lock: ma_spinlock;
    channels: ma_uint8;
  end;

  ma_node_base = record
    pNodeGraph: Pma_node_graph;
    vtable: Pma_node_vtable;
    pCachedData: PSingle;
    cachedDataCapInFramesPerBus: ma_uint16;
    cachedFrameCountOut: ma_uint16;
    cachedFrameCountIn: ma_uint16;
    consumedFrameCountIn: ma_uint16;
    state: ma_node_state;
    stateTimes: array [0..1] of ma_uint64;
    localTime: ma_uint64;
    inputBusCount: ma_uint32;
    outputBusCount: ma_uint32;
    pInputBuses: Pma_node_input_bus;
    pOutputBuses: Pma_node_output_bus;
    _inputBuses: array [0..1] of ma_node_input_bus;
    _outputBuses: array [0..1] of ma_node_output_bus;
    _pHeap: Pointer;
    _ownsHeap: ma_bool32;
  end;

  ma_node_graph_config = record
    channels: ma_uint32;
    nodeCacheCapInFrames: ma_uint16;
  end;

  ma_node_graph = record
    base: ma_node_base;
    endpoint: ma_node_base;
    nodeCacheCapInFrames: ma_uint16;
    isReading: ma_bool32;
  end;

  ma_data_source_node_config = record
    nodeConfig: ma_node_config;
    pDataSource: Pma_data_source;
  end;

  ma_data_source_node = record
    base: ma_node_base;
    pDataSource: Pma_data_source;
  end;

  ma_splitter_node_config = record
    nodeConfig: ma_node_config;
    channels: ma_uint32;
    outputBusCount: ma_uint32;
  end;

  ma_splitter_node = record
    base: ma_node_base;
  end;

  ma_biquad_node_config = record
    nodeConfig: ma_node_config;
    biquad: ma_biquad_config;
  end;

  ma_biquad_node = record
    baseNode: ma_node_base;
    biquad: ma_biquad;
  end;

  ma_lpf_node_config = record
    nodeConfig: ma_node_config;
    lpf: ma_lpf_config;
  end;

  ma_lpf_node = record
    baseNode: ma_node_base;
    lpf: ma_lpf;
  end;

  ma_hpf_node_config = record
    nodeConfig: ma_node_config;
    hpf: ma_hpf_config;
  end;

  ma_hpf_node = record
    baseNode: ma_node_base;
    hpf: ma_hpf;
  end;

  ma_bpf_node_config = record
    nodeConfig: ma_node_config;
    bpf: ma_bpf_config;
  end;

  ma_bpf_node = record
    baseNode: ma_node_base;
    bpf: ma_bpf;
  end;

  ma_notch_node_config = record
    nodeConfig: ma_node_config;
    notch: ma_notch_config;
  end;

  ma_notch_node = record
    baseNode: ma_node_base;
    notch: ma_notch2;
  end;

  ma_peak_node_config = record
    nodeConfig: ma_node_config;
    peak: ma_peak_config;
  end;

  ma_peak_node = record
    baseNode: ma_node_base;
    peak: ma_peak2;
  end;

  ma_loshelf_node_config = record
    nodeConfig: ma_node_config;
    loshelf: ma_loshelf_config;
  end;

  ma_loshelf_node = record
    baseNode: ma_node_base;
    loshelf: ma_loshelf2;
  end;

  ma_hishelf_node_config = record
    nodeConfig: ma_node_config;
    hishelf: ma_hishelf_config;
  end;

  ma_hishelf_node = record
    baseNode: ma_node_base;
    hishelf: ma_hishelf2;
  end;

  ma_delay_node_config = record
    nodeConfig: ma_node_config;
    delay: ma_delay_config;
  end;

  ma_delay_node = record
    baseNode: ma_node_base;
    delay: ma_delay;
  end;

  ma_engine_node_config = record
    pEngine: Pma_engine;
    &type: ma_engine_node_type;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    sampleRate: ma_uint32;
    volumeSmoothTimeInPCMFrames: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    isPitchDisabled: ma_bool8;
    isSpatializationDisabled: ma_bool8;
    pinnedListenerIndex: ma_uint8;
  end;

  P_anonymous_type_89 = ^_anonymous_type_89;
  _anonymous_type_89 = record
    volumeBeg: ma_atomic_float;
    volumeEnd: ma_atomic_float;
    fadeLengthInFrames: ma_atomic_uint64;
    absoluteGlobalTimeInFrames: ma_atomic_uint64;
  end;

  ma_engine_node = record
    baseNode: ma_node_base;
    pEngine: Pma_engine;
    sampleRate: ma_uint32;
    volumeSmoothTimeInPCMFrames: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    fader: ma_fader;
    resampler: ma_linear_resampler;
    spatializer: ma_spatializer;
    panner: ma_panner;
    volumeGainer: ma_gainer;
    volume: ma_atomic_float;
    pitch: Single;
    oldPitch: Single;
    oldDopplerPitch: Single;
    isPitchDisabled: ma_bool32;
    isSpatializationDisabled: ma_bool32;
    pinnedListenerIndex: ma_uint32;
    fadeSettings: _anonymous_type_89;
    _ownsHeap: ma_bool8;
    _pHeap: Pointer;
  end;

  ma_sound_end_proc = procedure(pUserData: Pointer; pSound: Pma_sound); cdecl;

  ma_sound_config = record
    pFilePath: PUTF8Char;
    pFilePathW: PWideChar;
    pDataSource: Pma_data_source;
    pInitialAttachment: Pma_node;
    initialAttachmentInputBusIndex: ma_uint32;
    channelsIn: ma_uint32;
    channelsOut: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    flags: ma_uint32;
    volumeSmoothTimeInPCMFrames: ma_uint32;
    initialSeekPointInPCMFrames: ma_uint64;
    rangeBegInPCMFrames: ma_uint64;
    rangeEndInPCMFrames: ma_uint64;
    loopPointBegInPCMFrames: ma_uint64;
    loopPointEndInPCMFrames: ma_uint64;
    isLooping: ma_bool32;
    endCallback: ma_sound_end_proc;
    pEndCallbackUserData: Pointer;
    initNotifications: ma_resource_manager_pipeline_notifications;
    pDoneFence: Pma_fence;
  end;

  ma_sound = record
    engineNode: ma_engine_node;
    pDataSource: Pma_data_source;
    seekTarget: ma_uint64;
    atEnd: ma_bool32;
    endCallback: ma_sound_end_proc;
    pEndCallbackUserData: Pointer;
    ownsDataSource: ma_bool8;
    pResourceManagerDataSource: Pma_resource_manager_data_source;
  end;

  ma_sound_inlined = record
    sound: ma_sound;
    pNext: Pma_sound_inlined;
    pPrev: Pma_sound_inlined;
  end;

  ma_sound_group_config = ma_sound_config;
  Pma_sound_group_config = ^ma_sound_group_config;
  ma_sound_group = ma_sound;
  Pma_sound_group = ^ma_sound_group;

  ma_engine_process_proc = procedure(pUserData: Pointer; pFramesOut: PSingle; frameCount: ma_uint64); cdecl;

  ma_engine_config = record
    pResourceManager: Pma_resource_manager;
    pContext: Pma_context;
    pDevice: Pma_device;
    pPlaybackDeviceID: Pma_device_id;
    dataCallback: ma_device_data_proc;
    notificationCallback: ma_device_notification_proc;
    pLog: Pma_log;
    listenerCount: ma_uint32;
    channels: ma_uint32;
    sampleRate: ma_uint32;
    periodSizeInFrames: ma_uint32;
    periodSizeInMilliseconds: ma_uint32;
    gainSmoothTimeInFrames: ma_uint32;
    gainSmoothTimeInMilliseconds: ma_uint32;
    defaultVolumeSmoothTimeInPCMFrames: ma_uint32;
    allocationCallbacks: ma_allocation_callbacks;
    noAutoStart: ma_bool32;
    noDevice: ma_bool32;
    monoExpansionMode: ma_mono_expansion_mode;
    pResourceManagerVFS: Pma_vfs;
    onProcess: ma_engine_process_proc;
    pProcessUserData: Pointer;
  end;

  ma_engine = record
    nodeGraph: ma_node_graph;
    pResourceManager: Pma_resource_manager;
    pDevice: Pma_device;
    pLog: Pma_log;
    sampleRate: ma_uint32;
    listenerCount: ma_uint32;
    listeners: array [0..3] of ma_spatializer_listener;
    allocationCallbacks: ma_allocation_callbacks;
    ownsResourceManager: ma_bool8;
    ownsDevice: ma_bool8;
    inlinedSoundLock: ma_spinlock;
    pInlinedSoundHead: Pma_sound_inlined;
    inlinedSoundCount: ma_uint32;
    gainSmoothTimeInFrames: ma_uint32;
    defaultVolumeSmoothTimeInPCMFrames: ma_uint32;
    monoExpansionMode: ma_mono_expansion_mode;
    onProcess: ma_engine_process_proc;
    pProcessUserData: Pointer;
  end;

  ImU64 = UInt64;
  PImU64 = ^ImU64;
  PImGuiDockRequest = Pointer;
  PPImGuiDockRequest = ^PImGuiDockRequest;
  PImGuiDockNodeSettings = Pointer;
  PPImGuiDockNodeSettings = ^PImGuiDockNodeSettings;
  PImGuiInputTextDeactivateData = Pointer;
  PPImGuiInputTextDeactivateData = ^PImGuiInputTextDeactivateData;
  PImGuiTableColumnsSettings = Pointer;
  PPImGuiTableColumnsSettings = ^PImGuiTableColumnsSettings;

  ImVector_const_charPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPUTF8Char;
  end;

  ImGuiCol = Integer;
  ImGuiCond = Integer;
  ImGuiDataType = Integer;
  ImGuiDir = Integer;
  PImGuiDir = ^ImGuiDir;
  ImGuiMouseButton = Integer;
  ImGuiMouseCursor = Integer;
  ImGuiSortDirection = Integer;
  ImGuiStyleVar = Integer;
  ImGuiTableBgTarget = Integer;
  ImDrawFlags = Integer;
  ImDrawListFlags = Integer;
  ImFontAtlasFlags = Integer;
  ImGuiBackendFlags = Integer;
  ImGuiButtonFlags = Integer;
  ImGuiChildFlags = Integer;
  ImGuiColorEditFlags = Integer;
  ImGuiConfigFlags = Integer;
  ImGuiComboFlags = Integer;
  ImGuiDockNodeFlags = Integer;
  ImGuiDragDropFlags = Integer;
  ImGuiFocusedFlags = Integer;
  ImGuiHoveredFlags = Integer;
  ImGuiInputTextFlags = Integer;
  ImGuiKeyChord = Integer;
  ImGuiPopupFlags = Integer;
  ImGuiSelectableFlags = Integer;
  ImGuiSliderFlags = Integer;
  ImGuiTabBarFlags = Integer;
  ImGuiTabItemFlags = Integer;
  ImGuiTableFlags = Integer;
  ImGuiTableColumnFlags = Integer;
  ImGuiTableRowFlags = Integer;
  ImGuiTreeNodeFlags = Integer;
  ImGuiViewportFlags = Integer;
  ImGuiWindowFlags = Integer;
  ImTextureID = Pointer;
  PImTextureID = ^ImTextureID;
  ImDrawIdx = Word;
  PImDrawIdx = ^ImDrawIdx;
  ImGuiID = Cardinal;
  PImGuiID = ^ImGuiID;
  ImS8 = UTF8Char;
  ImU8 = Byte;
  ImS16 = Smallint;
  ImU16 = Word;
  ImS32 = Integer;
  ImU32 = Cardinal;
  PImU32 = ^ImU32;
  ImS64 = Int64;
  PImS64 = ^ImS64;
  ImWchar32 = Cardinal;
  ImWchar16 = Word;
  ImWchar = ImWchar16;
  PImWchar = ^ImWchar;

  ImGuiInputTextCallback = function(data: PImGuiInputTextCallbackData): Integer; cdecl;

  ImGuiSizeCallback = procedure(data: PImGuiSizeCallbackData); cdecl;

  ImGuiMemAllocFunc = function(sz: NativeUInt; user_data: Pointer): Pointer; cdecl;
  PImGuiMemAllocFunc = ^ImGuiMemAllocFunc;

  ImGuiMemFreeFunc = procedure(ptr: Pointer; user_data: Pointer); cdecl;
  PImGuiMemFreeFunc = ^ImGuiMemFreeFunc;

  ImVec2 = record
    x: Single;
    y: Single;
  end;

  ImVec4 = record
    x: Single;
    y: Single;
    z: Single;
    w: Single;
  end;

  ImGuiTableSortSpecs = record
    Specs: PImGuiTableColumnSortSpecs;
    SpecsCount: Integer;
    SpecsDirty: Boolean;
  end;

  ImGuiTableColumnSortSpecs = record
    ColumnUserID: ImGuiID;
    ColumnIndex: ImS16;
    SortOrder: ImS16;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SortDirection: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
  end;

  ImGuiStyle = record
    Alpha: Single;
    DisabledAlpha: Single;
    WindowPadding: ImVec2;
    WindowRounding: Single;
    WindowBorderSize: Single;
    WindowMinSize: ImVec2;
    WindowTitleAlign: ImVec2;
    WindowMenuButtonPosition: ImGuiDir;
    ChildRounding: Single;
    ChildBorderSize: Single;
    PopupRounding: Single;
    PopupBorderSize: Single;
    FramePadding: ImVec2;
    FrameRounding: Single;
    FrameBorderSize: Single;
    ItemSpacing: ImVec2;
    ItemInnerSpacing: ImVec2;
    CellPadding: ImVec2;
    TouchExtraPadding: ImVec2;
    IndentSpacing: Single;
    ColumnsMinSpacing: Single;
    ScrollbarSize: Single;
    ScrollbarRounding: Single;
    GrabMinSize: Single;
    GrabRounding: Single;
    LogSliderDeadzone: Single;
    TabRounding: Single;
    TabBorderSize: Single;
    TabMinWidthForCloseButton: Single;
    TabBarBorderSize: Single;
    TableAngledHeadersAngle: Single;
    ColorButtonPosition: ImGuiDir;
    ButtonTextAlign: ImVec2;
    SelectableTextAlign: ImVec2;
    SeparatorTextBorderSize: Single;
    SeparatorTextAlign: ImVec2;
    SeparatorTextPadding: ImVec2;
    DisplayWindowPadding: ImVec2;
    DisplaySafeAreaPadding: ImVec2;
    DockingSeparatorSize: Single;
    MouseCursorScale: Single;
    AntiAliasedLines: Boolean;
    AntiAliasedLinesUseTex: Boolean;
    AntiAliasedFill: Boolean;
    CurveTessellationTol: Single;
    CircleTessellationMaxError: Single;
    Colors: array [0..54] of ImVec4;
    HoverStationaryDelay: Single;
    HoverDelayShort: Single;
    HoverDelayNormal: Single;
    HoverFlagsForTooltipMouse: ImGuiHoveredFlags;
    HoverFlagsForTooltipNav: ImGuiHoveredFlags;
  end;

  ImGuiKeyData = record
    Down: Boolean;
    DownDuration: Single;
    DownDurationPrev: Single;
    AnalogValue: Single;
  end;

  ImVector_ImWchar = record
    Size: Integer;
    Capacity: Integer;
    Data: PImWchar;
  end;

  ImGuiIO = record
    ConfigFlags: ImGuiConfigFlags;
    BackendFlags: ImGuiBackendFlags;
    DisplaySize: ImVec2;
    DeltaTime: Single;
    IniSavingRate: Single;
    IniFilename: PUTF8Char;
    LogFilename: PUTF8Char;
    UserData: Pointer;
    Fonts: PImFontAtlas;
    FontGlobalScale: Single;
    FontAllowUserScaling: Boolean;
    FontDefault: PImFont;
    DisplayFramebufferScale: ImVec2;
    ConfigDockingNoSplit: Boolean;
    ConfigDockingWithShift: Boolean;
    ConfigDockingAlwaysTabBar: Boolean;
    ConfigDockingTransparentPayload: Boolean;
    ConfigViewportsNoAutoMerge: Boolean;
    ConfigViewportsNoTaskBarIcon: Boolean;
    ConfigViewportsNoDecoration: Boolean;
    ConfigViewportsNoDefaultParent: Boolean;
    MouseDrawCursor: Boolean;
    ConfigMacOSXBehaviors: Boolean;
    ConfigInputTrickleEventQueue: Boolean;
    ConfigInputTextCursorBlink: Boolean;
    ConfigInputTextEnterKeepActive: Boolean;
    ConfigDragClickToInputText: Boolean;
    ConfigWindowsResizeFromEdges: Boolean;
    ConfigWindowsMoveFromTitleBarOnly: Boolean;
    ConfigMemoryCompactTimer: Single;
    MouseDoubleClickTime: Single;
    MouseDoubleClickMaxDist: Single;
    MouseDragThreshold: Single;
    KeyRepeatDelay: Single;
    KeyRepeatRate: Single;
    ConfigDebugIsDebuggerPresent: Boolean;
    ConfigDebugBeginReturnValueOnce: Boolean;
    ConfigDebugBeginReturnValueLoop: Boolean;
    ConfigDebugIgnoreFocusLoss: Boolean;
    ConfigDebugIniSettings: Boolean;
    BackendPlatformName: PUTF8Char;
    BackendRendererName: PUTF8Char;
    BackendPlatformUserData: Pointer;
    BackendRendererUserData: Pointer;
    BackendLanguageUserData: Pointer;
    GetClipboardTextFn: function(user_data: Pointer): PUTF8Char; cdecl;
    SetClipboardTextFn: procedure(user_data: Pointer; const text: PUTF8Char); cdecl;
    ClipboardUserData: Pointer;
    SetPlatformImeDataFn: procedure(viewport: PImGuiViewport; data: PImGuiPlatformImeData); cdecl;
    PlatformLocaleDecimalPoint: ImWchar;
    WantCaptureMouse: Boolean;
    WantCaptureKeyboard: Boolean;
    WantTextInput: Boolean;
    WantSetMousePos: Boolean;
    WantSaveIniSettings: Boolean;
    NavActive: Boolean;
    NavVisible: Boolean;
    Framerate: Single;
    MetricsRenderVertices: Integer;
    MetricsRenderIndices: Integer;
    MetricsRenderWindows: Integer;
    MetricsActiveWindows: Integer;
    MouseDelta: ImVec2;
    Ctx: PImGuiContext;
    MousePos: ImVec2;
    MouseDown: array [0..4] of Boolean;
    MouseWheel: Single;
    MouseWheelH: Single;
    MouseSource: ImGuiMouseSource;
    MouseHoveredViewport: ImGuiID;
    KeyCtrl: Boolean;
    KeyShift: Boolean;
    KeyAlt: Boolean;
    KeySuper: Boolean;
    KeyMods: ImGuiKeyChord;
    KeysData: array [0..153] of ImGuiKeyData;
    WantCaptureMouseUnlessPopupClose: Boolean;
    MousePosPrev: ImVec2;
    MouseClickedPos: array [0..4] of ImVec2;
    MouseClickedTime: array [0..4] of Double;
    MouseClicked: array [0..4] of Boolean;
    MouseDoubleClicked: array [0..4] of Boolean;
    MouseClickedCount: array [0..4] of ImU16;
    MouseClickedLastCount: array [0..4] of ImU16;
    MouseReleased: array [0..4] of Boolean;
    MouseDownOwned: array [0..4] of Boolean;
    MouseDownOwnedUnlessPopupClose: array [0..4] of Boolean;
    MouseWheelRequestAxisSwap: Boolean;
    MouseDownDuration: array [0..4] of Single;
    MouseDownDurationPrev: array [0..4] of Single;
    MouseDragMaxDistanceAbs: array [0..4] of ImVec2;
    MouseDragMaxDistanceSqr: array [0..4] of Single;
    PenPressure: Single;
    AppFocusLost: Boolean;
    AppAcceptingEvents: Boolean;
    BackendUsingLegacyKeyArrays: ImS8;
    BackendUsingLegacyNavInputArray: Boolean;
    InputQueueSurrogate: ImWchar16;
    InputQueueCharacters: ImVector_ImWchar;
  end;

  ImGuiInputTextCallbackData = record
    Ctx: PImGuiContext;
    EventFlag: ImGuiInputTextFlags;
    Flags: ImGuiInputTextFlags;
    UserData: Pointer;
    EventChar: ImWchar;
    EventKey: ImGuiKey;
    Buf: PUTF8Char;
    BufTextLen: Integer;
    BufSize: Integer;
    BufDirty: Boolean;
    CursorPos: Integer;
    SelectionStart: Integer;
    SelectionEnd: Integer;
  end;

  ImGuiSizeCallbackData = record
    UserData: Pointer;
    Pos: ImVec2;
    CurrentSize: ImVec2;
    DesiredSize: ImVec2;
  end;

  ImGuiWindowClass = record
    ClassId: ImGuiID;
    ParentViewportId: ImGuiID;
    FocusRouteParentWindowId: ImGuiID;
    ViewportFlagsOverrideSet: ImGuiViewportFlags;
    ViewportFlagsOverrideClear: ImGuiViewportFlags;
    TabItemFlagsOverrideSet: ImGuiTabItemFlags;
    DockNodeFlagsOverrideSet: ImGuiDockNodeFlags;
    DockingAlwaysTabBar: Boolean;
    DockingAllowUnclassed: Boolean;
  end;

  ImGuiPayload = record
    Data: Pointer;
    DataSize: Integer;
    SourceId: ImGuiID;
    SourceParentId: ImGuiID;
    DataFrameCount: Integer;
    DataType: array [0..32] of UTF8Char;
    Preview: Boolean;
    Delivery: Boolean;
  end;

  ImGuiOnceUponAFrame = record
    RefFrame: Integer;
  end;

  ImGuiTextRange = record
    b: PUTF8Char;
    e: PUTF8Char;
  end;

  ImVector_ImGuiTextRange = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTextRange;
  end;

  ImGuiTextFilter = record
    InputBuf: array [0..255] of UTF8Char;
    Filters: ImVector_ImGuiTextRange;
    CountGrep: Integer;
  end;

  ImVector_char = record
    Size: Integer;
    Capacity: Integer;
    Data: PUTF8Char;
  end;

  ImGuiTextBuffer = record
    Buf: ImVector_char;
  end;

  P_anonymous_type_90 = ^_anonymous_type_90;
  _anonymous_type_90 = record
    case Integer of
      0: (val_i: Integer);
      1: (val_f: Single);
      2: (val_p: Pointer);
  end;

  ImGuiStoragePair = record
    key: ImGuiID;
    f2: _anonymous_type_90;
  end;

  ImVector_ImGuiStoragePair = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStoragePair;
  end;

  ImGuiStorage = record
    Data: ImVector_ImGuiStoragePair;
  end;

  ImGuiListClipper = record
    Ctx: PImGuiContext;
    DisplayStart: Integer;
    DisplayEnd: Integer;
    ItemsCount: Integer;
    ItemsHeight: Single;
    StartPosY: Single;
    TempData: Pointer;
  end;

  ImColor = record
    Value: ImVec4;
  end;

  ImDrawCallback = procedure(const parent_list: PImDrawList; const cmd: PImDrawCmd); cdecl;

  ImDrawCmd = record
    ClipRect: ImVec4;
    TextureId: ImTextureID;
    VtxOffset: Cardinal;
    IdxOffset: Cardinal;
    ElemCount: Cardinal;
    UserCallback: ImDrawCallback;
    UserCallbackData: Pointer;
  end;

  ImDrawVert = record
    pos: ImVec2;
    uv: ImVec2;
    col: ImU32;
  end;

  ImDrawCmdHeader = record
    ClipRect: ImVec4;
    TextureId: ImTextureID;
    VtxOffset: Cardinal;
  end;

  ImVector_ImDrawCmd = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawCmd;
  end;

  ImVector_ImDrawIdx = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawIdx;
  end;

  ImDrawChannel = record
    _CmdBuffer: ImVector_ImDrawCmd;
    _IdxBuffer: ImVector_ImDrawIdx;
  end;

  ImVector_ImDrawChannel = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawChannel;
  end;

  ImDrawListSplitter = record
    _Current: Integer;
    _Count: Integer;
    _Channels: ImVector_ImDrawChannel;
  end;

  ImVector_ImDrawVert = record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawVert;
  end;

  ImVector_ImVec4 = record
    Size: Integer;
    Capacity: Integer;
    Data: PImVec4;
  end;

  ImVector_ImTextureID = record
    Size: Integer;
    Capacity: Integer;
    Data: PImTextureID;
  end;

  ImVector_ImVec2 = record
    Size: Integer;
    Capacity: Integer;
    Data: PImVec2;
  end;

  ImDrawList = record
    CmdBuffer: ImVector_ImDrawCmd;
    IdxBuffer: ImVector_ImDrawIdx;
    VtxBuffer: ImVector_ImDrawVert;
    Flags: ImDrawListFlags;
    _VtxCurrentIdx: Cardinal;
    _Data: PImDrawListSharedData;
    _OwnerName: PUTF8Char;
    _VtxWritePtr: PImDrawVert;
    _IdxWritePtr: PImDrawIdx;
    _ClipRectStack: ImVector_ImVec4;
    _TextureIdStack: ImVector_ImTextureID;
    _Path: ImVector_ImVec2;
    _CmdHeader: ImDrawCmdHeader;
    _Splitter: ImDrawListSplitter;
    _FringeScale: Single;
  end;

  ImVector_ImDrawListPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImDrawList;
  end;

  ImDrawData = record
    Valid: Boolean;
    CmdListsCount: Integer;
    TotalIdxCount: Integer;
    TotalVtxCount: Integer;
    CmdLists: ImVector_ImDrawListPtr;
    DisplayPos: ImVec2;
    DisplaySize: ImVec2;
    FramebufferScale: ImVec2;
    OwnerViewport: PImGuiViewport;
  end;

  ImFontConfig = record
    FontData: Pointer;
    FontDataSize: Integer;
    FontDataOwnedByAtlas: Boolean;
    FontNo: Integer;
    SizePixels: Single;
    OversampleH: Integer;
    OversampleV: Integer;
    PixelSnapH: Boolean;
    GlyphExtraSpacing: ImVec2;
    GlyphOffset: ImVec2;
    GlyphRanges: PImWchar;
    GlyphMinAdvanceX: Single;
    GlyphMaxAdvanceX: Single;
    MergeMode: Boolean;
    FontBuilderFlags: Cardinal;
    RasterizerMultiply: Single;
    RasterizerDensity: Single;
    EllipsisChar: ImWchar;
    Name: array [0..39] of UTF8Char;
    DstFont: PImFont;
  end;

  ImFontGlyph = record
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property Colored: Cardinal index $0001 read GetData0Value write SetData0Value; // 1 bits at offset 0 in Data0
    property Visible: Cardinal index $0101 read GetData0Value write SetData0Value; // 1 bits at offset 1 in Data0
    property Codepoint: Cardinal index $021E read GetData0Value write SetData0Value; // 30 bits at offset 2 in Data0
  var
    AdvanceX: Single;
    X0: Single;
    Y0: Single;
    X1: Single;
    Y1: Single;
    U0: Single;
    V0: Single;
    U1: Single;
    V1: Single;
  end;

  ImVector_ImU32 = record
    Size: Integer;
    Capacity: Integer;
    Data: PImU32;
  end;

  ImFontGlyphRangesBuilder = record
    UsedChars: ImVector_ImU32;
  end;

  ImFontAtlasCustomRect = record
    Width: Word;
    Height: Word;
    X: Word;
    Y: Word;
    GlyphID: Cardinal;
    GlyphAdvanceX: Single;
    GlyphOffset: ImVec2;
    Font: PImFont;
  end;

  ImVector_ImFontPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImFont;
  end;

  ImVector_ImFontAtlasCustomRect = record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontAtlasCustomRect;
  end;

  ImVector_ImFontConfig = record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontConfig;
  end;

  ImFontAtlas = record
    Flags: ImFontAtlasFlags;
    TexID: ImTextureID;
    TexDesiredWidth: Integer;
    TexGlyphPadding: Integer;
    Locked: Boolean;
    UserData: Pointer;
    TexReady: Boolean;
    TexPixelsUseColors: Boolean;
    TexPixelsAlpha8: PByte;
    TexPixelsRGBA32: PCardinal;
    TexWidth: Integer;
    TexHeight: Integer;
    TexUvScale: ImVec2;
    TexUvWhitePixel: ImVec2;
    Fonts: ImVector_ImFontPtr;
    CustomRects: ImVector_ImFontAtlasCustomRect;
    ConfigData: ImVector_ImFontConfig;
    TexUvLines: array [0..63] of ImVec4;
    FontBuilderIO: PImFontBuilderIO;
    FontBuilderFlags: Cardinal;
    PackIdMouseCursors: Integer;
    PackIdLines: Integer;
  end;

  ImVector_float = record
    Size: Integer;
    Capacity: Integer;
    Data: PSingle;
  end;

  ImVector_ImFontGlyph = record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontGlyph;
  end;

  ImFont = record
    IndexAdvanceX: ImVector_float;
    FallbackAdvanceX: Single;
    FontSize: Single;
    IndexLookup: ImVector_ImWchar;
    Glyphs: ImVector_ImFontGlyph;
    FallbackGlyph: PImFontGlyph;
    ContainerAtlas: PImFontAtlas;
    ConfigData: PImFontConfig;
    ConfigDataCount: Smallint;
    FallbackChar: ImWchar;
    EllipsisChar: ImWchar;
    EllipsisCharCount: Smallint;
    EllipsisWidth: Single;
    EllipsisCharStep: Single;
    DirtyLookupTables: Boolean;
    Scale: Single;
    Ascent: Single;
    Descent: Single;
    MetricsTotalSurface: Integer;
    Used4kPagesMap: array [0..1] of ImU8;
  end;

  ImGuiViewport = record
    ID: ImGuiID;
    Flags: ImGuiViewportFlags;
    Pos: ImVec2;
    Size: ImVec2;
    WorkPos: ImVec2;
    WorkSize: ImVec2;
    DpiScale: Single;
    ParentViewportId: ImGuiID;
    DrawData: PImDrawData;
    RendererUserData: Pointer;
    PlatformUserData: Pointer;
    PlatformHandle: Pointer;
    PlatformHandleRaw: Pointer;
    PlatformWindowCreated: Boolean;
    PlatformRequestMove: Boolean;
    PlatformRequestResize: Boolean;
    PlatformRequestClose: Boolean;
  end;

  ImVector_ImGuiPlatformMonitor = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPlatformMonitor;
  end;

  ImVector_ImGuiViewportPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImGuiViewport;
  end;

  ImGuiPlatformIO = record
    Platform_CreateWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_DestroyWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_ShowWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_SetWindowPos: procedure(vp: PImGuiViewport; pos: ImVec2); cdecl;
    Platform_GetWindowPos: function(vp: PImGuiViewport): ImVec2; cdecl;
    Platform_SetWindowSize: procedure(vp: PImGuiViewport; size: ImVec2); cdecl;
    Platform_GetWindowSize: function(vp: PImGuiViewport): ImVec2; cdecl;
    Platform_SetWindowFocus: procedure(vp: PImGuiViewport); cdecl;
    Platform_GetWindowFocus: function(vp: PImGuiViewport): Boolean; cdecl;
    Platform_GetWindowMinimized: function(vp: PImGuiViewport): Boolean; cdecl;
    Platform_SetWindowTitle: procedure(vp: PImGuiViewport; const str: PUTF8Char); cdecl;
    Platform_SetWindowAlpha: procedure(vp: PImGuiViewport; alpha: Single); cdecl;
    Platform_UpdateWindow: procedure(vp: PImGuiViewport); cdecl;
    Platform_RenderWindow: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Platform_SwapBuffers: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Platform_GetWindowDpiScale: function(vp: PImGuiViewport): Single; cdecl;
    Platform_OnChangedViewport: procedure(vp: PImGuiViewport); cdecl;
    Platform_CreateVkSurface: function(vp: PImGuiViewport; vk_inst: ImU64; const vk_allocators: Pointer; out_vk_surface: PImU64): Integer; cdecl;
    Renderer_CreateWindow: procedure(vp: PImGuiViewport); cdecl;
    Renderer_DestroyWindow: procedure(vp: PImGuiViewport); cdecl;
    Renderer_SetWindowSize: procedure(vp: PImGuiViewport; size: ImVec2); cdecl;
    Renderer_RenderWindow: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Renderer_SwapBuffers: procedure(vp: PImGuiViewport; render_arg: Pointer); cdecl;
    Monitors: ImVector_ImGuiPlatformMonitor;
    Viewports: ImVector_ImGuiViewportPtr;
  end;

  ImGuiPlatformMonitor = record
    MainPos: ImVec2;
    MainSize: ImVec2;
    WorkPos: ImVec2;
    WorkSize: ImVec2;
    DpiScale: Single;
    PlatformHandle: Pointer;
  end;

  ImGuiPlatformImeData = record
    WantVisible: Boolean;
    InputPos: ImVec2;
    InputLineHeight: Single;
  end;

  ImGuiDataAuthority = Integer;
  ImGuiLayoutType = Integer;
  ImGuiActivateFlags = Integer;
  ImGuiDebugLogFlags = Integer;
  ImGuiFocusRequestFlags = Integer;
  ImGuiInputFlags = Integer;
  ImGuiItemFlags = Integer;
  PImGuiItemFlags = ^ImGuiItemFlags;
  ImGuiItemStatusFlags = Integer;
  ImGuiOldColumnFlags = Integer;
  ImGuiNavHighlightFlags = Integer;
  ImGuiNavMoveFlags = Integer;
  ImGuiNextItemDataFlags = Integer;
  ImGuiNextWindowDataFlags = Integer;
  ImGuiScrollFlags = Integer;
  ImGuiSeparatorFlags = Integer;
  ImGuiTextFlags = Integer;
  ImGuiTooltipFlags = Integer;
  ImGuiTypingSelectFlags = Integer;

  ImGuiErrorLogCallback = procedure(user_data: Pointer; const fmt: PUTF8Char) varargs; cdecl;

  StbUndoRecord = record
    where: Integer;
    insert_length: Integer;
    delete_length: Integer;
    char_storage: Integer;
  end;

  StbUndoState = record
    undo_rec: array [0..98] of StbUndoRecord;
    undo_char: array [0..998] of ImWchar;
    undo_point: Smallint;
    redo_point: Smallint;
    undo_char_point: Integer;
    redo_char_point: Integer;
  end;

  STB_TexteditState = record
    cursor: Integer;
    select_start: Integer;
    select_end: Integer;
    insert_mode: Byte;
    row_count_per_page: Integer;
    cursor_at_end_of_line: Byte;
    initialized: Byte;
    has_preferred_x: Byte;
    single_line: Byte;
    padding1: Byte;
    padding2: Byte;
    padding3: Byte;
    preferred_x: Single;
    undostate: StbUndoState;
  end;

  StbTexteditRow = record
    x0: Single;
    x1: Single;
    baseline_y_delta: Single;
    ymin: Single;
    ymax: Single;
    num_chars: Integer;
  end;

  ImFileHandle = PPointer;

  ImVec1 = record
    x: Single;
  end;

  ImVec2ih = record
    x: Smallint;
    y: Smallint;
  end;

  ImRect = record
    Min: ImVec2;
    Max: ImVec2;
  end;

  ImBitArrayPtr = PImU32;

  ImBitVector = record
    Storage: ImVector_ImU32;
  end;

  ImPoolIdx = Integer;

  ImVector_int = record
    Size: Integer;
    Capacity: Integer;
    Data: PInteger;
  end;

  ImGuiTextIndex = record
    LineOffsets: ImVector_int;
    EndOffset: Integer;
  end;

  ImDrawListSharedData = record
    TexUvWhitePixel: ImVec2;
    Font: PImFont;
    FontSize: Single;
    CurveTessellationTol: Single;
    CircleSegmentMaxError: Single;
    ClipRectFullscreen: ImVec4;
    InitialFlags: ImDrawListFlags;
    TempBuffer: ImVector_ImVec2;
    ArcFastVtx: array [0..47] of ImVec2;
    ArcFastRadiusCutoff: Single;
    CircleSegmentCounts: array [0..63] of ImU8;
    TexUvLines: PImVec4;
  end;

  ImDrawDataBuilder = record
    Layers: array [0..1] of PImVector_ImDrawListPtr;
    LayerData1: ImVector_ImDrawListPtr;
  end;

  ImGuiColorMod = record
    Col: ImGuiCol;
    BackupValue: ImVec4;
  end;

  P_anonymous_type_91 = ^_anonymous_type_91;
  _anonymous_type_91 = record
    case Integer of
      0: (BackupInt: array [0..1] of Integer);
      1: (BackupFloat: array [0..1] of Single);
  end;

  ImGuiStyleMod = record
    VarIdx: ImGuiStyleVar;
    f2: _anonymous_type_91;
  end;

  ImGuiComboPreviewData = record
    PreviewRect: ImRect;
    BackupCursorPos: ImVec2;
    BackupCursorMaxPos: ImVec2;
    BackupCursorPosPrevLine: ImVec2;
    BackupPrevLineTextBaseOffset: Single;
    BackupLayout: ImGuiLayoutType;
  end;

  ImGuiGroupData = record
    WindowID: ImGuiID;
    BackupCursorPos: ImVec2;
    BackupCursorMaxPos: ImVec2;
    BackupCursorPosPrevLine: ImVec2;
    BackupIndent: ImVec1;
    BackupGroupOffset: ImVec1;
    BackupCurrLineSize: ImVec2;
    BackupCurrLineTextBaseOffset: Single;
    BackupActiveIdIsAlive: ImGuiID;
    BackupActiveIdPreviousFrameIsAlive: Boolean;
    BackupHoveredIdIsAlive: Boolean;
    BackupIsSameLine: Boolean;
    EmitItem: Boolean;
  end;

  ImGuiMenuColumns = record
    TotalWidth: ImU32;
    NextTotalWidth: ImU32;
    Spacing: ImU16;
    OffsetIcon: ImU16;
    OffsetLabel: ImU16;
    OffsetShortcut: ImU16;
    OffsetMark: ImU16;
    Widths: array [0..3] of ImU16;
  end;

  ImGuiInputTextDeactivatedState = record
    ID: ImGuiID;
    TextA: ImVector_char;
  end;

  ImGuiInputTextState = record
    Ctx: PImGuiContext;
    ID: ImGuiID;
    CurLenW: Integer;
    CurLenA: Integer;
    TextW: ImVector_ImWchar;
    TextA: ImVector_char;
    InitialTextA: ImVector_char;
    TextAIsValid: Boolean;
    BufCapacityA: Integer;
    ScrollX: Single;
    Stb: STB_TexteditState;
    CursorAnim: Single;
    CursorFollow: Boolean;
    SelectedAllMouseLock: Boolean;
    Edited: Boolean;
    Flags: ImGuiInputTextFlags;
    ReloadUserBuf: Boolean;
    ReloadSelectionStart: Integer;
    ReloadSelectionEnd: Integer;
  end;

  ImGuiNextWindowData = record
    Flags: ImGuiNextWindowDataFlags;
    PosCond: ImGuiCond;
    SizeCond: ImGuiCond;
    CollapsedCond: ImGuiCond;
    DockCond: ImGuiCond;
    PosVal: ImVec2;
    PosPivotVal: ImVec2;
    SizeVal: ImVec2;
    ContentSizeVal: ImVec2;
    ScrollVal: ImVec2;
    ChildFlags: ImGuiChildFlags;
    PosUndock: Boolean;
    CollapsedVal: Boolean;
    SizeConstraintRect: ImRect;
    SizeCallback: ImGuiSizeCallback;
    SizeCallbackUserData: Pointer;
    BgAlphaVal: Single;
    ViewportId: ImGuiID;
    DockId: ImGuiID;
    WindowClass: ImGuiWindowClass;
    MenuBarOffsetMinVal: ImVec2;
  end;

  ImGuiSelectionUserData = ImS64;

  ImGuiNextItemData = record
    Flags: ImGuiNextItemDataFlags;
    ItemFlags: ImGuiItemFlags;
    SelectionUserData: ImGuiSelectionUserData;
    Width: Single;
    Shortcut: ImGuiKeyChord;
    OpenVal: Boolean;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property OpenCond: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
  end;

  ImGuiLastItemData = record
    ID: ImGuiID;
    InFlags: ImGuiItemFlags;
    StatusFlags: ImGuiItemStatusFlags;
    Rect: ImRect;
    NavRect: ImRect;
    DisplayRect: ImRect;
    ClipRect: ImRect;
  end;

  ImGuiNavTreeNodeData = record
    ID: ImGuiID;
    InFlags: ImGuiItemFlags;
    NavRect: ImRect;
  end;

  ImGuiStackSizes = record
    SizeOfIDStack: Smallint;
    SizeOfColorStack: Smallint;
    SizeOfStyleVarStack: Smallint;
    SizeOfFontStack: Smallint;
    SizeOfFocusScopeStack: Smallint;
    SizeOfGroupStack: Smallint;
    SizeOfItemFlagsStack: Smallint;
    SizeOfBeginPopupStack: Smallint;
    SizeOfDisabledStack: Smallint;
  end;

  ImGuiWindowStackData = record
    Window: PImGuiWindow;
    ParentLastItemDataBackup: ImGuiLastItemData;
    StackSizesOnBegin: ImGuiStackSizes;
  end;

  ImGuiShrinkWidthItem = record
    Index: Integer;
    Width: Single;
    InitialWidth: Single;
  end;

  ImGuiPtrOrIndex = record
    Ptr: Pointer;
    Index: Integer;
  end;

  ImGuiDataVarInfo = record
    &Type: ImGuiDataType;
    Count: ImU32;
    Offset: ImU32;
  end;

  ImGuiDataTypeTempStorage = record
    Data: array [0..7] of ImU8;
  end;

  ImGuiDataTypeInfo = record
    Size: NativeUInt;
    Name: PUTF8Char;
    PrintFmt: PUTF8Char;
    ScanFmt: PUTF8Char;
  end;

  ImGuiPopupData = record
    PopupId: ImGuiID;
    Window: PImGuiWindow;
    BackupNavWindow: PImGuiWindow;
    ParentNavLayer: Integer;
    OpenFrameCount: Integer;
    OpenParentId: ImGuiID;
    OpenPopupPos: ImVec2;
    OpenMousePos: ImVec2;
  end;

  ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN = record
    Storage: array [0..4] of ImU32;
  end;

  ImBitArrayForNamedKeys = ImBitArray_ImGuiKey_NamedKey_COUNT__lessImGuiKey_NamedKey_BEGIN;

  ImGuiInputEventMousePos = record
    PosX: Single;
    PosY: Single;
    MouseSource: ImGuiMouseSource;
  end;

  ImGuiInputEventMouseWheel = record
    WheelX: Single;
    WheelY: Single;
    MouseSource: ImGuiMouseSource;
  end;

  ImGuiInputEventMouseButton = record
    Button: Integer;
    Down: Boolean;
    MouseSource: ImGuiMouseSource;
  end;

  ImGuiInputEventMouseViewport = record
    HoveredViewportID: ImGuiID;
  end;

  ImGuiInputEventKey = record
    Key: ImGuiKey;
    Down: Boolean;
    AnalogValue: Single;
  end;

  ImGuiInputEventText = record
    Char: Cardinal;
  end;

  ImGuiInputEventAppFocused = record
    Focused: Boolean;
  end;

  P_anonymous_type_92 = ^_anonymous_type_92;
  _anonymous_type_92 = record
    case Integer of
      0: (MousePos: ImGuiInputEventMousePos);
      1: (MouseWheel: ImGuiInputEventMouseWheel);
      2: (MouseButton: ImGuiInputEventMouseButton);
      3: (MouseViewport: ImGuiInputEventMouseViewport);
      4: (Key: ImGuiInputEventKey);
      5: (Text: ImGuiInputEventText);
      6: (AppFocused: ImGuiInputEventAppFocused);
  end;

  ImGuiInputEvent = record
    &Type: ImGuiInputEventType;
    Source: ImGuiInputSource;
    EventId: ImU32;
    f4: _anonymous_type_92;
    AddedByTestEngine: Boolean;
  end;

  ImGuiKeyRoutingIndex = ImS16;

  ImGuiKeyRoutingData = record
    NextEntryIndex: ImGuiKeyRoutingIndex;
    Mods: ImU16;
    RoutingCurrScore: ImU8;
    RoutingNextScore: ImU8;
    RoutingCurr: ImGuiID;
    RoutingNext: ImGuiID;
  end;

  ImVector_ImGuiKeyRoutingData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiKeyRoutingData;
  end;

  ImGuiKeyRoutingTable = record
    Index: array [0..153] of ImGuiKeyRoutingIndex;
    Entries: ImVector_ImGuiKeyRoutingData;
    EntriesNext: ImVector_ImGuiKeyRoutingData;
  end;

  ImGuiKeyOwnerData = record
    OwnerCurr: ImGuiID;
    OwnerNext: ImGuiID;
    LockThisFrame: Boolean;
    LockUntilRelease: Boolean;
  end;

  ImGuiListClipperRange = record
    Min: Integer;
    Max: Integer;
    PosToIndexConvert: Boolean;
    PosToIndexOffsetMin: ImS8;
    PosToIndexOffsetMax: ImS8;
  end;

  ImVector_ImGuiListClipperRange = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiListClipperRange;
  end;

  ImGuiListClipperData = record
    ListClipper: PImGuiListClipper;
    LossynessOffset: Single;
    StepNo: Integer;
    ItemsFrozen: Integer;
    Ranges: ImVector_ImGuiListClipperRange;
  end;

  ImGuiNavItemData = record
    Window: PImGuiWindow;
    ID: ImGuiID;
    FocusScopeId: ImGuiID;
    RectRel: ImRect;
    InFlags: ImGuiItemFlags;
    SelectionUserData: ImGuiSelectionUserData;
    DistBox: Single;
    DistCenter: Single;
    DistAxial: Single;
  end;

  ImGuiFocusScopeData = record
    ID: ImGuiID;
    WindowID: ImGuiID;
  end;

  ImGuiTypingSelectRequest = record
    Flags: ImGuiTypingSelectFlags;
    SearchBufferLen: Integer;
    SearchBuffer: PUTF8Char;
    SelectRequest: Boolean;
    SingleCharMode: Boolean;
    SingleCharSize: ImS8;
  end;

  ImGuiTypingSelectState = record
    Request: ImGuiTypingSelectRequest;
    SearchBuffer: array [0..63] of UTF8Char;
    FocusScope: ImGuiID;
    LastRequestFrame: Integer;
    LastRequestTime: Single;
    SingleCharModeLock: Boolean;
  end;

  ImGuiOldColumnData = record
    OffsetNorm: Single;
    OffsetNormBeforeResize: Single;
    Flags: ImGuiOldColumnFlags;
    ClipRect: ImRect;
  end;

  ImVector_ImGuiOldColumnData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiOldColumnData;
  end;

  ImGuiOldColumns = record
    ID: ImGuiID;
    Flags: ImGuiOldColumnFlags;
    IsFirstFrame: Boolean;
    IsBeingResized: Boolean;
    Current: Integer;
    Count: Integer;
    OffMinX: Single;
    OffMaxX: Single;
    LineMinY: Single;
    LineMaxY: Single;
    HostCursorPosY: Single;
    HostCursorMaxPosX: Single;
    HostInitialClipRect: ImRect;
    HostBackupClipRect: ImRect;
    HostBackupParentWorkRect: ImRect;
    Columns: ImVector_ImGuiOldColumnData;
    Splitter: ImDrawListSplitter;
  end;

  ImVector_ImGuiWindowPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImGuiWindow;
  end;

  ImGuiDockNode = record
    ID: ImGuiID;
    SharedFlags: ImGuiDockNodeFlags;
    LocalFlags: ImGuiDockNodeFlags;
    LocalFlagsInWindows: ImGuiDockNodeFlags;
    MergedFlags: ImGuiDockNodeFlags;
    State: ImGuiDockNodeState;
    ParentNode: PImGuiDockNode;
    ChildNodes: array [0..1] of PImGuiDockNode;
    Windows: ImVector_ImGuiWindowPtr;
    TabBar: PImGuiTabBar;
    Pos: ImVec2;
    Size: ImVec2;
    SizeRef: ImVec2;
    SplitAxis: ImGuiAxis;
    WindowClass: ImGuiWindowClass;
    LastBgColor: ImU32;
    HostWindow: PImGuiWindow;
    VisibleWindow: PImGuiWindow;
    CentralNode: PImGuiDockNode;
    OnlyNodeWithWindows: PImGuiDockNode;
    CountNodeWithWindows: Integer;
    LastFrameAlive: Integer;
    LastFrameActive: Integer;
    LastFrameFocused: Integer;
    LastFocusedNodeId: ImGuiID;
    SelectedTabId: ImGuiID;
    WantCloseTabId: ImGuiID;
    RefViewportId: ImGuiID;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property AuthorityForPos: Cardinal index $0003 read GetData0Value write SetData0Value; // 3 bits at offset 0 in Data0
    property AuthorityForSize: Cardinal index $0303 read GetData0Value write SetData0Value; // 3 bits at offset 3 in Data0
    property AuthorityForViewport: Cardinal index $0603 read GetData0Value write SetData0Value; // 3 bits at offset 6 in Data0
    property IsVisible: Cardinal index $901 read GetData0Value write SetData0Value; // 1 bits at offset 9 in Data0
    property IsFocused: Cardinal index $A01 read GetData0Value write SetData0Value; // 1 bits at offset 10 in Data0
    property IsBgDrawnThisFrame: Cardinal index $B01 read GetData0Value write SetData0Value; // 1 bits at offset 11 in Data0
    property HasCloseButton: Cardinal index $C01 read GetData0Value write SetData0Value; // 1 bits at offset 12 in Data0
    property HasWindowMenuButton: Cardinal index $D01 read GetData0Value write SetData0Value; // 1 bits at offset 13 in Data0
    property HasCentralNodeChild: Cardinal index $E01 read GetData0Value write SetData0Value; // 1 bits at offset 14 in Data0
    property WantCloseAll: Cardinal index $F01 read GetData0Value write SetData0Value; // 1 bits at offset 15 in Data0
    property WantLockSizeOnce: Cardinal index $1001 read GetData0Value write SetData0Value; // 1 bits at offset 16 in Data0
    property WantMouseMove: Cardinal index $1101 read GetData0Value write SetData0Value; // 1 bits at offset 17 in Data0
    property WantHiddenTabBarUpdate: Cardinal index $1201 read GetData0Value write SetData0Value; // 1 bits at offset 18 in Data0
    property WantHiddenTabBarToggle: Cardinal index $1301 read GetData0Value write SetData0Value; // 1 bits at offset 19 in Data0
  end;

  ImGuiWindowDockStyle = record
    Colors: array [0..5] of ImU32;
  end;

  ImVector_ImGuiDockRequest = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiDockRequest;
  end;

  ImVector_ImGuiDockNodeSettings = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiDockNodeSettings;
  end;

  ImGuiDockContext = record
    Nodes: ImGuiStorage;
    Requests: ImVector_ImGuiDockRequest;
    NodesSettings: ImVector_ImGuiDockNodeSettings;
    WantFullRebuild: Boolean;
  end;

  ImGuiViewportP = record
    _ImGuiViewport: ImGuiViewport;
    Window: PImGuiWindow;
    Idx: Integer;
    LastFrameActive: Integer;
    LastFocusedStampCount: Integer;
    LastNameHash: ImGuiID;
    LastPos: ImVec2;
    Alpha: Single;
    LastAlpha: Single;
    LastFocusedHadNavWindow: Boolean;
    PlatformMonitor: Smallint;
    BgFgDrawListsLastFrame: array [0..1] of Integer;
    BgFgDrawLists: array [0..1] of PImDrawList;
    DrawDataP: ImDrawData;
    DrawDataBuilder: ImDrawDataBuilder;
    LastPlatformPos: ImVec2;
    LastPlatformSize: ImVec2;
    LastRendererSize: ImVec2;
    WorkOffsetMin: ImVec2;
    WorkOffsetMax: ImVec2;
    BuildWorkOffsetMin: ImVec2;
    BuildWorkOffsetMax: ImVec2;
  end;

  ImGuiWindowSettings = record
    ID: ImGuiID;
    Pos: ImVec2ih;
    Size: ImVec2ih;
    ViewportPos: ImVec2ih;
    ViewportId: ImGuiID;
    DockId: ImGuiID;
    ClassId: ImGuiID;
    DockOrder: Smallint;
    Collapsed: Boolean;
    IsChild: Boolean;
    WantApply: Boolean;
    WantDelete: Boolean;
  end;

  ImGuiSettingsHandler = record
    TypeName: PUTF8Char;
    TypeHash: ImGuiID;
    ClearAllFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler); cdecl;
    ReadInitFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler); cdecl;
    ReadOpenFn: function(ctx: PImGuiContext; handler: PImGuiSettingsHandler; const name: PUTF8Char): Pointer; cdecl;
    ReadLineFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler; entry: Pointer; const line: PUTF8Char); cdecl;
    ApplyAllFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler); cdecl;
    WriteAllFn: procedure(ctx: PImGuiContext; handler: PImGuiSettingsHandler; out_buf: PImGuiTextBuffer); cdecl;
    UserData: Pointer;
  end;

  ImGuiLocEntry = record
    Key: ImGuiLocKey;
    Text: PUTF8Char;
  end;

  ImGuiDebugAllocEntry = record
    FrameCount: Integer;
    AllocCount: ImS16;
    FreeCount: ImS16;
  end;

  ImGuiDebugAllocInfo = record
    TotalAllocCount: Integer;
    TotalFreeCount: Integer;
    LastEntriesIdx: ImS16;
    LastEntriesBuf: array [0..5] of ImGuiDebugAllocEntry;
  end;

  ImGuiMetricsConfig = record
    ShowDebugLog: Boolean;
    ShowIDStackTool: Boolean;
    ShowWindowsRects: Boolean;
    ShowWindowsBeginOrder: Boolean;
    ShowTablesRects: Boolean;
    ShowDrawCmdMesh: Boolean;
    ShowDrawCmdBoundingBoxes: Boolean;
    ShowTextEncodingViewer: Boolean;
    ShowAtlasTintedWithTextColor: Boolean;
    ShowDockingNodes: Boolean;
    ShowWindowsRectsType: Integer;
    ShowTablesRectsType: Integer;
    HighlightMonitorIdx: Integer;
    HighlightViewportID: ImGuiID;
  end;

  ImGuiStackLevelInfo = record
    ID: ImGuiID;
    QueryFrameCount: ImS8;
    QuerySuccess: Boolean;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property DataType: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
  var
    Desc: array [0..56] of UTF8Char;
  end;

  ImVector_ImGuiStackLevelInfo = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStackLevelInfo;
  end;

  ImGuiIDStackTool = record
    LastActiveFrame: Integer;
    StackLevel: Integer;
    QueryId: ImGuiID;
    Results: ImVector_ImGuiStackLevelInfo;
    CopyToClipboardOnCtrlC: Boolean;
    CopyToClipboardLastTime: Single;
  end;

  ImGuiContextHookCallback = procedure(ctx: PImGuiContext; hook: PImGuiContextHook); cdecl;

  ImGuiContextHook = record
    HookId: ImGuiID;
    &Type: ImGuiContextHookType;
    Owner: ImGuiID;
    Callback: ImGuiContextHookCallback;
    UserData: Pointer;
  end;

  ImVector_ImGuiInputEvent = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiInputEvent;
  end;

  ImVector_ImGuiWindowStackData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiWindowStackData;
  end;

  ImVector_ImGuiColorMod = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiColorMod;
  end;

  ImVector_ImGuiStyleMod = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStyleMod;
  end;

  ImVector_ImGuiFocusScopeData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiFocusScopeData;
  end;

  ImVector_ImGuiItemFlags = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiItemFlags;
  end;

  ImVector_ImGuiGroupData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiGroupData;
  end;

  ImVector_ImGuiPopupData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPopupData;
  end;

  ImVector_ImGuiNavTreeNodeData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiNavTreeNodeData;
  end;

  ImVector_ImGuiViewportPPtr = record
    Size: Integer;
    Capacity: Integer;
    Data: PPImGuiViewportP;
  end;

  ImVector_unsigned_char = record
    Size: Integer;
    Capacity: Integer;
    Data: PByte;
  end;

  ImVector_ImGuiListClipperData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiListClipperData;
  end;

  ImVector_ImGuiTableTempData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableTempData;
  end;

  ImVector_ImGuiTable = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTable;
  end;

  ImPool_ImGuiTable = record
    Buf: ImVector_ImGuiTable;
    Map: ImGuiStorage;
    FreeIdx: ImPoolIdx;
    AliveCount: ImPoolIdx;
  end;

  ImVector_ImGuiTabBar = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTabBar;
  end;

  ImPool_ImGuiTabBar = record
    Buf: ImVector_ImGuiTabBar;
    Map: ImGuiStorage;
    FreeIdx: ImPoolIdx;
    AliveCount: ImPoolIdx;
  end;

  ImVector_ImGuiPtrOrIndex = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPtrOrIndex;
  end;

  ImVector_ImGuiShrinkWidthItem = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiShrinkWidthItem;
  end;

  ImVector_ImGuiID = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiID;
  end;

  ImVector_ImGuiSettingsHandler = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiSettingsHandler;
  end;

  ImChunkStream_ImGuiWindowSettings = record
    Buf: ImVector_char;
  end;

  ImChunkStream_ImGuiTableSettings = record
    Buf: ImVector_char;
  end;

  ImVector_ImGuiContextHook = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiContextHook;
  end;

  ImGuiContext = record
    Initialized: Boolean;
    FontAtlasOwnedByContext: Boolean;
    IO: ImGuiIO;
    PlatformIO: ImGuiPlatformIO;
    Style: ImGuiStyle;
    ConfigFlagsCurrFrame: ImGuiConfigFlags;
    ConfigFlagsLastFrame: ImGuiConfigFlags;
    Font: PImFont;
    FontSize: Single;
    FontBaseSize: Single;
    DrawListSharedData: ImDrawListSharedData;
    Time: Double;
    FrameCount: Integer;
    FrameCountEnded: Integer;
    FrameCountPlatformEnded: Integer;
    FrameCountRendered: Integer;
    WithinFrameScope: Boolean;
    WithinFrameScopeWithImplicitWindow: Boolean;
    WithinEndChild: Boolean;
    GcCompactAll: Boolean;
    TestEngineHookItems: Boolean;
    TestEngine: Pointer;
    InputEventsQueue: ImVector_ImGuiInputEvent;
    InputEventsTrail: ImVector_ImGuiInputEvent;
    InputEventsNextMouseSource: ImGuiMouseSource;
    InputEventsNextEventId: ImU32;
    Windows: ImVector_ImGuiWindowPtr;
    WindowsFocusOrder: ImVector_ImGuiWindowPtr;
    WindowsTempSortBuffer: ImVector_ImGuiWindowPtr;
    CurrentWindowStack: ImVector_ImGuiWindowStackData;
    WindowsById: ImGuiStorage;
    WindowsActiveCount: Integer;
    WindowsHoverPadding: ImVec2;
    DebugBreakInWindow: ImGuiID;
    CurrentWindow: PImGuiWindow;
    HoveredWindow: PImGuiWindow;
    HoveredWindowUnderMovingWindow: PImGuiWindow;
    MovingWindow: PImGuiWindow;
    WheelingWindow: PImGuiWindow;
    WheelingWindowRefMousePos: ImVec2;
    WheelingWindowStartFrame: Integer;
    WheelingWindowScrolledFrame: Integer;
    WheelingWindowReleaseTimer: Single;
    WheelingWindowWheelRemainder: ImVec2;
    WheelingAxisAvg: ImVec2;
    DebugHookIdInfo: ImGuiID;
    HoveredId: ImGuiID;
    HoveredIdPreviousFrame: ImGuiID;
    HoveredIdAllowOverlap: Boolean;
    HoveredIdDisabled: Boolean;
    HoveredIdTimer: Single;
    HoveredIdNotActiveTimer: Single;
    ActiveId: ImGuiID;
    ActiveIdIsAlive: ImGuiID;
    ActiveIdTimer: Single;
    ActiveIdIsJustActivated: Boolean;
    ActiveIdAllowOverlap: Boolean;
    ActiveIdNoClearOnFocusLoss: Boolean;
    ActiveIdHasBeenPressedBefore: Boolean;
    ActiveIdHasBeenEditedBefore: Boolean;
    ActiveIdHasBeenEditedThisFrame: Boolean;
    ActiveIdFromShortcut: Boolean;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property ActiveIdMouseButton: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
  var
    ActiveIdClickOffset: ImVec2;
    ActiveIdWindow: PImGuiWindow;
    ActiveIdSource: ImGuiInputSource;
    ActiveIdPreviousFrame: ImGuiID;
    ActiveIdPreviousFrameIsAlive: Boolean;
    ActiveIdPreviousFrameHasBeenEditedBefore: Boolean;
    ActiveIdPreviousFrameWindow: PImGuiWindow;
    LastActiveId: ImGuiID;
    LastActiveIdTimer: Single;
    LastKeyModsChangeTime: Double;
    LastKeyModsChangeFromNoneTime: Double;
    LastKeyboardKeyPressTime: Double;
    KeysMayBeCharInput: ImBitArrayForNamedKeys;
    KeysOwnerData: array [0..153] of ImGuiKeyOwnerData;
    KeysRoutingTable: ImGuiKeyRoutingTable;
    ActiveIdUsingNavDirMask: ImU32;
    ActiveIdUsingAllKeyboardKeys: Boolean;
    DebugBreakInShortcutRouting: ImGuiKeyChord;
    CurrentFocusScopeId: ImGuiID;
    CurrentItemFlags: ImGuiItemFlags;
    DebugLocateId: ImGuiID;
    NextItemData: ImGuiNextItemData;
    LastItemData: ImGuiLastItemData;
    NextWindowData: ImGuiNextWindowData;
    DebugShowGroupRects: Boolean;
    DebugFlashStyleColorIdx: ImGuiCol;
    ColorStack: ImVector_ImGuiColorMod;
    StyleVarStack: ImVector_ImGuiStyleMod;
    FontStack: ImVector_ImFontPtr;
    FocusScopeStack: ImVector_ImGuiFocusScopeData;
    ItemFlagsStack: ImVector_ImGuiItemFlags;
    GroupStack: ImVector_ImGuiGroupData;
    OpenPopupStack: ImVector_ImGuiPopupData;
    BeginPopupStack: ImVector_ImGuiPopupData;
    NavTreeNodeStack: ImVector_ImGuiNavTreeNodeData;
    Viewports: ImVector_ImGuiViewportPPtr;
    CurrentDpiScale: Single;
    CurrentViewport: PImGuiViewportP;
    MouseViewport: PImGuiViewportP;
    MouseLastHoveredViewport: PImGuiViewportP;
    PlatformLastFocusedViewportId: ImGuiID;
    FallbackMonitor: ImGuiPlatformMonitor;
    PlatformMonitorsFullWorkRect: ImRect;
    ViewportCreatedCount: Integer;
    PlatformWindowsCreatedCount: Integer;
    ViewportFocusedStampCount: Integer;
    NavWindow: PImGuiWindow;
    NavId: ImGuiID;
    NavFocusScopeId: ImGuiID;
    NavFocusRoute: ImVector_ImGuiFocusScopeData;
    NavActivateId: ImGuiID;
    NavActivateDownId: ImGuiID;
    NavActivatePressedId: ImGuiID;
    NavActivateFlags: ImGuiActivateFlags;
    NavHighlightActivatedId: ImGuiID;
    NavHighlightActivatedTimer: Single;
    NavJustMovedToId: ImGuiID;
    NavJustMovedToFocusScopeId: ImGuiID;
    NavJustMovedToKeyMods: ImGuiKeyChord;
    NavNextActivateId: ImGuiID;
    NavNextActivateFlags: ImGuiActivateFlags;
    NavInputSource: ImGuiInputSource;
    NavLayer: ImGuiNavLayer;
    NavLastValidSelectionUserData: ImGuiSelectionUserData;
    NavIdIsAlive: Boolean;
    NavMousePosDirty: Boolean;
    NavDisableHighlight: Boolean;
    NavDisableMouseHover: Boolean;
    NavAnyRequest: Boolean;
    NavInitRequest: Boolean;
    NavInitRequestFromMove: Boolean;
    NavInitResult: ImGuiNavItemData;
    NavMoveSubmitted: Boolean;
    NavMoveScoringItems: Boolean;
    NavMoveForwardToNextFrame: Boolean;
    NavMoveFlags: ImGuiNavMoveFlags;
    NavMoveScrollFlags: ImGuiScrollFlags;
    NavMoveKeyMods: ImGuiKeyChord;
    NavMoveDir: ImGuiDir;
    NavMoveDirForDebug: ImGuiDir;
    NavMoveClipDir: ImGuiDir;
    NavScoringRect: ImRect;
    NavScoringNoClipRect: ImRect;
    NavScoringDebugCount: Integer;
    NavTabbingDir: Integer;
    NavTabbingCounter: Integer;
    NavMoveResultLocal: ImGuiNavItemData;
    NavMoveResultLocalVisible: ImGuiNavItemData;
    NavMoveResultOther: ImGuiNavItemData;
    NavTabbingResultFirst: ImGuiNavItemData;
    ConfigNavWindowingKeyNext: ImGuiKeyChord;
    ConfigNavWindowingKeyPrev: ImGuiKeyChord;
    NavWindowingTarget: PImGuiWindow;
    NavWindowingTargetAnim: PImGuiWindow;
    NavWindowingListWindow: PImGuiWindow;
    NavWindowingTimer: Single;
    NavWindowingHighlightAlpha: Single;
    NavWindowingToggleLayer: Boolean;
    NavWindowingToggleKey: ImGuiKey;
    NavWindowingAccumDeltaPos: ImVec2;
    NavWindowingAccumDeltaSize: ImVec2;
    DimBgRatio: Single;
    DragDropActive: Boolean;
    DragDropWithinSource: Boolean;
    DragDropWithinTarget: Boolean;
    DragDropSourceFlags: ImGuiDragDropFlags;
    DragDropSourceFrameCount: Integer;
    DragDropMouseButton: Integer;
    DragDropPayload: ImGuiPayload;
    DragDropTargetRect: ImRect;
    DragDropTargetClipRect: ImRect;
    DragDropTargetId: ImGuiID;
    DragDropAcceptFlags: ImGuiDragDropFlags;
    DragDropAcceptIdCurrRectSurface: Single;
    DragDropAcceptIdCurr: ImGuiID;
    DragDropAcceptIdPrev: ImGuiID;
    DragDropAcceptFrameCount: Integer;
    DragDropHoldJustPressedId: ImGuiID;
    DragDropPayloadBufHeap: ImVector_unsigned_char;
    DragDropPayloadBufLocal: array [0..15] of Byte;
    ClipperTempDataStacked: Integer;
    ClipperTempData: ImVector_ImGuiListClipperData;
    CurrentTable: PImGuiTable;
    DebugBreakInTable: ImGuiID;
    TablesTempDataStacked: Integer;
    TablesTempData: ImVector_ImGuiTableTempData;
    Tables: ImPool_ImGuiTable;
    TablesLastTimeActive: ImVector_float;
    DrawChannelsTempMergeBuffer: ImVector_ImDrawChannel;
    CurrentTabBar: PImGuiTabBar;
    TabBars: ImPool_ImGuiTabBar;
    CurrentTabBarStack: ImVector_ImGuiPtrOrIndex;
    ShrinkWidthBuffer: ImVector_ImGuiShrinkWidthItem;
    HoverItemDelayId: ImGuiID;
    HoverItemDelayIdPreviousFrame: ImGuiID;
    HoverItemDelayTimer: Single;
    HoverItemDelayClearTimer: Single;
    HoverItemUnlockedStationaryId: ImGuiID;
    HoverWindowUnlockedStationaryId: ImGuiID;
    MouseCursor: ImGuiMouseCursor;
    MouseStationaryTimer: Single;
    MouseLastValidPos: ImVec2;
    InputTextState: ImGuiInputTextState;
    InputTextDeactivatedState: ImGuiInputTextDeactivatedState;
    InputTextPasswordFont: ImFont;
    TempInputId: ImGuiID;
    BeginMenuDepth: Integer;
    BeginComboDepth: Integer;
    ColorEditOptions: ImGuiColorEditFlags;
    ColorEditCurrentID: ImGuiID;
    ColorEditSavedID: ImGuiID;
    ColorEditSavedHue: Single;
    ColorEditSavedSat: Single;
    ColorEditSavedColor: ImU32;
    ColorPickerRef: ImVec4;
    ComboPreviewData: ImGuiComboPreviewData;
    WindowResizeBorderExpectedRect: ImRect;
    WindowResizeRelativeMode: Boolean;
    SliderGrabClickOffset: Single;
    SliderCurrentAccum: Single;
    SliderCurrentAccumDirty: Boolean;
    DragCurrentAccumDirty: Boolean;
    DragCurrentAccum: Single;
    DragSpeedDefaultRatio: Single;
    ScrollbarClickDeltaToGrabCenter: Single;
    DisabledAlphaBackup: Single;
    DisabledStackSize: Smallint;
    LockMarkEdited: Smallint;
    TooltipOverrideCount: Smallint;
    ClipboardHandlerData: ImVector_char;
    MenusIdSubmittedThisFrame: ImVector_ImGuiID;
    TypingSelectState: ImGuiTypingSelectState;
    PlatformImeData: ImGuiPlatformImeData;
    PlatformImeDataPrev: ImGuiPlatformImeData;
    PlatformImeViewport: ImGuiID;
    DockContext: ImGuiDockContext;
    DockNodeWindowMenuHandler: procedure(ctx: PImGuiContext; node: PImGuiDockNode; tab_bar: PImGuiTabBar); cdecl;
    SettingsLoaded: Boolean;
    SettingsDirtyTimer: Single;
    SettingsIniData: ImGuiTextBuffer;
    SettingsHandlers: ImVector_ImGuiSettingsHandler;
    SettingsWindows: ImChunkStream_ImGuiWindowSettings;
    SettingsTables: ImChunkStream_ImGuiTableSettings;
    Hooks: ImVector_ImGuiContextHook;
    HookIdNext: ImGuiID;
    LocalizationTable: array [0..10] of PUTF8Char;
    LogEnabled: Boolean;
    LogType: ImGuiLogType;
    LogFile: ImFileHandle;
    LogBuffer: ImGuiTextBuffer;
    LogNextPrefix: PUTF8Char;
    LogNextSuffix: PUTF8Char;
    LogLinePosY: Single;
    LogLineFirstItem: Boolean;
    LogDepthRef: Integer;
    LogDepthToExpand: Integer;
    LogDepthToExpandDefault: Integer;
    DebugLogFlags: ImGuiDebugLogFlags;
    DebugLogBuf: ImGuiTextBuffer;
    DebugLogIndex: ImGuiTextIndex;
    DebugLogAutoDisableFlags: ImGuiDebugLogFlags;
    DebugLogAutoDisableFrames: ImU8;
    DebugLocateFrames: ImU8;
    DebugBreakInLocateId: Boolean;
    DebugBreakKeyChord: ImGuiKeyChord;
    DebugBeginReturnValueCullDepth: ImS8;
    DebugItemPickerActive: Boolean;
    DebugItemPickerMouseButton: ImU8;
    DebugItemPickerBreakId: ImGuiID;
    DebugFlashStyleColorTime: Single;
    DebugFlashStyleColorBackup: ImVec4;
    DebugMetricsConfig: ImGuiMetricsConfig;
    DebugIDStackTool: ImGuiIDStackTool;
    DebugAllocInfo: ImGuiDebugAllocInfo;
    DebugHoveredDockNode: PImGuiDockNode;
    FramerateSecPerFrame: array [0..59] of Single;
    FramerateSecPerFrameIdx: Integer;
    FramerateSecPerFrameCount: Integer;
    FramerateSecPerFrameAccum: Single;
    WantCaptureMouseNextFrame: Integer;
    WantCaptureKeyboardNextFrame: Integer;
    WantTextInputNextFrame: Integer;
    TempBuffer: ImVector_char;
    TempKeychordName: array [0..63] of UTF8Char;
  end;

  ImGuiWindowTempData = record
    CursorPos: ImVec2;
    CursorPosPrevLine: ImVec2;
    CursorStartPos: ImVec2;
    CursorMaxPos: ImVec2;
    IdealMaxPos: ImVec2;
    CurrLineSize: ImVec2;
    PrevLineSize: ImVec2;
    CurrLineTextBaseOffset: Single;
    PrevLineTextBaseOffset: Single;
    IsSameLine: Boolean;
    IsSetPos: Boolean;
    Indent: ImVec1;
    ColumnsOffset: ImVec1;
    GroupOffset: ImVec1;
    CursorStartPosLossyness: ImVec2;
    NavLayerCurrent: ImGuiNavLayer;
    NavLayersActiveMask: Smallint;
    NavLayersActiveMaskNext: Smallint;
    NavIsScrollPushableX: Boolean;
    NavHideHighlightOneFrame: Boolean;
    NavWindowHasScrollY: Boolean;
    MenuBarAppending: Boolean;
    MenuBarOffset: ImVec2;
    MenuColumns: ImGuiMenuColumns;
    TreeDepth: Integer;
    TreeJumpToParentOnPopMask: ImU32;
    ChildWindows: ImVector_ImGuiWindowPtr;
    StateStorage: PImGuiStorage;
    CurrentColumns: PImGuiOldColumns;
    CurrentTableIdx: Integer;
    LayoutType: ImGuiLayoutType;
    ParentLayoutType: ImGuiLayoutType;
    ModalDimBgColor: ImU32;
    ItemWidth: Single;
    TextWrapPos: Single;
    ItemWidthStack: ImVector_float;
    TextWrapPosStack: ImVector_float;
  end;

  ImVector_ImGuiOldColumns = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiOldColumns;
  end;

  ImGuiWindow = record
    Ctx: PImGuiContext;
    Name: PUTF8Char;
    ID: ImGuiID;
    Flags: ImGuiWindowFlags;
    FlagsPreviousFrame: ImGuiWindowFlags;
    ChildFlags: ImGuiChildFlags;
    WindowClass: ImGuiWindowClass;
    Viewport: PImGuiViewportP;
    ViewportId: ImGuiID;
    ViewportPos: ImVec2;
    ViewportAllowPlatformMonitorExtend: Integer;
    Pos: ImVec2;
    Size: ImVec2;
    SizeFull: ImVec2;
    ContentSize: ImVec2;
    ContentSizeIdeal: ImVec2;
    ContentSizeExplicit: ImVec2;
    WindowPadding: ImVec2;
    WindowRounding: Single;
    WindowBorderSize: Single;
    DecoOuterSizeX1: Single;
    DecoOuterSizeY1: Single;
    DecoOuterSizeX2: Single;
    DecoOuterSizeY2: Single;
    DecoInnerSizeX1: Single;
    DecoInnerSizeY1: Single;
    NameBufLen: Integer;
    MoveId: ImGuiID;
    TabId: ImGuiID;
    ChildId: ImGuiID;
    Scroll: ImVec2;
    ScrollMax: ImVec2;
    ScrollTarget: ImVec2;
    ScrollTargetCenterRatio: ImVec2;
    ScrollTargetEdgeSnapDist: ImVec2;
    ScrollbarSizes: ImVec2;
    ScrollbarX: Boolean;
    ScrollbarY: Boolean;
    ViewportOwned: Boolean;
    Active: Boolean;
    WasActive: Boolean;
    WriteAccessed: Boolean;
    Collapsed: Boolean;
    WantCollapseToggle: Boolean;
    SkipItems: Boolean;
    Appearing: Boolean;
    Hidden: Boolean;
    IsFallbackWindow: Boolean;
    IsExplicitChild: Boolean;
    HasCloseButton: Boolean;
    ResizeBorderHovered: UTF8Char;
    ResizeBorderHeld: UTF8Char;
    BeginCount: Smallint;
    BeginCountPreviousFrame: Smallint;
    BeginOrderWithinParent: Smallint;
    BeginOrderWithinContext: Smallint;
    FocusOrder: Smallint;
    PopupId: ImGuiID;
    AutoFitFramesX: ImS8;
    AutoFitFramesY: ImS8;
    AutoFitOnlyGrows: Boolean;
    AutoPosLastDirection: ImGuiDir;
    HiddenFramesCanSkipItems: ImS8;
    HiddenFramesCannotSkipItems: ImS8;
    HiddenFramesForRenderOnly: ImS8;
    DisableInputsFrames: ImS8;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SetWindowPosAllowFlags: Cardinal index $0008 read GetData0Value write SetData0Value; // 8 bits at offset 0 in Data0
    property SetWindowSizeAllowFlags: Cardinal index $0808 read GetData0Value write SetData0Value; // 8 bits at offset 8 in Data0
    property SetWindowCollapsedAllowFlags: Cardinal index $1008 read GetData0Value write SetData0Value; // 8 bits at offset 16 in Data0
    property SetWindowDockAllowFlags: Cardinal index $1808 read GetData0Value write SetData0Value; // 8 bits at offset 24 in Data0
  var
    SetWindowPosVal: ImVec2;
    SetWindowPosPivot: ImVec2;
    IDStack: ImVector_ImGuiID;
    DC: ImGuiWindowTempData;
    OuterRectClipped: ImRect;
    InnerRect: ImRect;
    InnerClipRect: ImRect;
    WorkRect: ImRect;
    ParentWorkRect: ImRect;
    ClipRect: ImRect;
    ContentRegionRect: ImRect;
    HitTestHoleSize: ImVec2ih;
    HitTestHoleOffset: ImVec2ih;
    LastFrameActive: Integer;
    LastFrameJustFocused: Integer;
    LastTimeActive: Single;
    ItemWidthDefault: Single;
    StateStorage: ImGuiStorage;
    ColumnsStorage: ImVector_ImGuiOldColumns;
    FontWindowScale: Single;
    FontDpiScale: Single;
    SettingsOffset: Integer;
    DrawList: PImDrawList;
    DrawListInst: ImDrawList;
    ParentWindow: PImGuiWindow;
    ParentWindowInBeginStack: PImGuiWindow;
    RootWindow: PImGuiWindow;
    RootWindowPopupTree: PImGuiWindow;
    RootWindowDockTree: PImGuiWindow;
    RootWindowForTitleBarHighlight: PImGuiWindow;
    RootWindowForNav: PImGuiWindow;
    ParentWindowForFocusRoute: PImGuiWindow;
    NavLastChildNavWindow: PImGuiWindow;
    NavLastIds: array [0..1] of ImGuiID;
    NavRectRel: array [0..1] of ImRect;
    NavPreferredScoringPosRel: array [0..1] of ImVec2;
    NavRootFocusScopeId: ImGuiID;
    MemoryDrawListIdxCapacity: Integer;
    MemoryDrawListVtxCapacity: Integer;
    MemoryCompacted: Boolean;
  private
    Data1: Cardinal;
    function GetData1Value(const AIndex: Integer): Cardinal;
    procedure SetData1Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property DockIsActive: Cardinal index $1 read GetData1Value write SetData1Value; // 1 bits at offset 0 in Data1
    property DockNodeIsVisible: Cardinal index $101 read GetData1Value write SetData1Value; // 1 bits at offset 1 in Data1
    property DockTabIsVisible: Cardinal index $201 read GetData1Value write SetData1Value; // 1 bits at offset 2 in Data1
    property DockTabWantClose: Cardinal index $301 read GetData1Value write SetData1Value; // 1 bits at offset 3 in Data1
  var
    DockOrder: Smallint;
    DockStyle: ImGuiWindowDockStyle;
    DockNode: PImGuiDockNode;
    DockNodeAsHost: PImGuiDockNode;
    DockId: ImGuiID;
    DockTabItemStatusFlags: ImGuiItemStatusFlags;
    DockTabItemRect: ImRect;
  end;

  ImGuiTabItem = record
    ID: ImGuiID;
    Flags: ImGuiTabItemFlags;
    Window: PImGuiWindow;
    LastFrameVisible: Integer;
    LastFrameSelected: Integer;
    Offset: Single;
    Width: Single;
    ContentWidth: Single;
    RequestedWidth: Single;
    NameOffset: ImS32;
    BeginOrder: ImS16;
    IndexDuringLayout: ImS16;
    WantClose: Boolean;
  end;

  ImVector_ImGuiTabItem = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTabItem;
  end;

  ImGuiTabBar = record
    Tabs: ImVector_ImGuiTabItem;
    Flags: ImGuiTabBarFlags;
    ID: ImGuiID;
    SelectedTabId: ImGuiID;
    NextSelectedTabId: ImGuiID;
    VisibleTabId: ImGuiID;
    CurrFrameVisible: Integer;
    PrevFrameVisible: Integer;
    BarRect: ImRect;
    CurrTabsContentsHeight: Single;
    PrevTabsContentsHeight: Single;
    WidthAllTabs: Single;
    WidthAllTabsIdeal: Single;
    ScrollingAnim: Single;
    ScrollingTarget: Single;
    ScrollingTargetDistToVisibility: Single;
    ScrollingSpeed: Single;
    ScrollingRectMinX: Single;
    ScrollingRectMaxX: Single;
    SeparatorMinX: Single;
    SeparatorMaxX: Single;
    ReorderRequestTabId: ImGuiID;
    ReorderRequestOffset: ImS16;
    BeginCount: ImS8;
    WantLayout: Boolean;
    VisibleTabWasSubmitted: Boolean;
    TabsAddedNew: Boolean;
    TabsActiveCount: ImS16;
    LastTabItemIdx: ImS16;
    ItemSpacingY: Single;
    FramePadding: ImVec2;
    BackupCursorPos: ImVec2;
    TabsNames: ImGuiTextBuffer;
  end;

  ImGuiTableColumnIdx = ImS16;
  PImGuiTableColumnIdx = ^ImGuiTableColumnIdx;
  ImGuiTableDrawChannelIdx = ImU16;

  ImGuiTableColumn = record
    Flags: ImGuiTableColumnFlags;
    WidthGiven: Single;
    MinX: Single;
    MaxX: Single;
    WidthRequest: Single;
    WidthAuto: Single;
    StretchWeight: Single;
    InitStretchWeightOrWidth: Single;
    ClipRect: ImRect;
    UserID: ImGuiID;
    WorkMinX: Single;
    WorkMaxX: Single;
    ItemWidth: Single;
    ContentMaxXFrozen: Single;
    ContentMaxXUnfrozen: Single;
    ContentMaxXHeadersUsed: Single;
    ContentMaxXHeadersIdeal: Single;
    NameOffset: ImS16;
    DisplayOrder: ImGuiTableColumnIdx;
    IndexWithinEnabledSet: ImGuiTableColumnIdx;
    PrevEnabledColumn: ImGuiTableColumnIdx;
    NextEnabledColumn: ImGuiTableColumnIdx;
    SortOrder: ImGuiTableColumnIdx;
    DrawChannelCurrent: ImGuiTableDrawChannelIdx;
    DrawChannelFrozen: ImGuiTableDrawChannelIdx;
    DrawChannelUnfrozen: ImGuiTableDrawChannelIdx;
    IsEnabled: Boolean;
    IsUserEnabled: Boolean;
    IsUserEnabledNextFrame: Boolean;
    IsVisibleX: Boolean;
    IsVisibleY: Boolean;
    IsRequestOutput: Boolean;
    IsSkipItems: Boolean;
    IsPreserveWidthAuto: Boolean;
    NavLayerCurrent: ImS8;
    AutoFitQueue: ImU8;
    CannotSkipItemsQueue: ImU8;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SortDirection: Cardinal index $2 read GetData0Value write SetData0Value; // 2 bits at offset 0 in Data0
    property SortDirectionsAvailCount: Cardinal index $202 read GetData0Value write SetData0Value; // 2 bits at offset 2 in Data0
    property SortDirectionsAvailMask: Cardinal index $404 read GetData0Value write SetData0Value; // 4 bits at offset 4 in Data0
  var
    SortDirectionsAvailList: ImU8;
  end;

  ImGuiTableCellData = record
    BgColor: ImU32;
    Column: ImGuiTableColumnIdx;
  end;

  ImGuiTableInstanceData = record
    TableInstanceID: ImGuiID;
    LastOuterHeight: Single;
    LastTopHeadersRowHeight: Single;
    LastFrozenHeight: Single;
    HoveredRowLast: Integer;
    HoveredRowNext: Integer;
  end;

  ImSpan_ImGuiTableColumn = record
    Data: PImGuiTableColumn;
    DataEnd: PImGuiTableColumn;
  end;

  ImSpan_ImGuiTableColumnIdx = record
    Data: PImGuiTableColumnIdx;
    DataEnd: PImGuiTableColumnIdx;
  end;

  ImSpan_ImGuiTableCellData = record
    Data: PImGuiTableCellData;
    DataEnd: PImGuiTableCellData;
  end;

  ImVector_ImGuiTableInstanceData = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableInstanceData;
  end;

  ImVector_ImGuiTableColumnSortSpecs = record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableColumnSortSpecs;
  end;

  ImGuiTable = record
    ID: ImGuiID;
    Flags: ImGuiTableFlags;
    RawData: Pointer;
    TempData: PImGuiTableTempData;
    Columns: ImSpan_ImGuiTableColumn;
    DisplayOrderToIndex: ImSpan_ImGuiTableColumnIdx;
    RowCellData: ImSpan_ImGuiTableCellData;
    EnabledMaskByDisplayOrder: ImBitArrayPtr;
    EnabledMaskByIndex: ImBitArrayPtr;
    VisibleMaskByIndex: ImBitArrayPtr;
    SettingsLoadedFlags: ImGuiTableFlags;
    SettingsOffset: Integer;
    LastFrameActive: Integer;
    ColumnsCount: Integer;
    CurrentRow: Integer;
    CurrentColumn: Integer;
    InstanceCurrent: ImS16;
    InstanceInteracted: ImS16;
    RowPosY1: Single;
    RowPosY2: Single;
    RowMinHeight: Single;
    RowCellPaddingY: Single;
    RowTextBaseline: Single;
    RowIndentOffsetX: Single;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property RowFlags: Cardinal index $0010 read GetData0Value write SetData0Value; // 16 bits at offset 0 in Data0
    property LastRowFlags: Cardinal index $1010 read GetData0Value write SetData0Value; // 16 bits at offset 16 in Data0
  var
    RowBgColorCounter: Integer;
    RowBgColor: array [0..1] of ImU32;
    BorderColorStrong: ImU32;
    BorderColorLight: ImU32;
    BorderX1: Single;
    BorderX2: Single;
    HostIndentX: Single;
    MinColumnWidth: Single;
    OuterPaddingX: Single;
    CellPaddingX: Single;
    CellSpacingX1: Single;
    CellSpacingX2: Single;
    InnerWidth: Single;
    ColumnsGivenWidth: Single;
    ColumnsAutoFitWidth: Single;
    ColumnsStretchSumWeights: Single;
    ResizedColumnNextWidth: Single;
    ResizeLockMinContentsX2: Single;
    RefScale: Single;
    AngledHeadersHeight: Single;
    AngledHeadersSlope: Single;
    OuterRect: ImRect;
    InnerRect: ImRect;
    WorkRect: ImRect;
    InnerClipRect: ImRect;
    BgClipRect: ImRect;
    Bg0ClipRectForDrawCmd: ImRect;
    Bg2ClipRectForDrawCmd: ImRect;
    HostClipRect: ImRect;
    HostBackupInnerClipRect: ImRect;
    OuterWindow: PImGuiWindow;
    InnerWindow: PImGuiWindow;
    ColumnsNames: ImGuiTextBuffer;
    DrawSplitter: PImDrawListSplitter;
    InstanceDataFirst: ImGuiTableInstanceData;
    InstanceDataExtra: ImVector_ImGuiTableInstanceData;
    SortSpecsSingle: ImGuiTableColumnSortSpecs;
    SortSpecsMulti: ImVector_ImGuiTableColumnSortSpecs;
    SortSpecs: ImGuiTableSortSpecs;
    SortSpecsCount: ImGuiTableColumnIdx;
    ColumnsEnabledCount: ImGuiTableColumnIdx;
    ColumnsEnabledFixedCount: ImGuiTableColumnIdx;
    DeclColumnsCount: ImGuiTableColumnIdx;
    AngledHeadersCount: ImGuiTableColumnIdx;
    HoveredColumnBody: ImGuiTableColumnIdx;
    HoveredColumnBorder: ImGuiTableColumnIdx;
    HighlightColumnHeader: ImGuiTableColumnIdx;
    AutoFitSingleColumn: ImGuiTableColumnIdx;
    ResizedColumn: ImGuiTableColumnIdx;
    LastResizedColumn: ImGuiTableColumnIdx;
    HeldHeaderColumn: ImGuiTableColumnIdx;
    ReorderColumn: ImGuiTableColumnIdx;
    ReorderColumnDir: ImGuiTableColumnIdx;
    LeftMostEnabledColumn: ImGuiTableColumnIdx;
    RightMostEnabledColumn: ImGuiTableColumnIdx;
    LeftMostStretchedColumn: ImGuiTableColumnIdx;
    RightMostStretchedColumn: ImGuiTableColumnIdx;
    ContextPopupColumn: ImGuiTableColumnIdx;
    FreezeRowsRequest: ImGuiTableColumnIdx;
    FreezeRowsCount: ImGuiTableColumnIdx;
    FreezeColumnsRequest: ImGuiTableColumnIdx;
    FreezeColumnsCount: ImGuiTableColumnIdx;
    RowCellDataCurrent: ImGuiTableColumnIdx;
    DummyDrawChannel: ImGuiTableDrawChannelIdx;
    Bg2DrawChannelCurrent: ImGuiTableDrawChannelIdx;
    Bg2DrawChannelUnfrozen: ImGuiTableDrawChannelIdx;
    IsLayoutLocked: Boolean;
    IsInsideRow: Boolean;
    IsInitializing: Boolean;
    IsSortSpecsDirty: Boolean;
    IsUsingHeaders: Boolean;
    IsContextPopupOpen: Boolean;
    DisableDefaultContextMenu: Boolean;
    IsSettingsRequestLoad: Boolean;
    IsSettingsDirty: Boolean;
    IsDefaultDisplayOrder: Boolean;
    IsResetAllRequest: Boolean;
    IsResetDisplayOrderRequest: Boolean;
    IsUnfrozenRows: Boolean;
    IsDefaultSizingPolicy: Boolean;
    IsActiveIdAliveBeforeTable: Boolean;
    IsActiveIdInTable: Boolean;
    HasScrollbarYCurr: Boolean;
    HasScrollbarYPrev: Boolean;
    MemoryCompacted: Boolean;
    HostSkipItems: Boolean;
  end;

  ImGuiTableTempData = record
    TableIndex: Integer;
    LastTimeActive: Single;
    AngledHeadersExtraWidth: Single;
    UserOuterSize: ImVec2;
    DrawSplitter: ImDrawListSplitter;
    HostBackupWorkRect: ImRect;
    HostBackupParentWorkRect: ImRect;
    HostBackupPrevLineSize: ImVec2;
    HostBackupCurrLineSize: ImVec2;
    HostBackupCursorMaxPos: ImVec2;
    HostBackupColumnsOffset: ImVec1;
    HostBackupItemWidth: Single;
    HostBackupItemWidthStackSize: Integer;
  end;

  ImGuiTableColumnSettings = record
    WidthOrWeight: Single;
    UserID: ImGuiID;
    Index: ImGuiTableColumnIdx;
    DisplayOrder: ImGuiTableColumnIdx;
    SortOrder: ImGuiTableColumnIdx;
  private
    Data0: Cardinal;
    function GetData0Value(const AIndex: Integer): Cardinal;
    procedure SetData0Value(const AIndex: Integer; const AValue: Cardinal);
  public
    property SortDirection: Cardinal index $2 read GetData0Value write SetData0Value; // 2 bits at offset 0 in Data0
    property IsEnabled: Cardinal index $201 read GetData0Value write SetData0Value; // 1 bits at offset 2 in Data0
    property IsStretch: Cardinal index $301 read GetData0Value write SetData0Value; // 1 bits at offset 3 in Data0
  end;

  ImGuiTableSettings = record
    ID: ImGuiID;
    SaveFlags: ImGuiTableFlags;
    RefScale: Single;
    ColumnsCount: ImGuiTableColumnIdx;
    ColumnsCountMax: ImGuiTableColumnIdx;
    WantApply: Boolean;
  end;

  ImFontBuilderIO = record
    FontBuilder_Build: function(atlas: PImFontAtlas): Boolean; cdecl;
  end;

  NSVGgradientStop = record
    color: Cardinal;
    offset: Single;
  end;

  NSVGgradient = record
    xform: array [0..5] of Single;
    spread: UTF8Char;
    fx: Single;
    fy: Single;
    nstops: Integer;
    stops: array [0..0] of NSVGgradientStop;
  end;

  P_anonymous_type_93 = ^_anonymous_type_93;
  _anonymous_type_93 = record
    case Integer of
      0: (color: Cardinal);
      1: (gradient: PNSVGgradient);
  end;

  NSVGpaint = record
    &type: UTF8Char;
    f2: _anonymous_type_93;
  end;

  NSVGpath = record
    pts: PSingle;
    npts: Integer;
    closed: UTF8Char;
    bounds: array [0..3] of Single;
    next: PNSVGpath;
  end;

  NSVGshape = record
    id: array [0..63] of UTF8Char;
    fill: NSVGpaint;
    stroke: NSVGpaint;
    opacity: Single;
    strokeWidth: Single;
    strokeDashOffset: Single;
    strokeDashArray: array [0..7] of Single;
    strokeDashCount: UTF8Char;
    strokeLineJoin: UTF8Char;
    strokeLineCap: UTF8Char;
    miterLimit: Single;
    fillRule: UTF8Char;
    flags: Byte;
    bounds: array [0..3] of Single;
    fillGradient: array [0..63] of UTF8Char;
    strokeGradient: array [0..63] of UTF8Char;
    xform: array [0..5] of Single;
    paths: PNSVGpath;
    next: PNSVGshape;
  end;

  NSVGimage = record
    width: Single;
    height: Single;
    shapes: PNSVGshape;
  end;

  PNSVGrasterizer = Pointer;
  PPNSVGrasterizer = ^PNSVGrasterizer;

const

  enet_v4_anyaddr: in6_addr = (Bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $FF, $FF, 0, 0, 0, 0));
  enet_v4_noaddr: in6_addr = (Bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $FF, $FF, $FF, $FF, $FF, $FF));
  enet_v4_localhost: in6_addr = (Bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, $FF, $FF, $7F, 0, 0, 1));
  enet_v6_anyaddr: in6_addr = (Bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0));
  enet_v6_noaddr: in6_addr = (Bytes: ($FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF));
  enet_v6_localhost: in6_addr = (Bytes: (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1));
  PLM_DEMUX_PACKET_PRIVATE: Integer = $BD;
  PLM_DEMUX_PACKET_AUDIO_1: Integer = $C0;
  PLM_DEMUX_PACKET_AUDIO_2: Integer = $C1;
  PLM_DEMUX_PACKET_AUDIO_3: Integer = $C2;
  PLM_DEMUX_PACKET_AUDIO_4: Integer = $C2;
  PLM_DEMUX_PACKET_VIDEO_1: Integer = $E0;

function glfwInit(): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwInit';

procedure glfwTerminate(); cdecl;
  external SGT_DLL name _PU + 'glfwTerminate';

procedure glfwInitHint(hint: Integer; value: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwInitHint';

procedure glfwInitAllocator(const allocator: PGLFWallocator); cdecl;
  external SGT_DLL name _PU + 'glfwInitAllocator';

procedure glfwGetVersion(major: PInteger; minor: PInteger; rev: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetVersion';

function glfwGetVersionString(): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetVersionString';

function glfwGetError(description: PPUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetError';

function glfwSetErrorCallback(callback: GLFWerrorfun): GLFWerrorfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetErrorCallback';

function glfwGetPlatform(): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetPlatform';

function glfwPlatformSupported(&platform: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwPlatformSupported';

function glfwGetMonitors(count: PInteger): PPGLFWmonitor; cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitors';

function glfwGetPrimaryMonitor(): PGLFWmonitor; cdecl;
  external SGT_DLL name _PU + 'glfwGetPrimaryMonitor';

procedure glfwGetMonitorPos(monitor: PGLFWmonitor; xpos: PInteger; ypos: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitorPos';

procedure glfwGetMonitorWorkarea(monitor: PGLFWmonitor; xpos: PInteger; ypos: PInteger; width: PInteger; height: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitorWorkarea';

procedure glfwGetMonitorPhysicalSize(monitor: PGLFWmonitor; widthMM: PInteger; heightMM: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitorPhysicalSize';

procedure glfwGetMonitorContentScale(monitor: PGLFWmonitor; xscale: PSingle; yscale: PSingle); cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitorContentScale';

function glfwGetMonitorName(monitor: PGLFWmonitor): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitorName';

procedure glfwSetMonitorUserPointer(monitor: PGLFWmonitor; pointer: Pointer); cdecl;
  external SGT_DLL name _PU + 'glfwSetMonitorUserPointer';

function glfwGetMonitorUserPointer(monitor: PGLFWmonitor): Pointer; cdecl;
  external SGT_DLL name _PU + 'glfwGetMonitorUserPointer';

function glfwSetMonitorCallback(callback: GLFWmonitorfun): GLFWmonitorfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetMonitorCallback';

function glfwGetVideoModes(monitor: PGLFWmonitor; count: PInteger): PGLFWvidmode; cdecl;
  external SGT_DLL name _PU + 'glfwGetVideoModes';

function glfwGetVideoMode(monitor: PGLFWmonitor): PGLFWvidmode; cdecl;
  external SGT_DLL name _PU + 'glfwGetVideoMode';

procedure glfwSetGamma(monitor: PGLFWmonitor; gamma: Single); cdecl;
  external SGT_DLL name _PU + 'glfwSetGamma';

function glfwGetGammaRamp(monitor: PGLFWmonitor): PGLFWgammaramp; cdecl;
  external SGT_DLL name _PU + 'glfwGetGammaRamp';

procedure glfwSetGammaRamp(monitor: PGLFWmonitor; const ramp: PGLFWgammaramp); cdecl;
  external SGT_DLL name _PU + 'glfwSetGammaRamp';

procedure glfwDefaultWindowHints(); cdecl;
  external SGT_DLL name _PU + 'glfwDefaultWindowHints';

procedure glfwWindowHint(hint: Integer; value: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwWindowHint';

procedure glfwWindowHintString(hint: Integer; const value: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'glfwWindowHintString';

function glfwCreateWindow(width: Integer; height: Integer; const title: PUTF8Char; monitor: PGLFWmonitor; share: PGLFWwindow): PGLFWwindow; cdecl;
  external SGT_DLL name _PU + 'glfwCreateWindow';

procedure glfwDestroyWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwDestroyWindow';

function glfwWindowShouldClose(window: PGLFWwindow): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwWindowShouldClose';

procedure glfwSetWindowShouldClose(window: PGLFWwindow; value: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowShouldClose';

function glfwGetWindowTitle(window: PGLFWwindow): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowTitle';

procedure glfwSetWindowTitle(window: PGLFWwindow; const title: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowTitle';

procedure glfwSetWindowIcon(window: PGLFWwindow; count: Integer; const images: PGLFWimage); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowIcon';

procedure glfwGetWindowPos(window: PGLFWwindow; xpos: PInteger; ypos: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowPos';

procedure glfwSetWindowPos(window: PGLFWwindow; xpos: Integer; ypos: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowPos';

procedure glfwGetWindowSize(window: PGLFWwindow; width: PInteger; height: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowSize';

procedure glfwSetWindowSizeLimits(window: PGLFWwindow; minwidth: Integer; minheight: Integer; maxwidth: Integer; maxheight: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowSizeLimits';

procedure glfwSetWindowAspectRatio(window: PGLFWwindow; numer: Integer; denom: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowAspectRatio';

procedure glfwSetWindowSize(window: PGLFWwindow; width: Integer; height: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowSize';

procedure glfwGetFramebufferSize(window: PGLFWwindow; width: PInteger; height: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetFramebufferSize';

procedure glfwGetWindowFrameSize(window: PGLFWwindow; left: PInteger; top: PInteger; right: PInteger; bottom: PInteger); cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowFrameSize';

procedure glfwGetWindowContentScale(window: PGLFWwindow; xscale: PSingle; yscale: PSingle); cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowContentScale';

function glfwGetWindowOpacity(window: PGLFWwindow): Single; cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowOpacity';

procedure glfwSetWindowOpacity(window: PGLFWwindow; opacity: Single); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowOpacity';

procedure glfwIconifyWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwIconifyWindow';

procedure glfwRestoreWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwRestoreWindow';

procedure glfwMaximizeWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwMaximizeWindow';

procedure glfwShowWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwShowWindow';

procedure glfwHideWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwHideWindow';

procedure glfwFocusWindow(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwFocusWindow';

procedure glfwRequestWindowAttention(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwRequestWindowAttention';

function glfwGetWindowMonitor(window: PGLFWwindow): PGLFWmonitor; cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowMonitor';

procedure glfwSetWindowMonitor(window: PGLFWwindow; monitor: PGLFWmonitor; xpos: Integer; ypos: Integer; width: Integer; height: Integer; refreshRate: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowMonitor';

function glfwGetWindowAttrib(window: PGLFWwindow; attrib: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowAttrib';

procedure glfwSetWindowAttrib(window: PGLFWwindow; attrib: Integer; value: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowAttrib';

procedure glfwSetWindowUserPointer(window: PGLFWwindow; pointer: Pointer); cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowUserPointer';

function glfwGetWindowUserPointer(window: PGLFWwindow): Pointer; cdecl;
  external SGT_DLL name _PU + 'glfwGetWindowUserPointer';

function glfwSetWindowPosCallback(window: PGLFWwindow; callback: GLFWwindowposfun): GLFWwindowposfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowPosCallback';

function glfwSetWindowSizeCallback(window: PGLFWwindow; callback: GLFWwindowsizefun): GLFWwindowsizefun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowSizeCallback';

function glfwSetWindowCloseCallback(window: PGLFWwindow; callback: GLFWwindowclosefun): GLFWwindowclosefun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowCloseCallback';

function glfwSetWindowRefreshCallback(window: PGLFWwindow; callback: GLFWwindowrefreshfun): GLFWwindowrefreshfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowRefreshCallback';

function glfwSetWindowFocusCallback(window: PGLFWwindow; callback: GLFWwindowfocusfun): GLFWwindowfocusfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowFocusCallback';

function glfwSetWindowIconifyCallback(window: PGLFWwindow; callback: GLFWwindowiconifyfun): GLFWwindowiconifyfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowIconifyCallback';

function glfwSetWindowMaximizeCallback(window: PGLFWwindow; callback: GLFWwindowmaximizefun): GLFWwindowmaximizefun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowMaximizeCallback';

function glfwSetFramebufferSizeCallback(window: PGLFWwindow; callback: GLFWframebuffersizefun): GLFWframebuffersizefun; cdecl;
  external SGT_DLL name _PU + 'glfwSetFramebufferSizeCallback';

function glfwSetWindowContentScaleCallback(window: PGLFWwindow; callback: GLFWwindowcontentscalefun): GLFWwindowcontentscalefun; cdecl;
  external SGT_DLL name _PU + 'glfwSetWindowContentScaleCallback';

procedure glfwPollEvents(); cdecl;
  external SGT_DLL name _PU + 'glfwPollEvents';

procedure glfwWaitEvents(); cdecl;
  external SGT_DLL name _PU + 'glfwWaitEvents';

procedure glfwWaitEventsTimeout(timeout: Double); cdecl;
  external SGT_DLL name _PU + 'glfwWaitEventsTimeout';

procedure glfwPostEmptyEvent(); cdecl;
  external SGT_DLL name _PU + 'glfwPostEmptyEvent';

function glfwGetInputMode(window: PGLFWwindow; mode: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetInputMode';

procedure glfwSetInputMode(window: PGLFWwindow; mode: Integer; value: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSetInputMode';

function glfwRawMouseMotionSupported(): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwRawMouseMotionSupported';

function glfwGetKeyName(key: Integer; scancode: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetKeyName';

function glfwGetKeyScancode(key: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetKeyScancode';

function glfwGetKey(window: PGLFWwindow; key: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetKey';

function glfwGetMouseButton(window: PGLFWwindow; button: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetMouseButton';

procedure glfwGetCursorPos(window: PGLFWwindow; xpos: PDouble; ypos: PDouble); cdecl;
  external SGT_DLL name _PU + 'glfwGetCursorPos';

procedure glfwSetCursorPos(window: PGLFWwindow; xpos: Double; ypos: Double); cdecl;
  external SGT_DLL name _PU + 'glfwSetCursorPos';

function glfwCreateCursor(const image: PGLFWimage; xhot: Integer; yhot: Integer): PGLFWcursor; cdecl;
  external SGT_DLL name _PU + 'glfwCreateCursor';

function glfwCreateStandardCursor(shape: Integer): PGLFWcursor; cdecl;
  external SGT_DLL name _PU + 'glfwCreateStandardCursor';

procedure glfwDestroyCursor(cursor: PGLFWcursor); cdecl;
  external SGT_DLL name _PU + 'glfwDestroyCursor';

procedure glfwSetCursor(window: PGLFWwindow; cursor: PGLFWcursor); cdecl;
  external SGT_DLL name _PU + 'glfwSetCursor';

function glfwSetKeyCallback(window: PGLFWwindow; callback: GLFWkeyfun): GLFWkeyfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetKeyCallback';

function glfwSetCharCallback(window: PGLFWwindow; callback: GLFWcharfun): GLFWcharfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetCharCallback';

function glfwSetCharModsCallback(window: PGLFWwindow; callback: GLFWcharmodsfun): GLFWcharmodsfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetCharModsCallback';

function glfwSetMouseButtonCallback(window: PGLFWwindow; callback: GLFWmousebuttonfun): GLFWmousebuttonfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetMouseButtonCallback';

function glfwSetCursorPosCallback(window: PGLFWwindow; callback: GLFWcursorposfun): GLFWcursorposfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetCursorPosCallback';

function glfwSetCursorEnterCallback(window: PGLFWwindow; callback: GLFWcursorenterfun): GLFWcursorenterfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetCursorEnterCallback';

function glfwSetScrollCallback(window: PGLFWwindow; callback: GLFWscrollfun): GLFWscrollfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetScrollCallback';

function glfwSetDropCallback(window: PGLFWwindow; callback: GLFWdropfun): GLFWdropfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetDropCallback';

function glfwJoystickPresent(jid: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwJoystickPresent';

function glfwGetJoystickAxes(jid: Integer; count: PInteger): PSingle; cdecl;
  external SGT_DLL name _PU + 'glfwGetJoystickAxes';

function glfwGetJoystickButtons(jid: Integer; count: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'glfwGetJoystickButtons';

function glfwGetJoystickHats(jid: Integer; count: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'glfwGetJoystickHats';

function glfwGetJoystickName(jid: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetJoystickName';

function glfwGetJoystickGUID(jid: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetJoystickGUID';

procedure glfwSetJoystickUserPointer(jid: Integer; pointer: Pointer); cdecl;
  external SGT_DLL name _PU + 'glfwSetJoystickUserPointer';

function glfwGetJoystickUserPointer(jid: Integer): Pointer; cdecl;
  external SGT_DLL name _PU + 'glfwGetJoystickUserPointer';

function glfwJoystickIsGamepad(jid: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwJoystickIsGamepad';

function glfwSetJoystickCallback(callback: GLFWjoystickfun): GLFWjoystickfun; cdecl;
  external SGT_DLL name _PU + 'glfwSetJoystickCallback';

function glfwUpdateGamepadMappings(const &string: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwUpdateGamepadMappings';

function glfwGetGamepadName(jid: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetGamepadName';

function glfwGetGamepadState(jid: Integer; state: PGLFWgamepadstate): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwGetGamepadState';

procedure glfwSetClipboardString(window: PGLFWwindow; const &string: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'glfwSetClipboardString';

function glfwGetClipboardString(window: PGLFWwindow): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetClipboardString';

function glfwGetTime(): Double; cdecl;
  external SGT_DLL name _PU + 'glfwGetTime';

procedure glfwSetTime(time: Double); cdecl;
  external SGT_DLL name _PU + 'glfwSetTime';

function glfwGetTimerValue(): UInt64; cdecl;
  external SGT_DLL name _PU + 'glfwGetTimerValue';

function glfwGetTimerFrequency(): UInt64; cdecl;
  external SGT_DLL name _PU + 'glfwGetTimerFrequency';

procedure glfwMakeContextCurrent(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwMakeContextCurrent';

function glfwGetCurrentContext(): PGLFWwindow; cdecl;
  external SGT_DLL name _PU + 'glfwGetCurrentContext';

procedure glfwSwapBuffers(window: PGLFWwindow); cdecl;
  external SGT_DLL name _PU + 'glfwSwapBuffers';

procedure glfwSwapInterval(interval: Integer); cdecl;
  external SGT_DLL name _PU + 'glfwSwapInterval';

function glfwExtensionSupported(const extension: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwExtensionSupported';

function glfwGetProcAddress(const procname: PUTF8Char): GLFWglproc; cdecl;
  external SGT_DLL name _PU + 'glfwGetProcAddress';

function glfwVulkanSupported(): Integer; cdecl;
  external SGT_DLL name _PU + 'glfwVulkanSupported';

function glfwGetRequiredInstanceExtensions(count: PUInt32): PPUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetRequiredInstanceExtensions';

function enet_malloc(p1: NativeUInt): Pointer; cdecl;
  external SGT_DLL name _PU + 'enet_malloc';

procedure enet_free(p1: Pointer); cdecl;
  external SGT_DLL name _PU + 'enet_free';

function enet_packet_create(const p1: Pointer; p2: NativeUInt; p3: enet_uint32): PENetPacket; cdecl;
  external SGT_DLL name _PU + 'enet_packet_create';

function enet_packet_resize(p1: PENetPacket; p2: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_packet_resize';

function enet_packet_copy(p1: PENetPacket): PENetPacket; cdecl;
  external SGT_DLL name _PU + 'enet_packet_copy';

procedure enet_packet_destroy(p1: PENetPacket); cdecl;
  external SGT_DLL name _PU + 'enet_packet_destroy';

function enet_list_insert(p1: ENetListIterator; p2: Pointer): ENetListIterator; cdecl;
  external SGT_DLL name _PU + 'enet_list_insert';

function enet_list_move(p1: ENetListIterator; p2: Pointer; p3: Pointer): ENetListIterator; cdecl;
  external SGT_DLL name _PU + 'enet_list_move';

function enet_list_remove(p1: ENetListIterator): Pointer; cdecl;
  external SGT_DLL name _PU + 'enet_list_remove';

procedure enet_list_clear(p1: PENetList); cdecl;
  external SGT_DLL name _PU + 'enet_list_clear';

function enet_list_size(p1: PENetList): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'enet_list_size';

function enet_initialize(): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_initialize';

function enet_initialize_with_callbacks(version: ENetVersion; const inits: PENetCallbacks): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_initialize_with_callbacks';

procedure enet_deinitialize(); cdecl;
  external SGT_DLL name _PU + 'enet_deinitialize';

function enet_linked_version(): ENetVersion; cdecl;
  external SGT_DLL name _PU + 'enet_linked_version';

function enet_time_get(): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_time_get';

function enet_socket_create(p1: ENetSocketType): ENetSocket; cdecl;
  external SGT_DLL name _PU + 'enet_socket_create';

function enet_socket_bind(p1: ENetSocket; const p2: PENetAddress): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_bind';

function enet_socket_get_address(p1: ENetSocket; p2: PENetAddress): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_get_address';

function enet_socket_listen(p1: ENetSocket; p2: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_listen';

function enet_socket_accept(p1: ENetSocket; p2: PENetAddress): ENetSocket; cdecl;
  external SGT_DLL name _PU + 'enet_socket_accept';

function enet_socket_connect(p1: ENetSocket; const p2: PENetAddress): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_connect';

function enet_socket_send(p1: ENetSocket; const p2: PENetAddress; const p3: PENetBuffer; p4: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_send';

function enet_socket_receive(p1: ENetSocket; p2: PENetAddress; p3: PENetBuffer; p4: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_receive';

function enet_socket_wait(p1: ENetSocket; p2: Penet_uint32; p3: enet_uint64): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_wait';

function enet_socket_set_option(p1: ENetSocket; p2: ENetSocketOption; p3: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_set_option';

function enet_socket_get_option(p1: ENetSocket; p2: ENetSocketOption; p3: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_get_option';

function enet_socket_shutdown(p1: ENetSocket; p2: ENetSocketShutdown): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socket_shutdown';

procedure enet_socket_destroy(p1: ENetSocket); cdecl;
  external SGT_DLL name _PU + 'enet_socket_destroy';

function enet_socketset_select(p1: ENetSocket; p2: PENetSocketSet; p3: PENetSocketSet; p4: enet_uint32): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_socketset_select';

function enet_address_set_host_ip_old(address: PENetAddress; const hostName: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_set_host_ip_old';

function enet_address_set_host_old(address: PENetAddress; const hostName: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_set_host_old';

function enet_address_get_host_ip_old(const address: PENetAddress; hostName: PUTF8Char; nameLength: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_get_host_ip_old';

function enet_address_get_host_old(const address: PENetAddress; hostName: PUTF8Char; nameLength: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_get_host_old';

function enet_address_set_host_ip_new(address: PENetAddress; const hostName: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_set_host_ip_new';

function enet_address_set_host_new(address: PENetAddress; const hostName: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_set_host_new';

function enet_address_get_host_ip_new(const address: PENetAddress; hostName: PUTF8Char; nameLength: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_get_host_ip_new';

function enet_address_get_host_new(const address: PENetAddress; hostName: PUTF8Char; nameLength: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_address_get_host_new';

function enet_host_get_peers_count(p1: PENetHost): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_peers_count';

function enet_host_get_packets_sent(p1: PENetHost): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_packets_sent';

function enet_host_get_packets_received(p1: PENetHost): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_packets_received';

function enet_host_get_bytes_sent(p1: PENetHost): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_bytes_sent';

function enet_host_get_bytes_received(p1: PENetHost): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_bytes_received';

function enet_host_get_received_data(p1: PENetHost; data: PPenet_uint8): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_received_data';

function enet_host_get_mtu(p1: PENetHost): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_host_get_mtu';

function enet_peer_get_id(p1: PENetPeer): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_id';

function enet_peer_get_ip(p1: PENetPeer; ip: PUTF8Char; ipLength: NativeUInt): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_ip';

function enet_peer_get_port(p1: PENetPeer): enet_uint16; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_port';

function enet_peer_get_rtt(p1: PENetPeer): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_rtt';

function enet_peer_get_packets_sent(p1: PENetPeer): enet_uint64; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_packets_sent';

function enet_peer_get_packets_lost(p1: PENetPeer): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_packets_lost';

function enet_peer_get_bytes_sent(p1: PENetPeer): enet_uint64; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_bytes_sent';

function enet_peer_get_bytes_received(p1: PENetPeer): enet_uint64; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_bytes_received';

function enet_peer_get_state(p1: PENetPeer): ENetPeerState; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_state';

function enet_peer_get_data(p1: PENetPeer): Pointer; cdecl;
  external SGT_DLL name _PU + 'enet_peer_get_data';

procedure enet_peer_set_data(p1: PENetPeer; const p2: Pointer); cdecl;
  external SGT_DLL name _PU + 'enet_peer_set_data';

function enet_packet_get_data(p1: PENetPacket): Pointer; cdecl;
  external SGT_DLL name _PU + 'enet_packet_get_data';

function enet_packet_get_length(p1: PENetPacket): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_packet_get_length';

procedure enet_packet_set_free_callback(p1: PENetPacket; p2: Pointer); cdecl;
  external SGT_DLL name _PU + 'enet_packet_set_free_callback';

function enet_packet_create_offset(const p1: Pointer; p2: NativeUInt; p3: NativeUInt; p4: enet_uint32): PENetPacket; cdecl;
  external SGT_DLL name _PU + 'enet_packet_create_offset';

function enet_crc32(const p1: PENetBuffer; p2: NativeUInt): enet_uint32; cdecl;
  external SGT_DLL name _PU + 'enet_crc32';

function enet_host_create(const p1: PENetAddress; p2: NativeUInt; p3: NativeUInt; p4: enet_uint32; p5: enet_uint32): PENetHost; cdecl;
  external SGT_DLL name _PU + 'enet_host_create';

procedure enet_host_destroy(p1: PENetHost); cdecl;
  external SGT_DLL name _PU + 'enet_host_destroy';

function enet_host_connect(p1: PENetHost; const p2: PENetAddress; p3: NativeUInt; p4: enet_uint32): PENetPeer; cdecl;
  external SGT_DLL name _PU + 'enet_host_connect';

function enet_host_check_events(p1: PENetHost; p2: PENetEvent): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_host_check_events';

function enet_host_service(p1: PENetHost; p2: PENetEvent; p3: enet_uint32): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_host_service';

function enet_host_send_raw(p1: PENetHost; const p2: PENetAddress; p3: Penet_uint8; p4: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_host_send_raw';

function enet_host_send_raw_ex(host: PENetHost; const address: PENetAddress; data: Penet_uint8; skipBytes: NativeUInt; bytesToSend: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_host_send_raw_ex';

procedure enet_host_set_intercept(p1: PENetHost; const p2: ENetInterceptCallback); cdecl;
  external SGT_DLL name _PU + 'enet_host_set_intercept';

procedure enet_host_flush(p1: PENetHost); cdecl;
  external SGT_DLL name _PU + 'enet_host_flush';

procedure enet_host_broadcast(p1: PENetHost; p2: enet_uint8; p3: PENetPacket); cdecl;
  external SGT_DLL name _PU + 'enet_host_broadcast';

procedure enet_host_compress(p1: PENetHost; const p2: PENetCompressor); cdecl;
  external SGT_DLL name _PU + 'enet_host_compress';

procedure enet_host_channel_limit(p1: PENetHost; p2: NativeUInt); cdecl;
  external SGT_DLL name _PU + 'enet_host_channel_limit';

procedure enet_host_bandwidth_limit(p1: PENetHost; p2: enet_uint32; p3: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_host_bandwidth_limit';

procedure enet_host_bandwidth_throttle(p1: PENetHost); cdecl;
  external SGT_DLL name _PU + 'enet_host_bandwidth_throttle';

function enet_host_random_seed(): enet_uint64; cdecl;
  external SGT_DLL name _PU + 'enet_host_random_seed';

function enet_peer_send(p1: PENetPeer; p2: enet_uint8; p3: PENetPacket): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_peer_send';

function enet_peer_receive(p1: PENetPeer; channelID: Penet_uint8): PENetPacket; cdecl;
  external SGT_DLL name _PU + 'enet_peer_receive';

procedure enet_peer_ping(p1: PENetPeer); cdecl;
  external SGT_DLL name _PU + 'enet_peer_ping';

procedure enet_peer_ping_interval(p1: PENetPeer; p2: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_peer_ping_interval';

procedure enet_peer_timeout(p1: PENetPeer; p2: enet_uint32; p3: enet_uint32; p4: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_peer_timeout';

procedure enet_peer_reset(p1: PENetPeer); cdecl;
  external SGT_DLL name _PU + 'enet_peer_reset';

procedure enet_peer_disconnect(p1: PENetPeer; p2: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_peer_disconnect';

procedure enet_peer_disconnect_now(p1: PENetPeer; p2: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_peer_disconnect_now';

procedure enet_peer_disconnect_later(p1: PENetPeer; p2: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_peer_disconnect_later';

procedure enet_peer_throttle_configure(p1: PENetPeer; p2: enet_uint32; p3: enet_uint32; p4: enet_uint32); cdecl;
  external SGT_DLL name _PU + 'enet_peer_throttle_configure';

function enet_peer_throttle(p1: PENetPeer; p2: enet_uint32): Integer; cdecl;
  external SGT_DLL name _PU + 'enet_peer_throttle';

procedure enet_peer_reset_queues(p1: PENetPeer); cdecl;
  external SGT_DLL name _PU + 'enet_peer_reset_queues';

procedure enet_peer_setup_outgoing_command(p1: PENetPeer; p2: PENetOutgoingCommand); cdecl;
  external SGT_DLL name _PU + 'enet_peer_setup_outgoing_command';

function enet_peer_queue_outgoing_command(p1: PENetPeer; const p2: PENetProtocol; p3: PENetPacket; p4: enet_uint32; p5: enet_uint16): PENetOutgoingCommand; cdecl;
  external SGT_DLL name _PU + 'enet_peer_queue_outgoing_command';

function enet_peer_queue_incoming_command(p1: PENetPeer; const p2: PENetProtocol; const p3: Pointer; p4: NativeUInt; p5: enet_uint32; p6: enet_uint32): PENetIncomingCommand; cdecl;
  external SGT_DLL name _PU + 'enet_peer_queue_incoming_command';

function enet_peer_queue_acknowledgement(p1: PENetPeer; const p2: PENetProtocol; p3: enet_uint16): PENetAcknowledgement; cdecl;
  external SGT_DLL name _PU + 'enet_peer_queue_acknowledgement';

procedure enet_peer_dispatch_incoming_unreliable_commands(p1: PENetPeer; p2: PENetChannel); cdecl;
  external SGT_DLL name _PU + 'enet_peer_dispatch_incoming_unreliable_commands';

procedure enet_peer_dispatch_incoming_reliable_commands(p1: PENetPeer; p2: PENetChannel); cdecl;
  external SGT_DLL name _PU + 'enet_peer_dispatch_incoming_reliable_commands';

procedure enet_peer_on_connect(p1: PENetPeer); cdecl;
  external SGT_DLL name _PU + 'enet_peer_on_connect';

procedure enet_peer_on_disconnect(p1: PENetPeer); cdecl;
  external SGT_DLL name _PU + 'enet_peer_on_disconnect';

function enet_protocol_command_size(p1: enet_uint8): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'enet_protocol_command_size';

function glfwGetWin32Adapter(monitor: PGLFWmonitor): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetWin32Adapter';

function glfwGetWin32Monitor(monitor: PGLFWmonitor): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'glfwGetWin32Monitor';

function glfwGetWin32Window(window: PGLFWwindow): HWND; cdecl;
  external SGT_DLL name _PU + 'glfwGetWin32Window';

function crc32(crc: uLong; const buf: PBytef; len: uInt): uLong; cdecl;
  external SGT_DLL name _PU + 'crc32';

function unzOpen64(const path: Pointer): unzFile; cdecl;
  external SGT_DLL name _PU + 'unzOpen64';

function unzLocateFile(&file: unzFile; const szFileName: PUTF8Char; iCaseSensitivity: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'unzLocateFile';

function unzClose(&file: unzFile): Integer; cdecl;
  external SGT_DLL name _PU + 'unzClose';

function unzOpenCurrentFilePassword(&file: unzFile; const password: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'unzOpenCurrentFilePassword';

function unzGetCurrentFileInfo64(&file: unzFile; pfile_info: Punz_file_info64; szFileName: PUTF8Char; fileNameBufferSize: uLong; extraField: Pointer; extraFieldBufferSize: uLong; szComment: PUTF8Char; commentBufferSize: uLong): Integer; cdecl;
  external SGT_DLL name _PU + 'unzGetCurrentFileInfo64';

function unzReadCurrentFile(&file: unzFile; buf: voidp; len: Cardinal): Integer; cdecl;
  external SGT_DLL name _PU + 'unzReadCurrentFile';

function unzCloseCurrentFile(&file: unzFile): Integer; cdecl;
  external SGT_DLL name _PU + 'unzCloseCurrentFile';

function unztell64(&file: unzFile): UInt64; cdecl;
  external SGT_DLL name _PU + 'unztell64';

function zipOpen64(const pathname: Pointer; append: Integer): zipFile; cdecl;
  external SGT_DLL name _PU + 'zipOpen64';

function zipOpenNewFileInZip3_64(&file: zipFile; const filename: PUTF8Char; const zipfi: Pzip_fileinfo; const extrafield_local: Pointer; size_extrafield_local: uInt; const extrafield_global: Pointer; size_extrafield_global: uInt; const comment: PUTF8Char; method: Integer; level: Integer; raw: Integer; windowBits: Integer; memLevel: Integer; strategy: Integer; const password: PUTF8Char; crcForCrypting: uLong; zip64: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'zipOpenNewFileInZip3_64';

function zipWriteInFileInZip(&file: zipFile; const buf: Pointer; len: Cardinal): Integer; cdecl;
  external SGT_DLL name _PU + 'zipWriteInFileInZip';

function zipCloseFileInZip(&file: zipFile): Integer; cdecl;
  external SGT_DLL name _PU + 'zipCloseFileInZip';

function zipClose(&file: zipFile; const global_comment: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'zipClose';

function stbi_load_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl;
  external SGT_DLL name _PU + 'stbi_load_from_memory';

function stbi_load_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl;
  external SGT_DLL name _PU + 'stbi_load_from_callbacks';

function stbi_load(const filename: PUTF8Char; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl;
  external SGT_DLL name _PU + 'stbi_load';

function stbi_load_from_file(f: PPointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_uc; cdecl;
  external SGT_DLL name _PU + 'stbi_load_from_file';

function stbi_load_gif_from_memory(const buffer: Pstbi_uc; len: Integer; delays: PPInteger; x: PInteger; y: PInteger; z: PInteger; comp: PInteger; req_comp: Integer): Pstbi_uc; cdecl;
  external SGT_DLL name _PU + 'stbi_load_gif_from_memory';

function stbi_load_16_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl;
  external SGT_DLL name _PU + 'stbi_load_16_from_memory';

function stbi_load_16_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl;
  external SGT_DLL name _PU + 'stbi_load_16_from_callbacks';

function stbi_load_16(const filename: PUTF8Char; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl;
  external SGT_DLL name _PU + 'stbi_load_16';

function stbi_load_from_file_16(f: PPointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): Pstbi_us; cdecl;
  external SGT_DLL name _PU + 'stbi_load_from_file_16';

function stbi_loadf_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl;
  external SGT_DLL name _PU + 'stbi_loadf_from_memory';

function stbi_loadf_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl;
  external SGT_DLL name _PU + 'stbi_loadf_from_callbacks';

function stbi_loadf(const filename: PUTF8Char; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl;
  external SGT_DLL name _PU + 'stbi_loadf';

function stbi_loadf_from_file(f: PPointer; x: PInteger; y: PInteger; channels_in_file: PInteger; desired_channels: Integer): PSingle; cdecl;
  external SGT_DLL name _PU + 'stbi_loadf_from_file';

procedure stbi_hdr_to_ldr_gamma(gamma: Single); cdecl;
  external SGT_DLL name _PU + 'stbi_hdr_to_ldr_gamma';

procedure stbi_hdr_to_ldr_scale(scale: Single); cdecl;
  external SGT_DLL name _PU + 'stbi_hdr_to_ldr_scale';

procedure stbi_ldr_to_hdr_gamma(gamma: Single); cdecl;
  external SGT_DLL name _PU + 'stbi_ldr_to_hdr_gamma';

procedure stbi_ldr_to_hdr_scale(scale: Single); cdecl;
  external SGT_DLL name _PU + 'stbi_ldr_to_hdr_scale';

function stbi_is_hdr_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_hdr_from_callbacks';

function stbi_is_hdr_from_memory(const buffer: Pstbi_uc; len: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_hdr_from_memory';

function stbi_is_hdr(const filename: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_hdr';

function stbi_is_hdr_from_file(f: PPointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_hdr_from_file';

function stbi_failure_reason(): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'stbi_failure_reason';

procedure stbi_image_free(retval_from_stbi_load: Pointer); cdecl;
  external SGT_DLL name _PU + 'stbi_image_free';

function stbi_info_from_memory(const buffer: Pstbi_uc; len: Integer; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_info_from_memory';

function stbi_info_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_info_from_callbacks';

function stbi_is_16_bit_from_memory(const buffer: Pstbi_uc; len: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_16_bit_from_memory';

function stbi_is_16_bit_from_callbacks(const clbk: Pstbi_io_callbacks; user: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_16_bit_from_callbacks';

function stbi_info(const filename: PUTF8Char; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_info';

function stbi_info_from_file(f: PPointer; x: PInteger; y: PInteger; comp: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_info_from_file';

function stbi_is_16_bit(const filename: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_16_bit';

function stbi_is_16_bit_from_file(f: PPointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_is_16_bit_from_file';

procedure stbi_set_unpremultiply_on_load(flag_true_if_should_unpremultiply: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_set_unpremultiply_on_load';

procedure stbi_convert_iphone_png_to_rgb(flag_true_if_should_convert: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_convert_iphone_png_to_rgb';

procedure stbi_set_flip_vertically_on_load(flag_true_if_should_flip: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_set_flip_vertically_on_load';

procedure stbi_set_unpremultiply_on_load_thread(flag_true_if_should_unpremultiply: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_set_unpremultiply_on_load_thread';

procedure stbi_convert_iphone_png_to_rgb_thread(flag_true_if_should_convert: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_convert_iphone_png_to_rgb_thread';

procedure stbi_set_flip_vertically_on_load_thread(flag_true_if_should_flip: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_set_flip_vertically_on_load_thread';

function stbi_zlib_decode_malloc_guesssize(const buffer: PUTF8Char; len: Integer; initial_size: Integer; outlen: PInteger): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'stbi_zlib_decode_malloc_guesssize';

function stbi_zlib_decode_malloc_guesssize_headerflag(const buffer: PUTF8Char; len: Integer; initial_size: Integer; outlen: PInteger; parse_header: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'stbi_zlib_decode_malloc_guesssize_headerflag';

function stbi_zlib_decode_malloc(const buffer: PUTF8Char; len: Integer; outlen: PInteger): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'stbi_zlib_decode_malloc';

function stbi_zlib_decode_buffer(obuffer: PUTF8Char; olen: Integer; const ibuffer: PUTF8Char; ilen: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_zlib_decode_buffer';

function stbi_zlib_decode_noheader_malloc(const buffer: PUTF8Char; len: Integer; outlen: PInteger): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'stbi_zlib_decode_noheader_malloc';

function stbi_zlib_decode_noheader_buffer(obuffer: PUTF8Char; olen: Integer; const ibuffer: PUTF8Char; ilen: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_zlib_decode_noheader_buffer';

function stbi_write_png(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: Pointer; stride_in_bytes: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_png';

function stbi_write_bmp(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_bmp';

function stbi_write_tga(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_tga';

function stbi_write_hdr(const filename: PUTF8Char; w: Integer; h: Integer; comp: Integer; const data: PSingle): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_hdr';

function stbi_write_jpg(const filename: PUTF8Char; x: Integer; y: Integer; comp: Integer; const data: Pointer; quality: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_jpg';

function stbi_write_png_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: Pointer; stride_in_bytes: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_png_to_func';

function stbi_write_bmp_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_bmp_to_func';

function stbi_write_tga_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_tga_to_func';

function stbi_write_hdr_to_func(func: Pstbi_write_func; context: Pointer; w: Integer; h: Integer; comp: Integer; const data: PSingle): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_hdr_to_func';

function stbi_write_jpg_to_func(func: Pstbi_write_func; context: Pointer; x: Integer; y: Integer; comp: Integer; const data: Pointer; quality: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbi_write_jpg_to_func';

procedure stbi_flip_vertically_on_write(flip_boolean: Integer); cdecl;
  external SGT_DLL name _PU + 'stbi_flip_vertically_on_write';

function stbrp_pack_rects(context: Pstbrp_context; rects: Pstbrp_rect; num_rects: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbrp_pack_rects';

procedure stbrp_init_target(context: Pstbrp_context; width: Integer; height: Integer; nodes: Pstbrp_node; num_nodes: Integer); cdecl;
  external SGT_DLL name _PU + 'stbrp_init_target';

procedure stbrp_setup_allow_out_of_mem(context: Pstbrp_context; allow_out_of_mem: Integer); cdecl;
  external SGT_DLL name _PU + 'stbrp_setup_allow_out_of_mem';

procedure stbrp_setup_heuristic(context: Pstbrp_context; heuristic: Integer); cdecl;
  external SGT_DLL name _PU + 'stbrp_setup_heuristic';

function stbtt_BakeFontBitmap(const data: PByte; offset: Integer; pixel_height: Single; pixels: PByte; pw: Integer; ph: Integer; first_char: Integer; num_chars: Integer; chardata: Pstbtt_bakedchar): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_BakeFontBitmap';

procedure stbtt_GetBakedQuad(const chardata: Pstbtt_bakedchar; pw: Integer; ph: Integer; char_index: Integer; xpos: PSingle; ypos: PSingle; q: Pstbtt_aligned_quad; opengl_fillrule: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetBakedQuad';

procedure stbtt_GetScaledFontVMetrics(const fontdata: PByte; index: Integer; size: Single; ascent: PSingle; descent: PSingle; lineGap: PSingle); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetScaledFontVMetrics';

function stbtt_PackBegin(spc: Pstbtt_pack_context; pixels: PByte; width: Integer; height: Integer; stride_in_bytes: Integer; padding: Integer; alloc_context: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_PackBegin';

procedure stbtt_PackEnd(spc: Pstbtt_pack_context); cdecl;
  external SGT_DLL name _PU + 'stbtt_PackEnd';

function stbtt_PackFontRange(spc: Pstbtt_pack_context; const fontdata: PByte; font_index: Integer; font_size: Single; first_unicode_char_in_range: Integer; num_chars_in_range: Integer; chardata_for_range: Pstbtt_packedchar): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_PackFontRange';

function stbtt_PackFontRanges(spc: Pstbtt_pack_context; const fontdata: PByte; font_index: Integer; ranges: Pstbtt_pack_range; num_ranges: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_PackFontRanges';

procedure stbtt_PackSetOversampling(spc: Pstbtt_pack_context; h_oversample: Cardinal; v_oversample: Cardinal); cdecl;
  external SGT_DLL name _PU + 'stbtt_PackSetOversampling';

procedure stbtt_PackSetSkipMissingCodepoints(spc: Pstbtt_pack_context; skip: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_PackSetSkipMissingCodepoints';

procedure stbtt_GetPackedQuad(const chardata: Pstbtt_packedchar; pw: Integer; ph: Integer; char_index: Integer; xpos: PSingle; ypos: PSingle; q: Pstbtt_aligned_quad; align_to_integer: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetPackedQuad';

function stbtt_PackFontRangesGatherRects(spc: Pstbtt_pack_context; const info: Pstbtt_fontinfo; ranges: Pstbtt_pack_range; num_ranges: Integer; rects: Pstbrp_rect): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_PackFontRangesGatherRects';

procedure stbtt_PackFontRangesPackRects(spc: Pstbtt_pack_context; rects: Pstbrp_rect; num_rects: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_PackFontRangesPackRects';

function stbtt_PackFontRangesRenderIntoRects(spc: Pstbtt_pack_context; const info: Pstbtt_fontinfo; ranges: Pstbtt_pack_range; num_ranges: Integer; rects: Pstbrp_rect): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_PackFontRangesRenderIntoRects';

function stbtt_GetNumberOfFonts(const data: PByte): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetNumberOfFonts';

function stbtt_GetFontOffsetForIndex(const data: PByte; index: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetFontOffsetForIndex';

function stbtt_InitFont(info: Pstbtt_fontinfo; const data: PByte; offset: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_InitFont';

function stbtt_FindGlyphIndex(const info: Pstbtt_fontinfo; unicode_codepoint: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_FindGlyphIndex';

function stbtt_ScaleForPixelHeight(const info: Pstbtt_fontinfo; pixels: Single): Single; cdecl;
  external SGT_DLL name _PU + 'stbtt_ScaleForPixelHeight';

function stbtt_ScaleForMappingEmToPixels(const info: Pstbtt_fontinfo; pixels: Single): Single; cdecl;
  external SGT_DLL name _PU + 'stbtt_ScaleForMappingEmToPixels';

procedure stbtt_GetFontVMetrics(const info: Pstbtt_fontinfo; ascent: PInteger; descent: PInteger; lineGap: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetFontVMetrics';

function stbtt_GetFontVMetricsOS2(const info: Pstbtt_fontinfo; typoAscent: PInteger; typoDescent: PInteger; typoLineGap: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetFontVMetricsOS2';

procedure stbtt_GetFontBoundingBox(const info: Pstbtt_fontinfo; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetFontBoundingBox';

procedure stbtt_GetCodepointHMetrics(const info: Pstbtt_fontinfo; codepoint: Integer; advanceWidth: PInteger; leftSideBearing: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointHMetrics';

function stbtt_GetCodepointKernAdvance(const info: Pstbtt_fontinfo; ch1: Integer; ch2: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointKernAdvance';

function stbtt_GetCodepointBox(const info: Pstbtt_fontinfo; codepoint: Integer; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointBox';

procedure stbtt_GetGlyphHMetrics(const info: Pstbtt_fontinfo; glyph_index: Integer; advanceWidth: PInteger; leftSideBearing: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphHMetrics';

function stbtt_GetGlyphKernAdvance(const info: Pstbtt_fontinfo; glyph1: Integer; glyph2: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphKernAdvance';

function stbtt_GetGlyphBox(const info: Pstbtt_fontinfo; glyph_index: Integer; x0: PInteger; y0: PInteger; x1: PInteger; y1: PInteger): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphBox';

function stbtt_GetKerningTableLength(const info: Pstbtt_fontinfo): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetKerningTableLength';

function stbtt_GetKerningTable(const info: Pstbtt_fontinfo; table: Pstbtt_kerningentry; table_length: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetKerningTable';

function stbtt_IsGlyphEmpty(const info: Pstbtt_fontinfo; glyph_index: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_IsGlyphEmpty';

function stbtt_GetCodepointShape(const info: Pstbtt_fontinfo; unicode_codepoint: Integer; vertices: PPstbtt_vertex): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointShape';

function stbtt_GetGlyphShape(const info: Pstbtt_fontinfo; glyph_index: Integer; vertices: PPstbtt_vertex): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphShape';

procedure stbtt_FreeShape(const info: Pstbtt_fontinfo; vertices: Pstbtt_vertex); cdecl;
  external SGT_DLL name _PU + 'stbtt_FreeShape';

function stbtt_FindSVGDoc(const info: Pstbtt_fontinfo; gl: Integer): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_FindSVGDoc';

function stbtt_GetCodepointSVG(const info: Pstbtt_fontinfo; unicode_codepoint: Integer; svg: PPUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointSVG';

function stbtt_GetGlyphSVG(const info: Pstbtt_fontinfo; gl: Integer; svg: PPUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphSVG';

procedure stbtt_FreeBitmap(bitmap: PByte; userdata: Pointer); cdecl;
  external SGT_DLL name _PU + 'stbtt_FreeBitmap';

function stbtt_GetCodepointBitmap(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; codepoint: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointBitmap';

function stbtt_GetCodepointBitmapSubpixel(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; codepoint: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointBitmapSubpixel';

procedure stbtt_MakeCodepointBitmap(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; codepoint: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_MakeCodepointBitmap';

procedure stbtt_MakeCodepointBitmapSubpixel(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; codepoint: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_MakeCodepointBitmapSubpixel';

procedure stbtt_MakeCodepointBitmapSubpixelPrefilter(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; oversample_x: Integer; oversample_y: Integer; sub_x: PSingle; sub_y: PSingle; codepoint: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_MakeCodepointBitmapSubpixelPrefilter';

procedure stbtt_GetCodepointBitmapBox(const font: Pstbtt_fontinfo; codepoint: Integer; scale_x: Single; scale_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointBitmapBox';

procedure stbtt_GetCodepointBitmapBoxSubpixel(const font: Pstbtt_fontinfo; codepoint: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointBitmapBoxSubpixel';

function stbtt_GetGlyphBitmap(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; glyph: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphBitmap';

function stbtt_GetGlyphBitmapSubpixel(const info: Pstbtt_fontinfo; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; glyph: Integer; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphBitmapSubpixel';

procedure stbtt_MakeGlyphBitmap(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; glyph: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_MakeGlyphBitmap';

procedure stbtt_MakeGlyphBitmapSubpixel(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; glyph: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_MakeGlyphBitmapSubpixel';

procedure stbtt_MakeGlyphBitmapSubpixelPrefilter(const info: Pstbtt_fontinfo; output: PByte; out_w: Integer; out_h: Integer; out_stride: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; oversample_x: Integer; oversample_y: Integer; sub_x: PSingle; sub_y: PSingle; glyph: Integer); cdecl;
  external SGT_DLL name _PU + 'stbtt_MakeGlyphBitmapSubpixelPrefilter';

procedure stbtt_GetGlyphBitmapBox(const font: Pstbtt_fontinfo; glyph: Integer; scale_x: Single; scale_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphBitmapBox';

procedure stbtt_GetGlyphBitmapBoxSubpixel(const font: Pstbtt_fontinfo; glyph: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; ix0: PInteger; iy0: PInteger; ix1: PInteger; iy1: PInteger); cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphBitmapBoxSubpixel';

procedure stbtt_Rasterize(result: Pstbtt__bitmap; flatness_in_pixels: Single; vertices: Pstbtt_vertex; num_verts: Integer; scale_x: Single; scale_y: Single; shift_x: Single; shift_y: Single; x_off: Integer; y_off: Integer; invert: Integer; userdata: Pointer); cdecl;
  external SGT_DLL name _PU + 'stbtt_Rasterize';

procedure stbtt_FreeSDF(bitmap: PByte; userdata: Pointer); cdecl;
  external SGT_DLL name _PU + 'stbtt_FreeSDF';

function stbtt_GetGlyphSDF(const info: Pstbtt_fontinfo; scale: Single; glyph: Integer; padding: Integer; onedge_value: Byte; pixel_dist_scale: Single; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetGlyphSDF';

function stbtt_GetCodepointSDF(const info: Pstbtt_fontinfo; scale: Single; codepoint: Integer; padding: Integer; onedge_value: Byte; pixel_dist_scale: Single; width: PInteger; height: PInteger; xoff: PInteger; yoff: PInteger): PByte; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetCodepointSDF';

function stbtt_FindMatchingFont(const fontdata: PByte; const name: PUTF8Char; flags: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_FindMatchingFont';

function stbtt_CompareUTF8toUTF16_bigendian(const s1: PUTF8Char; len1: Integer; const s2: PUTF8Char; len2: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'stbtt_CompareUTF8toUTF16_bigendian';

function stbtt_GetFontNameString(const font: Pstbtt_fontinfo; length: PInteger; platformID: Integer; encodingID: Integer; languageID: Integer; nameID: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'stbtt_GetFontNameString';

function plm_create_with_filename(const filename: PUTF8Char): Pplm_t; cdecl;
  external SGT_DLL name _PU + 'plm_create_with_filename';

function plm_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_t; cdecl;
  external SGT_DLL name _PU + 'plm_create_with_file';

function plm_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_t; cdecl;
  external SGT_DLL name _PU + 'plm_create_with_memory';

function plm_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_t; cdecl;
  external SGT_DLL name _PU + 'plm_create_with_buffer';

procedure plm_destroy(self: Pplm_t); cdecl;
  external SGT_DLL name _PU + 'plm_destroy';

function plm_has_headers(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_has_headers';

function plm_probe(self: Pplm_t; probesize: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_probe';

function plm_get_video_enabled(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_video_enabled';

procedure plm_set_video_enabled(self: Pplm_t; enabled: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_set_video_enabled';

function plm_get_num_video_streams(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_num_video_streams';

function plm_get_width(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_width';

function plm_get_height(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_height';

function plm_get_framerate(self: Pplm_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_get_framerate';

function plm_get_audio_enabled(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_audio_enabled';

procedure plm_set_audio_enabled(self: Pplm_t; enabled: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_set_audio_enabled';

function plm_get_num_audio_streams(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_num_audio_streams';

procedure plm_set_audio_stream(self: Pplm_t; stream_index: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_set_audio_stream';

function plm_get_samplerate(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_samplerate';

function plm_get_audio_lead_time(self: Pplm_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_get_audio_lead_time';

procedure plm_set_audio_lead_time(self: Pplm_t; lead_time: Double); cdecl;
  external SGT_DLL name _PU + 'plm_set_audio_lead_time';

function plm_get_time(self: Pplm_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_get_time';

function plm_get_duration(self: Pplm_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_get_duration';

procedure plm_rewind(self: Pplm_t); cdecl;
  external SGT_DLL name _PU + 'plm_rewind';

function plm_get_loop(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_get_loop';

procedure plm_set_loop(self: Pplm_t; loop: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_set_loop';

function plm_has_ended(self: Pplm_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_has_ended';

procedure plm_set_video_decode_callback(self: Pplm_t; fp: plm_video_decode_callback; user: Pointer); cdecl;
  external SGT_DLL name _PU + 'plm_set_video_decode_callback';

procedure plm_set_audio_decode_callback(self: Pplm_t; fp: plm_audio_decode_callback; user: Pointer); cdecl;
  external SGT_DLL name _PU + 'plm_set_audio_decode_callback';

procedure plm_decode(self: Pplm_t; seconds: Double); cdecl;
  external SGT_DLL name _PU + 'plm_decode';

function plm_decode_video(self: Pplm_t): Pplm_frame_t; cdecl;
  external SGT_DLL name _PU + 'plm_decode_video';

function plm_decode_audio(self: Pplm_t): Pplm_samples_t; cdecl;
  external SGT_DLL name _PU + 'plm_decode_audio';

function plm_seek(self: Pplm_t; time: Double; seek_exact: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_seek';

function plm_seek_frame(self: Pplm_t; time: Double; seek_exact: Integer): Pplm_frame_t; cdecl;
  external SGT_DLL name _PU + 'plm_seek_frame';

function plm_buffer_create_with_filename(const filename: PUTF8Char): Pplm_buffer_t; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_create_with_filename';

function plm_buffer_create_with_file(fh: PPointer; close_when_done: Integer): Pplm_buffer_t; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_create_with_file';

function plm_buffer_create_with_memory(bytes: PUInt8; length: NativeUInt; free_when_done: Integer): Pplm_buffer_t; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_create_with_memory';

function plm_buffer_create_with_capacity(capacity: NativeUInt): Pplm_buffer_t; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_create_with_capacity';

function plm_buffer_create_for_appending(initial_capacity: NativeUInt): Pplm_buffer_t; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_create_for_appending';

procedure plm_buffer_destroy(self: Pplm_buffer_t); cdecl;
  external SGT_DLL name _PU + 'plm_buffer_destroy';

function plm_buffer_write(self: Pplm_buffer_t; bytes: PUInt8; length: NativeUInt): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_write';

procedure plm_buffer_signal_end(self: Pplm_buffer_t); cdecl;
  external SGT_DLL name _PU + 'plm_buffer_signal_end';

procedure plm_buffer_set_load_callback(self: Pplm_buffer_t; fp: plm_buffer_load_callback; user: Pointer); cdecl;
  external SGT_DLL name _PU + 'plm_buffer_set_load_callback';

procedure plm_buffer_rewind(self: Pplm_buffer_t); cdecl;
  external SGT_DLL name _PU + 'plm_buffer_rewind';

function plm_buffer_get_size(self: Pplm_buffer_t): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_get_size';

function plm_buffer_get_remaining(self: Pplm_buffer_t): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_get_remaining';

function plm_buffer_has_ended(self: Pplm_buffer_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_buffer_has_ended';

function plm_demux_create(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_demux_t; cdecl;
  external SGT_DLL name _PU + 'plm_demux_create';

procedure plm_demux_destroy(self: Pplm_demux_t); cdecl;
  external SGT_DLL name _PU + 'plm_demux_destroy';

function plm_demux_has_headers(self: Pplm_demux_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_demux_has_headers';

function plm_demux_probe(self: Pplm_demux_t; probesize: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_demux_probe';

function plm_demux_get_num_video_streams(self: Pplm_demux_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_demux_get_num_video_streams';

function plm_demux_get_num_audio_streams(self: Pplm_demux_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_demux_get_num_audio_streams';

procedure plm_demux_rewind(self: Pplm_demux_t); cdecl;
  external SGT_DLL name _PU + 'plm_demux_rewind';

function plm_demux_has_ended(self: Pplm_demux_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_demux_has_ended';

function plm_demux_seek(self: Pplm_demux_t; time: Double; &type: Integer; force_intra: Integer): Pplm_packet_t; cdecl;
  external SGT_DLL name _PU + 'plm_demux_seek';

function plm_demux_get_start_time(self: Pplm_demux_t; &type: Integer): Double; cdecl;
  external SGT_DLL name _PU + 'plm_demux_get_start_time';

function plm_demux_get_duration(self: Pplm_demux_t; &type: Integer): Double; cdecl;
  external SGT_DLL name _PU + 'plm_demux_get_duration';

function plm_demux_decode(self: Pplm_demux_t): Pplm_packet_t; cdecl;
  external SGT_DLL name _PU + 'plm_demux_decode';

function plm_video_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_video_t; cdecl;
  external SGT_DLL name _PU + 'plm_video_create_with_buffer';

procedure plm_video_destroy(self: Pplm_video_t); cdecl;
  external SGT_DLL name _PU + 'plm_video_destroy';

function plm_video_has_header(self: Pplm_video_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_video_has_header';

function plm_video_get_framerate(self: Pplm_video_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_video_get_framerate';

function plm_video_get_width(self: Pplm_video_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_video_get_width';

function plm_video_get_height(self: Pplm_video_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_video_get_height';

procedure plm_video_set_no_delay(self: Pplm_video_t; no_delay: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_video_set_no_delay';

function plm_video_get_time(self: Pplm_video_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_video_get_time';

procedure plm_video_set_time(self: Pplm_video_t; time: Double); cdecl;
  external SGT_DLL name _PU + 'plm_video_set_time';

procedure plm_video_rewind(self: Pplm_video_t); cdecl;
  external SGT_DLL name _PU + 'plm_video_rewind';

function plm_video_has_ended(self: Pplm_video_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_video_has_ended';

function plm_video_decode(self: Pplm_video_t): Pplm_frame_t; cdecl;
  external SGT_DLL name _PU + 'plm_video_decode';

procedure plm_frame_to_rgb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_frame_to_rgb';

procedure plm_frame_to_bgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_frame_to_bgr';

procedure plm_frame_to_rgba(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_frame_to_rgba';

procedure plm_frame_to_bgra(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_frame_to_bgra';

procedure plm_frame_to_argb(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_frame_to_argb';

procedure plm_frame_to_abgr(frame: Pplm_frame_t; dest: PUInt8; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'plm_frame_to_abgr';

function plm_audio_create_with_buffer(buffer: Pplm_buffer_t; destroy_when_done: Integer): Pplm_audio_t; cdecl;
  external SGT_DLL name _PU + 'plm_audio_create_with_buffer';

procedure plm_audio_destroy(self: Pplm_audio_t); cdecl;
  external SGT_DLL name _PU + 'plm_audio_destroy';

function plm_audio_has_header(self: Pplm_audio_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_audio_has_header';

function plm_audio_get_samplerate(self: Pplm_audio_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_audio_get_samplerate';

function plm_audio_get_time(self: Pplm_audio_t): Double; cdecl;
  external SGT_DLL name _PU + 'plm_audio_get_time';

procedure plm_audio_set_time(self: Pplm_audio_t; time: Double); cdecl;
  external SGT_DLL name _PU + 'plm_audio_set_time';

procedure plm_audio_rewind(self: Pplm_audio_t); cdecl;
  external SGT_DLL name _PU + 'plm_audio_rewind';

function plm_audio_has_ended(self: Pplm_audio_t): Integer; cdecl;
  external SGT_DLL name _PU + 'plm_audio_has_ended';

function plm_audio_decode(self: Pplm_audio_t): Pplm_samples_t; cdecl;
  external SGT_DLL name _PU + 'plm_audio_decode';

procedure ma_version(pMajor: Pma_uint32; pMinor: Pma_uint32; pRevision: Pma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_version';

function ma_version_string(): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ma_version_string';

function ma_log_callback_init(onLog: ma_log_callback_proc; pUserData: Pointer): ma_log_callback; cdecl;
  external SGT_DLL name _PU + 'ma_log_callback_init';

function ma_log_init(const pAllocationCallbacks: Pma_allocation_callbacks; pLog: Pma_log): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_log_init';

procedure ma_log_uninit(pLog: Pma_log); cdecl;
  external SGT_DLL name _PU + 'ma_log_uninit';

function ma_log_register_callback(pLog: Pma_log; callback: ma_log_callback): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_log_register_callback';

function ma_log_unregister_callback(pLog: Pma_log; callback: ma_log_callback): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_log_unregister_callback';

function ma_log_post(pLog: Pma_log; level: ma_uint32; const pMessage: PUTF8Char): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_log_post';

function ma_log_postv(pLog: Pma_log; level: ma_uint32; const pFormat: PUTF8Char; args: Pointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_log_postv';

function ma_log_postf(pLog: Pma_log; level: ma_uint32; const pFormat: PUTF8Char): ma_result varargs; cdecl;
  external SGT_DLL name _PU + 'ma_log_postf';

function ma_biquad_config_init(format: ma_format; channels: ma_uint32; b0: Double; b1: Double; b2: Double; a0: Double; a1: Double; a2: Double): ma_biquad_config; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_config_init';

function ma_biquad_get_heap_size(const pConfig: Pma_biquad_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_get_heap_size';

function ma_biquad_init_preallocated(const pConfig: Pma_biquad_config; pHeap: Pointer; pBQ: Pma_biquad): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_init_preallocated';

function ma_biquad_init(const pConfig: Pma_biquad_config; const pAllocationCallbacks: Pma_allocation_callbacks; pBQ: Pma_biquad): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_init';

procedure ma_biquad_uninit(pBQ: Pma_biquad; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_biquad_uninit';

function ma_biquad_reinit(const pConfig: Pma_biquad_config; pBQ: Pma_biquad): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_reinit';

function ma_biquad_clear_cache(pBQ: Pma_biquad): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_clear_cache';

function ma_biquad_process_pcm_frames(pBQ: Pma_biquad; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_process_pcm_frames';

function ma_biquad_get_latency(const pBQ: Pma_biquad): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_get_latency';

function ma_lpf1_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double): ma_lpf1_config; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_config_init';

function ma_lpf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; q: Double): ma_lpf2_config; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_config_init';

function ma_lpf1_get_heap_size(const pConfig: Pma_lpf1_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_get_heap_size';

function ma_lpf1_init_preallocated(const pConfig: Pma_lpf1_config; pHeap: Pointer; pLPF: Pma_lpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_init_preallocated';

function ma_lpf1_init(const pConfig: Pma_lpf1_config; const pAllocationCallbacks: Pma_allocation_callbacks; pLPF: Pma_lpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_init';

procedure ma_lpf1_uninit(pLPF: Pma_lpf1; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_uninit';

function ma_lpf1_reinit(const pConfig: Pma_lpf1_config; pLPF: Pma_lpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_reinit';

function ma_lpf1_clear_cache(pLPF: Pma_lpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_clear_cache';

function ma_lpf1_process_pcm_frames(pLPF: Pma_lpf1; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_process_pcm_frames';

function ma_lpf1_get_latency(const pLPF: Pma_lpf1): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_lpf1_get_latency';

function ma_lpf2_get_heap_size(const pConfig: Pma_lpf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_get_heap_size';

function ma_lpf2_init_preallocated(const pConfig: Pma_lpf2_config; pHeap: Pointer; pHPF: Pma_lpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_init_preallocated';

function ma_lpf2_init(const pConfig: Pma_lpf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pLPF: Pma_lpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_init';

procedure ma_lpf2_uninit(pLPF: Pma_lpf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_uninit';

function ma_lpf2_reinit(const pConfig: Pma_lpf2_config; pLPF: Pma_lpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_reinit';

function ma_lpf2_clear_cache(pLPF: Pma_lpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_clear_cache';

function ma_lpf2_process_pcm_frames(pLPF: Pma_lpf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_process_pcm_frames';

function ma_lpf2_get_latency(const pLPF: Pma_lpf2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_lpf2_get_latency';

function ma_lpf_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_lpf_config; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_config_init';

function ma_lpf_get_heap_size(const pConfig: Pma_lpf_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_get_heap_size';

function ma_lpf_init_preallocated(const pConfig: Pma_lpf_config; pHeap: Pointer; pLPF: Pma_lpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_init_preallocated';

function ma_lpf_init(const pConfig: Pma_lpf_config; const pAllocationCallbacks: Pma_allocation_callbacks; pLPF: Pma_lpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_init';

procedure ma_lpf_uninit(pLPF: Pma_lpf; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_lpf_uninit';

function ma_lpf_reinit(const pConfig: Pma_lpf_config; pLPF: Pma_lpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_reinit';

function ma_lpf_clear_cache(pLPF: Pma_lpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_clear_cache';

function ma_lpf_process_pcm_frames(pLPF: Pma_lpf; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_process_pcm_frames';

function ma_lpf_get_latency(const pLPF: Pma_lpf): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_get_latency';

function ma_hpf1_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double): ma_hpf1_config; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_config_init';

function ma_hpf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; q: Double): ma_hpf2_config; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_config_init';

function ma_hpf1_get_heap_size(const pConfig: Pma_hpf1_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_get_heap_size';

function ma_hpf1_init_preallocated(const pConfig: Pma_hpf1_config; pHeap: Pointer; pLPF: Pma_hpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_init_preallocated';

function ma_hpf1_init(const pConfig: Pma_hpf1_config; const pAllocationCallbacks: Pma_allocation_callbacks; pHPF: Pma_hpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_init';

procedure ma_hpf1_uninit(pHPF: Pma_hpf1; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_uninit';

function ma_hpf1_reinit(const pConfig: Pma_hpf1_config; pHPF: Pma_hpf1): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_reinit';

function ma_hpf1_process_pcm_frames(pHPF: Pma_hpf1; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_process_pcm_frames';

function ma_hpf1_get_latency(const pHPF: Pma_hpf1): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_hpf1_get_latency';

function ma_hpf2_get_heap_size(const pConfig: Pma_hpf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_get_heap_size';

function ma_hpf2_init_preallocated(const pConfig: Pma_hpf2_config; pHeap: Pointer; pHPF: Pma_hpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_init_preallocated';

function ma_hpf2_init(const pConfig: Pma_hpf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pHPF: Pma_hpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_init';

procedure ma_hpf2_uninit(pHPF: Pma_hpf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_uninit';

function ma_hpf2_reinit(const pConfig: Pma_hpf2_config; pHPF: Pma_hpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_reinit';

function ma_hpf2_process_pcm_frames(pHPF: Pma_hpf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_process_pcm_frames';

function ma_hpf2_get_latency(const pHPF: Pma_hpf2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_hpf2_get_latency';

function ma_hpf_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_hpf_config; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_config_init';

function ma_hpf_get_heap_size(const pConfig: Pma_hpf_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_get_heap_size';

function ma_hpf_init_preallocated(const pConfig: Pma_hpf_config; pHeap: Pointer; pLPF: Pma_hpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_init_preallocated';

function ma_hpf_init(const pConfig: Pma_hpf_config; const pAllocationCallbacks: Pma_allocation_callbacks; pHPF: Pma_hpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_init';

procedure ma_hpf_uninit(pHPF: Pma_hpf; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_hpf_uninit';

function ma_hpf_reinit(const pConfig: Pma_hpf_config; pHPF: Pma_hpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_reinit';

function ma_hpf_process_pcm_frames(pHPF: Pma_hpf; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_process_pcm_frames';

function ma_hpf_get_latency(const pHPF: Pma_hpf): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_get_latency';

function ma_bpf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; q: Double): ma_bpf2_config; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_config_init';

function ma_bpf2_get_heap_size(const pConfig: Pma_bpf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_get_heap_size';

function ma_bpf2_init_preallocated(const pConfig: Pma_bpf2_config; pHeap: Pointer; pBPF: Pma_bpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_init_preallocated';

function ma_bpf2_init(const pConfig: Pma_bpf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pBPF: Pma_bpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_init';

procedure ma_bpf2_uninit(pBPF: Pma_bpf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_uninit';

function ma_bpf2_reinit(const pConfig: Pma_bpf2_config; pBPF: Pma_bpf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_reinit';

function ma_bpf2_process_pcm_frames(pBPF: Pma_bpf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_process_pcm_frames';

function ma_bpf2_get_latency(const pBPF: Pma_bpf2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_bpf2_get_latency';

function ma_bpf_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_bpf_config; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_config_init';

function ma_bpf_get_heap_size(const pConfig: Pma_bpf_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_get_heap_size';

function ma_bpf_init_preallocated(const pConfig: Pma_bpf_config; pHeap: Pointer; pBPF: Pma_bpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_init_preallocated';

function ma_bpf_init(const pConfig: Pma_bpf_config; const pAllocationCallbacks: Pma_allocation_callbacks; pBPF: Pma_bpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_init';

procedure ma_bpf_uninit(pBPF: Pma_bpf; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_bpf_uninit';

function ma_bpf_reinit(const pConfig: Pma_bpf_config; pBPF: Pma_bpf): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_reinit';

function ma_bpf_process_pcm_frames(pBPF: Pma_bpf; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_process_pcm_frames';

function ma_bpf_get_latency(const pBPF: Pma_bpf): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_get_latency';

function ma_notch2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; q: Double; frequency: Double): ma_notch2_config; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_config_init';

function ma_notch2_get_heap_size(const pConfig: Pma_notch2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_get_heap_size';

function ma_notch2_init_preallocated(const pConfig: Pma_notch2_config; pHeap: Pointer; pFilter: Pma_notch2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_init_preallocated';

function ma_notch2_init(const pConfig: Pma_notch2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_notch2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_init';

procedure ma_notch2_uninit(pFilter: Pma_notch2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_notch2_uninit';

function ma_notch2_reinit(const pConfig: Pma_notch2_config; pFilter: Pma_notch2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_reinit';

function ma_notch2_process_pcm_frames(pFilter: Pma_notch2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_process_pcm_frames';

function ma_notch2_get_latency(const pFilter: Pma_notch2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_notch2_get_latency';

function ma_peak2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_peak2_config; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_config_init';

function ma_peak2_get_heap_size(const pConfig: Pma_peak2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_get_heap_size';

function ma_peak2_init_preallocated(const pConfig: Pma_peak2_config; pHeap: Pointer; pFilter: Pma_peak2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_init_preallocated';

function ma_peak2_init(const pConfig: Pma_peak2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_peak2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_init';

procedure ma_peak2_uninit(pFilter: Pma_peak2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_peak2_uninit';

function ma_peak2_reinit(const pConfig: Pma_peak2_config; pFilter: Pma_peak2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_reinit';

function ma_peak2_process_pcm_frames(pFilter: Pma_peak2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_process_pcm_frames';

function ma_peak2_get_latency(const pFilter: Pma_peak2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_peak2_get_latency';

function ma_loshelf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; shelfSlope: Double; frequency: Double): ma_loshelf2_config; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_config_init';

function ma_loshelf2_get_heap_size(const pConfig: Pma_loshelf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_get_heap_size';

function ma_loshelf2_init_preallocated(const pConfig: Pma_loshelf2_config; pHeap: Pointer; pFilter: Pma_loshelf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_init_preallocated';

function ma_loshelf2_init(const pConfig: Pma_loshelf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_loshelf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_init';

procedure ma_loshelf2_uninit(pFilter: Pma_loshelf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_uninit';

function ma_loshelf2_reinit(const pConfig: Pma_loshelf2_config; pFilter: Pma_loshelf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_reinit';

function ma_loshelf2_process_pcm_frames(pFilter: Pma_loshelf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_process_pcm_frames';

function ma_loshelf2_get_latency(const pFilter: Pma_loshelf2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf2_get_latency';

function ma_hishelf2_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; shelfSlope: Double; frequency: Double): ma_hishelf2_config; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_config_init';

function ma_hishelf2_get_heap_size(const pConfig: Pma_hishelf2_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_get_heap_size';

function ma_hishelf2_init_preallocated(const pConfig: Pma_hishelf2_config; pHeap: Pointer; pFilter: Pma_hishelf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_init_preallocated';

function ma_hishelf2_init(const pConfig: Pma_hishelf2_config; const pAllocationCallbacks: Pma_allocation_callbacks; pFilter: Pma_hishelf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_init';

procedure ma_hishelf2_uninit(pFilter: Pma_hishelf2; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_uninit';

function ma_hishelf2_reinit(const pConfig: Pma_hishelf2_config; pFilter: Pma_hishelf2): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_reinit';

function ma_hishelf2_process_pcm_frames(pFilter: Pma_hishelf2; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_process_pcm_frames';

function ma_hishelf2_get_latency(const pFilter: Pma_hishelf2): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf2_get_latency';

function ma_delay_config_init(channels: ma_uint32; sampleRate: ma_uint32; delayInFrames: ma_uint32; decay: Single): ma_delay_config; cdecl;
  external SGT_DLL name _PU + 'ma_delay_config_init';

function ma_delay_init(const pConfig: Pma_delay_config; const pAllocationCallbacks: Pma_allocation_callbacks; pDelay: Pma_delay): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_delay_init';

procedure ma_delay_uninit(pDelay: Pma_delay; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_delay_uninit';

function ma_delay_process_pcm_frames(pDelay: Pma_delay; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_delay_process_pcm_frames';

procedure ma_delay_set_wet(pDelay: Pma_delay; value: Single); cdecl;
  external SGT_DLL name _PU + 'ma_delay_set_wet';

function ma_delay_get_wet(const pDelay: Pma_delay): Single; cdecl;
  external SGT_DLL name _PU + 'ma_delay_get_wet';

procedure ma_delay_set_dry(pDelay: Pma_delay; value: Single); cdecl;
  external SGT_DLL name _PU + 'ma_delay_set_dry';

function ma_delay_get_dry(const pDelay: Pma_delay): Single; cdecl;
  external SGT_DLL name _PU + 'ma_delay_get_dry';

procedure ma_delay_set_decay(pDelay: Pma_delay; value: Single); cdecl;
  external SGT_DLL name _PU + 'ma_delay_set_decay';

function ma_delay_get_decay(const pDelay: Pma_delay): Single; cdecl;
  external SGT_DLL name _PU + 'ma_delay_get_decay';

function ma_gainer_config_init(channels: ma_uint32; smoothTimeInFrames: ma_uint32): ma_gainer_config; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_config_init';

function ma_gainer_get_heap_size(const pConfig: Pma_gainer_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_get_heap_size';

function ma_gainer_init_preallocated(const pConfig: Pma_gainer_config; pHeap: Pointer; pGainer: Pma_gainer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_init_preallocated';

function ma_gainer_init(const pConfig: Pma_gainer_config; const pAllocationCallbacks: Pma_allocation_callbacks; pGainer: Pma_gainer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_init';

procedure ma_gainer_uninit(pGainer: Pma_gainer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_gainer_uninit';

function ma_gainer_process_pcm_frames(pGainer: Pma_gainer; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_process_pcm_frames';

function ma_gainer_set_gain(pGainer: Pma_gainer; newGain: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_set_gain';

function ma_gainer_set_gains(pGainer: Pma_gainer; pNewGains: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_set_gains';

function ma_gainer_set_master_volume(pGainer: Pma_gainer; volume: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_set_master_volume';

function ma_gainer_get_master_volume(const pGainer: Pma_gainer; pVolume: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_gainer_get_master_volume';

function ma_panner_config_init(format: ma_format; channels: ma_uint32): ma_panner_config; cdecl;
  external SGT_DLL name _PU + 'ma_panner_config_init';

function ma_panner_init(const pConfig: Pma_panner_config; pPanner: Pma_panner): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_panner_init';

function ma_panner_process_pcm_frames(pPanner: Pma_panner; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_panner_process_pcm_frames';

procedure ma_panner_set_mode(pPanner: Pma_panner; mode: ma_pan_mode); cdecl;
  external SGT_DLL name _PU + 'ma_panner_set_mode';

function ma_panner_get_mode(const pPanner: Pma_panner): ma_pan_mode; cdecl;
  external SGT_DLL name _PU + 'ma_panner_get_mode';

procedure ma_panner_set_pan(pPanner: Pma_panner; pan: Single); cdecl;
  external SGT_DLL name _PU + 'ma_panner_set_pan';

function ma_panner_get_pan(const pPanner: Pma_panner): Single; cdecl;
  external SGT_DLL name _PU + 'ma_panner_get_pan';

function ma_fader_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_fader_config; cdecl;
  external SGT_DLL name _PU + 'ma_fader_config_init';

function ma_fader_init(const pConfig: Pma_fader_config; pFader: Pma_fader): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_fader_init';

function ma_fader_process_pcm_frames(pFader: Pma_fader; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_fader_process_pcm_frames';

procedure ma_fader_get_data_format(const pFader: Pma_fader; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_fader_get_data_format';

procedure ma_fader_set_fade(pFader: Pma_fader; volumeBeg: Single; volumeEnd: Single; lengthInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_fader_set_fade';

procedure ma_fader_set_fade_ex(pFader: Pma_fader; volumeBeg: Single; volumeEnd: Single; lengthInFrames: ma_uint64; startOffsetInFrames: ma_int64); cdecl;
  external SGT_DLL name _PU + 'ma_fader_set_fade_ex';

function ma_fader_get_current_volume(const pFader: Pma_fader): Single; cdecl;
  external SGT_DLL name _PU + 'ma_fader_get_current_volume';

function ma_spatializer_listener_config_init(channelsOut: ma_uint32): ma_spatializer_listener_config; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_config_init';

function ma_spatializer_listener_get_heap_size(const pConfig: Pma_spatializer_listener_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_heap_size';

function ma_spatializer_listener_init_preallocated(const pConfig: Pma_spatializer_listener_config; pHeap: Pointer; pListener: Pma_spatializer_listener): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_init_preallocated';

function ma_spatializer_listener_init(const pConfig: Pma_spatializer_listener_config; const pAllocationCallbacks: Pma_allocation_callbacks; pListener: Pma_spatializer_listener): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_init';

procedure ma_spatializer_listener_uninit(pListener: Pma_spatializer_listener; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_uninit';

function ma_spatializer_listener_get_channel_map(pListener: Pma_spatializer_listener): Pma_channel; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_channel_map';

procedure ma_spatializer_listener_set_cone(pListener: Pma_spatializer_listener; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_cone';

procedure ma_spatializer_listener_get_cone(const pListener: Pma_spatializer_listener; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_cone';

procedure ma_spatializer_listener_set_position(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_position';

function ma_spatializer_listener_get_position(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_position';

procedure ma_spatializer_listener_set_direction(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_direction';

function ma_spatializer_listener_get_direction(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_direction';

procedure ma_spatializer_listener_set_velocity(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_velocity';

function ma_spatializer_listener_get_velocity(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_velocity';

procedure ma_spatializer_listener_set_speed_of_sound(pListener: Pma_spatializer_listener; speedOfSound: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_speed_of_sound';

function ma_spatializer_listener_get_speed_of_sound(const pListener: Pma_spatializer_listener): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_speed_of_sound';

procedure ma_spatializer_listener_set_world_up(pListener: Pma_spatializer_listener; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_world_up';

function ma_spatializer_listener_get_world_up(const pListener: Pma_spatializer_listener): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_get_world_up';

procedure ma_spatializer_listener_set_enabled(pListener: Pma_spatializer_listener; isEnabled: ma_bool32); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_set_enabled';

function ma_spatializer_listener_is_enabled(const pListener: Pma_spatializer_listener): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_listener_is_enabled';

function ma_spatializer_config_init(channelsIn: ma_uint32; channelsOut: ma_uint32): ma_spatializer_config; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_config_init';

function ma_spatializer_get_heap_size(const pConfig: Pma_spatializer_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_heap_size';

function ma_spatializer_init_preallocated(const pConfig: Pma_spatializer_config; pHeap: Pointer; pSpatializer: Pma_spatializer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_init_preallocated';

function ma_spatializer_init(const pConfig: Pma_spatializer_config; const pAllocationCallbacks: Pma_allocation_callbacks; pSpatializer: Pma_spatializer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_init';

procedure ma_spatializer_uninit(pSpatializer: Pma_spatializer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_uninit';

function ma_spatializer_process_pcm_frames(pSpatializer: Pma_spatializer; pListener: Pma_spatializer_listener; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_process_pcm_frames';

function ma_spatializer_set_master_volume(pSpatializer: Pma_spatializer; volume: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_master_volume';

function ma_spatializer_get_master_volume(const pSpatializer: Pma_spatializer; pVolume: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_master_volume';

function ma_spatializer_get_input_channels(const pSpatializer: Pma_spatializer): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_input_channels';

function ma_spatializer_get_output_channels(const pSpatializer: Pma_spatializer): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_output_channels';

procedure ma_spatializer_set_attenuation_model(pSpatializer: Pma_spatializer; attenuationModel: ma_attenuation_model); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_attenuation_model';

function ma_spatializer_get_attenuation_model(const pSpatializer: Pma_spatializer): ma_attenuation_model; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_attenuation_model';

procedure ma_spatializer_set_positioning(pSpatializer: Pma_spatializer; positioning: ma_positioning); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_positioning';

function ma_spatializer_get_positioning(const pSpatializer: Pma_spatializer): ma_positioning; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_positioning';

procedure ma_spatializer_set_rolloff(pSpatializer: Pma_spatializer; rolloff: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_rolloff';

function ma_spatializer_get_rolloff(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_rolloff';

procedure ma_spatializer_set_min_gain(pSpatializer: Pma_spatializer; minGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_min_gain';

function ma_spatializer_get_min_gain(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_min_gain';

procedure ma_spatializer_set_max_gain(pSpatializer: Pma_spatializer; maxGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_max_gain';

function ma_spatializer_get_max_gain(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_max_gain';

procedure ma_spatializer_set_min_distance(pSpatializer: Pma_spatializer; minDistance: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_min_distance';

function ma_spatializer_get_min_distance(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_min_distance';

procedure ma_spatializer_set_max_distance(pSpatializer: Pma_spatializer; maxDistance: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_max_distance';

function ma_spatializer_get_max_distance(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_max_distance';

procedure ma_spatializer_set_cone(pSpatializer: Pma_spatializer; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_cone';

procedure ma_spatializer_get_cone(const pSpatializer: Pma_spatializer; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_cone';

procedure ma_spatializer_set_doppler_factor(pSpatializer: Pma_spatializer; dopplerFactor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_doppler_factor';

function ma_spatializer_get_doppler_factor(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_doppler_factor';

procedure ma_spatializer_set_directional_attenuation_factor(pSpatializer: Pma_spatializer; directionalAttenuationFactor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_directional_attenuation_factor';

function ma_spatializer_get_directional_attenuation_factor(const pSpatializer: Pma_spatializer): Single; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_directional_attenuation_factor';

procedure ma_spatializer_set_position(pSpatializer: Pma_spatializer; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_position';

function ma_spatializer_get_position(const pSpatializer: Pma_spatializer): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_position';

procedure ma_spatializer_set_direction(pSpatializer: Pma_spatializer; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_direction';

function ma_spatializer_get_direction(const pSpatializer: Pma_spatializer): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_direction';

procedure ma_spatializer_set_velocity(pSpatializer: Pma_spatializer; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_set_velocity';

function ma_spatializer_get_velocity(const pSpatializer: Pma_spatializer): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_velocity';

procedure ma_spatializer_get_relative_position_and_direction(const pSpatializer: Pma_spatializer; const pListener: Pma_spatializer_listener; pRelativePos: Pma_vec3f; pRelativeDir: Pma_vec3f); cdecl;
  external SGT_DLL name _PU + 'ma_spatializer_get_relative_position_and_direction';

function ma_linear_resampler_config_init(format: ma_format; channels: ma_uint32; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_linear_resampler_config; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_config_init';

function ma_linear_resampler_get_heap_size(const pConfig: Pma_linear_resampler_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_get_heap_size';

function ma_linear_resampler_init_preallocated(const pConfig: Pma_linear_resampler_config; pHeap: Pointer; pResampler: Pma_linear_resampler): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_init_preallocated';

function ma_linear_resampler_init(const pConfig: Pma_linear_resampler_config; const pAllocationCallbacks: Pma_allocation_callbacks; pResampler: Pma_linear_resampler): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_init';

procedure ma_linear_resampler_uninit(pResampler: Pma_linear_resampler; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_uninit';

function ma_linear_resampler_process_pcm_frames(pResampler: Pma_linear_resampler; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_process_pcm_frames';

function ma_linear_resampler_set_rate(pResampler: Pma_linear_resampler; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_set_rate';

function ma_linear_resampler_set_rate_ratio(pResampler: Pma_linear_resampler; ratioInOut: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_set_rate_ratio';

function ma_linear_resampler_get_input_latency(const pResampler: Pma_linear_resampler): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_get_input_latency';

function ma_linear_resampler_get_output_latency(const pResampler: Pma_linear_resampler): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_get_output_latency';

function ma_linear_resampler_get_required_input_frame_count(const pResampler: Pma_linear_resampler; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_get_required_input_frame_count';

function ma_linear_resampler_get_expected_output_frame_count(const pResampler: Pma_linear_resampler; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_get_expected_output_frame_count';

function ma_linear_resampler_reset(pResampler: Pma_linear_resampler): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_linear_resampler_reset';

function ma_resampler_config_init(format: ma_format; channels: ma_uint32; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32; algorithm: ma_resample_algorithm): ma_resampler_config; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_config_init';

function ma_resampler_get_heap_size(const pConfig: Pma_resampler_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_get_heap_size';

function ma_resampler_init_preallocated(const pConfig: Pma_resampler_config; pHeap: Pointer; pResampler: Pma_resampler): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_init_preallocated';

function ma_resampler_init(const pConfig: Pma_resampler_config; const pAllocationCallbacks: Pma_allocation_callbacks; pResampler: Pma_resampler): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_init';

procedure ma_resampler_uninit(pResampler: Pma_resampler; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_resampler_uninit';

function ma_resampler_process_pcm_frames(pResampler: Pma_resampler; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_process_pcm_frames';

function ma_resampler_set_rate(pResampler: Pma_resampler; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_set_rate';

function ma_resampler_set_rate_ratio(pResampler: Pma_resampler; ratio: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_set_rate_ratio';

function ma_resampler_get_input_latency(const pResampler: Pma_resampler): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_get_input_latency';

function ma_resampler_get_output_latency(const pResampler: Pma_resampler): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_get_output_latency';

function ma_resampler_get_required_input_frame_count(const pResampler: Pma_resampler; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_get_required_input_frame_count';

function ma_resampler_get_expected_output_frame_count(const pResampler: Pma_resampler; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_get_expected_output_frame_count';

function ma_resampler_reset(pResampler: Pma_resampler): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resampler_reset';

function ma_channel_converter_config_init(format: ma_format; channelsIn: ma_uint32; const pChannelMapIn: Pma_channel; channelsOut: ma_uint32; const pChannelMapOut: Pma_channel; mixingMode: ma_channel_mix_mode): ma_channel_converter_config; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_config_init';

function ma_channel_converter_get_heap_size(const pConfig: Pma_channel_converter_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_get_heap_size';

function ma_channel_converter_init_preallocated(const pConfig: Pma_channel_converter_config; pHeap: Pointer; pConverter: Pma_channel_converter): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_init_preallocated';

function ma_channel_converter_init(const pConfig: Pma_channel_converter_config; const pAllocationCallbacks: Pma_allocation_callbacks; pConverter: Pma_channel_converter): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_init';

procedure ma_channel_converter_uninit(pConverter: Pma_channel_converter; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_uninit';

function ma_channel_converter_process_pcm_frames(pConverter: Pma_channel_converter; pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_process_pcm_frames';

function ma_channel_converter_get_input_channel_map(const pConverter: Pma_channel_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_get_input_channel_map';

function ma_channel_converter_get_output_channel_map(const pConverter: Pma_channel_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_channel_converter_get_output_channel_map';

function ma_data_converter_config_init_default(): ma_data_converter_config; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_config_init_default';

function ma_data_converter_config_init(formatIn: ma_format; formatOut: ma_format; channelsIn: ma_uint32; channelsOut: ma_uint32; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_data_converter_config; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_config_init';

function ma_data_converter_get_heap_size(const pConfig: Pma_data_converter_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_heap_size';

function ma_data_converter_init_preallocated(const pConfig: Pma_data_converter_config; pHeap: Pointer; pConverter: Pma_data_converter): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_init_preallocated';

function ma_data_converter_init(const pConfig: Pma_data_converter_config; const pAllocationCallbacks: Pma_allocation_callbacks; pConverter: Pma_data_converter): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_init';

procedure ma_data_converter_uninit(pConverter: Pma_data_converter; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_uninit';

function ma_data_converter_process_pcm_frames(pConverter: Pma_data_converter; const pFramesIn: Pointer; pFrameCountIn: Pma_uint64; pFramesOut: Pointer; pFrameCountOut: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_process_pcm_frames';

function ma_data_converter_set_rate(pConverter: Pma_data_converter; sampleRateIn: ma_uint32; sampleRateOut: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_set_rate';

function ma_data_converter_set_rate_ratio(pConverter: Pma_data_converter; ratioInOut: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_set_rate_ratio';

function ma_data_converter_get_input_latency(const pConverter: Pma_data_converter): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_input_latency';

function ma_data_converter_get_output_latency(const pConverter: Pma_data_converter): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_output_latency';

function ma_data_converter_get_required_input_frame_count(const pConverter: Pma_data_converter; outputFrameCount: ma_uint64; pInputFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_required_input_frame_count';

function ma_data_converter_get_expected_output_frame_count(const pConverter: Pma_data_converter; inputFrameCount: ma_uint64; pOutputFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_expected_output_frame_count';

function ma_data_converter_get_input_channel_map(const pConverter: Pma_data_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_input_channel_map';

function ma_data_converter_get_output_channel_map(const pConverter: Pma_data_converter; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_get_output_channel_map';

function ma_data_converter_reset(pConverter: Pma_data_converter): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_converter_reset';

procedure ma_pcm_u8_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_u8_to_s16';

procedure ma_pcm_u8_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_u8_to_s24';

procedure ma_pcm_u8_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_u8_to_s32';

procedure ma_pcm_u8_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_u8_to_f32';

procedure ma_pcm_s16_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s16_to_u8';

procedure ma_pcm_s16_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s16_to_s24';

procedure ma_pcm_s16_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s16_to_s32';

procedure ma_pcm_s16_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s16_to_f32';

procedure ma_pcm_s24_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s24_to_u8';

procedure ma_pcm_s24_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s24_to_s16';

procedure ma_pcm_s24_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s24_to_s32';

procedure ma_pcm_s24_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s24_to_f32';

procedure ma_pcm_s32_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s32_to_u8';

procedure ma_pcm_s32_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s32_to_s16';

procedure ma_pcm_s32_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s32_to_s24';

procedure ma_pcm_s32_to_f32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_s32_to_f32';

procedure ma_pcm_f32_to_u8(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_f32_to_u8';

procedure ma_pcm_f32_to_s16(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_f32_to_s16';

procedure ma_pcm_f32_to_s24(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_f32_to_s24';

procedure ma_pcm_f32_to_s32(pOut: Pointer; const pIn: Pointer; count: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_f32_to_s32';

procedure ma_pcm_convert(pOut: Pointer; formatOut: ma_format; const pIn: Pointer; formatIn: ma_format; sampleCount: ma_uint64; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_convert';

procedure ma_convert_pcm_frames_format(pOut: Pointer; formatOut: ma_format; const pIn: Pointer; formatIn: ma_format; frameCount: ma_uint64; channels: ma_uint32; ditherMode: ma_dither_mode); cdecl;
  external SGT_DLL name _PU + 'ma_convert_pcm_frames_format';

procedure ma_deinterleave_pcm_frames(format: ma_format; channels: ma_uint32; frameCount: ma_uint64; const pInterleavedPCMFrames: Pointer; ppDeinterleavedPCMFrames: PPointer); cdecl;
  external SGT_DLL name _PU + 'ma_deinterleave_pcm_frames';

procedure ma_interleave_pcm_frames(format: ma_format; channels: ma_uint32; frameCount: ma_uint64; ppDeinterleavedPCMFrames: PPointer; pInterleavedPCMFrames: Pointer); cdecl;
  external SGT_DLL name _PU + 'ma_interleave_pcm_frames';

function ma_channel_map_get_channel(const pChannelMap: Pma_channel; channelCount: ma_uint32; channelIndex: ma_uint32): ma_channel; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_get_channel';

procedure ma_channel_map_init_blank(pChannelMap: Pma_channel; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_init_blank';

procedure ma_channel_map_init_standard(standardChannelMap: ma_standard_channel_map; pChannelMap: Pma_channel; channelMapCap: NativeUInt; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_init_standard';

procedure ma_channel_map_copy(pOut: Pma_channel; const pIn: Pma_channel; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_copy';

procedure ma_channel_map_copy_or_default(pOut: Pma_channel; channelMapCapOut: NativeUInt; const pIn: Pma_channel; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_copy_or_default';

function ma_channel_map_is_valid(const pChannelMap: Pma_channel; channels: ma_uint32): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_is_valid';

function ma_channel_map_is_equal(const pChannelMapA: Pma_channel; const pChannelMapB: Pma_channel; channels: ma_uint32): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_is_equal';

function ma_channel_map_is_blank(const pChannelMap: Pma_channel; channels: ma_uint32): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_is_blank';

function ma_channel_map_contains_channel_position(channels: ma_uint32; const pChannelMap: Pma_channel; channelPosition: ma_channel): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_contains_channel_position';

function ma_channel_map_find_channel_position(channels: ma_uint32; const pChannelMap: Pma_channel; channelPosition: ma_channel; pChannelIndex: Pma_uint32): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_find_channel_position';

function ma_channel_map_to_string(const pChannelMap: Pma_channel; channels: ma_uint32; pBufferOut: PUTF8Char; bufferCap: NativeUInt): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'ma_channel_map_to_string';

function ma_channel_position_to_string(channel: ma_channel): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ma_channel_position_to_string';

function ma_convert_frames(pOut: Pointer; frameCountOut: ma_uint64; formatOut: ma_format; channelsOut: ma_uint32; sampleRateOut: ma_uint32; const pIn: Pointer; frameCountIn: ma_uint64; formatIn: ma_format; channelsIn: ma_uint32; sampleRateIn: ma_uint32): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_convert_frames';

function ma_convert_frames_ex(pOut: Pointer; frameCountOut: ma_uint64; const pIn: Pointer; frameCountIn: ma_uint64; const pConfig: Pma_data_converter_config): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_convert_frames_ex';

function ma_data_source_config_init(): ma_data_source_config; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_config_init';

function ma_data_source_init(const pConfig: Pma_data_source_config; pDataSource: Pma_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_init';

procedure ma_data_source_uninit(pDataSource: Pma_data_source); cdecl;
  external SGT_DLL name _PU + 'ma_data_source_uninit';

function ma_data_source_read_pcm_frames(pDataSource: Pma_data_source; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_read_pcm_frames';

function ma_data_source_seek_pcm_frames(pDataSource: Pma_data_source; frameCount: ma_uint64; pFramesSeeked: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_seek_pcm_frames';

function ma_data_source_seek_to_pcm_frame(pDataSource: Pma_data_source; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_seek_to_pcm_frame';

function ma_data_source_get_data_format(pDataSource: Pma_data_source; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_data_format';

function ma_data_source_get_cursor_in_pcm_frames(pDataSource: Pma_data_source; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_cursor_in_pcm_frames';

function ma_data_source_get_length_in_pcm_frames(pDataSource: Pma_data_source; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_length_in_pcm_frames';

function ma_data_source_get_cursor_in_seconds(pDataSource: Pma_data_source; pCursor: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_cursor_in_seconds';

function ma_data_source_get_length_in_seconds(pDataSource: Pma_data_source; pLength: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_length_in_seconds';

function ma_data_source_set_looping(pDataSource: Pma_data_source; isLooping: ma_bool32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_set_looping';

function ma_data_source_is_looping(const pDataSource: Pma_data_source): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_is_looping';

function ma_data_source_set_range_in_pcm_frames(pDataSource: Pma_data_source; rangeBegInFrames: ma_uint64; rangeEndInFrames: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_set_range_in_pcm_frames';

procedure ma_data_source_get_range_in_pcm_frames(const pDataSource: Pma_data_source; pRangeBegInFrames: Pma_uint64; pRangeEndInFrames: Pma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_range_in_pcm_frames';

function ma_data_source_set_loop_point_in_pcm_frames(pDataSource: Pma_data_source; loopBegInFrames: ma_uint64; loopEndInFrames: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_set_loop_point_in_pcm_frames';

procedure ma_data_source_get_loop_point_in_pcm_frames(const pDataSource: Pma_data_source; pLoopBegInFrames: Pma_uint64; pLoopEndInFrames: Pma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_loop_point_in_pcm_frames';

function ma_data_source_set_current(pDataSource: Pma_data_source; pCurrentDataSource: Pma_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_set_current';

function ma_data_source_get_current(const pDataSource: Pma_data_source): Pma_data_source; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_current';

function ma_data_source_set_next(pDataSource: Pma_data_source; pNextDataSource: Pma_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_set_next';

function ma_data_source_get_next(const pDataSource: Pma_data_source): Pma_data_source; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_next';

function ma_data_source_set_next_callback(pDataSource: Pma_data_source; onGetNext: ma_data_source_get_next_proc): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_set_next_callback';

function ma_data_source_get_next_callback(const pDataSource: Pma_data_source): ma_data_source_get_next_proc; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_get_next_callback';

function ma_audio_buffer_ref_init(format: ma_format; channels: ma_uint32; const pData: Pointer; sizeInFrames: ma_uint64; pAudioBufferRef: Pma_audio_buffer_ref): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_init';

procedure ma_audio_buffer_ref_uninit(pAudioBufferRef: Pma_audio_buffer_ref); cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_uninit';

function ma_audio_buffer_ref_set_data(pAudioBufferRef: Pma_audio_buffer_ref; const pData: Pointer; sizeInFrames: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_set_data';

function ma_audio_buffer_ref_read_pcm_frames(pAudioBufferRef: Pma_audio_buffer_ref; pFramesOut: Pointer; frameCount: ma_uint64; loop: ma_bool32): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_read_pcm_frames';

function ma_audio_buffer_ref_seek_to_pcm_frame(pAudioBufferRef: Pma_audio_buffer_ref; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_seek_to_pcm_frame';

function ma_audio_buffer_ref_map(pAudioBufferRef: Pma_audio_buffer_ref; ppFramesOut: PPointer; pFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_map';

function ma_audio_buffer_ref_unmap(pAudioBufferRef: Pma_audio_buffer_ref; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_unmap';

function ma_audio_buffer_ref_at_end(const pAudioBufferRef: Pma_audio_buffer_ref): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_at_end';

function ma_audio_buffer_ref_get_cursor_in_pcm_frames(const pAudioBufferRef: Pma_audio_buffer_ref; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_get_cursor_in_pcm_frames';

function ma_audio_buffer_ref_get_length_in_pcm_frames(const pAudioBufferRef: Pma_audio_buffer_ref; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_get_length_in_pcm_frames';

function ma_audio_buffer_ref_get_available_frames(const pAudioBufferRef: Pma_audio_buffer_ref; pAvailableFrames: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_ref_get_available_frames';

function ma_audio_buffer_config_init(format: ma_format; channels: ma_uint32; sizeInFrames: ma_uint64; const pData: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks): ma_audio_buffer_config; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_config_init';

function ma_audio_buffer_init(const pConfig: Pma_audio_buffer_config; pAudioBuffer: Pma_audio_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_init';

function ma_audio_buffer_init_copy(const pConfig: Pma_audio_buffer_config; pAudioBuffer: Pma_audio_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_init_copy';

function ma_audio_buffer_alloc_and_init(const pConfig: Pma_audio_buffer_config; ppAudioBuffer: PPma_audio_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_alloc_and_init';

procedure ma_audio_buffer_uninit(pAudioBuffer: Pma_audio_buffer); cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_uninit';

procedure ma_audio_buffer_uninit_and_free(pAudioBuffer: Pma_audio_buffer); cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_uninit_and_free';

function ma_audio_buffer_read_pcm_frames(pAudioBuffer: Pma_audio_buffer; pFramesOut: Pointer; frameCount: ma_uint64; loop: ma_bool32): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_read_pcm_frames';

function ma_audio_buffer_seek_to_pcm_frame(pAudioBuffer: Pma_audio_buffer; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_seek_to_pcm_frame';

function ma_audio_buffer_map(pAudioBuffer: Pma_audio_buffer; ppFramesOut: PPointer; pFrameCount: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_map';

function ma_audio_buffer_unmap(pAudioBuffer: Pma_audio_buffer; frameCount: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_unmap';

function ma_audio_buffer_at_end(const pAudioBuffer: Pma_audio_buffer): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_at_end';

function ma_audio_buffer_get_cursor_in_pcm_frames(const pAudioBuffer: Pma_audio_buffer; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_get_cursor_in_pcm_frames';

function ma_audio_buffer_get_length_in_pcm_frames(const pAudioBuffer: Pma_audio_buffer; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_get_length_in_pcm_frames';

function ma_audio_buffer_get_available_frames(const pAudioBuffer: Pma_audio_buffer; pAvailableFrames: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_audio_buffer_get_available_frames';

function ma_paged_audio_buffer_data_init(format: ma_format; channels: ma_uint32; pData: Pma_paged_audio_buffer_data): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_init';

procedure ma_paged_audio_buffer_data_uninit(pData: Pma_paged_audio_buffer_data; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_uninit';

function ma_paged_audio_buffer_data_get_head(pData: Pma_paged_audio_buffer_data): Pma_paged_audio_buffer_page; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_get_head';

function ma_paged_audio_buffer_data_get_tail(pData: Pma_paged_audio_buffer_data): Pma_paged_audio_buffer_page; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_get_tail';

function ma_paged_audio_buffer_data_get_length_in_pcm_frames(pData: Pma_paged_audio_buffer_data; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_get_length_in_pcm_frames';

function ma_paged_audio_buffer_data_allocate_page(pData: Pma_paged_audio_buffer_data; pageSizeInFrames: ma_uint64; const pInitialData: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; ppPage: PPma_paged_audio_buffer_page): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_allocate_page';

function ma_paged_audio_buffer_data_free_page(pData: Pma_paged_audio_buffer_data; pPage: Pma_paged_audio_buffer_page; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_free_page';

function ma_paged_audio_buffer_data_append_page(pData: Pma_paged_audio_buffer_data; pPage: Pma_paged_audio_buffer_page): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_append_page';

function ma_paged_audio_buffer_data_allocate_and_append_page(pData: Pma_paged_audio_buffer_data; pageSizeInFrames: ma_uint32; const pInitialData: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_data_allocate_and_append_page';

function ma_paged_audio_buffer_config_init(pData: Pma_paged_audio_buffer_data): ma_paged_audio_buffer_config; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_config_init';

function ma_paged_audio_buffer_init(const pConfig: Pma_paged_audio_buffer_config; pPagedAudioBuffer: Pma_paged_audio_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_init';

procedure ma_paged_audio_buffer_uninit(pPagedAudioBuffer: Pma_paged_audio_buffer); cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_uninit';

function ma_paged_audio_buffer_read_pcm_frames(pPagedAudioBuffer: Pma_paged_audio_buffer; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_read_pcm_frames';

function ma_paged_audio_buffer_seek_to_pcm_frame(pPagedAudioBuffer: Pma_paged_audio_buffer; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_seek_to_pcm_frame';

function ma_paged_audio_buffer_get_cursor_in_pcm_frames(pPagedAudioBuffer: Pma_paged_audio_buffer; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_get_cursor_in_pcm_frames';

function ma_paged_audio_buffer_get_length_in_pcm_frames(pPagedAudioBuffer: Pma_paged_audio_buffer; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_paged_audio_buffer_get_length_in_pcm_frames';

function ma_rb_init_ex(subbufferSizeInBytes: NativeUInt; subbufferCount: NativeUInt; subbufferStrideInBytes: NativeUInt; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_rb): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_init_ex';

function ma_rb_init(bufferSizeInBytes: NativeUInt; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_rb): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_init';

procedure ma_rb_uninit(pRB: Pma_rb); cdecl;
  external SGT_DLL name _PU + 'ma_rb_uninit';

procedure ma_rb_reset(pRB: Pma_rb); cdecl;
  external SGT_DLL name _PU + 'ma_rb_reset';

function ma_rb_acquire_read(pRB: Pma_rb; pSizeInBytes: PNativeUInt; ppBufferOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_acquire_read';

function ma_rb_commit_read(pRB: Pma_rb; sizeInBytes: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_commit_read';

function ma_rb_acquire_write(pRB: Pma_rb; pSizeInBytes: PNativeUInt; ppBufferOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_acquire_write';

function ma_rb_commit_write(pRB: Pma_rb; sizeInBytes: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_commit_write';

function ma_rb_seek_read(pRB: Pma_rb; offsetInBytes: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_seek_read';

function ma_rb_seek_write(pRB: Pma_rb; offsetInBytes: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_rb_seek_write';

function ma_rb_pointer_distance(pRB: Pma_rb): ma_int32; cdecl;
  external SGT_DLL name _PU + 'ma_rb_pointer_distance';

function ma_rb_available_read(pRB: Pma_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_rb_available_read';

function ma_rb_available_write(pRB: Pma_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_rb_available_write';

function ma_rb_get_subbuffer_size(pRB: Pma_rb): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'ma_rb_get_subbuffer_size';

function ma_rb_get_subbuffer_stride(pRB: Pma_rb): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'ma_rb_get_subbuffer_stride';

function ma_rb_get_subbuffer_offset(pRB: Pma_rb; subbufferIndex: NativeUInt): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'ma_rb_get_subbuffer_offset';

function ma_rb_get_subbuffer_ptr(pRB: Pma_rb; subbufferIndex: NativeUInt; pBuffer: Pointer): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_rb_get_subbuffer_ptr';

function ma_pcm_rb_init_ex(format: ma_format; channels: ma_uint32; subbufferSizeInFrames: ma_uint32; subbufferCount: ma_uint32; subbufferStrideInFrames: ma_uint32; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_pcm_rb): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_init_ex';

function ma_pcm_rb_init(format: ma_format; channels: ma_uint32; bufferSizeInFrames: ma_uint32; pOptionalPreallocatedBuffer: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_pcm_rb): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_init';

procedure ma_pcm_rb_uninit(pRB: Pma_pcm_rb); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_uninit';

procedure ma_pcm_rb_reset(pRB: Pma_pcm_rb); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_reset';

function ma_pcm_rb_acquire_read(pRB: Pma_pcm_rb; pSizeInFrames: Pma_uint32; ppBufferOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_acquire_read';

function ma_pcm_rb_commit_read(pRB: Pma_pcm_rb; sizeInFrames: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_commit_read';

function ma_pcm_rb_acquire_write(pRB: Pma_pcm_rb; pSizeInFrames: Pma_uint32; ppBufferOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_acquire_write';

function ma_pcm_rb_commit_write(pRB: Pma_pcm_rb; sizeInFrames: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_commit_write';

function ma_pcm_rb_seek_read(pRB: Pma_pcm_rb; offsetInFrames: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_seek_read';

function ma_pcm_rb_seek_write(pRB: Pma_pcm_rb; offsetInFrames: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_seek_write';

function ma_pcm_rb_pointer_distance(pRB: Pma_pcm_rb): ma_int32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_pointer_distance';

function ma_pcm_rb_available_read(pRB: Pma_pcm_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_available_read';

function ma_pcm_rb_available_write(pRB: Pma_pcm_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_available_write';

function ma_pcm_rb_get_subbuffer_size(pRB: Pma_pcm_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_subbuffer_size';

function ma_pcm_rb_get_subbuffer_stride(pRB: Pma_pcm_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_subbuffer_stride';

function ma_pcm_rb_get_subbuffer_offset(pRB: Pma_pcm_rb; subbufferIndex: ma_uint32): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_subbuffer_offset';

function ma_pcm_rb_get_subbuffer_ptr(pRB: Pma_pcm_rb; subbufferIndex: ma_uint32; pBuffer: Pointer): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_subbuffer_ptr';

function ma_pcm_rb_get_format(const pRB: Pma_pcm_rb): ma_format; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_format';

function ma_pcm_rb_get_channels(const pRB: Pma_pcm_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_channels';

function ma_pcm_rb_get_sample_rate(const pRB: Pma_pcm_rb): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_get_sample_rate';

procedure ma_pcm_rb_set_sample_rate(pRB: Pma_pcm_rb; sampleRate: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_pcm_rb_set_sample_rate';

function ma_duplex_rb_init(captureFormat: ma_format; captureChannels: ma_uint32; sampleRate: ma_uint32; captureInternalSampleRate: ma_uint32; captureInternalPeriodSizeInFrames: ma_uint32; const pAllocationCallbacks: Pma_allocation_callbacks; pRB: Pma_duplex_rb): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_duplex_rb_init';

function ma_duplex_rb_uninit(pRB: Pma_duplex_rb): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_duplex_rb_uninit';

function ma_result_description(result: ma_result): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ma_result_description';

function ma_malloc(sz: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_malloc';

function ma_calloc(sz: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_calloc';

function ma_realloc(p: Pointer; sz: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_realloc';

procedure ma_free(p: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_free';

function ma_aligned_malloc(sz: NativeUInt; alignment: NativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_aligned_malloc';

procedure ma_aligned_free(p: Pointer; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_aligned_free';

function ma_get_format_name(format: ma_format): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ma_get_format_name';

procedure ma_blend_f32(pOut: PSingle; pInA: PSingle; pInB: PSingle; factor: Single; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_blend_f32';

function ma_get_bytes_per_sample(format: ma_format): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_get_bytes_per_sample';

function ma_log_level_to_string(logLevel: ma_uint32): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ma_log_level_to_string';

function ma_spinlock_lock(pSpinlock: Pma_spinlock): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spinlock_lock';

function ma_spinlock_lock_noyield(pSpinlock: Pma_spinlock): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spinlock_lock_noyield';

function ma_spinlock_unlock(pSpinlock: Pma_spinlock): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_spinlock_unlock';

function ma_mutex_init(pMutex: Pma_mutex): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_mutex_init';

procedure ma_mutex_uninit(pMutex: Pma_mutex); cdecl;
  external SGT_DLL name _PU + 'ma_mutex_uninit';

procedure ma_mutex_lock(pMutex: Pma_mutex); cdecl;
  external SGT_DLL name _PU + 'ma_mutex_lock';

procedure ma_mutex_unlock(pMutex: Pma_mutex); cdecl;
  external SGT_DLL name _PU + 'ma_mutex_unlock';

function ma_event_init(pEvent: Pma_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_event_init';

procedure ma_event_uninit(pEvent: Pma_event); cdecl;
  external SGT_DLL name _PU + 'ma_event_uninit';

function ma_event_wait(pEvent: Pma_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_event_wait';

function ma_event_signal(pEvent: Pma_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_event_signal';

function ma_fence_init(pFence: Pma_fence): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_fence_init';

procedure ma_fence_uninit(pFence: Pma_fence); cdecl;
  external SGT_DLL name _PU + 'ma_fence_uninit';

function ma_fence_acquire(pFence: Pma_fence): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_fence_acquire';

function ma_fence_release(pFence: Pma_fence): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_fence_release';

function ma_fence_wait(pFence: Pma_fence): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_fence_wait';

function ma_async_notification_signal(pNotification: Pma_async_notification): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_signal';

function ma_async_notification_poll_init(pNotificationPoll: Pma_async_notification_poll): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_poll_init';

function ma_async_notification_poll_is_signalled(const pNotificationPoll: Pma_async_notification_poll): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_poll_is_signalled';

function ma_async_notification_event_init(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_event_init';

function ma_async_notification_event_uninit(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_event_uninit';

function ma_async_notification_event_wait(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_event_wait';

function ma_async_notification_event_signal(pNotificationEvent: Pma_async_notification_event): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_async_notification_event_signal';

function ma_slot_allocator_config_init(capacity: ma_uint32): ma_slot_allocator_config; cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_config_init';

function ma_slot_allocator_get_heap_size(const pConfig: Pma_slot_allocator_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_get_heap_size';

function ma_slot_allocator_init_preallocated(const pConfig: Pma_slot_allocator_config; pHeap: Pointer; pAllocator: Pma_slot_allocator): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_init_preallocated';

function ma_slot_allocator_init(const pConfig: Pma_slot_allocator_config; const pAllocationCallbacks: Pma_allocation_callbacks; pAllocator: Pma_slot_allocator): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_init';

procedure ma_slot_allocator_uninit(pAllocator: Pma_slot_allocator; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_uninit';

function ma_slot_allocator_alloc(pAllocator: Pma_slot_allocator; pSlot: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_alloc';

function ma_slot_allocator_free(pAllocator: Pma_slot_allocator; slot: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_slot_allocator_free';

function ma_job_init(code: ma_uint16): ma_job; cdecl;
  external SGT_DLL name _PU + 'ma_job_init';

function ma_job_process(pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_job_process';

function ma_job_queue_config_init(flags: ma_uint32; capacity: ma_uint32): ma_job_queue_config; cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_config_init';

function ma_job_queue_get_heap_size(const pConfig: Pma_job_queue_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_get_heap_size';

function ma_job_queue_init_preallocated(const pConfig: Pma_job_queue_config; pHeap: Pointer; pQueue: Pma_job_queue): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_init_preallocated';

function ma_job_queue_init(const pConfig: Pma_job_queue_config; const pAllocationCallbacks: Pma_allocation_callbacks; pQueue: Pma_job_queue): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_init';

procedure ma_job_queue_uninit(pQueue: Pma_job_queue; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_uninit';

function ma_job_queue_post(pQueue: Pma_job_queue; const pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_post';

function ma_job_queue_next(pQueue: Pma_job_queue; pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_job_queue_next';

function ma_device_job_thread_config_init(): ma_device_job_thread_config; cdecl;
  external SGT_DLL name _PU + 'ma_device_job_thread_config_init';

function ma_device_job_thread_init(const pConfig: Pma_device_job_thread_config; const pAllocationCallbacks: Pma_allocation_callbacks; pJobThread: Pma_device_job_thread): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_job_thread_init';

procedure ma_device_job_thread_uninit(pJobThread: Pma_device_job_thread; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_device_job_thread_uninit';

function ma_device_job_thread_post(pJobThread: Pma_device_job_thread; const pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_job_thread_post';

function ma_device_job_thread_next(pJobThread: Pma_device_job_thread; pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_job_thread_next';

function ma_context_config_init(): ma_context_config; cdecl;
  external SGT_DLL name _PU + 'ma_context_config_init';

function ma_context_init(backends: Pma_backend; backendCount: ma_uint32; const pConfig: Pma_context_config; pContext: Pma_context): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_context_init';

function ma_context_uninit(pContext: Pma_context): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_context_uninit';

function ma_context_sizeof(): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'ma_context_sizeof';

function ma_context_get_log(pContext: Pma_context): Pma_log; cdecl;
  external SGT_DLL name _PU + 'ma_context_get_log';

function ma_context_enumerate_devices(pContext: Pma_context; callback: ma_enum_devices_callback_proc; pUserData: Pointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_context_enumerate_devices';

function ma_context_get_devices(pContext: Pma_context; ppPlaybackDeviceInfos: PPma_device_info; pPlaybackDeviceCount: Pma_uint32; ppCaptureDeviceInfos: PPma_device_info; pCaptureDeviceCount: Pma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_context_get_devices';

function ma_context_get_device_info(pContext: Pma_context; deviceType: ma_device_type; const pDeviceID: Pma_device_id; pDeviceInfo: Pma_device_info): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_context_get_device_info';

function ma_context_is_loopback_supported(pContext: Pma_context): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_context_is_loopback_supported';

function ma_device_config_init(deviceType: ma_device_type): ma_device_config; cdecl;
  external SGT_DLL name _PU + 'ma_device_config_init';

function ma_device_init(pContext: Pma_context; const pConfig: Pma_device_config; pDevice: Pma_device): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_init';

function ma_device_init_ex(backends: Pma_backend; backendCount: ma_uint32; const pContextConfig: Pma_context_config; const pConfig: Pma_device_config; pDevice: Pma_device): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_init_ex';

procedure ma_device_uninit(pDevice: Pma_device); cdecl;
  external SGT_DLL name _PU + 'ma_device_uninit';

function ma_device_get_context(pDevice: Pma_device): Pma_context; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_context';

function ma_device_get_log(pDevice: Pma_device): Pma_log; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_log';

function ma_device_get_info(pDevice: Pma_device; &type: ma_device_type; pDeviceInfo: Pma_device_info): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_info';

function ma_device_get_name(pDevice: Pma_device; &type: ma_device_type; pName: PUTF8Char; nameCap: NativeUInt; pLengthNotIncludingNullTerminator: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_name';

function ma_device_start(pDevice: Pma_device): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_start';

function ma_device_stop(pDevice: Pma_device): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_stop';

function ma_device_is_started(const pDevice: Pma_device): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_device_is_started';

function ma_device_get_state(const pDevice: Pma_device): ma_device_state; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_state';

function ma_device_post_init(pDevice: Pma_device; deviceType: ma_device_type; const pPlaybackDescriptor: Pma_device_descriptor; const pCaptureDescriptor: Pma_device_descriptor): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_post_init';

function ma_device_set_master_volume(pDevice: Pma_device; volume: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_set_master_volume';

function ma_device_get_master_volume(pDevice: Pma_device; pVolume: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_master_volume';

function ma_device_set_master_volume_db(pDevice: Pma_device; gainDB: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_set_master_volume_db';

function ma_device_get_master_volume_db(pDevice: Pma_device; pGainDB: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_get_master_volume_db';

function ma_device_handle_backend_data_callback(pDevice: Pma_device; pOutput: Pointer; const pInput: Pointer; frameCount: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_device_handle_backend_data_callback';

function ma_calculate_buffer_size_in_frames_from_descriptor(const pDescriptor: Pma_device_descriptor; nativeSampleRate: ma_uint32; performanceProfile: ma_performance_profile): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_calculate_buffer_size_in_frames_from_descriptor';

function ma_get_backend_name(backend: ma_backend): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ma_get_backend_name';

function ma_get_backend_from_name(const pBackendName: PUTF8Char; pBackend: Pma_backend): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_get_backend_from_name';

function ma_is_backend_enabled(backend: ma_backend): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_is_backend_enabled';

function ma_get_enabled_backends(pBackends: Pma_backend; backendCap: NativeUInt; pBackendCount: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_get_enabled_backends';

function ma_is_loopback_supported(backend: ma_backend): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_is_loopback_supported';

function ma_calculate_buffer_size_in_milliseconds_from_frames(bufferSizeInFrames: ma_uint32; sampleRate: ma_uint32): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_calculate_buffer_size_in_milliseconds_from_frames';

function ma_calculate_buffer_size_in_frames_from_milliseconds(bufferSizeInMilliseconds: ma_uint32; sampleRate: ma_uint32): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_calculate_buffer_size_in_frames_from_milliseconds';

procedure ma_copy_pcm_frames(dst: Pointer; const src: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_copy_pcm_frames';

procedure ma_silence_pcm_frames(p: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_silence_pcm_frames';

function ma_offset_pcm_frames_ptr(p: Pointer; offsetInFrames: ma_uint64; format: ma_format; channels: ma_uint32): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_offset_pcm_frames_ptr';

function ma_offset_pcm_frames_const_ptr(const p: Pointer; offsetInFrames: ma_uint64; format: ma_format; channels: ma_uint32): Pointer; cdecl;
  external SGT_DLL name _PU + 'ma_offset_pcm_frames_const_ptr';

procedure ma_clip_samples_u8(pDst: Pma_uint8; const pSrc: Pma_int16; count: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_clip_samples_u8';

procedure ma_clip_samples_s16(pDst: Pma_int16; const pSrc: Pma_int32; count: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_clip_samples_s16';

procedure ma_clip_samples_s24(pDst: Pma_uint8; const pSrc: Pma_int64; count: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_clip_samples_s24';

procedure ma_clip_samples_s32(pDst: Pma_int32; const pSrc: Pma_int64; count: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_clip_samples_s32';

procedure ma_clip_samples_f32(pDst: PSingle; const pSrc: PSingle; count: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_clip_samples_f32';

procedure ma_clip_pcm_frames(pDst: Pointer; const pSrc: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_clip_pcm_frames';

procedure ma_copy_and_apply_volume_factor_u8(pSamplesOut: Pma_uint8; const pSamplesIn: Pma_uint8; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_u8';

procedure ma_copy_and_apply_volume_factor_s16(pSamplesOut: Pma_int16; const pSamplesIn: Pma_int16; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_s16';

procedure ma_copy_and_apply_volume_factor_s24(pSamplesOut: Pointer; const pSamplesIn: Pointer; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_s24';

procedure ma_copy_and_apply_volume_factor_s32(pSamplesOut: Pma_int32; const pSamplesIn: Pma_int32; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_s32';

procedure ma_copy_and_apply_volume_factor_f32(pSamplesOut: PSingle; const pSamplesIn: PSingle; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_f32';

procedure ma_apply_volume_factor_u8(pSamples: Pma_uint8; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_u8';

procedure ma_apply_volume_factor_s16(pSamples: Pma_int16; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_s16';

procedure ma_apply_volume_factor_s24(pSamples: Pointer; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_s24';

procedure ma_apply_volume_factor_s32(pSamples: Pma_int32; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_s32';

procedure ma_apply_volume_factor_f32(pSamples: PSingle; sampleCount: ma_uint64; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_f32';

procedure ma_copy_and_apply_volume_factor_pcm_frames_u8(pFramesOut: Pma_uint8; const pFramesIn: Pma_uint8; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_pcm_frames_u8';

procedure ma_copy_and_apply_volume_factor_pcm_frames_s16(pFramesOut: Pma_int16; const pFramesIn: Pma_int16; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_pcm_frames_s16';

procedure ma_copy_and_apply_volume_factor_pcm_frames_s24(pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_pcm_frames_s24';

procedure ma_copy_and_apply_volume_factor_pcm_frames_s32(pFramesOut: Pma_int32; const pFramesIn: Pma_int32; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_pcm_frames_s32';

procedure ma_copy_and_apply_volume_factor_pcm_frames_f32(pFramesOut: PSingle; const pFramesIn: PSingle; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_pcm_frames_f32';

procedure ma_copy_and_apply_volume_factor_pcm_frames(pFramesOut: Pointer; const pFramesIn: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_pcm_frames';

procedure ma_apply_volume_factor_pcm_frames_u8(pFrames: Pma_uint8; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_pcm_frames_u8';

procedure ma_apply_volume_factor_pcm_frames_s16(pFrames: Pma_int16; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_pcm_frames_s16';

procedure ma_apply_volume_factor_pcm_frames_s24(pFrames: Pointer; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_pcm_frames_s24';

procedure ma_apply_volume_factor_pcm_frames_s32(pFrames: Pma_int32; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_pcm_frames_s32';

procedure ma_apply_volume_factor_pcm_frames_f32(pFrames: PSingle; frameCount: ma_uint64; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_pcm_frames_f32';

procedure ma_apply_volume_factor_pcm_frames(pFrames: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; factor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_apply_volume_factor_pcm_frames';

procedure ma_copy_and_apply_volume_factor_per_channel_f32(pFramesOut: PSingle; const pFramesIn: PSingle; frameCount: ma_uint64; channels: ma_uint32; pChannelGains: PSingle); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_factor_per_channel_f32';

procedure ma_copy_and_apply_volume_and_clip_samples_u8(pDst: Pma_uint8; const pSrc: Pma_int16; count: ma_uint64; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_and_clip_samples_u8';

procedure ma_copy_and_apply_volume_and_clip_samples_s16(pDst: Pma_int16; const pSrc: Pma_int32; count: ma_uint64; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_and_clip_samples_s16';

procedure ma_copy_and_apply_volume_and_clip_samples_s24(pDst: Pma_uint8; const pSrc: Pma_int64; count: ma_uint64; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_and_clip_samples_s24';

procedure ma_copy_and_apply_volume_and_clip_samples_s32(pDst: Pma_int32; const pSrc: Pma_int64; count: ma_uint64; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_and_clip_samples_s32';

procedure ma_copy_and_apply_volume_and_clip_samples_f32(pDst: PSingle; const pSrc: PSingle; count: ma_uint64; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_and_clip_samples_f32';

procedure ma_copy_and_apply_volume_and_clip_pcm_frames(pDst: Pointer; const pSrc: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_copy_and_apply_volume_and_clip_pcm_frames';

function ma_volume_linear_to_db(factor: Single): Single; cdecl;
  external SGT_DLL name _PU + 'ma_volume_linear_to_db';

function ma_volume_db_to_linear(gain: Single): Single; cdecl;
  external SGT_DLL name _PU + 'ma_volume_db_to_linear';

function ma_mix_pcm_frames_f32(pDst: PSingle; const pSrc: PSingle; frameCount: ma_uint64; channels: ma_uint32; volume: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_mix_pcm_frames_f32';

function ma_vfs_open(pVFS: Pma_vfs; const pFilePath: PUTF8Char; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_open';

function ma_vfs_open_w(pVFS: Pma_vfs; const pFilePath: PWideChar; openMode: ma_uint32; pFile: Pma_vfs_file): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_open_w';

function ma_vfs_close(pVFS: Pma_vfs; &file: ma_vfs_file): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_close';

function ma_vfs_read(pVFS: Pma_vfs; &file: ma_vfs_file; pDst: Pointer; sizeInBytes: NativeUInt; pBytesRead: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_read';

function ma_vfs_write(pVFS: Pma_vfs; &file: ma_vfs_file; const pSrc: Pointer; sizeInBytes: NativeUInt; pBytesWritten: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_write';

function ma_vfs_seek(pVFS: Pma_vfs; &file: ma_vfs_file; offset: ma_int64; origin: ma_seek_origin): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_seek';

function ma_vfs_tell(pVFS: Pma_vfs; &file: ma_vfs_file; pCursor: Pma_int64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_tell';

function ma_vfs_info(pVFS: Pma_vfs; &file: ma_vfs_file; pInfo: Pma_file_info): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_info';

function ma_vfs_open_and_read_file(pVFS: Pma_vfs; const pFilePath: PUTF8Char; ppData: PPointer; pSize: PNativeUInt; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_vfs_open_and_read_file';

function ma_default_vfs_init(pVFS: Pma_default_vfs; const pAllocationCallbacks: Pma_allocation_callbacks): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_default_vfs_init';

function ma_decoding_backend_config_init(preferredFormat: ma_format; seekPointCount: ma_uint32): ma_decoding_backend_config; cdecl;
  external SGT_DLL name _PU + 'ma_decoding_backend_config_init';

function ma_decoder_config_init(outputFormat: ma_format; outputChannels: ma_uint32; outputSampleRate: ma_uint32): ma_decoder_config; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_config_init';

function ma_decoder_config_init_default(): ma_decoder_config; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_config_init_default';

function ma_decoder_init(onRead: ma_decoder_read_proc; onSeek: ma_decoder_seek_proc; pUserData: Pointer; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_init';

function ma_decoder_init_memory(const pData: Pointer; dataSize: NativeUInt; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_init_memory';

function ma_decoder_init_vfs(pVFS: Pma_vfs; const pFilePath: PUTF8Char; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_init_vfs';

function ma_decoder_init_vfs_w(pVFS: Pma_vfs; const pFilePath: PWideChar; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_init_vfs_w';

function ma_decoder_init_file(const pFilePath: PUTF8Char; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_init_file';

function ma_decoder_init_file_w(const pFilePath: PWideChar; const pConfig: Pma_decoder_config; pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_init_file_w';

function ma_decoder_uninit(pDecoder: Pma_decoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_uninit';

function ma_decoder_read_pcm_frames(pDecoder: Pma_decoder; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_read_pcm_frames';

function ma_decoder_seek_to_pcm_frame(pDecoder: Pma_decoder; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_seek_to_pcm_frame';

function ma_decoder_get_data_format(pDecoder: Pma_decoder; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_get_data_format';

function ma_decoder_get_cursor_in_pcm_frames(pDecoder: Pma_decoder; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_get_cursor_in_pcm_frames';

function ma_decoder_get_length_in_pcm_frames(pDecoder: Pma_decoder; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_get_length_in_pcm_frames';

function ma_decoder_get_available_frames(pDecoder: Pma_decoder; pAvailableFrames: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decoder_get_available_frames';

function ma_decode_from_vfs(pVFS: Pma_vfs; const pFilePath: PUTF8Char; pConfig: Pma_decoder_config; pFrameCountOut: Pma_uint64; ppPCMFramesOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decode_from_vfs';

function ma_decode_file(const pFilePath: PUTF8Char; pConfig: Pma_decoder_config; pFrameCountOut: Pma_uint64; ppPCMFramesOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decode_file';

function ma_decode_memory(const pData: Pointer; dataSize: NativeUInt; pConfig: Pma_decoder_config; pFrameCountOut: Pma_uint64; ppPCMFramesOut: PPointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_decode_memory';

function ma_encoder_config_init(encodingFormat: ma_encoding_format; format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_encoder_config; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_config_init';

function ma_encoder_init(onWrite: ma_encoder_write_proc; onSeek: ma_encoder_seek_proc; pUserData: Pointer; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_init';

function ma_encoder_init_vfs(pVFS: Pma_vfs; const pFilePath: PUTF8Char; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_init_vfs';

function ma_encoder_init_vfs_w(pVFS: Pma_vfs; const pFilePath: PWideChar; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_init_vfs_w';

function ma_encoder_init_file(const pFilePath: PUTF8Char; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_init_file';

function ma_encoder_init_file_w(const pFilePath: PWideChar; const pConfig: Pma_encoder_config; pEncoder: Pma_encoder): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_init_file_w';

procedure ma_encoder_uninit(pEncoder: Pma_encoder); cdecl;
  external SGT_DLL name _PU + 'ma_encoder_uninit';

function ma_encoder_write_pcm_frames(pEncoder: Pma_encoder; const pFramesIn: Pointer; frameCount: ma_uint64; pFramesWritten: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_encoder_write_pcm_frames';

function ma_waveform_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; &type: ma_waveform_type; amplitude: Double; frequency: Double): ma_waveform_config; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_config_init';

function ma_waveform_init(const pConfig: Pma_waveform_config; pWaveform: Pma_waveform): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_init';

procedure ma_waveform_uninit(pWaveform: Pma_waveform); cdecl;
  external SGT_DLL name _PU + 'ma_waveform_uninit';

function ma_waveform_read_pcm_frames(pWaveform: Pma_waveform; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_read_pcm_frames';

function ma_waveform_seek_to_pcm_frame(pWaveform: Pma_waveform; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_seek_to_pcm_frame';

function ma_waveform_set_amplitude(pWaveform: Pma_waveform; amplitude: Double): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_set_amplitude';

function ma_waveform_set_frequency(pWaveform: Pma_waveform; frequency: Double): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_set_frequency';

function ma_waveform_set_type(pWaveform: Pma_waveform; &type: ma_waveform_type): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_set_type';

function ma_waveform_set_sample_rate(pWaveform: Pma_waveform; sampleRate: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_waveform_set_sample_rate';

function ma_pulsewave_config_init(format: ma_format; channels: ma_uint32; sampleRate: ma_uint32; dutyCycle: Double; amplitude: Double; frequency: Double): ma_pulsewave_config; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_config_init';

function ma_pulsewave_init(const pConfig: Pma_pulsewave_config; pWaveform: Pma_pulsewave): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_init';

procedure ma_pulsewave_uninit(pWaveform: Pma_pulsewave); cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_uninit';

function ma_pulsewave_read_pcm_frames(pWaveform: Pma_pulsewave; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_read_pcm_frames';

function ma_pulsewave_seek_to_pcm_frame(pWaveform: Pma_pulsewave; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_seek_to_pcm_frame';

function ma_pulsewave_set_amplitude(pWaveform: Pma_pulsewave; amplitude: Double): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_set_amplitude';

function ma_pulsewave_set_frequency(pWaveform: Pma_pulsewave; frequency: Double): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_set_frequency';

function ma_pulsewave_set_sample_rate(pWaveform: Pma_pulsewave; sampleRate: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_set_sample_rate';

function ma_pulsewave_set_duty_cycle(pWaveform: Pma_pulsewave; dutyCycle: Double): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_pulsewave_set_duty_cycle';

function ma_noise_config_init(format: ma_format; channels: ma_uint32; &type: ma_noise_type; seed: ma_int32; amplitude: Double): ma_noise_config; cdecl;
  external SGT_DLL name _PU + 'ma_noise_config_init';

function ma_noise_get_heap_size(const pConfig: Pma_noise_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_get_heap_size';

function ma_noise_init_preallocated(const pConfig: Pma_noise_config; pHeap: Pointer; pNoise: Pma_noise): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_init_preallocated';

function ma_noise_init(const pConfig: Pma_noise_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNoise: Pma_noise): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_init';

procedure ma_noise_uninit(pNoise: Pma_noise; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_noise_uninit';

function ma_noise_read_pcm_frames(pNoise: Pma_noise; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_read_pcm_frames';

function ma_noise_set_amplitude(pNoise: Pma_noise; amplitude: Double): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_set_amplitude';

function ma_noise_set_seed(pNoise: Pma_noise; seed: ma_int32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_set_seed';

function ma_noise_set_type(pNoise: Pma_noise; &type: ma_noise_type): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_noise_set_type';

function ma_resource_manager_pipeline_notifications_init(): ma_resource_manager_pipeline_notifications; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_pipeline_notifications_init';

function ma_resource_manager_data_source_config_init(): ma_resource_manager_data_source_config; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_config_init';

function ma_resource_manager_config_init(): ma_resource_manager_config; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_config_init';

function ma_resource_manager_init(const pConfig: Pma_resource_manager_config; pResourceManager: Pma_resource_manager): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_init';

procedure ma_resource_manager_uninit(pResourceManager: Pma_resource_manager); cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_uninit';

function ma_resource_manager_get_log(pResourceManager: Pma_resource_manager): Pma_log; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_get_log';

function ma_resource_manager_register_file(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char; flags: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_register_file';

function ma_resource_manager_register_file_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar; flags: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_register_file_w';

function ma_resource_manager_register_decoded_data(pResourceManager: Pma_resource_manager; const pName: PUTF8Char; const pData: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_register_decoded_data';

function ma_resource_manager_register_decoded_data_w(pResourceManager: Pma_resource_manager; const pName: PWideChar; const pData: Pointer; frameCount: ma_uint64; format: ma_format; channels: ma_uint32; sampleRate: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_register_decoded_data_w';

function ma_resource_manager_register_encoded_data(pResourceManager: Pma_resource_manager; const pName: PUTF8Char; const pData: Pointer; sizeInBytes: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_register_encoded_data';

function ma_resource_manager_register_encoded_data_w(pResourceManager: Pma_resource_manager; const pName: PWideChar; const pData: Pointer; sizeInBytes: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_register_encoded_data_w';

function ma_resource_manager_unregister_file(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_unregister_file';

function ma_resource_manager_unregister_file_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_unregister_file_w';

function ma_resource_manager_unregister_data(pResourceManager: Pma_resource_manager; const pName: PUTF8Char): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_unregister_data';

function ma_resource_manager_unregister_data_w(pResourceManager: Pma_resource_manager; const pName: PWideChar): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_unregister_data_w';

function ma_resource_manager_data_buffer_init_ex(pResourceManager: Pma_resource_manager; const pConfig: Pma_resource_manager_data_source_config; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_init_ex';

function ma_resource_manager_data_buffer_init(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_init';

function ma_resource_manager_data_buffer_init_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_init_w';

function ma_resource_manager_data_buffer_init_copy(pResourceManager: Pma_resource_manager; const pExistingDataBuffer: Pma_resource_manager_data_buffer; pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_init_copy';

function ma_resource_manager_data_buffer_uninit(pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_uninit';

function ma_resource_manager_data_buffer_read_pcm_frames(pDataBuffer: Pma_resource_manager_data_buffer; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_read_pcm_frames';

function ma_resource_manager_data_buffer_seek_to_pcm_frame(pDataBuffer: Pma_resource_manager_data_buffer; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_seek_to_pcm_frame';

function ma_resource_manager_data_buffer_get_data_format(pDataBuffer: Pma_resource_manager_data_buffer; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_get_data_format';

function ma_resource_manager_data_buffer_get_cursor_in_pcm_frames(pDataBuffer: Pma_resource_manager_data_buffer; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_get_cursor_in_pcm_frames';

function ma_resource_manager_data_buffer_get_length_in_pcm_frames(pDataBuffer: Pma_resource_manager_data_buffer; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_get_length_in_pcm_frames';

function ma_resource_manager_data_buffer_result(const pDataBuffer: Pma_resource_manager_data_buffer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_result';

function ma_resource_manager_data_buffer_set_looping(pDataBuffer: Pma_resource_manager_data_buffer; isLooping: ma_bool32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_set_looping';

function ma_resource_manager_data_buffer_is_looping(const pDataBuffer: Pma_resource_manager_data_buffer): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_is_looping';

function ma_resource_manager_data_buffer_get_available_frames(pDataBuffer: Pma_resource_manager_data_buffer; pAvailableFrames: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_buffer_get_available_frames';

function ma_resource_manager_data_stream_init_ex(pResourceManager: Pma_resource_manager; const pConfig: Pma_resource_manager_data_source_config; pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_init_ex';

function ma_resource_manager_data_stream_init(pResourceManager: Pma_resource_manager; const pFilePath: PUTF8Char; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_init';

function ma_resource_manager_data_stream_init_w(pResourceManager: Pma_resource_manager; const pFilePath: PWideChar; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_init_w';

function ma_resource_manager_data_stream_uninit(pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_uninit';

function ma_resource_manager_data_stream_read_pcm_frames(pDataStream: Pma_resource_manager_data_stream; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_read_pcm_frames';

function ma_resource_manager_data_stream_seek_to_pcm_frame(pDataStream: Pma_resource_manager_data_stream; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_seek_to_pcm_frame';

function ma_resource_manager_data_stream_get_data_format(pDataStream: Pma_resource_manager_data_stream; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_get_data_format';

function ma_resource_manager_data_stream_get_cursor_in_pcm_frames(pDataStream: Pma_resource_manager_data_stream; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_get_cursor_in_pcm_frames';

function ma_resource_manager_data_stream_get_length_in_pcm_frames(pDataStream: Pma_resource_manager_data_stream; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_get_length_in_pcm_frames';

function ma_resource_manager_data_stream_result(const pDataStream: Pma_resource_manager_data_stream): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_result';

function ma_resource_manager_data_stream_set_looping(pDataStream: Pma_resource_manager_data_stream; isLooping: ma_bool32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_set_looping';

function ma_resource_manager_data_stream_is_looping(const pDataStream: Pma_resource_manager_data_stream): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_is_looping';

function ma_resource_manager_data_stream_get_available_frames(pDataStream: Pma_resource_manager_data_stream; pAvailableFrames: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_stream_get_available_frames';

function ma_resource_manager_data_source_init_ex(pResourceManager: Pma_resource_manager; const pConfig: Pma_resource_manager_data_source_config; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_init_ex';

function ma_resource_manager_data_source_init(pResourceManager: Pma_resource_manager; const pName: PUTF8Char; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_init';

function ma_resource_manager_data_source_init_w(pResourceManager: Pma_resource_manager; const pName: PWideChar; flags: ma_uint32; const pNotifications: Pma_resource_manager_pipeline_notifications; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_init_w';

function ma_resource_manager_data_source_init_copy(pResourceManager: Pma_resource_manager; const pExistingDataSource: Pma_resource_manager_data_source; pDataSource: Pma_resource_manager_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_init_copy';

function ma_resource_manager_data_source_uninit(pDataSource: Pma_resource_manager_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_uninit';

function ma_resource_manager_data_source_read_pcm_frames(pDataSource: Pma_resource_manager_data_source; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_read_pcm_frames';

function ma_resource_manager_data_source_seek_to_pcm_frame(pDataSource: Pma_resource_manager_data_source; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_seek_to_pcm_frame';

function ma_resource_manager_data_source_get_data_format(pDataSource: Pma_resource_manager_data_source; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_get_data_format';

function ma_resource_manager_data_source_get_cursor_in_pcm_frames(pDataSource: Pma_resource_manager_data_source; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_get_cursor_in_pcm_frames';

function ma_resource_manager_data_source_get_length_in_pcm_frames(pDataSource: Pma_resource_manager_data_source; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_get_length_in_pcm_frames';

function ma_resource_manager_data_source_result(const pDataSource: Pma_resource_manager_data_source): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_result';

function ma_resource_manager_data_source_set_looping(pDataSource: Pma_resource_manager_data_source; isLooping: ma_bool32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_set_looping';

function ma_resource_manager_data_source_is_looping(const pDataSource: Pma_resource_manager_data_source): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_is_looping';

function ma_resource_manager_data_source_get_available_frames(pDataSource: Pma_resource_manager_data_source; pAvailableFrames: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_data_source_get_available_frames';

function ma_resource_manager_post_job(pResourceManager: Pma_resource_manager; const pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_post_job';

function ma_resource_manager_post_job_quit(pResourceManager: Pma_resource_manager): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_post_job_quit';

function ma_resource_manager_next_job(pResourceManager: Pma_resource_manager; pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_next_job';

function ma_resource_manager_process_job(pResourceManager: Pma_resource_manager; pJob: Pma_job): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_process_job';

function ma_resource_manager_process_next_job(pResourceManager: Pma_resource_manager): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_resource_manager_process_next_job';

function ma_node_config_init(): ma_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_node_config_init';

function ma_node_get_heap_size(pNodeGraph: Pma_node_graph; const pConfig: Pma_node_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_heap_size';

function ma_node_init_preallocated(pNodeGraph: Pma_node_graph; const pConfig: Pma_node_config; pHeap: Pointer; pNode: Pma_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_init_preallocated';

function ma_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_init';

procedure ma_node_uninit(pNode: Pma_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_node_uninit';

function ma_node_get_node_graph(const pNode: Pma_node): Pma_node_graph; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_node_graph';

function ma_node_get_input_bus_count(const pNode: Pma_node): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_input_bus_count';

function ma_node_get_output_bus_count(const pNode: Pma_node): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_output_bus_count';

function ma_node_get_input_channels(const pNode: Pma_node; inputBusIndex: ma_uint32): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_input_channels';

function ma_node_get_output_channels(const pNode: Pma_node; outputBusIndex: ma_uint32): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_output_channels';

function ma_node_attach_output_bus(pNode: Pma_node; outputBusIndex: ma_uint32; pOtherNode: Pma_node; otherNodeInputBusIndex: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_attach_output_bus';

function ma_node_detach_output_bus(pNode: Pma_node; outputBusIndex: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_detach_output_bus';

function ma_node_detach_all_output_buses(pNode: Pma_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_detach_all_output_buses';

function ma_node_set_output_bus_volume(pNode: Pma_node; outputBusIndex: ma_uint32; volume: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_set_output_bus_volume';

function ma_node_get_output_bus_volume(const pNode: Pma_node; outputBusIndex: ma_uint32): Single; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_output_bus_volume';

function ma_node_set_state(pNode: Pma_node; state: ma_node_state): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_set_state';

function ma_node_get_state(const pNode: Pma_node): ma_node_state; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_state';

function ma_node_set_state_time(pNode: Pma_node; state: ma_node_state; globalTime: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_set_state_time';

function ma_node_get_state_time(const pNode: Pma_node; state: ma_node_state): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_state_time';

function ma_node_get_state_by_time(const pNode: Pma_node; globalTime: ma_uint64): ma_node_state; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_state_by_time';

function ma_node_get_state_by_time_range(const pNode: Pma_node; globalTimeBeg: ma_uint64; globalTimeEnd: ma_uint64): ma_node_state; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_state_by_time_range';

function ma_node_get_time(const pNode: Pma_node): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_node_get_time';

function ma_node_set_time(pNode: Pma_node; localTime: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_set_time';

function ma_node_graph_config_init(channels: ma_uint32): ma_node_graph_config; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_config_init';

function ma_node_graph_init(const pConfig: Pma_node_graph_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNodeGraph: Pma_node_graph): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_init';

procedure ma_node_graph_uninit(pNodeGraph: Pma_node_graph; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_uninit';

function ma_node_graph_get_endpoint(pNodeGraph: Pma_node_graph): Pma_node; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_get_endpoint';

function ma_node_graph_read_pcm_frames(pNodeGraph: Pma_node_graph; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_read_pcm_frames';

function ma_node_graph_get_channels(const pNodeGraph: Pma_node_graph): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_get_channels';

function ma_node_graph_get_time(const pNodeGraph: Pma_node_graph): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_get_time';

function ma_node_graph_set_time(pNodeGraph: Pma_node_graph; globalTime: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_node_graph_set_time';

function ma_data_source_node_config_init(pDataSource: Pma_data_source): ma_data_source_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_node_config_init';

function ma_data_source_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_data_source_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pDataSourceNode: Pma_data_source_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_node_init';

procedure ma_data_source_node_uninit(pDataSourceNode: Pma_data_source_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_data_source_node_uninit';

function ma_data_source_node_set_looping(pDataSourceNode: Pma_data_source_node; isLooping: ma_bool32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_node_set_looping';

function ma_data_source_node_is_looping(pDataSourceNode: Pma_data_source_node): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_data_source_node_is_looping';

function ma_splitter_node_config_init(channels: ma_uint32): ma_splitter_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_splitter_node_config_init';

function ma_splitter_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_splitter_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pSplitterNode: Pma_splitter_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_splitter_node_init';

procedure ma_splitter_node_uninit(pSplitterNode: Pma_splitter_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_splitter_node_uninit';

function ma_biquad_node_config_init(channels: ma_uint32; b0: Single; b1: Single; b2: Single; a0: Single; a1: Single; a2: Single): ma_biquad_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_node_config_init';

function ma_biquad_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_biquad_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_biquad_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_node_init';

function ma_biquad_node_reinit(const pConfig: Pma_biquad_config; pNode: Pma_biquad_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_biquad_node_reinit';

procedure ma_biquad_node_uninit(pNode: Pma_biquad_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_biquad_node_uninit';

function ma_lpf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_lpf_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_node_config_init';

function ma_lpf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_lpf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_lpf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_node_init';

function ma_lpf_node_reinit(const pConfig: Pma_lpf_config; pNode: Pma_lpf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_lpf_node_reinit';

procedure ma_lpf_node_uninit(pNode: Pma_lpf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_lpf_node_uninit';

function ma_hpf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_hpf_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_node_config_init';

function ma_hpf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_hpf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_hpf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_node_init';

function ma_hpf_node_reinit(const pConfig: Pma_hpf_config; pNode: Pma_hpf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hpf_node_reinit';

procedure ma_hpf_node_uninit(pNode: Pma_hpf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_hpf_node_uninit';

function ma_bpf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; cutoffFrequency: Double; order: ma_uint32): ma_bpf_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_node_config_init';

function ma_bpf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_bpf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_bpf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_node_init';

function ma_bpf_node_reinit(const pConfig: Pma_bpf_config; pNode: Pma_bpf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_bpf_node_reinit';

procedure ma_bpf_node_uninit(pNode: Pma_bpf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_bpf_node_uninit';

function ma_notch_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; q: Double; frequency: Double): ma_notch_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_notch_node_config_init';

function ma_notch_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_notch_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_notch_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch_node_init';

function ma_notch_node_reinit(const pConfig: Pma_notch_config; pNode: Pma_notch_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_notch_node_reinit';

procedure ma_notch_node_uninit(pNode: Pma_notch_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_notch_node_uninit';

function ma_peak_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_peak_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_peak_node_config_init';

function ma_peak_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_peak_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_peak_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak_node_init';

function ma_peak_node_reinit(const pConfig: Pma_peak_config; pNode: Pma_peak_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_peak_node_reinit';

procedure ma_peak_node_uninit(pNode: Pma_peak_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_peak_node_uninit';

function ma_loshelf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_loshelf_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf_node_config_init';

function ma_loshelf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_loshelf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_loshelf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf_node_init';

function ma_loshelf_node_reinit(const pConfig: Pma_loshelf_config; pNode: Pma_loshelf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_loshelf_node_reinit';

procedure ma_loshelf_node_uninit(pNode: Pma_loshelf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_loshelf_node_uninit';

function ma_hishelf_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; gainDB: Double; q: Double; frequency: Double): ma_hishelf_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf_node_config_init';

function ma_hishelf_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_hishelf_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pNode: Pma_hishelf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf_node_init';

function ma_hishelf_node_reinit(const pConfig: Pma_hishelf_config; pNode: Pma_hishelf_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_hishelf_node_reinit';

procedure ma_hishelf_node_uninit(pNode: Pma_hishelf_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_hishelf_node_uninit';

function ma_delay_node_config_init(channels: ma_uint32; sampleRate: ma_uint32; delayInFrames: ma_uint32; decay: Single): ma_delay_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_config_init';

function ma_delay_node_init(pNodeGraph: Pma_node_graph; const pConfig: Pma_delay_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pDelayNode: Pma_delay_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_init';

procedure ma_delay_node_uninit(pDelayNode: Pma_delay_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_uninit';

procedure ma_delay_node_set_wet(pDelayNode: Pma_delay_node; value: Single); cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_set_wet';

function ma_delay_node_get_wet(const pDelayNode: Pma_delay_node): Single; cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_get_wet';

procedure ma_delay_node_set_dry(pDelayNode: Pma_delay_node; value: Single); cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_set_dry';

function ma_delay_node_get_dry(const pDelayNode: Pma_delay_node): Single; cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_get_dry';

procedure ma_delay_node_set_decay(pDelayNode: Pma_delay_node; value: Single); cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_set_decay';

function ma_delay_node_get_decay(const pDelayNode: Pma_delay_node): Single; cdecl;
  external SGT_DLL name _PU + 'ma_delay_node_get_decay';

function ma_engine_node_config_init(pEngine: Pma_engine; &type: ma_engine_node_type; flags: ma_uint32): ma_engine_node_config; cdecl;
  external SGT_DLL name _PU + 'ma_engine_node_config_init';

function ma_engine_node_get_heap_size(const pConfig: Pma_engine_node_config; pHeapSizeInBytes: PNativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_node_get_heap_size';

function ma_engine_node_init_preallocated(const pConfig: Pma_engine_node_config; pHeap: Pointer; pEngineNode: Pma_engine_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_node_init_preallocated';

function ma_engine_node_init(const pConfig: Pma_engine_node_config; const pAllocationCallbacks: Pma_allocation_callbacks; pEngineNode: Pma_engine_node): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_node_init';

procedure ma_engine_node_uninit(pEngineNode: Pma_engine_node; const pAllocationCallbacks: Pma_allocation_callbacks); cdecl;
  external SGT_DLL name _PU + 'ma_engine_node_uninit';

function ma_sound_config_init(): ma_sound_config; cdecl;
  external SGT_DLL name _PU + 'ma_sound_config_init';

function ma_sound_config_init_2(pEngine: Pma_engine): ma_sound_config; cdecl;
  external SGT_DLL name _PU + 'ma_sound_config_init_2';

function ma_sound_group_config_init(): ma_sound_group_config; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_config_init';

function ma_sound_group_config_init_2(pEngine: Pma_engine): ma_sound_group_config; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_config_init_2';

function ma_engine_config_init(): ma_engine_config; cdecl;
  external SGT_DLL name _PU + 'ma_engine_config_init';

function ma_engine_init(const pConfig: Pma_engine_config; pEngine: Pma_engine): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_init';

procedure ma_engine_uninit(pEngine: Pma_engine); cdecl;
  external SGT_DLL name _PU + 'ma_engine_uninit';

function ma_engine_read_pcm_frames(pEngine: Pma_engine; pFramesOut: Pointer; frameCount: ma_uint64; pFramesRead: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_read_pcm_frames';

function ma_engine_get_node_graph(pEngine: Pma_engine): Pma_node_graph; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_node_graph';

function ma_engine_get_resource_manager(pEngine: Pma_engine): Pma_resource_manager; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_resource_manager';

function ma_engine_get_device(pEngine: Pma_engine): Pma_device; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_device';

function ma_engine_get_log(pEngine: Pma_engine): Pma_log; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_log';

function ma_engine_get_endpoint(pEngine: Pma_engine): Pma_node; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_endpoint';

function ma_engine_get_time_in_pcm_frames(const pEngine: Pma_engine): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_time_in_pcm_frames';

function ma_engine_get_time_in_milliseconds(const pEngine: Pma_engine): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_time_in_milliseconds';

function ma_engine_set_time_in_pcm_frames(pEngine: Pma_engine; globalTime: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_set_time_in_pcm_frames';

function ma_engine_set_time_in_milliseconds(pEngine: Pma_engine; globalTime: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_set_time_in_milliseconds';

function ma_engine_get_time(const pEngine: Pma_engine): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_time';

function ma_engine_set_time(pEngine: Pma_engine; globalTime: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_set_time';

function ma_engine_get_channels(const pEngine: Pma_engine): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_channels';

function ma_engine_get_sample_rate(const pEngine: Pma_engine): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_sample_rate';

function ma_engine_start(pEngine: Pma_engine): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_start';

function ma_engine_stop(pEngine: Pma_engine): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_stop';

function ma_engine_set_volume(pEngine: Pma_engine; volume: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_set_volume';

function ma_engine_get_volume(pEngine: Pma_engine): Single; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_volume';

function ma_engine_set_gain_db(pEngine: Pma_engine; gainDB: Single): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_set_gain_db';

function ma_engine_get_gain_db(pEngine: Pma_engine): Single; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_gain_db';

function ma_engine_get_listener_count(const pEngine: Pma_engine): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_engine_get_listener_count';

function ma_engine_find_closest_listener(const pEngine: Pma_engine; absolutePosX: Single; absolutePosY: Single; absolutePosZ: Single): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_engine_find_closest_listener';

procedure ma_engine_listener_set_position(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_set_position';

function ma_engine_listener_get_position(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_get_position';

procedure ma_engine_listener_set_direction(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_set_direction';

function ma_engine_listener_get_direction(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_get_direction';

procedure ma_engine_listener_set_velocity(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_set_velocity';

function ma_engine_listener_get_velocity(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_get_velocity';

procedure ma_engine_listener_set_cone(pEngine: Pma_engine; listenerIndex: ma_uint32; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_set_cone';

procedure ma_engine_listener_get_cone(const pEngine: Pma_engine; listenerIndex: ma_uint32; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_get_cone';

procedure ma_engine_listener_set_world_up(pEngine: Pma_engine; listenerIndex: ma_uint32; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_set_world_up';

function ma_engine_listener_get_world_up(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_get_world_up';

procedure ma_engine_listener_set_enabled(pEngine: Pma_engine; listenerIndex: ma_uint32; isEnabled: ma_bool32); cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_set_enabled';

function ma_engine_listener_is_enabled(const pEngine: Pma_engine; listenerIndex: ma_uint32): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_engine_listener_is_enabled';

function ma_engine_play_sound_ex(pEngine: Pma_engine; const pFilePath: PUTF8Char; pNode: Pma_node; nodeInputBusIndex: ma_uint32): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_play_sound_ex';

function ma_engine_play_sound(pEngine: Pma_engine; const pFilePath: PUTF8Char; pGroup: Pma_sound_group): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_engine_play_sound';

function ma_sound_init_from_file(pEngine: Pma_engine; const pFilePath: PUTF8Char; flags: ma_uint32; pGroup: Pma_sound_group; pDoneFence: Pma_fence; pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_init_from_file';

function ma_sound_init_from_file_w(pEngine: Pma_engine; const pFilePath: PWideChar; flags: ma_uint32; pGroup: Pma_sound_group; pDoneFence: Pma_fence; pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_init_from_file_w';

function ma_sound_init_copy(pEngine: Pma_engine; const pExistingSound: Pma_sound; flags: ma_uint32; pGroup: Pma_sound_group; pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_init_copy';

function ma_sound_init_from_data_source(pEngine: Pma_engine; pDataSource: Pma_data_source; flags: ma_uint32; pGroup: Pma_sound_group; pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_init_from_data_source';

function ma_sound_init_ex(pEngine: Pma_engine; const pConfig: Pma_sound_config; pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_init_ex';

procedure ma_sound_uninit(pSound: Pma_sound); cdecl;
  external SGT_DLL name _PU + 'ma_sound_uninit';

function ma_sound_get_engine(const pSound: Pma_sound): Pma_engine; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_engine';

function ma_sound_get_data_source(const pSound: Pma_sound): Pma_data_source; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_data_source';

function ma_sound_start(pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_start';

function ma_sound_stop(pSound: Pma_sound): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_stop';

function ma_sound_stop_with_fade_in_pcm_frames(pSound: Pma_sound; fadeLengthInFrames: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_stop_with_fade_in_pcm_frames';

function ma_sound_stop_with_fade_in_milliseconds(pSound: Pma_sound; fadeLengthInFrames: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_stop_with_fade_in_milliseconds';

procedure ma_sound_set_volume(pSound: Pma_sound; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_volume';

function ma_sound_get_volume(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_volume';

procedure ma_sound_set_pan(pSound: Pma_sound; pan: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_pan';

function ma_sound_get_pan(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_pan';

procedure ma_sound_set_pan_mode(pSound: Pma_sound; panMode: ma_pan_mode); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_pan_mode';

function ma_sound_get_pan_mode(const pSound: Pma_sound): ma_pan_mode; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_pan_mode';

procedure ma_sound_set_pitch(pSound: Pma_sound; pitch: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_pitch';

function ma_sound_get_pitch(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_pitch';

procedure ma_sound_set_spatialization_enabled(pSound: Pma_sound; enabled: ma_bool32); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_spatialization_enabled';

function ma_sound_is_spatialization_enabled(const pSound: Pma_sound): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_is_spatialization_enabled';

procedure ma_sound_set_pinned_listener_index(pSound: Pma_sound; listenerIndex: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_pinned_listener_index';

function ma_sound_get_pinned_listener_index(const pSound: Pma_sound): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_pinned_listener_index';

function ma_sound_get_listener_index(const pSound: Pma_sound): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_listener_index';

function ma_sound_get_direction_to_listener(const pSound: Pma_sound): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_direction_to_listener';

procedure ma_sound_set_position(pSound: Pma_sound; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_position';

function ma_sound_get_position(const pSound: Pma_sound): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_position';

procedure ma_sound_set_direction(pSound: Pma_sound; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_direction';

function ma_sound_get_direction(const pSound: Pma_sound): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_direction';

procedure ma_sound_set_velocity(pSound: Pma_sound; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_velocity';

function ma_sound_get_velocity(const pSound: Pma_sound): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_velocity';

procedure ma_sound_set_attenuation_model(pSound: Pma_sound; attenuationModel: ma_attenuation_model); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_attenuation_model';

function ma_sound_get_attenuation_model(const pSound: Pma_sound): ma_attenuation_model; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_attenuation_model';

procedure ma_sound_set_positioning(pSound: Pma_sound; positioning: ma_positioning); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_positioning';

function ma_sound_get_positioning(const pSound: Pma_sound): ma_positioning; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_positioning';

procedure ma_sound_set_rolloff(pSound: Pma_sound; rolloff: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_rolloff';

function ma_sound_get_rolloff(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_rolloff';

procedure ma_sound_set_min_gain(pSound: Pma_sound; minGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_min_gain';

function ma_sound_get_min_gain(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_min_gain';

procedure ma_sound_set_max_gain(pSound: Pma_sound; maxGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_max_gain';

function ma_sound_get_max_gain(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_max_gain';

procedure ma_sound_set_min_distance(pSound: Pma_sound; minDistance: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_min_distance';

function ma_sound_get_min_distance(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_min_distance';

procedure ma_sound_set_max_distance(pSound: Pma_sound; maxDistance: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_max_distance';

function ma_sound_get_max_distance(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_max_distance';

procedure ma_sound_set_cone(pSound: Pma_sound; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_cone';

procedure ma_sound_get_cone(const pSound: Pma_sound; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_cone';

procedure ma_sound_set_doppler_factor(pSound: Pma_sound; dopplerFactor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_doppler_factor';

function ma_sound_get_doppler_factor(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_doppler_factor';

procedure ma_sound_set_directional_attenuation_factor(pSound: Pma_sound; directionalAttenuationFactor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_directional_attenuation_factor';

function ma_sound_get_directional_attenuation_factor(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_directional_attenuation_factor';

procedure ma_sound_set_fade_in_pcm_frames(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_fade_in_pcm_frames';

procedure ma_sound_set_fade_in_milliseconds(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_fade_in_milliseconds';

procedure ma_sound_set_fade_start_in_pcm_frames(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInFrames: ma_uint64; absoluteGlobalTimeInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_fade_start_in_pcm_frames';

procedure ma_sound_set_fade_start_in_milliseconds(pSound: Pma_sound; volumeBeg: Single; volumeEnd: Single; fadeLengthInMilliseconds: ma_uint64; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_fade_start_in_milliseconds';

function ma_sound_get_current_fade_volume(const pSound: Pma_sound): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_current_fade_volume';

procedure ma_sound_set_start_time_in_pcm_frames(pSound: Pma_sound; absoluteGlobalTimeInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_start_time_in_pcm_frames';

procedure ma_sound_set_start_time_in_milliseconds(pSound: Pma_sound; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_start_time_in_milliseconds';

procedure ma_sound_set_stop_time_in_pcm_frames(pSound: Pma_sound; absoluteGlobalTimeInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_stop_time_in_pcm_frames';

procedure ma_sound_set_stop_time_in_milliseconds(pSound: Pma_sound; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_stop_time_in_milliseconds';

procedure ma_sound_set_stop_time_with_fade_in_pcm_frames(pSound: Pma_sound; stopAbsoluteGlobalTimeInFrames: ma_uint64; fadeLengthInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_stop_time_with_fade_in_pcm_frames';

procedure ma_sound_set_stop_time_with_fade_in_milliseconds(pSound: Pma_sound; stopAbsoluteGlobalTimeInMilliseconds: ma_uint64; fadeLengthInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_stop_time_with_fade_in_milliseconds';

function ma_sound_is_playing(const pSound: Pma_sound): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_is_playing';

function ma_sound_get_time_in_pcm_frames(const pSound: Pma_sound): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_time_in_pcm_frames';

function ma_sound_get_time_in_milliseconds(const pSound: Pma_sound): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_time_in_milliseconds';

procedure ma_sound_set_looping(pSound: Pma_sound; isLooping: ma_bool32); cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_looping';

function ma_sound_is_looping(const pSound: Pma_sound): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_is_looping';

function ma_sound_at_end(const pSound: Pma_sound): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_at_end';

function ma_sound_seek_to_pcm_frame(pSound: Pma_sound; frameIndex: ma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_seek_to_pcm_frame';

function ma_sound_get_data_format(pSound: Pma_sound; pFormat: Pma_format; pChannels: Pma_uint32; pSampleRate: Pma_uint32; pChannelMap: Pma_channel; channelMapCap: NativeUInt): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_data_format';

function ma_sound_get_cursor_in_pcm_frames(pSound: Pma_sound; pCursor: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_cursor_in_pcm_frames';

function ma_sound_get_length_in_pcm_frames(pSound: Pma_sound; pLength: Pma_uint64): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_length_in_pcm_frames';

function ma_sound_get_cursor_in_seconds(pSound: Pma_sound; pCursor: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_cursor_in_seconds';

function ma_sound_get_length_in_seconds(pSound: Pma_sound; pLength: PSingle): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_get_length_in_seconds';

function ma_sound_set_end_callback(pSound: Pma_sound; callback: ma_sound_end_proc; pUserData: Pointer): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_set_end_callback';

function ma_sound_group_init(pEngine: Pma_engine; flags: ma_uint32; pParentGroup: Pma_sound_group; pGroup: Pma_sound_group): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_init';

function ma_sound_group_init_ex(pEngine: Pma_engine; const pConfig: Pma_sound_group_config; pGroup: Pma_sound_group): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_init_ex';

procedure ma_sound_group_uninit(pGroup: Pma_sound_group); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_uninit';

function ma_sound_group_get_engine(const pGroup: Pma_sound_group): Pma_engine; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_engine';

function ma_sound_group_start(pGroup: Pma_sound_group): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_start';

function ma_sound_group_stop(pGroup: Pma_sound_group): ma_result; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_stop';

procedure ma_sound_group_set_volume(pGroup: Pma_sound_group; volume: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_volume';

function ma_sound_group_get_volume(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_volume';

procedure ma_sound_group_set_pan(pGroup: Pma_sound_group; pan: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_pan';

function ma_sound_group_get_pan(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_pan';

procedure ma_sound_group_set_pan_mode(pGroup: Pma_sound_group; panMode: ma_pan_mode); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_pan_mode';

function ma_sound_group_get_pan_mode(const pGroup: Pma_sound_group): ma_pan_mode; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_pan_mode';

procedure ma_sound_group_set_pitch(pGroup: Pma_sound_group; pitch: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_pitch';

function ma_sound_group_get_pitch(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_pitch';

procedure ma_sound_group_set_spatialization_enabled(pGroup: Pma_sound_group; enabled: ma_bool32); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_spatialization_enabled';

function ma_sound_group_is_spatialization_enabled(const pGroup: Pma_sound_group): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_is_spatialization_enabled';

procedure ma_sound_group_set_pinned_listener_index(pGroup: Pma_sound_group; listenerIndex: ma_uint32); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_pinned_listener_index';

function ma_sound_group_get_pinned_listener_index(const pGroup: Pma_sound_group): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_pinned_listener_index';

function ma_sound_group_get_listener_index(const pGroup: Pma_sound_group): ma_uint32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_listener_index';

function ma_sound_group_get_direction_to_listener(const pGroup: Pma_sound_group): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_direction_to_listener';

procedure ma_sound_group_set_position(pGroup: Pma_sound_group; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_position';

function ma_sound_group_get_position(const pGroup: Pma_sound_group): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_position';

procedure ma_sound_group_set_direction(pGroup: Pma_sound_group; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_direction';

function ma_sound_group_get_direction(const pGroup: Pma_sound_group): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_direction';

procedure ma_sound_group_set_velocity(pGroup: Pma_sound_group; x: Single; y: Single; z: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_velocity';

function ma_sound_group_get_velocity(const pGroup: Pma_sound_group): ma_vec3f; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_velocity';

procedure ma_sound_group_set_attenuation_model(pGroup: Pma_sound_group; attenuationModel: ma_attenuation_model); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_attenuation_model';

function ma_sound_group_get_attenuation_model(const pGroup: Pma_sound_group): ma_attenuation_model; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_attenuation_model';

procedure ma_sound_group_set_positioning(pGroup: Pma_sound_group; positioning: ma_positioning); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_positioning';

function ma_sound_group_get_positioning(const pGroup: Pma_sound_group): ma_positioning; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_positioning';

procedure ma_sound_group_set_rolloff(pGroup: Pma_sound_group; rolloff: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_rolloff';

function ma_sound_group_get_rolloff(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_rolloff';

procedure ma_sound_group_set_min_gain(pGroup: Pma_sound_group; minGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_min_gain';

function ma_sound_group_get_min_gain(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_min_gain';

procedure ma_sound_group_set_max_gain(pGroup: Pma_sound_group; maxGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_max_gain';

function ma_sound_group_get_max_gain(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_max_gain';

procedure ma_sound_group_set_min_distance(pGroup: Pma_sound_group; minDistance: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_min_distance';

function ma_sound_group_get_min_distance(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_min_distance';

procedure ma_sound_group_set_max_distance(pGroup: Pma_sound_group; maxDistance: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_max_distance';

function ma_sound_group_get_max_distance(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_max_distance';

procedure ma_sound_group_set_cone(pGroup: Pma_sound_group; innerAngleInRadians: Single; outerAngleInRadians: Single; outerGain: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_cone';

procedure ma_sound_group_get_cone(const pGroup: Pma_sound_group; pInnerAngleInRadians: PSingle; pOuterAngleInRadians: PSingle; pOuterGain: PSingle); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_cone';

procedure ma_sound_group_set_doppler_factor(pGroup: Pma_sound_group; dopplerFactor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_doppler_factor';

function ma_sound_group_get_doppler_factor(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_doppler_factor';

procedure ma_sound_group_set_directional_attenuation_factor(pGroup: Pma_sound_group; directionalAttenuationFactor: Single); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_directional_attenuation_factor';

function ma_sound_group_get_directional_attenuation_factor(const pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_directional_attenuation_factor';

procedure ma_sound_group_set_fade_in_pcm_frames(pGroup: Pma_sound_group; volumeBeg: Single; volumeEnd: Single; fadeLengthInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_fade_in_pcm_frames';

procedure ma_sound_group_set_fade_in_milliseconds(pGroup: Pma_sound_group; volumeBeg: Single; volumeEnd: Single; fadeLengthInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_fade_in_milliseconds';

function ma_sound_group_get_current_fade_volume(pGroup: Pma_sound_group): Single; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_current_fade_volume';

procedure ma_sound_group_set_start_time_in_pcm_frames(pGroup: Pma_sound_group; absoluteGlobalTimeInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_start_time_in_pcm_frames';

procedure ma_sound_group_set_start_time_in_milliseconds(pGroup: Pma_sound_group; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_start_time_in_milliseconds';

procedure ma_sound_group_set_stop_time_in_pcm_frames(pGroup: Pma_sound_group; absoluteGlobalTimeInFrames: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_stop_time_in_pcm_frames';

procedure ma_sound_group_set_stop_time_in_milliseconds(pGroup: Pma_sound_group; absoluteGlobalTimeInMilliseconds: ma_uint64); cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_set_stop_time_in_milliseconds';

function ma_sound_group_is_playing(const pGroup: Pma_sound_group): ma_bool32; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_is_playing';

function ma_sound_group_get_time_in_pcm_frames(const pGroup: Pma_sound_group): ma_uint64; cdecl;
  external SGT_DLL name _PU + 'ma_sound_group_get_time_in_pcm_frames';

function ImVec2_ImVec2_Nil(): PImVec2; cdecl;
  external SGT_DLL name _PU + 'ImVec2_ImVec2_Nil';

procedure ImVec2_destroy(self: PImVec2); cdecl;
  external SGT_DLL name _PU + 'ImVec2_destroy';

function ImVec2_ImVec2_Float(_x: Single; _y: Single): PImVec2; cdecl;
  external SGT_DLL name _PU + 'ImVec2_ImVec2_Float';

function ImVec4_ImVec4_Nil(): PImVec4; cdecl;
  external SGT_DLL name _PU + 'ImVec4_ImVec4_Nil';

procedure ImVec4_destroy(self: PImVec4); cdecl;
  external SGT_DLL name _PU + 'ImVec4_destroy';

function ImVec4_ImVec4_Float(_x: Single; _y: Single; _z: Single; _w: Single): PImVec4; cdecl;
  external SGT_DLL name _PU + 'ImVec4_ImVec4_Float';

function igCreateContext(shared_font_atlas: PImFontAtlas): PImGuiContext; cdecl;
  external SGT_DLL name _PU + 'igCreateContext';

procedure igDestroyContext(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDestroyContext';

function igGetCurrentContext(): PImGuiContext; cdecl;
  external SGT_DLL name _PU + 'igGetCurrentContext';

procedure igSetCurrentContext(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igSetCurrentContext';

function igGetIO(): PImGuiIO; cdecl;
  external SGT_DLL name _PU + 'igGetIO';

function igGetStyle(): PImGuiStyle; cdecl;
  external SGT_DLL name _PU + 'igGetStyle';

procedure igNewFrame(); cdecl;
  external SGT_DLL name _PU + 'igNewFrame';

procedure igEndFrame(); cdecl;
  external SGT_DLL name _PU + 'igEndFrame';

procedure igRender(); cdecl;
  external SGT_DLL name _PU + 'igRender';

function igGetDrawData(): PImDrawData; cdecl;
  external SGT_DLL name _PU + 'igGetDrawData';

procedure igShowDemoWindow(p_open: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igShowDemoWindow';

procedure igShowMetricsWindow(p_open: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igShowMetricsWindow';

procedure igShowDebugLogWindow(p_open: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igShowDebugLogWindow';

procedure igShowIDStackToolWindow(p_open: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igShowIDStackToolWindow';

procedure igShowAboutWindow(p_open: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igShowAboutWindow';

procedure igShowStyleEditor(ref: PImGuiStyle); cdecl;
  external SGT_DLL name _PU + 'igShowStyleEditor';

function igShowStyleSelector(const &label: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igShowStyleSelector';

procedure igShowFontSelector(const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igShowFontSelector';

procedure igShowUserGuide(); cdecl;
  external SGT_DLL name _PU + 'igShowUserGuide';

function igGetVersion(): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igGetVersion';

procedure igStyleColorsDark(dst: PImGuiStyle); cdecl;
  external SGT_DLL name _PU + 'igStyleColorsDark';

procedure igStyleColorsLight(dst: PImGuiStyle); cdecl;
  external SGT_DLL name _PU + 'igStyleColorsLight';

procedure igStyleColorsClassic(dst: PImGuiStyle); cdecl;
  external SGT_DLL name _PU + 'igStyleColorsClassic';

function igBegin(const name: PUTF8Char; p_open: PBoolean; flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBegin';

procedure igEnd(); cdecl;
  external SGT_DLL name _PU + 'igEnd';

function igBeginChild_Str(const str_id: PUTF8Char; size: ImVec2; child_flags: ImGuiChildFlags; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginChild_Str';

function igBeginChild_ID(id: ImGuiID; size: ImVec2; child_flags: ImGuiChildFlags; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginChild_ID';

procedure igEndChild(); cdecl;
  external SGT_DLL name _PU + 'igEndChild';

function igIsWindowAppearing(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowAppearing';

function igIsWindowCollapsed(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowCollapsed';

function igIsWindowFocused(flags: ImGuiFocusedFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowFocused';

function igIsWindowHovered(flags: ImGuiHoveredFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowHovered';

function igGetWindowDrawList(): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'igGetWindowDrawList';

function igGetWindowDpiScale(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetWindowDpiScale';

procedure igGetWindowPos(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetWindowPos';

procedure igGetWindowSize(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetWindowSize';

function igGetWindowWidth(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetWindowWidth';

function igGetWindowHeight(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetWindowHeight';

function igGetWindowViewport(): PImGuiViewport; cdecl;
  external SGT_DLL name _PU + 'igGetWindowViewport';

procedure igSetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowPos';

procedure igSetNextWindowSize(size: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowSize';

procedure igSetNextWindowSizeConstraints(size_min: ImVec2; size_max: ImVec2; custom_callback: ImGuiSizeCallback; custom_callback_data: Pointer); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowSizeConstraints';

procedure igSetNextWindowContentSize(size: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowContentSize';

procedure igSetNextWindowCollapsed(collapsed: Boolean; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowCollapsed';

procedure igSetNextWindowFocus(); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowFocus';

procedure igSetNextWindowScroll(scroll: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowScroll';

procedure igSetNextWindowBgAlpha(alpha: Single); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowBgAlpha';

procedure igSetNextWindowViewport(viewport_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowViewport';

procedure igSetWindowPos_Vec2(pos: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowPos_Vec2';

procedure igSetWindowSize_Vec2(size: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowSize_Vec2';

procedure igSetWindowCollapsed_Bool(collapsed: Boolean; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowCollapsed_Bool';

procedure igSetWindowFocus_Nil(); cdecl;
  external SGT_DLL name _PU + 'igSetWindowFocus_Nil';

procedure igSetWindowFontScale(scale: Single); cdecl;
  external SGT_DLL name _PU + 'igSetWindowFontScale';

procedure igSetWindowPos_Str(const name: PUTF8Char; pos: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowPos_Str';

procedure igSetWindowSize_Str(const name: PUTF8Char; size: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowSize_Str';

procedure igSetWindowCollapsed_Str(const name: PUTF8Char; collapsed: Boolean; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowCollapsed_Str';

procedure igSetWindowFocus_Str(const name: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igSetWindowFocus_Str';

procedure igGetContentRegionAvail(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetContentRegionAvail';

procedure igGetContentRegionMax(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetContentRegionMax';

procedure igGetWindowContentRegionMin(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetWindowContentRegionMin';

procedure igGetWindowContentRegionMax(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetWindowContentRegionMax';

function igGetScrollX(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetScrollX';

function igGetScrollY(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetScrollY';

procedure igSetScrollX_Float(scroll_x: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollX_Float';

procedure igSetScrollY_Float(scroll_y: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollY_Float';

function igGetScrollMaxX(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetScrollMaxX';

function igGetScrollMaxY(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetScrollMaxY';

procedure igSetScrollHereX(center_x_ratio: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollHereX';

procedure igSetScrollHereY(center_y_ratio: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollHereY';

procedure igSetScrollFromPosX_Float(local_x: Single; center_x_ratio: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollFromPosX_Float';

procedure igSetScrollFromPosY_Float(local_y: Single; center_y_ratio: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollFromPosY_Float';

procedure igPushFont(font: PImFont); cdecl;
  external SGT_DLL name _PU + 'igPushFont';

procedure igPopFont(); cdecl;
  external SGT_DLL name _PU + 'igPopFont';

procedure igPushStyleColor_U32(idx: ImGuiCol; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igPushStyleColor_U32';

procedure igPushStyleColor_Vec4(idx: ImGuiCol; col: ImVec4); cdecl;
  external SGT_DLL name _PU + 'igPushStyleColor_Vec4';

procedure igPopStyleColor(count: Integer); cdecl;
  external SGT_DLL name _PU + 'igPopStyleColor';

procedure igPushStyleVar_Float(idx: ImGuiStyleVar; val: Single); cdecl;
  external SGT_DLL name _PU + 'igPushStyleVar_Float';

procedure igPushStyleVar_Vec2(idx: ImGuiStyleVar; val: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igPushStyleVar_Vec2';

procedure igPopStyleVar(count: Integer); cdecl;
  external SGT_DLL name _PU + 'igPopStyleVar';

procedure igPushTabStop(tab_stop: Boolean); cdecl;
  external SGT_DLL name _PU + 'igPushTabStop';

procedure igPopTabStop(); cdecl;
  external SGT_DLL name _PU + 'igPopTabStop';

procedure igPushButtonRepeat(&repeat: Boolean); cdecl;
  external SGT_DLL name _PU + 'igPushButtonRepeat';

procedure igPopButtonRepeat(); cdecl;
  external SGT_DLL name _PU + 'igPopButtonRepeat';

procedure igPushItemWidth(item_width: Single); cdecl;
  external SGT_DLL name _PU + 'igPushItemWidth';

procedure igPopItemWidth(); cdecl;
  external SGT_DLL name _PU + 'igPopItemWidth';

procedure igSetNextItemWidth(item_width: Single); cdecl;
  external SGT_DLL name _PU + 'igSetNextItemWidth';

function igCalcItemWidth(): Single; cdecl;
  external SGT_DLL name _PU + 'igCalcItemWidth';

procedure igPushTextWrapPos(wrap_local_pos_x: Single); cdecl;
  external SGT_DLL name _PU + 'igPushTextWrapPos';

procedure igPopTextWrapPos(); cdecl;
  external SGT_DLL name _PU + 'igPopTextWrapPos';

function igGetFont(): PImFont; cdecl;
  external SGT_DLL name _PU + 'igGetFont';

function igGetFontSize(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetFontSize';

procedure igGetFontTexUvWhitePixel(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetFontTexUvWhitePixel';

function igGetColorU32_Col(idx: ImGuiCol; alpha_mul: Single): ImU32; cdecl;
  external SGT_DLL name _PU + 'igGetColorU32_Col';

function igGetColorU32_Vec4(col: ImVec4): ImU32; cdecl;
  external SGT_DLL name _PU + 'igGetColorU32_Vec4';

function igGetColorU32_U32(col: ImU32; alpha_mul: Single): ImU32; cdecl;
  external SGT_DLL name _PU + 'igGetColorU32_U32';

function igGetStyleColorVec4(idx: ImGuiCol): PImVec4; cdecl;
  external SGT_DLL name _PU + 'igGetStyleColorVec4';

procedure igGetCursorScreenPos(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetCursorScreenPos';

procedure igSetCursorScreenPos(pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igSetCursorScreenPos';

procedure igGetCursorPos(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetCursorPos';

function igGetCursorPosX(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetCursorPosX';

function igGetCursorPosY(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetCursorPosY';

procedure igSetCursorPos(local_pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igSetCursorPos';

procedure igSetCursorPosX(local_x: Single); cdecl;
  external SGT_DLL name _PU + 'igSetCursorPosX';

procedure igSetCursorPosY(local_y: Single); cdecl;
  external SGT_DLL name _PU + 'igSetCursorPosY';

procedure igGetCursorStartPos(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetCursorStartPos';

procedure igSeparator(); cdecl;
  external SGT_DLL name _PU + 'igSeparator';

procedure igSameLine(offset_from_start_x: Single; spacing: Single); cdecl;
  external SGT_DLL name _PU + 'igSameLine';

procedure igNewLine(); cdecl;
  external SGT_DLL name _PU + 'igNewLine';

procedure igSpacing(); cdecl;
  external SGT_DLL name _PU + 'igSpacing';

procedure igDummy(size: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igDummy';

procedure igIndent(indent_w: Single); cdecl;
  external SGT_DLL name _PU + 'igIndent';

procedure igUnindent(indent_w: Single); cdecl;
  external SGT_DLL name _PU + 'igUnindent';

procedure igBeginGroup(); cdecl;
  external SGT_DLL name _PU + 'igBeginGroup';

procedure igEndGroup(); cdecl;
  external SGT_DLL name _PU + 'igEndGroup';

procedure igAlignTextToFramePadding(); cdecl;
  external SGT_DLL name _PU + 'igAlignTextToFramePadding';

function igGetTextLineHeight(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetTextLineHeight';

function igGetTextLineHeightWithSpacing(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetTextLineHeightWithSpacing';

function igGetFrameHeight(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetFrameHeight';

function igGetFrameHeightWithSpacing(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetFrameHeightWithSpacing';

procedure igPushID_Str(const str_id: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igPushID_Str';

procedure igPushID_StrStr(const str_id_begin: PUTF8Char; const str_id_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igPushID_StrStr';

procedure igPushID_Ptr(const ptr_id: Pointer); cdecl;
  external SGT_DLL name _PU + 'igPushID_Ptr';

procedure igPushID_Int(int_id: Integer); cdecl;
  external SGT_DLL name _PU + 'igPushID_Int';

procedure igPopID(); cdecl;
  external SGT_DLL name _PU + 'igPopID';

function igGetID_Str(const str_id: PUTF8Char): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetID_Str';

function igGetID_StrStr(const str_id_begin: PUTF8Char; const str_id_end: PUTF8Char): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetID_StrStr';

function igGetID_Ptr(const ptr_id: Pointer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetID_Ptr';

procedure igTextUnformatted(const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igTextUnformatted';

procedure igText(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igText';

procedure igTextV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igTextV';

procedure igTextColored(col: ImVec4; const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igTextColored';

procedure igTextColoredV(col: ImVec4; const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igTextColoredV';

procedure igTextDisabled(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igTextDisabled';

procedure igTextDisabledV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igTextDisabledV';

procedure igTextWrapped(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igTextWrapped';

procedure igTextWrappedV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igTextWrappedV';

procedure igLabelText(const &label: PUTF8Char; const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igLabelText';

procedure igLabelTextV(const &label: PUTF8Char; const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igLabelTextV';

procedure igBulletText(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igBulletText';

procedure igBulletTextV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igBulletTextV';

procedure igSeparatorText(const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igSeparatorText';

function igButton(const &label: PUTF8Char; size: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igButton';

function igSmallButton(const &label: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSmallButton';

function igInvisibleButton(const str_id: PUTF8Char; size: ImVec2; flags: ImGuiButtonFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInvisibleButton';

function igArrowButton(const str_id: PUTF8Char; dir: ImGuiDir): Boolean; cdecl;
  external SGT_DLL name _PU + 'igArrowButton';

function igCheckbox(const &label: PUTF8Char; v: PBoolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCheckbox';

function igCheckboxFlags_IntPtr(const &label: PUTF8Char; flags: PInteger; flags_value: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCheckboxFlags_IntPtr';

function igCheckboxFlags_UintPtr(const &label: PUTF8Char; flags: PCardinal; flags_value: Cardinal): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCheckboxFlags_UintPtr';

function igRadioButton_Bool(const &label: PUTF8Char; active: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igRadioButton_Bool';

function igRadioButton_IntPtr(const &label: PUTF8Char; v: PInteger; v_button: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igRadioButton_IntPtr';

procedure igProgressBar(fraction: Single; size_arg: ImVec2; const overlay: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igProgressBar';

procedure igBullet(); cdecl;
  external SGT_DLL name _PU + 'igBullet';

procedure igImage(user_texture_id: ImTextureID; image_size: ImVec2; uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4); cdecl;
  external SGT_DLL name _PU + 'igImage';

function igImageButton(const str_id: PUTF8Char; user_texture_id: ImTextureID; image_size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImageButton';

function igBeginCombo(const &label: PUTF8Char; const preview_value: PUTF8Char; flags: ImGuiComboFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginCombo';

procedure igEndCombo(); cdecl;
  external SGT_DLL name _PU + 'igEndCombo';

function igCombo_Str_arr(const &label: PUTF8Char; current_item: PInteger; items: PPUTF8Char; items_count: Integer; popup_max_height_in_items: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCombo_Str_arr';

function igCombo_Str(const &label: PUTF8Char; current_item: PInteger; const items_separated_by_zeros: PUTF8Char; popup_max_height_in_items: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCombo_Str';

type
  igCombo_FnStrPtr_getter = function(user_data: Pointer; idx: Integer): PUTF8Char; cdecl;

function igCombo_FnStrPtr(const &label: PUTF8Char; current_item: PInteger; getter: igCombo_FnStrPtr_getter; user_data: Pointer; items_count: Integer; popup_max_height_in_items: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCombo_FnStrPtr';

function igDragFloat(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragFloat';

function igDragFloat2(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragFloat2';

function igDragFloat3(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragFloat3';

function igDragFloat4(const &label: PUTF8Char; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragFloat4';

function igDragFloatRange2(const &label: PUTF8Char; v_current_min: PSingle; v_current_max: PSingle; v_speed: Single; v_min: Single; v_max: Single; const format: PUTF8Char; const format_max: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragFloatRange2';

function igDragInt(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragInt';

function igDragInt2(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragInt2';

function igDragInt3(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragInt3';

function igDragInt4(const &label: PUTF8Char; v: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragInt4';

function igDragIntRange2(const &label: PUTF8Char; v_current_min: PInteger; v_current_max: PInteger; v_speed: Single; v_min: Integer; v_max: Integer; const format: PUTF8Char; const format_max: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragIntRange2';

function igDragScalar(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; v_speed: Single; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragScalar';

function igDragScalarN(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; components: Integer; v_speed: Single; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragScalarN';

function igSliderFloat(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderFloat';

function igSliderFloat2(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderFloat2';

function igSliderFloat3(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderFloat3';

function igSliderFloat4(const &label: PUTF8Char; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderFloat4';

function igSliderAngle(const &label: PUTF8Char; v_rad: PSingle; v_degrees_min: Single; v_degrees_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderAngle';

function igSliderInt(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderInt';

function igSliderInt2(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderInt2';

function igSliderInt3(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderInt3';

function igSliderInt4(const &label: PUTF8Char; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderInt4';

function igSliderScalar(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderScalar';

function igSliderScalarN(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; components: Integer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderScalarN';

function igVSliderFloat(const &label: PUTF8Char; size: ImVec2; v: PSingle; v_min: Single; v_max: Single; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igVSliderFloat';

function igVSliderInt(const &label: PUTF8Char; size: ImVec2; v: PInteger; v_min: Integer; v_max: Integer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igVSliderInt';

function igVSliderScalar(const &label: PUTF8Char; size: ImVec2; data_type: ImGuiDataType; p_data: Pointer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igVSliderScalar';

function igInputText(const &label: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputText';

function igInputTextMultiline(const &label: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt; size: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputTextMultiline';

function igInputTextWithHint(const &label: PUTF8Char; const hint: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputTextWithHint';

function igInputFloat(const &label: PUTF8Char; v: PSingle; step: Single; step_fast: Single; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputFloat';

function igInputFloat2(const &label: PUTF8Char; v: PSingle; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputFloat2';

function igInputFloat3(const &label: PUTF8Char; v: PSingle; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputFloat3';

function igInputFloat4(const &label: PUTF8Char; v: PSingle; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputFloat4';

function igInputInt(const &label: PUTF8Char; v: PInteger; step: Integer; step_fast: Integer; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputInt';

function igInputInt2(const &label: PUTF8Char; v: PInteger; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputInt2';

function igInputInt3(const &label: PUTF8Char; v: PInteger; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputInt3';

function igInputInt4(const &label: PUTF8Char; v: PInteger; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputInt4';

function igInputDouble(const &label: PUTF8Char; v: PDouble; step: Double; step_fast: Double; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputDouble';

function igInputScalar(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const p_step: Pointer; const p_step_fast: Pointer; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputScalar';

function igInputScalarN(const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; components: Integer; const p_step: Pointer; const p_step_fast: Pointer; const format: PUTF8Char; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputScalarN';

function igColorEdit3(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igColorEdit3';

function igColorEdit4(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igColorEdit4';

function igColorPicker3(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igColorPicker3';

function igColorPicker4(const &label: PUTF8Char; col: PSingle; flags: ImGuiColorEditFlags; const ref_col: PSingle): Boolean; cdecl;
  external SGT_DLL name _PU + 'igColorPicker4';

function igColorButton(const desc_id: PUTF8Char; col: ImVec4; flags: ImGuiColorEditFlags; size: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igColorButton';

procedure igSetColorEditOptions(flags: ImGuiColorEditFlags); cdecl;
  external SGT_DLL name _PU + 'igSetColorEditOptions';

function igTreeNode_Str(const &label: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNode_Str';

function igTreeNode_StrStr(const str_id: PUTF8Char; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external SGT_DLL name _PU + 'igTreeNode_StrStr';

function igTreeNode_Ptr(const ptr_id: Pointer; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external SGT_DLL name _PU + 'igTreeNode_Ptr';

function igTreeNodeV_Str(const str_id: PUTF8Char; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeV_Str';

function igTreeNodeV_Ptr(const ptr_id: Pointer; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeV_Ptr';

function igTreeNodeEx_Str(const &label: PUTF8Char; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeEx_Str';

function igTreeNodeEx_StrStr(const str_id: PUTF8Char; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeEx_StrStr';

function igTreeNodeEx_Ptr(const ptr_id: Pointer; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char): Boolean varargs; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeEx_Ptr';

function igTreeNodeExV_Str(const str_id: PUTF8Char; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeExV_Str';

function igTreeNodeExV_Ptr(const ptr_id: Pointer; flags: ImGuiTreeNodeFlags; const fmt: PUTF8Char; args: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeExV_Ptr';

procedure igTreePush_Str(const str_id: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igTreePush_Str';

procedure igTreePush_Ptr(const ptr_id: Pointer); cdecl;
  external SGT_DLL name _PU + 'igTreePush_Ptr';

procedure igTreePop(); cdecl;
  external SGT_DLL name _PU + 'igTreePop';

function igGetTreeNodeToLabelSpacing(): Single; cdecl;
  external SGT_DLL name _PU + 'igGetTreeNodeToLabelSpacing';

function igCollapsingHeader_TreeNodeFlags(const &label: PUTF8Char; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCollapsingHeader_TreeNodeFlags';

function igCollapsingHeader_BoolPtr(const &label: PUTF8Char; p_visible: PBoolean; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCollapsingHeader_BoolPtr';

procedure igSetNextItemOpen(is_open: Boolean; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetNextItemOpen';

function igSelectable_Bool(const &label: PUTF8Char; selected: Boolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSelectable_Bool';

function igSelectable_BoolPtr(const &label: PUTF8Char; p_selected: PBoolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSelectable_BoolPtr';

function igBeginListBox(const &label: PUTF8Char; size: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginListBox';

procedure igEndListBox(); cdecl;
  external SGT_DLL name _PU + 'igEndListBox';

function igListBox_Str_arr(const &label: PUTF8Char; current_item: PInteger; items: PPUTF8Char; items_count: Integer; height_in_items: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igListBox_Str_arr';

type
  igListBox_FnStrPtr_getter = function(user_data: Pointer; idx: Integer): PUTF8Char; cdecl;

function igListBox_FnStrPtr(const &label: PUTF8Char; current_item: PInteger; getter: igListBox_FnStrPtr_getter; user_data: Pointer; items_count: Integer; height_in_items: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igListBox_FnStrPtr';

procedure igPlotLines_FloatPtr(const &label: PUTF8Char; const values: PSingle; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'igPlotLines_FloatPtr';

type
  igPlotLines_FnFloatPtr_values_getter = function(data: Pointer; idx: Integer): Single; cdecl;

procedure igPlotLines_FnFloatPtr(const &label: PUTF8Char; values_getter: igPlotLines_FnFloatPtr_values_getter; data: Pointer; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igPlotLines_FnFloatPtr';

procedure igPlotHistogram_FloatPtr(const &label: PUTF8Char; const values: PSingle; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'igPlotHistogram_FloatPtr';

type
  igPlotHistogram_FnFloatPtr_values_getter = function(data: Pointer; idx: Integer): Single; cdecl;

procedure igPlotHistogram_FnFloatPtr(const &label: PUTF8Char; values_getter: igPlotHistogram_FnFloatPtr_values_getter; data: Pointer; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; graph_size: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igPlotHistogram_FnFloatPtr';

procedure igValue_Bool(const prefix: PUTF8Char; b: Boolean); cdecl;
  external SGT_DLL name _PU + 'igValue_Bool';

procedure igValue_Int(const prefix: PUTF8Char; v: Integer); cdecl;
  external SGT_DLL name _PU + 'igValue_Int';

procedure igValue_Uint(const prefix: PUTF8Char; v: Cardinal); cdecl;
  external SGT_DLL name _PU + 'igValue_Uint';

procedure igValue_Float(const prefix: PUTF8Char; v: Single; const float_format: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igValue_Float';

function igBeginMenuBar(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginMenuBar';

procedure igEndMenuBar(); cdecl;
  external SGT_DLL name _PU + 'igEndMenuBar';

function igBeginMainMenuBar(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginMainMenuBar';

procedure igEndMainMenuBar(); cdecl;
  external SGT_DLL name _PU + 'igEndMainMenuBar';

function igBeginMenu(const &label: PUTF8Char; enabled: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginMenu';

procedure igEndMenu(); cdecl;
  external SGT_DLL name _PU + 'igEndMenu';

function igMenuItem_Bool(const &label: PUTF8Char; const shortcut: PUTF8Char; selected: Boolean; enabled: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igMenuItem_Bool';

function igMenuItem_BoolPtr(const &label: PUTF8Char; const shortcut: PUTF8Char; p_selected: PBoolean; enabled: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igMenuItem_BoolPtr';

function igBeginTooltip(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTooltip';

procedure igEndTooltip(); cdecl;
  external SGT_DLL name _PU + 'igEndTooltip';

procedure igSetTooltip(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igSetTooltip';

procedure igSetTooltipV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igSetTooltipV';

function igBeginItemTooltip(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginItemTooltip';

procedure igSetItemTooltip(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igSetItemTooltip';

procedure igSetItemTooltipV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igSetItemTooltipV';

function igBeginPopup(const str_id: PUTF8Char; flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginPopup';

function igBeginPopupModal(const name: PUTF8Char; p_open: PBoolean; flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginPopupModal';

procedure igEndPopup(); cdecl;
  external SGT_DLL name _PU + 'igEndPopup';

procedure igOpenPopup_Str(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags); cdecl;
  external SGT_DLL name _PU + 'igOpenPopup_Str';

procedure igOpenPopup_ID(id: ImGuiID; popup_flags: ImGuiPopupFlags); cdecl;
  external SGT_DLL name _PU + 'igOpenPopup_ID';

procedure igOpenPopupOnItemClick(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags); cdecl;
  external SGT_DLL name _PU + 'igOpenPopupOnItemClick';

procedure igCloseCurrentPopup(); cdecl;
  external SGT_DLL name _PU + 'igCloseCurrentPopup';

function igBeginPopupContextItem(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginPopupContextItem';

function igBeginPopupContextWindow(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginPopupContextWindow';

function igBeginPopupContextVoid(const str_id: PUTF8Char; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginPopupContextVoid';

function igIsPopupOpen_Str(const str_id: PUTF8Char; flags: ImGuiPopupFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsPopupOpen_Str';

function igBeginTable(const str_id: PUTF8Char; column: Integer; flags: ImGuiTableFlags; outer_size: ImVec2; inner_width: Single): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTable';

procedure igEndTable(); cdecl;
  external SGT_DLL name _PU + 'igEndTable';

procedure igTableNextRow(row_flags: ImGuiTableRowFlags; min_row_height: Single); cdecl;
  external SGT_DLL name _PU + 'igTableNextRow';

function igTableNextColumn(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTableNextColumn';

function igTableSetColumnIndex(column_n: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTableSetColumnIndex';

procedure igTableSetupColumn(const &label: PUTF8Char; flags: ImGuiTableColumnFlags; init_width_or_weight: Single; user_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igTableSetupColumn';

procedure igTableSetupScrollFreeze(cols: Integer; rows: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableSetupScrollFreeze';

procedure igTableHeader(const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igTableHeader';

procedure igTableHeadersRow(); cdecl;
  external SGT_DLL name _PU + 'igTableHeadersRow';

procedure igTableAngledHeadersRow(); cdecl;
  external SGT_DLL name _PU + 'igTableAngledHeadersRow';

function igTableGetSortSpecs(): PImGuiTableSortSpecs; cdecl;
  external SGT_DLL name _PU + 'igTableGetSortSpecs';

function igTableGetColumnCount(): Integer; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnCount';

function igTableGetColumnIndex(): Integer; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnIndex';

function igTableGetRowIndex(): Integer; cdecl;
  external SGT_DLL name _PU + 'igTableGetRowIndex';

function igTableGetColumnName_Int(column_n: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnName_Int';

function igTableGetColumnFlags(column_n: Integer): ImGuiTableColumnFlags; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnFlags';

procedure igTableSetColumnEnabled(column_n: Integer; v: Boolean); cdecl;
  external SGT_DLL name _PU + 'igTableSetColumnEnabled';

procedure igTableSetBgColor(target: ImGuiTableBgTarget; color: ImU32; column_n: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableSetBgColor';

procedure igColumns(count: Integer; const id: PUTF8Char; border: Boolean); cdecl;
  external SGT_DLL name _PU + 'igColumns';

procedure igNextColumn(); cdecl;
  external SGT_DLL name _PU + 'igNextColumn';

function igGetColumnIndex(): Integer; cdecl;
  external SGT_DLL name _PU + 'igGetColumnIndex';

function igGetColumnWidth(column_index: Integer): Single; cdecl;
  external SGT_DLL name _PU + 'igGetColumnWidth';

procedure igSetColumnWidth(column_index: Integer; width: Single); cdecl;
  external SGT_DLL name _PU + 'igSetColumnWidth';

function igGetColumnOffset(column_index: Integer): Single; cdecl;
  external SGT_DLL name _PU + 'igGetColumnOffset';

procedure igSetColumnOffset(column_index: Integer; offset_x: Single); cdecl;
  external SGT_DLL name _PU + 'igSetColumnOffset';

function igGetColumnsCount(): Integer; cdecl;
  external SGT_DLL name _PU + 'igGetColumnsCount';

function igBeginTabBar(const str_id: PUTF8Char; flags: ImGuiTabBarFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTabBar';

procedure igEndTabBar(); cdecl;
  external SGT_DLL name _PU + 'igEndTabBar';

function igBeginTabItem(const &label: PUTF8Char; p_open: PBoolean; flags: ImGuiTabItemFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTabItem';

procedure igEndTabItem(); cdecl;
  external SGT_DLL name _PU + 'igEndTabItem';

function igTabItemButton(const &label: PUTF8Char; flags: ImGuiTabItemFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTabItemButton';

procedure igSetTabItemClosed(const tab_or_docked_window_label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igSetTabItemClosed';

function igDockSpace(id: ImGuiID; size: ImVec2; flags: ImGuiDockNodeFlags; const window_class: PImGuiWindowClass): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igDockSpace';

function igDockSpaceOverViewport(const viewport: PImGuiViewport; flags: ImGuiDockNodeFlags; const window_class: PImGuiWindowClass): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igDockSpaceOverViewport';

procedure igSetNextWindowDockID(dock_id: ImGuiID; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowDockID';

procedure igSetNextWindowClass(const window_class: PImGuiWindowClass); cdecl;
  external SGT_DLL name _PU + 'igSetNextWindowClass';

function igGetWindowDockID(): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetWindowDockID';

function igIsWindowDocked(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowDocked';

procedure igLogToTTY(auto_open_depth: Integer); cdecl;
  external SGT_DLL name _PU + 'igLogToTTY';

procedure igLogToFile(auto_open_depth: Integer; const filename: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igLogToFile';

procedure igLogToClipboard(auto_open_depth: Integer); cdecl;
  external SGT_DLL name _PU + 'igLogToClipboard';

procedure igLogFinish(); cdecl;
  external SGT_DLL name _PU + 'igLogFinish';

procedure igLogButtons(); cdecl;
  external SGT_DLL name _PU + 'igLogButtons';

procedure igLogTextV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igLogTextV';

function igBeginDragDropSource(flags: ImGuiDragDropFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginDragDropSource';

function igSetDragDropPayload(const &type: PUTF8Char; const data: Pointer; sz: NativeUInt; cond: ImGuiCond): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSetDragDropPayload';

procedure igEndDragDropSource(); cdecl;
  external SGT_DLL name _PU + 'igEndDragDropSource';

function igBeginDragDropTarget(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginDragDropTarget';

function igAcceptDragDropPayload(const &type: PUTF8Char; flags: ImGuiDragDropFlags): PImGuiPayload; cdecl;
  external SGT_DLL name _PU + 'igAcceptDragDropPayload';

procedure igEndDragDropTarget(); cdecl;
  external SGT_DLL name _PU + 'igEndDragDropTarget';

function igGetDragDropPayload(): PImGuiPayload; cdecl;
  external SGT_DLL name _PU + 'igGetDragDropPayload';

procedure igBeginDisabled(disabled: Boolean); cdecl;
  external SGT_DLL name _PU + 'igBeginDisabled';

procedure igEndDisabled(); cdecl;
  external SGT_DLL name _PU + 'igEndDisabled';

procedure igPushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean); cdecl;
  external SGT_DLL name _PU + 'igPushClipRect';

procedure igPopClipRect(); cdecl;
  external SGT_DLL name _PU + 'igPopClipRect';

procedure igSetItemDefaultFocus(); cdecl;
  external SGT_DLL name _PU + 'igSetItemDefaultFocus';

procedure igSetKeyboardFocusHere(offset: Integer); cdecl;
  external SGT_DLL name _PU + 'igSetKeyboardFocusHere';

procedure igSetNextItemAllowOverlap(); cdecl;
  external SGT_DLL name _PU + 'igSetNextItemAllowOverlap';

function igIsItemHovered(flags: ImGuiHoveredFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemHovered';

function igIsItemActive(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemActive';

function igIsItemFocused(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemFocused';

function igIsItemClicked(mouse_button: ImGuiMouseButton): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemClicked';

function igIsItemVisible(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemVisible';

function igIsItemEdited(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemEdited';

function igIsItemActivated(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemActivated';

function igIsItemDeactivated(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemDeactivated';

function igIsItemDeactivatedAfterEdit(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemDeactivatedAfterEdit';

function igIsItemToggledOpen(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemToggledOpen';

function igIsAnyItemHovered(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsAnyItemHovered';

function igIsAnyItemActive(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsAnyItemActive';

function igIsAnyItemFocused(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsAnyItemFocused';

function igGetItemID(): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetItemID';

procedure igGetItemRectMin(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetItemRectMin';

procedure igGetItemRectMax(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetItemRectMax';

procedure igGetItemRectSize(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetItemRectSize';

function igGetMainViewport(): PImGuiViewport; cdecl;
  external SGT_DLL name _PU + 'igGetMainViewport';

function igGetBackgroundDrawList_Nil(): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'igGetBackgroundDrawList_Nil';

function igGetForegroundDrawList_Nil(): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'igGetForegroundDrawList_Nil';

function igGetBackgroundDrawList_ViewportPtr(viewport: PImGuiViewport): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'igGetBackgroundDrawList_ViewportPtr';

function igGetForegroundDrawList_ViewportPtr(viewport: PImGuiViewport): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'igGetForegroundDrawList_ViewportPtr';

function igIsRectVisible_Nil(size: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsRectVisible_Nil';

function igIsRectVisible_Vec2(rect_min: ImVec2; rect_max: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsRectVisible_Vec2';

function igGetTime(): Double; cdecl;
  external SGT_DLL name _PU + 'igGetTime';

function igGetFrameCount(): Integer; cdecl;
  external SGT_DLL name _PU + 'igGetFrameCount';

function igGetDrawListSharedData(): PImDrawListSharedData; cdecl;
  external SGT_DLL name _PU + 'igGetDrawListSharedData';

function igGetStyleColorName(idx: ImGuiCol): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igGetStyleColorName';

procedure igSetStateStorage(storage: PImGuiStorage); cdecl;
  external SGT_DLL name _PU + 'igSetStateStorage';

function igGetStateStorage(): PImGuiStorage; cdecl;
  external SGT_DLL name _PU + 'igGetStateStorage';

procedure igCalcTextSize(pOut: PImVec2; const text: PUTF8Char; const text_end: PUTF8Char; hide_text_after_double_hash: Boolean; wrap_width: Single); cdecl;
  external SGT_DLL name _PU + 'igCalcTextSize';

procedure igColorConvertU32ToFloat4(pOut: PImVec4; &in: ImU32); cdecl;
  external SGT_DLL name _PU + 'igColorConvertU32ToFloat4';

function igColorConvertFloat4ToU32(&in: ImVec4): ImU32; cdecl;
  external SGT_DLL name _PU + 'igColorConvertFloat4ToU32';

procedure igColorConvertRGBtoHSV(r: Single; g: Single; b: Single; out_h: PSingle; out_s: PSingle; out_v: PSingle); cdecl;
  external SGT_DLL name _PU + 'igColorConvertRGBtoHSV';

procedure igColorConvertHSVtoRGB(h: Single; s: Single; v: Single; out_r: PSingle; out_g: PSingle; out_b: PSingle); cdecl;
  external SGT_DLL name _PU + 'igColorConvertHSVtoRGB';

function igIsKeyDown_Nil(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyDown_Nil';

function igIsKeyPressed_Bool(key: ImGuiKey; &repeat: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyPressed_Bool';

function igIsKeyReleased_Nil(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyReleased_Nil';

function igIsKeyChordPressed_Nil(key_chord: ImGuiKeyChord): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyChordPressed_Nil';

function igGetKeyPressedAmount(key: ImGuiKey; repeat_delay: Single; rate: Single): Integer; cdecl;
  external SGT_DLL name _PU + 'igGetKeyPressedAmount';

function igGetKeyName(key: ImGuiKey): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igGetKeyName';

procedure igSetNextFrameWantCaptureKeyboard(want_capture_keyboard: Boolean); cdecl;
  external SGT_DLL name _PU + 'igSetNextFrameWantCaptureKeyboard';

function igIsMouseDown_Nil(button: ImGuiMouseButton): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseDown_Nil';

function igIsMouseClicked_Bool(button: ImGuiMouseButton; &repeat: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseClicked_Bool';

function igIsMouseReleased_Nil(button: ImGuiMouseButton): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseReleased_Nil';

function igIsMouseDoubleClicked_Nil(button: ImGuiMouseButton): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseDoubleClicked_Nil';

function igGetMouseClickedCount(button: ImGuiMouseButton): Integer; cdecl;
  external SGT_DLL name _PU + 'igGetMouseClickedCount';

function igIsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2; clip: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseHoveringRect';

function igIsMousePosValid(const mouse_pos: PImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMousePosValid';

function igIsAnyMouseDown(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsAnyMouseDown';

procedure igGetMousePos(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetMousePos';

procedure igGetMousePosOnOpeningCurrentPopup(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetMousePosOnOpeningCurrentPopup';

function igIsMouseDragging(button: ImGuiMouseButton; lock_threshold: Single): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseDragging';

procedure igGetMouseDragDelta(pOut: PImVec2; button: ImGuiMouseButton; lock_threshold: Single); cdecl;
  external SGT_DLL name _PU + 'igGetMouseDragDelta';

procedure igResetMouseDragDelta(button: ImGuiMouseButton); cdecl;
  external SGT_DLL name _PU + 'igResetMouseDragDelta';

function igGetMouseCursor(): ImGuiMouseCursor; cdecl;
  external SGT_DLL name _PU + 'igGetMouseCursor';

procedure igSetMouseCursor(cursor_type: ImGuiMouseCursor); cdecl;
  external SGT_DLL name _PU + 'igSetMouseCursor';

procedure igSetNextFrameWantCaptureMouse(want_capture_mouse: Boolean); cdecl;
  external SGT_DLL name _PU + 'igSetNextFrameWantCaptureMouse';

function igGetClipboardText(): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igGetClipboardText';

procedure igSetClipboardText(const text: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igSetClipboardText';

procedure igLoadIniSettingsFromDisk(const ini_filename: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igLoadIniSettingsFromDisk';

procedure igLoadIniSettingsFromMemory(const ini_data: PUTF8Char; ini_size: NativeUInt); cdecl;
  external SGT_DLL name _PU + 'igLoadIniSettingsFromMemory';

procedure igSaveIniSettingsToDisk(const ini_filename: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igSaveIniSettingsToDisk';

function igSaveIniSettingsToMemory(out_ini_size: PNativeUInt): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igSaveIniSettingsToMemory';

procedure igDebugTextEncoding(const text: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugTextEncoding';

procedure igDebugFlashStyleColor(idx: ImGuiCol); cdecl;
  external SGT_DLL name _PU + 'igDebugFlashStyleColor';

procedure igDebugStartItemPicker(); cdecl;
  external SGT_DLL name _PU + 'igDebugStartItemPicker';

function igDebugCheckVersionAndDataLayout(const version_str: PUTF8Char; sz_io: NativeUInt; sz_style: NativeUInt; sz_vec2: NativeUInt; sz_vec4: NativeUInt; sz_drawvert: NativeUInt; sz_drawidx: NativeUInt): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDebugCheckVersionAndDataLayout';

procedure igSetAllocatorFunctions(alloc_func: ImGuiMemAllocFunc; free_func: ImGuiMemFreeFunc; user_data: Pointer); cdecl;
  external SGT_DLL name _PU + 'igSetAllocatorFunctions';

procedure igGetAllocatorFunctions(p_alloc_func: PImGuiMemAllocFunc; p_free_func: PImGuiMemFreeFunc; p_user_data: PPointer); cdecl;
  external SGT_DLL name _PU + 'igGetAllocatorFunctions';

function igMemAlloc(size: NativeUInt): Pointer; cdecl;
  external SGT_DLL name _PU + 'igMemAlloc';

procedure igMemFree(ptr: Pointer); cdecl;
  external SGT_DLL name _PU + 'igMemFree';

function igGetPlatformIO(): PImGuiPlatformIO; cdecl;
  external SGT_DLL name _PU + 'igGetPlatformIO';

procedure igUpdatePlatformWindows(); cdecl;
  external SGT_DLL name _PU + 'igUpdatePlatformWindows';

procedure igRenderPlatformWindowsDefault(platform_render_arg: Pointer; renderer_render_arg: Pointer); cdecl;
  external SGT_DLL name _PU + 'igRenderPlatformWindowsDefault';

procedure igDestroyPlatformWindows(); cdecl;
  external SGT_DLL name _PU + 'igDestroyPlatformWindows';

function igFindViewportByID(id: ImGuiID): PImGuiViewport; cdecl;
  external SGT_DLL name _PU + 'igFindViewportByID';

function igFindViewportByPlatformHandle(platform_handle: Pointer): PImGuiViewport; cdecl;
  external SGT_DLL name _PU + 'igFindViewportByPlatformHandle';

function ImGuiTableSortSpecs_ImGuiTableSortSpecs(): PImGuiTableSortSpecs; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableSortSpecs_ImGuiTableSortSpecs';

procedure ImGuiTableSortSpecs_destroy(self: PImGuiTableSortSpecs); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableSortSpecs_destroy';

function ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs(): PImGuiTableColumnSortSpecs; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableColumnSortSpecs_ImGuiTableColumnSortSpecs';

procedure ImGuiTableColumnSortSpecs_destroy(self: PImGuiTableColumnSortSpecs); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableColumnSortSpecs_destroy';

function ImGuiStyle_ImGuiStyle(): PImGuiStyle; cdecl;
  external SGT_DLL name _PU + 'ImGuiStyle_ImGuiStyle';

procedure ImGuiStyle_destroy(self: PImGuiStyle); cdecl;
  external SGT_DLL name _PU + 'ImGuiStyle_destroy';

procedure ImGuiStyle_ScaleAllSizes(self: PImGuiStyle; scale_factor: Single); cdecl;
  external SGT_DLL name _PU + 'ImGuiStyle_ScaleAllSizes';

procedure ImGuiIO_AddKeyEvent(self: PImGuiIO; key: ImGuiKey; down: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddKeyEvent';

procedure ImGuiIO_AddKeyAnalogEvent(self: PImGuiIO; key: ImGuiKey; down: Boolean; v: Single); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddKeyAnalogEvent';

procedure ImGuiIO_AddMousePosEvent(self: PImGuiIO; x: Single; y: Single); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddMousePosEvent';

procedure ImGuiIO_AddMouseButtonEvent(self: PImGuiIO; button: Integer; down: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddMouseButtonEvent';

procedure ImGuiIO_AddMouseWheelEvent(self: PImGuiIO; wheel_x: Single; wheel_y: Single); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddMouseWheelEvent';

procedure ImGuiIO_AddMouseSourceEvent(self: PImGuiIO; source: ImGuiMouseSource); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddMouseSourceEvent';

procedure ImGuiIO_AddMouseViewportEvent(self: PImGuiIO; id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddMouseViewportEvent';

procedure ImGuiIO_AddFocusEvent(self: PImGuiIO; focused: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddFocusEvent';

procedure ImGuiIO_AddInputCharacter(self: PImGuiIO; c: Cardinal); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddInputCharacter';

procedure ImGuiIO_AddInputCharacterUTF16(self: PImGuiIO; c: ImWchar16); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddInputCharacterUTF16';

procedure ImGuiIO_AddInputCharactersUTF8(self: PImGuiIO; const str: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_AddInputCharactersUTF8';

procedure ImGuiIO_SetKeyEventNativeData(self: PImGuiIO; key: ImGuiKey; native_keycode: Integer; native_scancode: Integer; native_legacy_index: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_SetKeyEventNativeData';

procedure ImGuiIO_SetAppAcceptingEvents(self: PImGuiIO; accepting_events: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_SetAppAcceptingEvents';

procedure ImGuiIO_ClearEventsQueue(self: PImGuiIO); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_ClearEventsQueue';

procedure ImGuiIO_ClearInputKeys(self: PImGuiIO); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_ClearInputKeys';

function ImGuiIO_ImGuiIO(): PImGuiIO; cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_ImGuiIO';

procedure ImGuiIO_destroy(self: PImGuiIO); cdecl;
  external SGT_DLL name _PU + 'ImGuiIO_destroy';

function ImGuiInputTextCallbackData_ImGuiInputTextCallbackData(): PImGuiInputTextCallbackData; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_ImGuiInputTextCallbackData';

procedure ImGuiInputTextCallbackData_destroy(self: PImGuiInputTextCallbackData); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_destroy';

procedure ImGuiInputTextCallbackData_DeleteChars(self: PImGuiInputTextCallbackData; pos: Integer; bytes_count: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_DeleteChars';

procedure ImGuiInputTextCallbackData_InsertChars(self: PImGuiInputTextCallbackData; pos: Integer; const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_InsertChars';

procedure ImGuiInputTextCallbackData_SelectAll(self: PImGuiInputTextCallbackData); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_SelectAll';

procedure ImGuiInputTextCallbackData_ClearSelection(self: PImGuiInputTextCallbackData); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_ClearSelection';

function ImGuiInputTextCallbackData_HasSelection(self: PImGuiInputTextCallbackData): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextCallbackData_HasSelection';

function ImGuiWindowClass_ImGuiWindowClass(): PImGuiWindowClass; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindowClass_ImGuiWindowClass';

procedure ImGuiWindowClass_destroy(self: PImGuiWindowClass); cdecl;
  external SGT_DLL name _PU + 'ImGuiWindowClass_destroy';

function ImGuiPayload_ImGuiPayload(): PImGuiPayload; cdecl;
  external SGT_DLL name _PU + 'ImGuiPayload_ImGuiPayload';

procedure ImGuiPayload_destroy(self: PImGuiPayload); cdecl;
  external SGT_DLL name _PU + 'ImGuiPayload_destroy';

procedure ImGuiPayload_Clear(self: PImGuiPayload); cdecl;
  external SGT_DLL name _PU + 'ImGuiPayload_Clear';

function ImGuiPayload_IsDataType(self: PImGuiPayload; const &type: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiPayload_IsDataType';

function ImGuiPayload_IsPreview(self: PImGuiPayload): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiPayload_IsPreview';

function ImGuiPayload_IsDelivery(self: PImGuiPayload): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiPayload_IsDelivery';

function ImGuiOnceUponAFrame_ImGuiOnceUponAFrame(): PImGuiOnceUponAFrame; cdecl;
  external SGT_DLL name _PU + 'ImGuiOnceUponAFrame_ImGuiOnceUponAFrame';

procedure ImGuiOnceUponAFrame_destroy(self: PImGuiOnceUponAFrame); cdecl;
  external SGT_DLL name _PU + 'ImGuiOnceUponAFrame_destroy';

function ImGuiTextFilter_ImGuiTextFilter(const default_filter: PUTF8Char): PImGuiTextFilter; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_ImGuiTextFilter';

procedure ImGuiTextFilter_destroy(self: PImGuiTextFilter); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_destroy';

function ImGuiTextFilter_Draw(self: PImGuiTextFilter; const &label: PUTF8Char; width: Single): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_Draw';

function ImGuiTextFilter_PassFilter(self: PImGuiTextFilter; const text: PUTF8Char; const text_end: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_PassFilter';

procedure ImGuiTextFilter_Build(self: PImGuiTextFilter); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_Build';

procedure ImGuiTextFilter_Clear(self: PImGuiTextFilter); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_Clear';

function ImGuiTextFilter_IsActive(self: PImGuiTextFilter): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextFilter_IsActive';

function ImGuiTextRange_ImGuiTextRange_Nil(): PImGuiTextRange; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextRange_ImGuiTextRange_Nil';

procedure ImGuiTextRange_destroy(self: PImGuiTextRange); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextRange_destroy';

function ImGuiTextRange_ImGuiTextRange_Str(const _b: PUTF8Char; const _e: PUTF8Char): PImGuiTextRange; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextRange_ImGuiTextRange_Str';

function ImGuiTextRange_empty(self: PImGuiTextRange): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextRange_empty';

procedure ImGuiTextRange_split(self: PImGuiTextRange; separator: UTF8Char; &out: PImVector_ImGuiTextRange); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextRange_split';

function ImGuiTextBuffer_ImGuiTextBuffer(): PImGuiTextBuffer; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_ImGuiTextBuffer';

procedure ImGuiTextBuffer_destroy(self: PImGuiTextBuffer); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_destroy';

function ImGuiTextBuffer_begin(self: PImGuiTextBuffer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_begin';

function ImGuiTextBuffer_end(self: PImGuiTextBuffer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_end';

function ImGuiTextBuffer_size(self: PImGuiTextBuffer): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_size';

function ImGuiTextBuffer_empty(self: PImGuiTextBuffer): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_empty';

procedure ImGuiTextBuffer_clear(self: PImGuiTextBuffer); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_clear';

procedure ImGuiTextBuffer_reserve(self: PImGuiTextBuffer; capacity: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_reserve';

function ImGuiTextBuffer_c_str(self: PImGuiTextBuffer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_c_str';

procedure ImGuiTextBuffer_append(self: PImGuiTextBuffer; const str: PUTF8Char; const str_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_append';

procedure ImGuiTextBuffer_appendfv(self: PImGuiTextBuffer; const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_appendfv';

function ImGuiStoragePair_ImGuiStoragePair_Int(_key: ImGuiID; _val: Integer): PImGuiStoragePair; cdecl;
  external SGT_DLL name _PU + 'ImGuiStoragePair_ImGuiStoragePair_Int';

procedure ImGuiStoragePair_destroy(self: PImGuiStoragePair); cdecl;
  external SGT_DLL name _PU + 'ImGuiStoragePair_destroy';

function ImGuiStoragePair_ImGuiStoragePair_Float(_key: ImGuiID; _val: Single): PImGuiStoragePair; cdecl;
  external SGT_DLL name _PU + 'ImGuiStoragePair_ImGuiStoragePair_Float';

function ImGuiStoragePair_ImGuiStoragePair_Ptr(_key: ImGuiID; _val: Pointer): PImGuiStoragePair; cdecl;
  external SGT_DLL name _PU + 'ImGuiStoragePair_ImGuiStoragePair_Ptr';

procedure ImGuiStorage_Clear(self: PImGuiStorage); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_Clear';

function ImGuiStorage_GetInt(self: PImGuiStorage; key: ImGuiID; default_val: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetInt';

procedure ImGuiStorage_SetInt(self: PImGuiStorage; key: ImGuiID; val: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_SetInt';

function ImGuiStorage_GetBool(self: PImGuiStorage; key: ImGuiID; default_val: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetBool';

procedure ImGuiStorage_SetBool(self: PImGuiStorage; key: ImGuiID; val: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_SetBool';

function ImGuiStorage_GetFloat(self: PImGuiStorage; key: ImGuiID; default_val: Single): Single; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetFloat';

procedure ImGuiStorage_SetFloat(self: PImGuiStorage; key: ImGuiID; val: Single); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_SetFloat';

function ImGuiStorage_GetVoidPtr(self: PImGuiStorage; key: ImGuiID): Pointer; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetVoidPtr';

procedure ImGuiStorage_SetVoidPtr(self: PImGuiStorage; key: ImGuiID; val: Pointer); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_SetVoidPtr';

function ImGuiStorage_GetIntRef(self: PImGuiStorage; key: ImGuiID; default_val: Integer): PInteger; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetIntRef';

function ImGuiStorage_GetBoolRef(self: PImGuiStorage; key: ImGuiID; default_val: Boolean): PBoolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetBoolRef';

function ImGuiStorage_GetFloatRef(self: PImGuiStorage; key: ImGuiID; default_val: Single): PSingle; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetFloatRef';

function ImGuiStorage_GetVoidPtrRef(self: PImGuiStorage; key: ImGuiID; default_val: Pointer): PPointer; cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_GetVoidPtrRef';

procedure ImGuiStorage_BuildSortByKey(self: PImGuiStorage); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_BuildSortByKey';

procedure ImGuiStorage_SetAllInt(self: PImGuiStorage; val: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiStorage_SetAllInt';

function ImGuiListClipper_ImGuiListClipper(): PImGuiListClipper; cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_ImGuiListClipper';

procedure ImGuiListClipper_destroy(self: PImGuiListClipper); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_destroy';

procedure ImGuiListClipper_Begin(self: PImGuiListClipper; items_count: Integer; items_height: Single); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_Begin';

procedure ImGuiListClipper_End(self: PImGuiListClipper); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_End';

function ImGuiListClipper_Step(self: PImGuiListClipper): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_Step';

procedure ImGuiListClipper_IncludeItemByIndex(self: PImGuiListClipper; item_index: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_IncludeItemByIndex';

procedure ImGuiListClipper_IncludeItemsByIndex(self: PImGuiListClipper; item_begin: Integer; item_end: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipper_IncludeItemsByIndex';

function ImColor_ImColor_Nil(): PImColor; cdecl;
  external SGT_DLL name _PU + 'ImColor_ImColor_Nil';

procedure ImColor_destroy(self: PImColor); cdecl;
  external SGT_DLL name _PU + 'ImColor_destroy';

function ImColor_ImColor_Float(r: Single; g: Single; b: Single; a: Single): PImColor; cdecl;
  external SGT_DLL name _PU + 'ImColor_ImColor_Float';

function ImColor_ImColor_Vec4(col: ImVec4): PImColor; cdecl;
  external SGT_DLL name _PU + 'ImColor_ImColor_Vec4';

function ImColor_ImColor_Int(r: Integer; g: Integer; b: Integer; a: Integer): PImColor; cdecl;
  external SGT_DLL name _PU + 'ImColor_ImColor_Int';

function ImColor_ImColor_U32(rgba: ImU32): PImColor; cdecl;
  external SGT_DLL name _PU + 'ImColor_ImColor_U32';

procedure ImColor_SetHSV(self: PImColor; h: Single; s: Single; v: Single; a: Single); cdecl;
  external SGT_DLL name _PU + 'ImColor_SetHSV';

procedure ImColor_HSV(pOut: PImColor; h: Single; s: Single; v: Single; a: Single); cdecl;
  external SGT_DLL name _PU + 'ImColor_HSV';

function ImDrawCmd_ImDrawCmd(): PImDrawCmd; cdecl;
  external SGT_DLL name _PU + 'ImDrawCmd_ImDrawCmd';

procedure ImDrawCmd_destroy(self: PImDrawCmd); cdecl;
  external SGT_DLL name _PU + 'ImDrawCmd_destroy';

function ImDrawCmd_GetTexID(self: PImDrawCmd): ImTextureID; cdecl;
  external SGT_DLL name _PU + 'ImDrawCmd_GetTexID';

function ImDrawListSplitter_ImDrawListSplitter(): PImDrawListSplitter; cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_ImDrawListSplitter';

procedure ImDrawListSplitter_destroy(self: PImDrawListSplitter); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_destroy';

procedure ImDrawListSplitter_Clear(self: PImDrawListSplitter); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_Clear';

procedure ImDrawListSplitter_ClearFreeMemory(self: PImDrawListSplitter); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_ClearFreeMemory';

procedure ImDrawListSplitter_Split(self: PImDrawListSplitter; draw_list: PImDrawList; count: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_Split';

procedure ImDrawListSplitter_Merge(self: PImDrawListSplitter; draw_list: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_Merge';

procedure ImDrawListSplitter_SetCurrentChannel(self: PImDrawListSplitter; draw_list: PImDrawList; channel_idx: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSplitter_SetCurrentChannel';

function ImDrawList_ImDrawList(shared_data: PImDrawListSharedData): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'ImDrawList_ImDrawList';

procedure ImDrawList_destroy(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_destroy';

procedure ImDrawList_PushClipRect(self: PImDrawList; clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PushClipRect';

procedure ImDrawList_PushClipRectFullScreen(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PushClipRectFullScreen';

procedure ImDrawList_PopClipRect(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PopClipRect';

procedure ImDrawList_PushTextureID(self: PImDrawList; texture_id: ImTextureID); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PushTextureID';

procedure ImDrawList_PopTextureID(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PopTextureID';

procedure ImDrawList_GetClipRectMin(pOut: PImVec2; self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_GetClipRectMin';

procedure ImDrawList_GetClipRectMax(pOut: PImVec2; self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_GetClipRectMax';

procedure ImDrawList_AddLine(self: PImDrawList; p1: ImVec2; p2: ImVec2; col: ImU32; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddLine';

procedure ImDrawList_AddRect(self: PImDrawList; p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddRect';

procedure ImDrawList_AddRectFilled(self: PImDrawList; p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddRectFilled';

procedure ImDrawList_AddRectFilledMultiColor(self: PImDrawList; p_min: ImVec2; p_max: ImVec2; col_upr_left: ImU32; col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddRectFilledMultiColor';

procedure ImDrawList_AddQuad(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddQuad';

procedure ImDrawList_AddQuadFilled(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddQuadFilled';

procedure ImDrawList_AddTriangle(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddTriangle';

procedure ImDrawList_AddTriangleFilled(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddTriangleFilled';

procedure ImDrawList_AddCircle(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddCircle';

procedure ImDrawList_AddCircleFilled(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddCircleFilled';

procedure ImDrawList_AddNgon(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddNgon';

procedure ImDrawList_AddNgonFilled(self: PImDrawList; center: ImVec2; radius: Single; col: ImU32; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddNgonFilled';

procedure ImDrawList_AddEllipse(self: PImDrawList; center: ImVec2; radius_x: Single; radius_y: Single; col: ImU32; rot: Single; num_segments: Integer; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddEllipse';

procedure ImDrawList_AddEllipseFilled(self: PImDrawList; center: ImVec2; radius_x: Single; radius_y: Single; col: ImU32; rot: Single; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddEllipseFilled';

procedure ImDrawList_AddText_Vec2(self: PImDrawList; pos: ImVec2; col: ImU32; const text_begin: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddText_Vec2';

procedure ImDrawList_AddText_FontPtr(self: PImDrawList; const font: PImFont; font_size: Single; pos: ImVec2; col: ImU32; const text_begin: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single; const cpu_fine_clip_rect: PImVec4); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddText_FontPtr';

procedure ImDrawList_AddPolyline(self: PImDrawList; const points: PImVec2; num_points: Integer; col: ImU32; flags: ImDrawFlags; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddPolyline';

procedure ImDrawList_AddConvexPolyFilled(self: PImDrawList; const points: PImVec2; num_points: Integer; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddConvexPolyFilled';

procedure ImDrawList_AddBezierCubic(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddBezierCubic';

procedure ImDrawList_AddBezierQuadratic(self: PImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32; thickness: Single; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddBezierQuadratic';

procedure ImDrawList_AddImage(self: PImDrawList; user_texture_id: ImTextureID; p_min: ImVec2; p_max: ImVec2; uv_min: ImVec2; uv_max: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddImage';

procedure ImDrawList_AddImageQuad(self: PImDrawList; user_texture_id: ImTextureID; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; uv1: ImVec2; uv2: ImVec2; uv3: ImVec2; uv4: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddImageQuad';

procedure ImDrawList_AddImageRounded(self: PImDrawList; user_texture_id: ImTextureID; p_min: ImVec2; p_max: ImVec2; uv_min: ImVec2; uv_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddImageRounded';

procedure ImDrawList_PathClear(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathClear';

procedure ImDrawList_PathLineTo(self: PImDrawList; pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathLineTo';

procedure ImDrawList_PathLineToMergeDuplicate(self: PImDrawList; pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathLineToMergeDuplicate';

procedure ImDrawList_PathFillConvex(self: PImDrawList; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathFillConvex';

procedure ImDrawList_PathStroke(self: PImDrawList; col: ImU32; flags: ImDrawFlags; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathStroke';

procedure ImDrawList_PathArcTo(self: PImDrawList; center: ImVec2; radius: Single; a_min: Single; a_max: Single; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathArcTo';

procedure ImDrawList_PathArcToFast(self: PImDrawList; center: ImVec2; radius: Single; a_min_of_12: Integer; a_max_of_12: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathArcToFast';

procedure ImDrawList_PathEllipticalArcTo(self: PImDrawList; center: ImVec2; radius_x: Single; radius_y: Single; rot: Single; a_min: Single; a_max: Single; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathEllipticalArcTo';

procedure ImDrawList_PathBezierCubicCurveTo(self: PImDrawList; p2: ImVec2; p3: ImVec2; p4: ImVec2; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathBezierCubicCurveTo';

procedure ImDrawList_PathBezierQuadraticCurveTo(self: PImDrawList; p2: ImVec2; p3: ImVec2; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathBezierQuadraticCurveTo';

procedure ImDrawList_PathRect(self: PImDrawList; rect_min: ImVec2; rect_max: ImVec2; rounding: Single; flags: ImDrawFlags); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PathRect';

procedure ImDrawList_AddCallback(self: PImDrawList; callback: ImDrawCallback; callback_data: Pointer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddCallback';

procedure ImDrawList_AddDrawCmd(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_AddDrawCmd';

function ImDrawList_CloneOutput(self: PImDrawList): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'ImDrawList_CloneOutput';

procedure ImDrawList_ChannelsSplit(self: PImDrawList; count: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_ChannelsSplit';

procedure ImDrawList_ChannelsMerge(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_ChannelsMerge';

procedure ImDrawList_ChannelsSetCurrent(self: PImDrawList; n: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_ChannelsSetCurrent';

procedure ImDrawList_PrimReserve(self: PImDrawList; idx_count: Integer; vtx_count: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimReserve';

procedure ImDrawList_PrimUnreserve(self: PImDrawList; idx_count: Integer; vtx_count: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimUnreserve';

procedure ImDrawList_PrimRect(self: PImDrawList; a: ImVec2; b: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimRect';

procedure ImDrawList_PrimRectUV(self: PImDrawList; a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimRectUV';

procedure ImDrawList_PrimQuadUV(self: PImDrawList; a: ImVec2; b: ImVec2; c: ImVec2; d: ImVec2; uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimQuadUV';

procedure ImDrawList_PrimWriteVtx(self: PImDrawList; pos: ImVec2; uv: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimWriteVtx';

procedure ImDrawList_PrimWriteIdx(self: PImDrawList; idx: ImDrawIdx); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimWriteIdx';

procedure ImDrawList_PrimVtx(self: PImDrawList; pos: ImVec2; uv: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'ImDrawList_PrimVtx';

procedure ImDrawList__ResetForNewFrame(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__ResetForNewFrame';

procedure ImDrawList__ClearFreeMemory(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__ClearFreeMemory';

procedure ImDrawList__PopUnusedDrawCmd(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__PopUnusedDrawCmd';

procedure ImDrawList__TryMergeDrawCmds(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__TryMergeDrawCmds';

procedure ImDrawList__OnChangedClipRect(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__OnChangedClipRect';

procedure ImDrawList__OnChangedTextureID(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__OnChangedTextureID';

procedure ImDrawList__OnChangedVtxOffset(self: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__OnChangedVtxOffset';

function ImDrawList__CalcCircleAutoSegmentCount(self: PImDrawList; radius: Single): Integer; cdecl;
  external SGT_DLL name _PU + 'ImDrawList__CalcCircleAutoSegmentCount';

procedure ImDrawList__PathArcToFastEx(self: PImDrawList; center: ImVec2; radius: Single; a_min_sample: Integer; a_max_sample: Integer; a_step: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__PathArcToFastEx';

procedure ImDrawList__PathArcToN(self: PImDrawList; center: ImVec2; radius: Single; a_min: Single; a_max: Single; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'ImDrawList__PathArcToN';

function ImDrawData_ImDrawData(): PImDrawData; cdecl;
  external SGT_DLL name _PU + 'ImDrawData_ImDrawData';

procedure ImDrawData_destroy(self: PImDrawData); cdecl;
  external SGT_DLL name _PU + 'ImDrawData_destroy';

procedure ImDrawData_Clear(self: PImDrawData); cdecl;
  external SGT_DLL name _PU + 'ImDrawData_Clear';

procedure ImDrawData_AddDrawList(self: PImDrawData; draw_list: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'ImDrawData_AddDrawList';

procedure ImDrawData_DeIndexAllBuffers(self: PImDrawData); cdecl;
  external SGT_DLL name _PU + 'ImDrawData_DeIndexAllBuffers';

procedure ImDrawData_ScaleClipRects(self: PImDrawData; fb_scale: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImDrawData_ScaleClipRects';

function ImFontConfig_ImFontConfig(): PImFontConfig; cdecl;
  external SGT_DLL name _PU + 'ImFontConfig_ImFontConfig';

procedure ImFontConfig_destroy(self: PImFontConfig); cdecl;
  external SGT_DLL name _PU + 'ImFontConfig_destroy';

function ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder(): PImFontGlyphRangesBuilder; cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_ImFontGlyphRangesBuilder';

procedure ImFontGlyphRangesBuilder_destroy(self: PImFontGlyphRangesBuilder); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_destroy';

procedure ImFontGlyphRangesBuilder_Clear(self: PImFontGlyphRangesBuilder); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_Clear';

function ImFontGlyphRangesBuilder_GetBit(self: PImFontGlyphRangesBuilder; n: NativeUInt): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_GetBit';

procedure ImFontGlyphRangesBuilder_SetBit(self: PImFontGlyphRangesBuilder; n: NativeUInt); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_SetBit';

procedure ImFontGlyphRangesBuilder_AddChar(self: PImFontGlyphRangesBuilder; c: ImWchar); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_AddChar';

procedure ImFontGlyphRangesBuilder_AddText(self: PImFontGlyphRangesBuilder; const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_AddText';

procedure ImFontGlyphRangesBuilder_AddRanges(self: PImFontGlyphRangesBuilder; const ranges: PImWchar); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_AddRanges';

procedure ImFontGlyphRangesBuilder_BuildRanges(self: PImFontGlyphRangesBuilder; out_ranges: PImVector_ImWchar); cdecl;
  external SGT_DLL name _PU + 'ImFontGlyphRangesBuilder_BuildRanges';

function ImFontAtlasCustomRect_ImFontAtlasCustomRect(): PImFontAtlasCustomRect; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlasCustomRect_ImFontAtlasCustomRect';

procedure ImFontAtlasCustomRect_destroy(self: PImFontAtlasCustomRect); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlasCustomRect_destroy';

function ImFontAtlasCustomRect_IsPacked(self: PImFontAtlasCustomRect): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlasCustomRect_IsPacked';

function ImFontAtlas_ImFontAtlas(): PImFontAtlas; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_ImFontAtlas';

procedure ImFontAtlas_destroy(self: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_destroy';

function ImFontAtlas_AddFont(self: PImFontAtlas; const font_cfg: PImFontConfig): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddFont';

function ImFontAtlas_AddFontDefault(self: PImFontAtlas; const font_cfg: PImFontConfig): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddFontDefault';

function ImFontAtlas_AddFontFromFileTTF(self: PImFontAtlas; const filename: PUTF8Char; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddFontFromFileTTF';

function ImFontAtlas_AddFontFromMemoryTTF(self: PImFontAtlas; font_data: Pointer; font_data_size: Integer; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddFontFromMemoryTTF';

function ImFontAtlas_AddFontFromMemoryCompressedTTF(self: PImFontAtlas; const compressed_font_data: Pointer; compressed_font_data_size: Integer; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddFontFromMemoryCompressedTTF';

function ImFontAtlas_AddFontFromMemoryCompressedBase85TTF(self: PImFontAtlas; const compressed_font_data_base85: PUTF8Char; size_pixels: Single; const font_cfg: PImFontConfig; const glyph_ranges: PImWchar): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddFontFromMemoryCompressedBase85TTF';

procedure ImFontAtlas_ClearInputData(self: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_ClearInputData';

procedure ImFontAtlas_ClearTexData(self: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_ClearTexData';

procedure ImFontAtlas_ClearFonts(self: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_ClearFonts';

procedure ImFontAtlas_Clear(self: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_Clear';

function ImFontAtlas_Build(self: PImFontAtlas): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_Build';

procedure ImFontAtlas_GetTexDataAsAlpha8(self: PImFontAtlas; out_pixels: PPByte; out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetTexDataAsAlpha8';

procedure ImFontAtlas_GetTexDataAsRGBA32(self: PImFontAtlas; out_pixels: PPByte; out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetTexDataAsRGBA32';

function ImFontAtlas_IsBuilt(self: PImFontAtlas): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_IsBuilt';

procedure ImFontAtlas_SetTexID(self: PImFontAtlas; id: ImTextureID); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_SetTexID';

function ImFontAtlas_GetGlyphRangesDefault(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesDefault';

function ImFontAtlas_GetGlyphRangesGreek(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesGreek';

function ImFontAtlas_GetGlyphRangesKorean(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesKorean';

function ImFontAtlas_GetGlyphRangesJapanese(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesJapanese';

function ImFontAtlas_GetGlyphRangesChineseFull(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesChineseFull';

function ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesChineseSimplifiedCommon';

function ImFontAtlas_GetGlyphRangesCyrillic(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesCyrillic';

function ImFontAtlas_GetGlyphRangesThai(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesThai';

function ImFontAtlas_GetGlyphRangesVietnamese(self: PImFontAtlas): PImWchar; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetGlyphRangesVietnamese';

function ImFontAtlas_AddCustomRectRegular(self: PImFontAtlas; width: Integer; height: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddCustomRectRegular';

function ImFontAtlas_AddCustomRectFontGlyph(self: PImFontAtlas; font: PImFont; id: ImWchar; width: Integer; height: Integer; advance_x: Single; offset: ImVec2): Integer; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_AddCustomRectFontGlyph';

function ImFontAtlas_GetCustomRectByIndex(self: PImFontAtlas; index: Integer): PImFontAtlasCustomRect; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetCustomRectByIndex';

procedure ImFontAtlas_CalcCustomRectUV(self: PImFontAtlas; const rect: PImFontAtlasCustomRect; out_uv_min: PImVec2; out_uv_max: PImVec2); cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_CalcCustomRectUV';

function ImFontAtlas_GetMouseCursorTexData(self: PImFontAtlas; cursor: ImGuiMouseCursor; out_offset: PImVec2; out_size: PImVec2; out_uv_border: PImVec2; out_uv_fill: PImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFontAtlas_GetMouseCursorTexData';

function ImFont_ImFont(): PImFont; cdecl;
  external SGT_DLL name _PU + 'ImFont_ImFont';

procedure ImFont_destroy(self: PImFont); cdecl;
  external SGT_DLL name _PU + 'ImFont_destroy';

function ImFont_FindGlyph(self: PImFont; c: ImWchar): PImFontGlyph; cdecl;
  external SGT_DLL name _PU + 'ImFont_FindGlyph';

function ImFont_FindGlyphNoFallback(self: PImFont; c: ImWchar): PImFontGlyph; cdecl;
  external SGT_DLL name _PU + 'ImFont_FindGlyphNoFallback';

function ImFont_GetCharAdvance(self: PImFont; c: ImWchar): Single; cdecl;
  external SGT_DLL name _PU + 'ImFont_GetCharAdvance';

function ImFont_IsLoaded(self: PImFont): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFont_IsLoaded';

function ImFont_GetDebugName(self: PImFont): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImFont_GetDebugName';

procedure ImFont_CalcTextSizeA(pOut: PImVec2; self: PImFont; size: Single; max_width: Single; wrap_width: Single; const text_begin: PUTF8Char; const text_end: PUTF8Char; remaining: PPUTF8Char); cdecl;
  external SGT_DLL name _PU + 'ImFont_CalcTextSizeA';

function ImFont_CalcWordWrapPositionA(self: PImFont; scale: Single; const text: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImFont_CalcWordWrapPositionA';

procedure ImFont_RenderChar(self: PImFont; draw_list: PImDrawList; size: Single; pos: ImVec2; col: ImU32; c: ImWchar); cdecl;
  external SGT_DLL name _PU + 'ImFont_RenderChar';

procedure ImFont_RenderText(self: PImFont; draw_list: PImDrawList; size: Single; pos: ImVec2; col: ImU32; clip_rect: ImVec4; const text_begin: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single; cpu_fine_clip: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImFont_RenderText';

procedure ImFont_BuildLookupTable(self: PImFont); cdecl;
  external SGT_DLL name _PU + 'ImFont_BuildLookupTable';

procedure ImFont_ClearOutputData(self: PImFont); cdecl;
  external SGT_DLL name _PU + 'ImFont_ClearOutputData';

procedure ImFont_GrowIndex(self: PImFont; new_size: Integer); cdecl;
  external SGT_DLL name _PU + 'ImFont_GrowIndex';

procedure ImFont_AddGlyph(self: PImFont; const src_cfg: PImFontConfig; c: ImWchar; x0: Single; y0: Single; x1: Single; y1: Single; u0: Single; v0: Single; u1: Single; v1: Single; advance_x: Single); cdecl;
  external SGT_DLL name _PU + 'ImFont_AddGlyph';

procedure ImFont_AddRemapChar(self: PImFont; dst: ImWchar; src: ImWchar; overwrite_dst: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImFont_AddRemapChar';

procedure ImFont_SetGlyphVisible(self: PImFont; c: ImWchar; visible: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImFont_SetGlyphVisible';

function ImFont_IsGlyphRangeUnused(self: PImFont; c_begin: Cardinal; c_last: Cardinal): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImFont_IsGlyphRangeUnused';

function ImGuiViewport_ImGuiViewport(): PImGuiViewport; cdecl;
  external SGT_DLL name _PU + 'ImGuiViewport_ImGuiViewport';

procedure ImGuiViewport_destroy(self: PImGuiViewport); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewport_destroy';

procedure ImGuiViewport_GetCenter(pOut: PImVec2; self: PImGuiViewport); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewport_GetCenter';

procedure ImGuiViewport_GetWorkCenter(pOut: PImVec2; self: PImGuiViewport); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewport_GetWorkCenter';

function ImGuiPlatformIO_ImGuiPlatformIO(): PImGuiPlatformIO; cdecl;
  external SGT_DLL name _PU + 'ImGuiPlatformIO_ImGuiPlatformIO';

procedure ImGuiPlatformIO_destroy(self: PImGuiPlatformIO); cdecl;
  external SGT_DLL name _PU + 'ImGuiPlatformIO_destroy';

function ImGuiPlatformMonitor_ImGuiPlatformMonitor(): PImGuiPlatformMonitor; cdecl;
  external SGT_DLL name _PU + 'ImGuiPlatformMonitor_ImGuiPlatformMonitor';

procedure ImGuiPlatformMonitor_destroy(self: PImGuiPlatformMonitor); cdecl;
  external SGT_DLL name _PU + 'ImGuiPlatformMonitor_destroy';

function ImGuiPlatformImeData_ImGuiPlatformImeData(): PImGuiPlatformImeData; cdecl;
  external SGT_DLL name _PU + 'ImGuiPlatformImeData_ImGuiPlatformImeData';

procedure ImGuiPlatformImeData_destroy(self: PImGuiPlatformImeData); cdecl;
  external SGT_DLL name _PU + 'ImGuiPlatformImeData_destroy';

function igGetKeyIndex(key: ImGuiKey): ImGuiKey; cdecl;
  external SGT_DLL name _PU + 'igGetKeyIndex';

function igImHashData(const data: Pointer; data_size: NativeUInt; seed: ImGuiID): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igImHashData';

function igImHashStr(const data: PUTF8Char; data_size: NativeUInt; seed: ImGuiID): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igImHashStr';

type
  igImQsort_compare_func = function(const p1: Pointer; const p2: Pointer): Integer; cdecl;

procedure igImQsort(base: Pointer; count: NativeUInt; size_of_element: NativeUInt; compare_func: igImQsort_compare_func); cdecl;
  external SGT_DLL name _PU + 'igImQsort';

function igImAlphaBlendColors(col_a: ImU32; col_b: ImU32): ImU32; cdecl;
  external SGT_DLL name _PU + 'igImAlphaBlendColors';

function igImIsPowerOfTwo_Int(v: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImIsPowerOfTwo_Int';

function igImIsPowerOfTwo_U64(v: ImU64): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImIsPowerOfTwo_U64';

function igImUpperPowerOfTwo(v: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'igImUpperPowerOfTwo';

function igImStricmp(const str1: PUTF8Char; const str2: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'igImStricmp';

function igImStrnicmp(const str1: PUTF8Char; const str2: PUTF8Char; count: NativeUInt): Integer; cdecl;
  external SGT_DLL name _PU + 'igImStrnicmp';

procedure igImStrncpy(dst: PUTF8Char; const src: PUTF8Char; count: NativeUInt); cdecl;
  external SGT_DLL name _PU + 'igImStrncpy';

function igImStrdup(const str: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImStrdup';

function igImStrdupcpy(dst: PUTF8Char; p_dst_size: PNativeUInt; const str: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImStrdupcpy';

function igImStrchrRange(const str_begin: PUTF8Char; const str_end: PUTF8Char; c: UTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImStrchrRange';

function igImStreolRange(const str: PUTF8Char; const str_end: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImStreolRange';

function igImStristr(const haystack: PUTF8Char; const haystack_end: PUTF8Char; const needle: PUTF8Char; const needle_end: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImStristr';

procedure igImStrTrimBlanks(str: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igImStrTrimBlanks';

function igImStrSkipBlank(const str: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImStrSkipBlank';

function igImStrlenW(const str: PImWchar): Integer; cdecl;
  external SGT_DLL name _PU + 'igImStrlenW';

function igImStrbolW(const buf_mid_line: PImWchar; const buf_begin: PImWchar): PImWchar; cdecl;
  external SGT_DLL name _PU + 'igImStrbolW';

function igImToUpper(c: UTF8Char): UTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImToUpper';

function igImCharIsBlankA(c: UTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImCharIsBlankA';

function igImCharIsBlankW(c: Cardinal): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImCharIsBlankW';

function igImFormatString(buf: PUTF8Char; buf_size: NativeUInt; const fmt: PUTF8Char): Integer varargs; cdecl;
  external SGT_DLL name _PU + 'igImFormatString';

function igImFormatStringV(buf: PUTF8Char; buf_size: NativeUInt; const fmt: PUTF8Char; args: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'igImFormatStringV';

procedure igImFormatStringToTempBuffer(out_buf: PPUTF8Char; out_buf_end: PPUTF8Char; const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igImFormatStringToTempBuffer';

procedure igImFormatStringToTempBufferV(out_buf: PPUTF8Char; out_buf_end: PPUTF8Char; const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igImFormatStringToTempBufferV';

function igImParseFormatFindStart(const format: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImParseFormatFindStart';

function igImParseFormatFindEnd(const format: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImParseFormatFindEnd';

function igImParseFormatTrimDecorations(const format: PUTF8Char; buf: PUTF8Char; buf_size: NativeUInt): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImParseFormatTrimDecorations';

procedure igImParseFormatSanitizeForPrinting(const fmt_in: PUTF8Char; fmt_out: PUTF8Char; fmt_out_size: NativeUInt); cdecl;
  external SGT_DLL name _PU + 'igImParseFormatSanitizeForPrinting';

function igImParseFormatSanitizeForScanning(const fmt_in: PUTF8Char; fmt_out: PUTF8Char; fmt_out_size: NativeUInt): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImParseFormatSanitizeForScanning';

function igImParseFormatPrecision(const format: PUTF8Char; default_value: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'igImParseFormatPrecision';

function igImTextCharToUtf8(out_buf: PUTF8Char; c: Cardinal): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImTextCharToUtf8';

function igImTextStrToUtf8(out_buf: PUTF8Char; out_buf_size: Integer; const in_text: PImWchar; const in_text_end: PImWchar): Integer; cdecl;
  external SGT_DLL name _PU + 'igImTextStrToUtf8';

function igImTextCharFromUtf8(out_char: PCardinal; const in_text: PUTF8Char; const in_text_end: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'igImTextCharFromUtf8';

function igImTextStrFromUtf8(out_buf: PImWchar; out_buf_size: Integer; const in_text: PUTF8Char; const in_text_end: PUTF8Char; in_remaining: PPUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'igImTextStrFromUtf8';

function igImTextCountCharsFromUtf8(const in_text: PUTF8Char; const in_text_end: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'igImTextCountCharsFromUtf8';

function igImTextCountUtf8BytesFromChar(const in_text: PUTF8Char; const in_text_end: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'igImTextCountUtf8BytesFromChar';

function igImTextCountUtf8BytesFromStr(const in_text: PImWchar; const in_text_end: PImWchar): Integer; cdecl;
  external SGT_DLL name _PU + 'igImTextCountUtf8BytesFromStr';

function igImTextFindPreviousUtf8Codepoint(const in_text_start: PUTF8Char; const in_text_curr: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igImTextFindPreviousUtf8Codepoint';

function igImFileOpen(const filename: PUTF8Char; const mode: PUTF8Char): ImFileHandle; cdecl;
  external SGT_DLL name _PU + 'igImFileOpen';

function igImFileClose(&file: ImFileHandle): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImFileClose';

function igImFileGetSize(&file: ImFileHandle): ImU64; cdecl;
  external SGT_DLL name _PU + 'igImFileGetSize';

function igImFileRead(data: Pointer; size: ImU64; count: ImU64; &file: ImFileHandle): ImU64; cdecl;
  external SGT_DLL name _PU + 'igImFileRead';

function igImFileWrite(const data: Pointer; size: ImU64; count: ImU64; &file: ImFileHandle): ImU64; cdecl;
  external SGT_DLL name _PU + 'igImFileWrite';

function igImFileLoadToMemory(const filename: PUTF8Char; const mode: PUTF8Char; out_file_size: PNativeUInt; padding_bytes: Integer): Pointer; cdecl;
  external SGT_DLL name _PU + 'igImFileLoadToMemory';

function igImPow_Float(x: Single; y: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImPow_Float';

function igImPow_double(x: Double; y: Double): Double; cdecl;
  external SGT_DLL name _PU + 'igImPow_double';

function igImLog_Float(x: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImLog_Float';

function igImLog_double(x: Double): Double; cdecl;
  external SGT_DLL name _PU + 'igImLog_double';

function igImAbs_Int(x: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'igImAbs_Int';

function igImAbs_Float(x: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImAbs_Float';

function igImAbs_double(x: Double): Double; cdecl;
  external SGT_DLL name _PU + 'igImAbs_double';

function igImSign_Float(x: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImSign_Float';

function igImSign_double(x: Double): Double; cdecl;
  external SGT_DLL name _PU + 'igImSign_double';

function igImRsqrt_Float(x: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImRsqrt_Float';

function igImRsqrt_double(x: Double): Double; cdecl;
  external SGT_DLL name _PU + 'igImRsqrt_double';

procedure igImMin(pOut: PImVec2; lhs: ImVec2; rhs: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImMin';

procedure igImMax(pOut: PImVec2; lhs: ImVec2; rhs: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImMax';

procedure igImClamp(pOut: PImVec2; v: ImVec2; mn: ImVec2; mx: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImClamp';

procedure igImLerp_Vec2Float(pOut: PImVec2; a: ImVec2; b: ImVec2; t: Single); cdecl;
  external SGT_DLL name _PU + 'igImLerp_Vec2Float';

procedure igImLerp_Vec2Vec2(pOut: PImVec2; a: ImVec2; b: ImVec2; t: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImLerp_Vec2Vec2';

procedure igImLerp_Vec4(pOut: PImVec4; a: ImVec4; b: ImVec4; t: Single); cdecl;
  external SGT_DLL name _PU + 'igImLerp_Vec4';

function igImSaturate(f: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImSaturate';

function igImLengthSqr_Vec2(lhs: ImVec2): Single; cdecl;
  external SGT_DLL name _PU + 'igImLengthSqr_Vec2';

function igImLengthSqr_Vec4(lhs: ImVec4): Single; cdecl;
  external SGT_DLL name _PU + 'igImLengthSqr_Vec4';

function igImInvLength(lhs: ImVec2; fail_value: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImInvLength';

function igImTrunc_Float(f: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImTrunc_Float';

procedure igImTrunc_Vec2(pOut: PImVec2; v: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImTrunc_Vec2';

function igImFloor_Float(f: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImFloor_Float';

procedure igImFloor_Vec2(pOut: PImVec2; v: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImFloor_Vec2';

function igImModPositive(a: Integer; b: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'igImModPositive';

function igImDot(a: ImVec2; b: ImVec2): Single; cdecl;
  external SGT_DLL name _PU + 'igImDot';

procedure igImRotate(pOut: PImVec2; v: ImVec2; cos_a: Single; sin_a: Single); cdecl;
  external SGT_DLL name _PU + 'igImRotate';

function igImLinearSweep(current: Single; target: Single; speed: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igImLinearSweep';

procedure igImMul(pOut: PImVec2; lhs: ImVec2; rhs: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImMul';

function igImIsFloatAboveGuaranteedIntegerPrecision(f: Single): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImIsFloatAboveGuaranteedIntegerPrecision';

function igImExponentialMovingAverage(avg: Single; sample: Single; n: Integer): Single; cdecl;
  external SGT_DLL name _PU + 'igImExponentialMovingAverage';

procedure igImBezierCubicCalc(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; t: Single); cdecl;
  external SGT_DLL name _PU + 'igImBezierCubicCalc';

procedure igImBezierCubicClosestPoint(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; p: ImVec2; num_segments: Integer); cdecl;
  external SGT_DLL name _PU + 'igImBezierCubicClosestPoint';

procedure igImBezierCubicClosestPointCasteljau(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; p: ImVec2; tess_tol: Single); cdecl;
  external SGT_DLL name _PU + 'igImBezierCubicClosestPointCasteljau';

procedure igImBezierQuadraticCalc(pOut: PImVec2; p1: ImVec2; p2: ImVec2; p3: ImVec2; t: Single); cdecl;
  external SGT_DLL name _PU + 'igImBezierQuadraticCalc';

procedure igImLineClosestPoint(pOut: PImVec2; a: ImVec2; b: ImVec2; p: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImLineClosestPoint';

function igImTriangleContainsPoint(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImTriangleContainsPoint';

procedure igImTriangleClosestPoint(pOut: PImVec2; a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igImTriangleClosestPoint';

procedure igImTriangleBarycentricCoords(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2; out_u: PSingle; out_v: PSingle; out_w: PSingle); cdecl;
  external SGT_DLL name _PU + 'igImTriangleBarycentricCoords';

function igImTriangleArea(a: ImVec2; b: ImVec2; c: ImVec2): Single; cdecl;
  external SGT_DLL name _PU + 'igImTriangleArea';

function ImVec1_ImVec1_Nil(): PImVec1; cdecl;
  external SGT_DLL name _PU + 'ImVec1_ImVec1_Nil';

procedure ImVec1_destroy(self: PImVec1); cdecl;
  external SGT_DLL name _PU + 'ImVec1_destroy';

function ImVec1_ImVec1_Float(_x: Single): PImVec1; cdecl;
  external SGT_DLL name _PU + 'ImVec1_ImVec1_Float';

function ImVec2ih_ImVec2ih_Nil(): PImVec2ih; cdecl;
  external SGT_DLL name _PU + 'ImVec2ih_ImVec2ih_Nil';

procedure ImVec2ih_destroy(self: PImVec2ih); cdecl;
  external SGT_DLL name _PU + 'ImVec2ih_destroy';

function ImVec2ih_ImVec2ih_short(_x: Smallint; _y: Smallint): PImVec2ih; cdecl;
  external SGT_DLL name _PU + 'ImVec2ih_ImVec2ih_short';

function ImVec2ih_ImVec2ih_Vec2(rhs: ImVec2): PImVec2ih; cdecl;
  external SGT_DLL name _PU + 'ImVec2ih_ImVec2ih_Vec2';

function ImRect_ImRect_Nil(): PImRect; cdecl;
  external SGT_DLL name _PU + 'ImRect_ImRect_Nil';

procedure ImRect_destroy(self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_destroy';

function ImRect_ImRect_Vec2(min: ImVec2; max: ImVec2): PImRect; cdecl;
  external SGT_DLL name _PU + 'ImRect_ImRect_Vec2';

function ImRect_ImRect_Vec4(v: ImVec4): PImRect; cdecl;
  external SGT_DLL name _PU + 'ImRect_ImRect_Vec4';

function ImRect_ImRect_Float(x1: Single; y1: Single; x2: Single; y2: Single): PImRect; cdecl;
  external SGT_DLL name _PU + 'ImRect_ImRect_Float';

procedure ImRect_GetCenter(pOut: PImVec2; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_GetCenter';

procedure ImRect_GetSize(pOut: PImVec2; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_GetSize';

function ImRect_GetWidth(self: PImRect): Single; cdecl;
  external SGT_DLL name _PU + 'ImRect_GetWidth';

function ImRect_GetHeight(self: PImRect): Single; cdecl;
  external SGT_DLL name _PU + 'ImRect_GetHeight';

function ImRect_GetArea(self: PImRect): Single; cdecl;
  external SGT_DLL name _PU + 'ImRect_GetArea';

procedure ImRect_GetTL(pOut: PImVec2; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_GetTL';

procedure ImRect_GetTR(pOut: PImVec2; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_GetTR';

procedure ImRect_GetBL(pOut: PImVec2; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_GetBL';

procedure ImRect_GetBR(pOut: PImVec2; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_GetBR';

function ImRect_Contains_Vec2(self: PImRect; p: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImRect_Contains_Vec2';

function ImRect_Contains_Rect(self: PImRect; r: ImRect): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImRect_Contains_Rect';

function ImRect_ContainsWithPad(self: PImRect; p: ImVec2; pad: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImRect_ContainsWithPad';

function ImRect_Overlaps(self: PImRect; r: ImRect): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImRect_Overlaps';

procedure ImRect_Add_Vec2(self: PImRect; p: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImRect_Add_Vec2';

procedure ImRect_Add_Rect(self: PImRect; r: ImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_Add_Rect';

procedure ImRect_Expand_Float(self: PImRect; const amount: Single); cdecl;
  external SGT_DLL name _PU + 'ImRect_Expand_Float';

procedure ImRect_Expand_Vec2(self: PImRect; amount: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImRect_Expand_Vec2';

procedure ImRect_Translate(self: PImRect; d: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImRect_Translate';

procedure ImRect_TranslateX(self: PImRect; dx: Single); cdecl;
  external SGT_DLL name _PU + 'ImRect_TranslateX';

procedure ImRect_TranslateY(self: PImRect; dy: Single); cdecl;
  external SGT_DLL name _PU + 'ImRect_TranslateY';

procedure ImRect_ClipWith(self: PImRect; r: ImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_ClipWith';

procedure ImRect_ClipWithFull(self: PImRect; r: ImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_ClipWithFull';

procedure ImRect_Floor(self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_Floor';

function ImRect_IsInverted(self: PImRect): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImRect_IsInverted';

procedure ImRect_ToVec4(pOut: PImVec4; self: PImRect); cdecl;
  external SGT_DLL name _PU + 'ImRect_ToVec4';

function igImBitArrayGetStorageSizeInBytes(bitcount: Integer): NativeUInt; cdecl;
  external SGT_DLL name _PU + 'igImBitArrayGetStorageSizeInBytes';

procedure igImBitArrayClearAllBits(arr: PImU32; bitcount: Integer); cdecl;
  external SGT_DLL name _PU + 'igImBitArrayClearAllBits';

function igImBitArrayTestBit(const arr: PImU32; n: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImBitArrayTestBit';

procedure igImBitArrayClearBit(arr: PImU32; n: Integer); cdecl;
  external SGT_DLL name _PU + 'igImBitArrayClearBit';

procedure igImBitArraySetBit(arr: PImU32; n: Integer); cdecl;
  external SGT_DLL name _PU + 'igImBitArraySetBit';

procedure igImBitArraySetBitRange(arr: PImU32; n: Integer; n2: Integer); cdecl;
  external SGT_DLL name _PU + 'igImBitArraySetBitRange';

procedure ImBitVector_Create(self: PImBitVector; sz: Integer); cdecl;
  external SGT_DLL name _PU + 'ImBitVector_Create';

procedure ImBitVector_Clear(self: PImBitVector); cdecl;
  external SGT_DLL name _PU + 'ImBitVector_Clear';

function ImBitVector_TestBit(self: PImBitVector; n: Integer): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImBitVector_TestBit';

procedure ImBitVector_SetBit(self: PImBitVector; n: Integer); cdecl;
  external SGT_DLL name _PU + 'ImBitVector_SetBit';

procedure ImBitVector_ClearBit(self: PImBitVector; n: Integer); cdecl;
  external SGT_DLL name _PU + 'ImBitVector_ClearBit';

procedure ImGuiTextIndex_clear(self: PImGuiTextIndex); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextIndex_clear';

function ImGuiTextIndex_size(self: PImGuiTextIndex): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextIndex_size';

function ImGuiTextIndex_get_line_begin(self: PImGuiTextIndex; const base: PUTF8Char; n: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextIndex_get_line_begin';

function ImGuiTextIndex_get_line_end(self: PImGuiTextIndex; const base: PUTF8Char; n: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextIndex_get_line_end';

procedure ImGuiTextIndex_append(self: PImGuiTextIndex; const base: PUTF8Char; old_size: Integer; new_size: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiTextIndex_append';

function ImDrawListSharedData_ImDrawListSharedData(): PImDrawListSharedData; cdecl;
  external SGT_DLL name _PU + 'ImDrawListSharedData_ImDrawListSharedData';

procedure ImDrawListSharedData_destroy(self: PImDrawListSharedData); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSharedData_destroy';

procedure ImDrawListSharedData_SetCircleTessellationMaxError(self: PImDrawListSharedData; max_error: Single); cdecl;
  external SGT_DLL name _PU + 'ImDrawListSharedData_SetCircleTessellationMaxError';

function ImDrawDataBuilder_ImDrawDataBuilder(): PImDrawDataBuilder; cdecl;
  external SGT_DLL name _PU + 'ImDrawDataBuilder_ImDrawDataBuilder';

procedure ImDrawDataBuilder_destroy(self: PImDrawDataBuilder); cdecl;
  external SGT_DLL name _PU + 'ImDrawDataBuilder_destroy';

function ImGuiStyleMod_ImGuiStyleMod_Int(idx: ImGuiStyleVar; v: Integer): PImGuiStyleMod; cdecl;
  external SGT_DLL name _PU + 'ImGuiStyleMod_ImGuiStyleMod_Int';

procedure ImGuiStyleMod_destroy(self: PImGuiStyleMod); cdecl;
  external SGT_DLL name _PU + 'ImGuiStyleMod_destroy';

function ImGuiStyleMod_ImGuiStyleMod_Float(idx: ImGuiStyleVar; v: Single): PImGuiStyleMod; cdecl;
  external SGT_DLL name _PU + 'ImGuiStyleMod_ImGuiStyleMod_Float';

function ImGuiStyleMod_ImGuiStyleMod_Vec2(idx: ImGuiStyleVar; v: ImVec2): PImGuiStyleMod; cdecl;
  external SGT_DLL name _PU + 'ImGuiStyleMod_ImGuiStyleMod_Vec2';

function ImGuiComboPreviewData_ImGuiComboPreviewData(): PImGuiComboPreviewData; cdecl;
  external SGT_DLL name _PU + 'ImGuiComboPreviewData_ImGuiComboPreviewData';

procedure ImGuiComboPreviewData_destroy(self: PImGuiComboPreviewData); cdecl;
  external SGT_DLL name _PU + 'ImGuiComboPreviewData_destroy';

function ImGuiMenuColumns_ImGuiMenuColumns(): PImGuiMenuColumns; cdecl;
  external SGT_DLL name _PU + 'ImGuiMenuColumns_ImGuiMenuColumns';

procedure ImGuiMenuColumns_destroy(self: PImGuiMenuColumns); cdecl;
  external SGT_DLL name _PU + 'ImGuiMenuColumns_destroy';

procedure ImGuiMenuColumns_Update(self: PImGuiMenuColumns; spacing: Single; window_reappearing: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiMenuColumns_Update';

function ImGuiMenuColumns_DeclColumns(self: PImGuiMenuColumns; w_icon: Single; w_label: Single; w_shortcut: Single; w_mark: Single): Single; cdecl;
  external SGT_DLL name _PU + 'ImGuiMenuColumns_DeclColumns';

procedure ImGuiMenuColumns_CalcNextTotalWidth(self: PImGuiMenuColumns; update_offsets: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGuiMenuColumns_CalcNextTotalWidth';

function ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState(): PImGuiInputTextDeactivatedState; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextDeactivatedState_ImGuiInputTextDeactivatedState';

procedure ImGuiInputTextDeactivatedState_destroy(self: PImGuiInputTextDeactivatedState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextDeactivatedState_destroy';

procedure ImGuiInputTextDeactivatedState_ClearFreeMemory(self: PImGuiInputTextDeactivatedState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextDeactivatedState_ClearFreeMemory';

function ImGuiInputTextState_ImGuiInputTextState(): PImGuiInputTextState; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ImGuiInputTextState';

procedure ImGuiInputTextState_destroy(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_destroy';

procedure ImGuiInputTextState_ClearText(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ClearText';

procedure ImGuiInputTextState_ClearFreeMemory(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ClearFreeMemory';

function ImGuiInputTextState_GetUndoAvailCount(self: PImGuiInputTextState): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_GetUndoAvailCount';

function ImGuiInputTextState_GetRedoAvailCount(self: PImGuiInputTextState): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_GetRedoAvailCount';

procedure ImGuiInputTextState_OnKeyPressed(self: PImGuiInputTextState; key: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_OnKeyPressed';

procedure ImGuiInputTextState_CursorAnimReset(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_CursorAnimReset';

procedure ImGuiInputTextState_CursorClamp(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_CursorClamp';

function ImGuiInputTextState_HasSelection(self: PImGuiInputTextState): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_HasSelection';

procedure ImGuiInputTextState_ClearSelection(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ClearSelection';

function ImGuiInputTextState_GetCursorPos(self: PImGuiInputTextState): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_GetCursorPos';

function ImGuiInputTextState_GetSelectionStart(self: PImGuiInputTextState): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_GetSelectionStart';

function ImGuiInputTextState_GetSelectionEnd(self: PImGuiInputTextState): Integer; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_GetSelectionEnd';

procedure ImGuiInputTextState_SelectAll(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_SelectAll';

procedure ImGuiInputTextState_ReloadUserBufAndSelectAll(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ReloadUserBufAndSelectAll';

procedure ImGuiInputTextState_ReloadUserBufAndKeepSelection(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ReloadUserBufAndKeepSelection';

procedure ImGuiInputTextState_ReloadUserBufAndMoveToEnd(self: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputTextState_ReloadUserBufAndMoveToEnd';

function ImGuiNextWindowData_ImGuiNextWindowData(): PImGuiNextWindowData; cdecl;
  external SGT_DLL name _PU + 'ImGuiNextWindowData_ImGuiNextWindowData';

procedure ImGuiNextWindowData_destroy(self: PImGuiNextWindowData); cdecl;
  external SGT_DLL name _PU + 'ImGuiNextWindowData_destroy';

procedure ImGuiNextWindowData_ClearFlags(self: PImGuiNextWindowData); cdecl;
  external SGT_DLL name _PU + 'ImGuiNextWindowData_ClearFlags';

function ImGuiNextItemData_ImGuiNextItemData(): PImGuiNextItemData; cdecl;
  external SGT_DLL name _PU + 'ImGuiNextItemData_ImGuiNextItemData';

procedure ImGuiNextItemData_destroy(self: PImGuiNextItemData); cdecl;
  external SGT_DLL name _PU + 'ImGuiNextItemData_destroy';

procedure ImGuiNextItemData_ClearFlags(self: PImGuiNextItemData); cdecl;
  external SGT_DLL name _PU + 'ImGuiNextItemData_ClearFlags';

function ImGuiLastItemData_ImGuiLastItemData(): PImGuiLastItemData; cdecl;
  external SGT_DLL name _PU + 'ImGuiLastItemData_ImGuiLastItemData';

procedure ImGuiLastItemData_destroy(self: PImGuiLastItemData); cdecl;
  external SGT_DLL name _PU + 'ImGuiLastItemData_destroy';

function ImGuiStackSizes_ImGuiStackSizes(): PImGuiStackSizes; cdecl;
  external SGT_DLL name _PU + 'ImGuiStackSizes_ImGuiStackSizes';

procedure ImGuiStackSizes_destroy(self: PImGuiStackSizes); cdecl;
  external SGT_DLL name _PU + 'ImGuiStackSizes_destroy';

procedure ImGuiStackSizes_SetToContextState(self: PImGuiStackSizes; ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'ImGuiStackSizes_SetToContextState';

procedure ImGuiStackSizes_CompareWithContextState(self: PImGuiStackSizes; ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'ImGuiStackSizes_CompareWithContextState';

function ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr(ptr: Pointer): PImGuiPtrOrIndex; cdecl;
  external SGT_DLL name _PU + 'ImGuiPtrOrIndex_ImGuiPtrOrIndex_Ptr';

procedure ImGuiPtrOrIndex_destroy(self: PImGuiPtrOrIndex); cdecl;
  external SGT_DLL name _PU + 'ImGuiPtrOrIndex_destroy';

function ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int(index: Integer): PImGuiPtrOrIndex; cdecl;
  external SGT_DLL name _PU + 'ImGuiPtrOrIndex_ImGuiPtrOrIndex_Int';

function ImGuiDataVarInfo_GetVarPtr(self: PImGuiDataVarInfo; parent: Pointer): Pointer; cdecl;
  external SGT_DLL name _PU + 'ImGuiDataVarInfo_GetVarPtr';

function ImGuiPopupData_ImGuiPopupData(): PImGuiPopupData; cdecl;
  external SGT_DLL name _PU + 'ImGuiPopupData_ImGuiPopupData';

procedure ImGuiPopupData_destroy(self: PImGuiPopupData); cdecl;
  external SGT_DLL name _PU + 'ImGuiPopupData_destroy';

function ImGuiInputEvent_ImGuiInputEvent(): PImGuiInputEvent; cdecl;
  external SGT_DLL name _PU + 'ImGuiInputEvent_ImGuiInputEvent';

procedure ImGuiInputEvent_destroy(self: PImGuiInputEvent); cdecl;
  external SGT_DLL name _PU + 'ImGuiInputEvent_destroy';

function ImGuiKeyRoutingData_ImGuiKeyRoutingData(): PImGuiKeyRoutingData; cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyRoutingData_ImGuiKeyRoutingData';

procedure ImGuiKeyRoutingData_destroy(self: PImGuiKeyRoutingData); cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyRoutingData_destroy';

function ImGuiKeyRoutingTable_ImGuiKeyRoutingTable(): PImGuiKeyRoutingTable; cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyRoutingTable_ImGuiKeyRoutingTable';

procedure ImGuiKeyRoutingTable_destroy(self: PImGuiKeyRoutingTable); cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyRoutingTable_destroy';

procedure ImGuiKeyRoutingTable_Clear(self: PImGuiKeyRoutingTable); cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyRoutingTable_Clear';

function ImGuiKeyOwnerData_ImGuiKeyOwnerData(): PImGuiKeyOwnerData; cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyOwnerData_ImGuiKeyOwnerData';

procedure ImGuiKeyOwnerData_destroy(self: PImGuiKeyOwnerData); cdecl;
  external SGT_DLL name _PU + 'ImGuiKeyOwnerData_destroy';

function ImGuiListClipperRange_FromIndices(min: Integer; max: Integer): ImGuiListClipperRange; cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipperRange_FromIndices';

function ImGuiListClipperRange_FromPositions(y1: Single; y2: Single; off_min: Integer; off_max: Integer): ImGuiListClipperRange; cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipperRange_FromPositions';

function ImGuiListClipperData_ImGuiListClipperData(): PImGuiListClipperData; cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipperData_ImGuiListClipperData';

procedure ImGuiListClipperData_destroy(self: PImGuiListClipperData); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipperData_destroy';

procedure ImGuiListClipperData_Reset(self: PImGuiListClipperData; clipper: PImGuiListClipper); cdecl;
  external SGT_DLL name _PU + 'ImGuiListClipperData_Reset';

function ImGuiNavItemData_ImGuiNavItemData(): PImGuiNavItemData; cdecl;
  external SGT_DLL name _PU + 'ImGuiNavItemData_ImGuiNavItemData';

procedure ImGuiNavItemData_destroy(self: PImGuiNavItemData); cdecl;
  external SGT_DLL name _PU + 'ImGuiNavItemData_destroy';

procedure ImGuiNavItemData_Clear(self: PImGuiNavItemData); cdecl;
  external SGT_DLL name _PU + 'ImGuiNavItemData_Clear';

function ImGuiTypingSelectState_ImGuiTypingSelectState(): PImGuiTypingSelectState; cdecl;
  external SGT_DLL name _PU + 'ImGuiTypingSelectState_ImGuiTypingSelectState';

procedure ImGuiTypingSelectState_destroy(self: PImGuiTypingSelectState); cdecl;
  external SGT_DLL name _PU + 'ImGuiTypingSelectState_destroy';

procedure ImGuiTypingSelectState_Clear(self: PImGuiTypingSelectState); cdecl;
  external SGT_DLL name _PU + 'ImGuiTypingSelectState_Clear';

function ImGuiOldColumnData_ImGuiOldColumnData(): PImGuiOldColumnData; cdecl;
  external SGT_DLL name _PU + 'ImGuiOldColumnData_ImGuiOldColumnData';

procedure ImGuiOldColumnData_destroy(self: PImGuiOldColumnData); cdecl;
  external SGT_DLL name _PU + 'ImGuiOldColumnData_destroy';

function ImGuiOldColumns_ImGuiOldColumns(): PImGuiOldColumns; cdecl;
  external SGT_DLL name _PU + 'ImGuiOldColumns_ImGuiOldColumns';

procedure ImGuiOldColumns_destroy(self: PImGuiOldColumns); cdecl;
  external SGT_DLL name _PU + 'ImGuiOldColumns_destroy';

function ImGuiDockNode_ImGuiDockNode(id: ImGuiID): PImGuiDockNode; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_ImGuiDockNode';

procedure ImGuiDockNode_destroy(self: PImGuiDockNode); cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_destroy';

function ImGuiDockNode_IsRootNode(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsRootNode';

function ImGuiDockNode_IsDockSpace(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsDockSpace';

function ImGuiDockNode_IsFloatingNode(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsFloatingNode';

function ImGuiDockNode_IsCentralNode(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsCentralNode';

function ImGuiDockNode_IsHiddenTabBar(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsHiddenTabBar';

function ImGuiDockNode_IsNoTabBar(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsNoTabBar';

function ImGuiDockNode_IsSplitNode(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsSplitNode';

function ImGuiDockNode_IsLeafNode(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsLeafNode';

function ImGuiDockNode_IsEmpty(self: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_IsEmpty';

procedure ImGuiDockNode_Rect(pOut: PImRect; self: PImGuiDockNode); cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_Rect';

procedure ImGuiDockNode_SetLocalFlags(self: PImGuiDockNode; flags: ImGuiDockNodeFlags); cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_SetLocalFlags';

procedure ImGuiDockNode_UpdateMergedFlags(self: PImGuiDockNode); cdecl;
  external SGT_DLL name _PU + 'ImGuiDockNode_UpdateMergedFlags';

function ImGuiDockContext_ImGuiDockContext(): PImGuiDockContext; cdecl;
  external SGT_DLL name _PU + 'ImGuiDockContext_ImGuiDockContext';

procedure ImGuiDockContext_destroy(self: PImGuiDockContext); cdecl;
  external SGT_DLL name _PU + 'ImGuiDockContext_destroy';

function ImGuiViewportP_ImGuiViewportP(): PImGuiViewportP; cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_ImGuiViewportP';

procedure ImGuiViewportP_destroy(self: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_destroy';

procedure ImGuiViewportP_ClearRequestFlags(self: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_ClearRequestFlags';

procedure ImGuiViewportP_CalcWorkRectPos(pOut: PImVec2; self: PImGuiViewportP; off_min: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_CalcWorkRectPos';

procedure ImGuiViewportP_CalcWorkRectSize(pOut: PImVec2; self: PImGuiViewportP; off_min: ImVec2; off_max: ImVec2); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_CalcWorkRectSize';

procedure ImGuiViewportP_UpdateWorkRect(self: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_UpdateWorkRect';

procedure ImGuiViewportP_GetMainRect(pOut: PImRect; self: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_GetMainRect';

procedure ImGuiViewportP_GetWorkRect(pOut: PImRect; self: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_GetWorkRect';

procedure ImGuiViewportP_GetBuildWorkRect(pOut: PImRect; self: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'ImGuiViewportP_GetBuildWorkRect';

function ImGuiWindowSettings_ImGuiWindowSettings(): PImGuiWindowSettings; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindowSettings_ImGuiWindowSettings';

procedure ImGuiWindowSettings_destroy(self: PImGuiWindowSettings); cdecl;
  external SGT_DLL name _PU + 'ImGuiWindowSettings_destroy';

function ImGuiWindowSettings_GetName(self: PImGuiWindowSettings): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindowSettings_GetName';

function ImGuiSettingsHandler_ImGuiSettingsHandler(): PImGuiSettingsHandler; cdecl;
  external SGT_DLL name _PU + 'ImGuiSettingsHandler_ImGuiSettingsHandler';

procedure ImGuiSettingsHandler_destroy(self: PImGuiSettingsHandler); cdecl;
  external SGT_DLL name _PU + 'ImGuiSettingsHandler_destroy';

function ImGuiDebugAllocInfo_ImGuiDebugAllocInfo(): PImGuiDebugAllocInfo; cdecl;
  external SGT_DLL name _PU + 'ImGuiDebugAllocInfo_ImGuiDebugAllocInfo';

procedure ImGuiDebugAllocInfo_destroy(self: PImGuiDebugAllocInfo); cdecl;
  external SGT_DLL name _PU + 'ImGuiDebugAllocInfo_destroy';

function ImGuiStackLevelInfo_ImGuiStackLevelInfo(): PImGuiStackLevelInfo; cdecl;
  external SGT_DLL name _PU + 'ImGuiStackLevelInfo_ImGuiStackLevelInfo';

procedure ImGuiStackLevelInfo_destroy(self: PImGuiStackLevelInfo); cdecl;
  external SGT_DLL name _PU + 'ImGuiStackLevelInfo_destroy';

function ImGuiIDStackTool_ImGuiIDStackTool(): PImGuiIDStackTool; cdecl;
  external SGT_DLL name _PU + 'ImGuiIDStackTool_ImGuiIDStackTool';

procedure ImGuiIDStackTool_destroy(self: PImGuiIDStackTool); cdecl;
  external SGT_DLL name _PU + 'ImGuiIDStackTool_destroy';

function ImGuiContextHook_ImGuiContextHook(): PImGuiContextHook; cdecl;
  external SGT_DLL name _PU + 'ImGuiContextHook_ImGuiContextHook';

procedure ImGuiContextHook_destroy(self: PImGuiContextHook); cdecl;
  external SGT_DLL name _PU + 'ImGuiContextHook_destroy';

function ImGuiContext_ImGuiContext(shared_font_atlas: PImFontAtlas): PImGuiContext; cdecl;
  external SGT_DLL name _PU + 'ImGuiContext_ImGuiContext';

procedure ImGuiContext_destroy(self: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'ImGuiContext_destroy';

function ImGuiWindow_ImGuiWindow(context: PImGuiContext; const name: PUTF8Char): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_ImGuiWindow';

procedure ImGuiWindow_destroy(self: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_destroy';

function ImGuiWindow_GetID_Str(self: PImGuiWindow; const str: PUTF8Char; const str_end: PUTF8Char): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_GetID_Str';

function ImGuiWindow_GetID_Ptr(self: PImGuiWindow; const ptr: Pointer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_GetID_Ptr';

function ImGuiWindow_GetID_Int(self: PImGuiWindow; n: Integer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_GetID_Int';

function ImGuiWindow_GetIDFromRectangle(self: PImGuiWindow; r_abs: ImRect): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_GetIDFromRectangle';

procedure ImGuiWindow_Rect(pOut: PImRect; self: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_Rect';

function ImGuiWindow_CalcFontSize(self: PImGuiWindow): Single; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_CalcFontSize';

function ImGuiWindow_TitleBarHeight(self: PImGuiWindow): Single; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_TitleBarHeight';

procedure ImGuiWindow_TitleBarRect(pOut: PImRect; self: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_TitleBarRect';

function ImGuiWindow_MenuBarHeight(self: PImGuiWindow): Single; cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_MenuBarHeight';

procedure ImGuiWindow_MenuBarRect(pOut: PImRect; self: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'ImGuiWindow_MenuBarRect';

function ImGuiTabItem_ImGuiTabItem(): PImGuiTabItem; cdecl;
  external SGT_DLL name _PU + 'ImGuiTabItem_ImGuiTabItem';

procedure ImGuiTabItem_destroy(self: PImGuiTabItem); cdecl;
  external SGT_DLL name _PU + 'ImGuiTabItem_destroy';

function ImGuiTabBar_ImGuiTabBar(): PImGuiTabBar; cdecl;
  external SGT_DLL name _PU + 'ImGuiTabBar_ImGuiTabBar';

procedure ImGuiTabBar_destroy(self: PImGuiTabBar); cdecl;
  external SGT_DLL name _PU + 'ImGuiTabBar_destroy';

function ImGuiTableColumn_ImGuiTableColumn(): PImGuiTableColumn; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableColumn_ImGuiTableColumn';

procedure ImGuiTableColumn_destroy(self: PImGuiTableColumn); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableColumn_destroy';

function ImGuiTableInstanceData_ImGuiTableInstanceData(): PImGuiTableInstanceData; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableInstanceData_ImGuiTableInstanceData';

procedure ImGuiTableInstanceData_destroy(self: PImGuiTableInstanceData); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableInstanceData_destroy';

function ImGuiTable_ImGuiTable(): PImGuiTable; cdecl;
  external SGT_DLL name _PU + 'ImGuiTable_ImGuiTable';

procedure ImGuiTable_destroy(self: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'ImGuiTable_destroy';

function ImGuiTableTempData_ImGuiTableTempData(): PImGuiTableTempData; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableTempData_ImGuiTableTempData';

procedure ImGuiTableTempData_destroy(self: PImGuiTableTempData); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableTempData_destroy';

function ImGuiTableColumnSettings_ImGuiTableColumnSettings(): PImGuiTableColumnSettings; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableColumnSettings_ImGuiTableColumnSettings';

procedure ImGuiTableColumnSettings_destroy(self: PImGuiTableColumnSettings); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableColumnSettings_destroy';

function ImGuiTableSettings_ImGuiTableSettings(): PImGuiTableSettings; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableSettings_ImGuiTableSettings';

procedure ImGuiTableSettings_destroy(self: PImGuiTableSettings); cdecl;
  external SGT_DLL name _PU + 'ImGuiTableSettings_destroy';

function ImGuiTableSettings_GetColumnSettings(self: PImGuiTableSettings): PImGuiTableColumnSettings; cdecl;
  external SGT_DLL name _PU + 'ImGuiTableSettings_GetColumnSettings';

function igGetCurrentWindowRead(): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igGetCurrentWindowRead';

function igGetCurrentWindow(): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igGetCurrentWindow';

function igFindWindowByID(id: ImGuiID): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igFindWindowByID';

function igFindWindowByName(const name: PUTF8Char): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igFindWindowByName';

procedure igUpdateWindowParentAndRootLinks(window: PImGuiWindow; flags: ImGuiWindowFlags; parent_window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igUpdateWindowParentAndRootLinks';

procedure igCalcWindowNextAutoFitSize(pOut: PImVec2; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igCalcWindowNextAutoFitSize';

function igIsWindowChildOf(window: PImGuiWindow; potential_parent: PImGuiWindow; popup_hierarchy: Boolean; dock_hierarchy: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowChildOf';

function igIsWindowWithinBeginStackOf(window: PImGuiWindow; potential_parent: PImGuiWindow): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowWithinBeginStackOf';

function igIsWindowAbove(potential_above: PImGuiWindow; potential_below: PImGuiWindow): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowAbove';

function igIsWindowNavFocusable(window: PImGuiWindow): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowNavFocusable';

procedure igSetWindowPos_WindowPtr(window: PImGuiWindow; pos: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowPos_WindowPtr';

procedure igSetWindowSize_WindowPtr(window: PImGuiWindow; size: ImVec2; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowSize_WindowPtr';

procedure igSetWindowCollapsed_WindowPtr(window: PImGuiWindow; collapsed: Boolean; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowCollapsed_WindowPtr';

procedure igSetWindowHitTestHole(window: PImGuiWindow; pos: ImVec2; size: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igSetWindowHitTestHole';

procedure igSetWindowHiddenAndSkipItemsForCurrentFrame(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igSetWindowHiddenAndSkipItemsForCurrentFrame';

procedure igSetWindowParentWindowForFocusRoute(window: PImGuiWindow; parent_window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igSetWindowParentWindowForFocusRoute';

procedure igWindowRectAbsToRel(pOut: PImRect; window: PImGuiWindow; r: ImRect); cdecl;
  external SGT_DLL name _PU + 'igWindowRectAbsToRel';

procedure igWindowRectRelToAbs(pOut: PImRect; window: PImGuiWindow; r: ImRect); cdecl;
  external SGT_DLL name _PU + 'igWindowRectRelToAbs';

procedure igWindowPosRelToAbs(pOut: PImVec2; window: PImGuiWindow; p: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igWindowPosRelToAbs';

procedure igFocusWindow(window: PImGuiWindow; flags: ImGuiFocusRequestFlags); cdecl;
  external SGT_DLL name _PU + 'igFocusWindow';

procedure igFocusTopMostWindowUnderOne(under_this_window: PImGuiWindow; ignore_window: PImGuiWindow; filter_viewport: PImGuiViewport; flags: ImGuiFocusRequestFlags); cdecl;
  external SGT_DLL name _PU + 'igFocusTopMostWindowUnderOne';

procedure igBringWindowToFocusFront(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igBringWindowToFocusFront';

procedure igBringWindowToDisplayFront(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igBringWindowToDisplayFront';

procedure igBringWindowToDisplayBack(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igBringWindowToDisplayBack';

procedure igBringWindowToDisplayBehind(window: PImGuiWindow; above_window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igBringWindowToDisplayBehind';

function igFindWindowDisplayIndex(window: PImGuiWindow): Integer; cdecl;
  external SGT_DLL name _PU + 'igFindWindowDisplayIndex';

function igFindBottomMostVisibleWindowWithinBeginStack(window: PImGuiWindow): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igFindBottomMostVisibleWindowWithinBeginStack';

procedure igSetCurrentFont(font: PImFont); cdecl;
  external SGT_DLL name _PU + 'igSetCurrentFont';

function igGetDefaultFont(): PImFont; cdecl;
  external SGT_DLL name _PU + 'igGetDefaultFont';

function igGetForegroundDrawList_WindowPtr(window: PImGuiWindow): PImDrawList; cdecl;
  external SGT_DLL name _PU + 'igGetForegroundDrawList_WindowPtr';

procedure igAddDrawListToDrawDataEx(draw_data: PImDrawData; out_list: PImVector_ImDrawListPtr; draw_list: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'igAddDrawListToDrawDataEx';

procedure igInitialize(); cdecl;
  external SGT_DLL name _PU + 'igInitialize';

procedure igShutdown(); cdecl;
  external SGT_DLL name _PU + 'igShutdown';

procedure igUpdateInputEvents(trickle_fast_inputs: Boolean); cdecl;
  external SGT_DLL name _PU + 'igUpdateInputEvents';

procedure igUpdateHoveredWindowAndCaptureFlags(); cdecl;
  external SGT_DLL name _PU + 'igUpdateHoveredWindowAndCaptureFlags';

procedure igStartMouseMovingWindow(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igStartMouseMovingWindow';

procedure igStartMouseMovingWindowOrNode(window: PImGuiWindow; node: PImGuiDockNode; undock: Boolean); cdecl;
  external SGT_DLL name _PU + 'igStartMouseMovingWindowOrNode';

procedure igUpdateMouseMovingWindowNewFrame(); cdecl;
  external SGT_DLL name _PU + 'igUpdateMouseMovingWindowNewFrame';

procedure igUpdateMouseMovingWindowEndFrame(); cdecl;
  external SGT_DLL name _PU + 'igUpdateMouseMovingWindowEndFrame';

function igAddContextHook(context: PImGuiContext; const hook: PImGuiContextHook): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igAddContextHook';

procedure igRemoveContextHook(context: PImGuiContext; hook_to_remove: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igRemoveContextHook';

procedure igCallContextHooks(context: PImGuiContext; &type: ImGuiContextHookType); cdecl;
  external SGT_DLL name _PU + 'igCallContextHooks';

procedure igTranslateWindowsInViewport(viewport: PImGuiViewportP; old_pos: ImVec2; new_pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igTranslateWindowsInViewport';

procedure igScaleWindowsInViewport(viewport: PImGuiViewportP; scale: Single); cdecl;
  external SGT_DLL name _PU + 'igScaleWindowsInViewport';

procedure igDestroyPlatformWindow(viewport: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'igDestroyPlatformWindow';

procedure igSetWindowViewport(window: PImGuiWindow; viewport: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'igSetWindowViewport';

procedure igSetCurrentViewport(window: PImGuiWindow; viewport: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'igSetCurrentViewport';

function igGetViewportPlatformMonitor(viewport: PImGuiViewport): PImGuiPlatformMonitor; cdecl;
  external SGT_DLL name _PU + 'igGetViewportPlatformMonitor';

function igFindHoveredViewportFromPlatformWindowStack(mouse_platform_pos: ImVec2): PImGuiViewportP; cdecl;
  external SGT_DLL name _PU + 'igFindHoveredViewportFromPlatformWindowStack';

procedure igMarkIniSettingsDirty_Nil(); cdecl;
  external SGT_DLL name _PU + 'igMarkIniSettingsDirty_Nil';

procedure igMarkIniSettingsDirty_WindowPtr(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igMarkIniSettingsDirty_WindowPtr';

procedure igClearIniSettings(); cdecl;
  external SGT_DLL name _PU + 'igClearIniSettings';

procedure igAddSettingsHandler(const handler: PImGuiSettingsHandler); cdecl;
  external SGT_DLL name _PU + 'igAddSettingsHandler';

procedure igRemoveSettingsHandler(const type_name: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igRemoveSettingsHandler';

function igFindSettingsHandler(const type_name: PUTF8Char): PImGuiSettingsHandler; cdecl;
  external SGT_DLL name _PU + 'igFindSettingsHandler';

function igCreateNewWindowSettings(const name: PUTF8Char): PImGuiWindowSettings; cdecl;
  external SGT_DLL name _PU + 'igCreateNewWindowSettings';

function igFindWindowSettingsByID(id: ImGuiID): PImGuiWindowSettings; cdecl;
  external SGT_DLL name _PU + 'igFindWindowSettingsByID';

function igFindWindowSettingsByWindow(window: PImGuiWindow): PImGuiWindowSettings; cdecl;
  external SGT_DLL name _PU + 'igFindWindowSettingsByWindow';

procedure igClearWindowSettings(const name: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igClearWindowSettings';

procedure igLocalizeRegisterEntries(const entries: PImGuiLocEntry; count: Integer); cdecl;
  external SGT_DLL name _PU + 'igLocalizeRegisterEntries';

function igLocalizeGetMsg(key: ImGuiLocKey): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igLocalizeGetMsg';

procedure igSetScrollX_WindowPtr(window: PImGuiWindow; scroll_x: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollX_WindowPtr';

procedure igSetScrollY_WindowPtr(window: PImGuiWindow; scroll_y: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollY_WindowPtr';

procedure igSetScrollFromPosX_WindowPtr(window: PImGuiWindow; local_x: Single; center_x_ratio: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollFromPosX_WindowPtr';

procedure igSetScrollFromPosY_WindowPtr(window: PImGuiWindow; local_y: Single; center_y_ratio: Single); cdecl;
  external SGT_DLL name _PU + 'igSetScrollFromPosY_WindowPtr';

procedure igScrollToItem(flags: ImGuiScrollFlags); cdecl;
  external SGT_DLL name _PU + 'igScrollToItem';

procedure igScrollToRect(window: PImGuiWindow; rect: ImRect; flags: ImGuiScrollFlags); cdecl;
  external SGT_DLL name _PU + 'igScrollToRect';

procedure igScrollToRectEx(pOut: PImVec2; window: PImGuiWindow; rect: ImRect; flags: ImGuiScrollFlags); cdecl;
  external SGT_DLL name _PU + 'igScrollToRectEx';

procedure igScrollToBringRectIntoView(window: PImGuiWindow; rect: ImRect); cdecl;
  external SGT_DLL name _PU + 'igScrollToBringRectIntoView';

function igGetItemStatusFlags(): ImGuiItemStatusFlags; cdecl;
  external SGT_DLL name _PU + 'igGetItemStatusFlags';

function igGetItemFlags(): ImGuiItemFlags; cdecl;
  external SGT_DLL name _PU + 'igGetItemFlags';

function igGetActiveID(): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetActiveID';

function igGetFocusID(): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetFocusID';

procedure igSetActiveID(id: ImGuiID; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igSetActiveID';

procedure igSetFocusID(id: ImGuiID; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igSetFocusID';

procedure igClearActiveID(); cdecl;
  external SGT_DLL name _PU + 'igClearActiveID';

function igGetHoveredID(): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetHoveredID';

procedure igSetHoveredID(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igSetHoveredID';

procedure igKeepAliveID(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igKeepAliveID';

procedure igMarkItemEdited(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igMarkItemEdited';

procedure igPushOverrideID(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igPushOverrideID';

function igGetIDWithSeed_Str(const str_id_begin: PUTF8Char; const str_id_end: PUTF8Char; seed: ImGuiID): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetIDWithSeed_Str';

function igGetIDWithSeed_Int(n: Integer; seed: ImGuiID): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetIDWithSeed_Int';

procedure igItemSize_Vec2(size: ImVec2; text_baseline_y: Single); cdecl;
  external SGT_DLL name _PU + 'igItemSize_Vec2';

procedure igItemSize_Rect(bb: ImRect; text_baseline_y: Single); cdecl;
  external SGT_DLL name _PU + 'igItemSize_Rect';

function igItemAdd(bb: ImRect; id: ImGuiID; const nav_bb: PImRect; extra_flags: ImGuiItemFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igItemAdd';

function igItemHoverable(bb: ImRect; id: ImGuiID; item_flags: ImGuiItemFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igItemHoverable';

function igIsWindowContentHoverable(window: PImGuiWindow; flags: ImGuiHoveredFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsWindowContentHoverable';

function igIsClippedEx(bb: ImRect; id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsClippedEx';

procedure igSetLastItemData(item_id: ImGuiID; in_flags: ImGuiItemFlags; status_flags: ImGuiItemStatusFlags; item_rect: ImRect); cdecl;
  external SGT_DLL name _PU + 'igSetLastItemData';

procedure igCalcItemSize(pOut: PImVec2; size: ImVec2; default_w: Single; default_h: Single); cdecl;
  external SGT_DLL name _PU + 'igCalcItemSize';

function igCalcWrapWidthForPos(pos: ImVec2; wrap_pos_x: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igCalcWrapWidthForPos';

procedure igPushMultiItemsWidths(components: Integer; width_full: Single); cdecl;
  external SGT_DLL name _PU + 'igPushMultiItemsWidths';

function igIsItemToggledSelection(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsItemToggledSelection';

procedure igGetContentRegionMaxAbs(pOut: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igGetContentRegionMaxAbs';

procedure igShrinkWidths(items: PImGuiShrinkWidthItem; count: Integer; width_excess: Single); cdecl;
  external SGT_DLL name _PU + 'igShrinkWidths';

procedure igPushItemFlag(option: ImGuiItemFlags; enabled: Boolean); cdecl;
  external SGT_DLL name _PU + 'igPushItemFlag';

procedure igPopItemFlag(); cdecl;
  external SGT_DLL name _PU + 'igPopItemFlag';

function igGetStyleVarInfo(idx: ImGuiStyleVar): PImGuiDataVarInfo; cdecl;
  external SGT_DLL name _PU + 'igGetStyleVarInfo';

procedure igLogBegin(&type: ImGuiLogType; auto_open_depth: Integer); cdecl;
  external SGT_DLL name _PU + 'igLogBegin';

procedure igLogToBuffer(auto_open_depth: Integer); cdecl;
  external SGT_DLL name _PU + 'igLogToBuffer';

procedure igLogRenderedText(const ref_pos: PImVec2; const text: PUTF8Char; const text_end: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igLogRenderedText';

procedure igLogSetNextTextDecoration(const prefix: PUTF8Char; const suffix: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igLogSetNextTextDecoration';

function igBeginChildEx(const name: PUTF8Char; id: ImGuiID; size_arg: ImVec2; child_flags: ImGuiChildFlags; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginChildEx';

procedure igOpenPopupEx(id: ImGuiID; popup_flags: ImGuiPopupFlags); cdecl;
  external SGT_DLL name _PU + 'igOpenPopupEx';

procedure igClosePopupToLevel(remaining: Integer; restore_focus_to_window_under_popup: Boolean); cdecl;
  external SGT_DLL name _PU + 'igClosePopupToLevel';

procedure igClosePopupsOverWindow(ref_window: PImGuiWindow; restore_focus_to_window_under_popup: Boolean); cdecl;
  external SGT_DLL name _PU + 'igClosePopupsOverWindow';

procedure igClosePopupsExceptModals(); cdecl;
  external SGT_DLL name _PU + 'igClosePopupsExceptModals';

function igIsPopupOpen_ID(id: ImGuiID; popup_flags: ImGuiPopupFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsPopupOpen_ID';

function igBeginPopupEx(id: ImGuiID; extra_flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginPopupEx';

function igBeginTooltipEx(tooltip_flags: ImGuiTooltipFlags; extra_window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTooltipEx';

function igBeginTooltipHidden(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTooltipHidden';

procedure igGetPopupAllowedExtentRect(pOut: PImRect; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igGetPopupAllowedExtentRect';

function igGetTopMostPopupModal(): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igGetTopMostPopupModal';

function igGetTopMostAndVisiblePopupModal(): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igGetTopMostAndVisiblePopupModal';

function igFindBlockingModal(window: PImGuiWindow): PImGuiWindow; cdecl;
  external SGT_DLL name _PU + 'igFindBlockingModal';

procedure igFindBestWindowPosForPopup(pOut: PImVec2; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igFindBestWindowPosForPopup';

procedure igFindBestWindowPosForPopupEx(pOut: PImVec2; ref_pos: ImVec2; size: ImVec2; last_dir: PImGuiDir; r_outer: ImRect; r_avoid: ImRect; policy: ImGuiPopupPositionPolicy); cdecl;
  external SGT_DLL name _PU + 'igFindBestWindowPosForPopupEx';

function igBeginViewportSideBar(const name: PUTF8Char; viewport: PImGuiViewport; dir: ImGuiDir; size: Single; window_flags: ImGuiWindowFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginViewportSideBar';

function igBeginMenuEx(const &label: PUTF8Char; const icon: PUTF8Char; enabled: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginMenuEx';

function igMenuItemEx(const &label: PUTF8Char; const icon: PUTF8Char; const shortcut: PUTF8Char; selected: Boolean; enabled: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'igMenuItemEx';

function igBeginComboPopup(popup_id: ImGuiID; bb: ImRect; flags: ImGuiComboFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginComboPopup';

function igBeginComboPreview(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginComboPreview';

procedure igEndComboPreview(); cdecl;
  external SGT_DLL name _PU + 'igEndComboPreview';

procedure igNavInitWindow(window: PImGuiWindow; force_reinit: Boolean); cdecl;
  external SGT_DLL name _PU + 'igNavInitWindow';

procedure igNavInitRequestApplyResult(); cdecl;
  external SGT_DLL name _PU + 'igNavInitRequestApplyResult';

function igNavMoveRequestButNoResultYet(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestButNoResultYet';

procedure igNavMoveRequestSubmit(move_dir: ImGuiDir; clip_dir: ImGuiDir; move_flags: ImGuiNavMoveFlags; scroll_flags: ImGuiScrollFlags); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestSubmit';

procedure igNavMoveRequestForward(move_dir: ImGuiDir; clip_dir: ImGuiDir; move_flags: ImGuiNavMoveFlags; scroll_flags: ImGuiScrollFlags); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestForward';

procedure igNavMoveRequestResolveWithLastItem(result: PImGuiNavItemData); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestResolveWithLastItem';

procedure igNavMoveRequestResolveWithPastTreeNode(result: PImGuiNavItemData; tree_node_data: PImGuiNavTreeNodeData); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestResolveWithPastTreeNode';

procedure igNavMoveRequestCancel(); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestCancel';

procedure igNavMoveRequestApplyResult(); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestApplyResult';

procedure igNavMoveRequestTryWrapping(window: PImGuiWindow; move_flags: ImGuiNavMoveFlags); cdecl;
  external SGT_DLL name _PU + 'igNavMoveRequestTryWrapping';

procedure igNavHighlightActivated(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igNavHighlightActivated';

procedure igNavClearPreferredPosForAxis(axis: ImGuiAxis); cdecl;
  external SGT_DLL name _PU + 'igNavClearPreferredPosForAxis';

procedure igNavRestoreHighlightAfterMove(); cdecl;
  external SGT_DLL name _PU + 'igNavRestoreHighlightAfterMove';

procedure igNavUpdateCurrentWindowIsScrollPushableX(); cdecl;
  external SGT_DLL name _PU + 'igNavUpdateCurrentWindowIsScrollPushableX';

procedure igSetNavWindow(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igSetNavWindow';

procedure igSetNavID(id: ImGuiID; nav_layer: ImGuiNavLayer; focus_scope_id: ImGuiID; rect_rel: ImRect); cdecl;
  external SGT_DLL name _PU + 'igSetNavID';

procedure igSetNavFocusScope(focus_scope_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igSetNavFocusScope';

procedure igFocusItem(); cdecl;
  external SGT_DLL name _PU + 'igFocusItem';

procedure igActivateItemByID(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igActivateItemByID';

function igIsNamedKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsNamedKey';

function igIsNamedKeyOrModKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsNamedKeyOrModKey';

function igIsLegacyKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsLegacyKey';

function igIsKeyboardKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyboardKey';

function igIsGamepadKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsGamepadKey';

function igIsMouseKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseKey';

function igIsAliasKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsAliasKey';

function igIsModKey(key: ImGuiKey): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsModKey';

function igFixupKeyChord(ctx: PImGuiContext; key_chord: ImGuiKeyChord): ImGuiKeyChord; cdecl;
  external SGT_DLL name _PU + 'igFixupKeyChord';

function igConvertSingleModFlagToKey(ctx: PImGuiContext; key: ImGuiKey): ImGuiKey; cdecl;
  external SGT_DLL name _PU + 'igConvertSingleModFlagToKey';

function igGetKeyData_ContextPtr(ctx: PImGuiContext; key: ImGuiKey): PImGuiKeyData; cdecl;
  external SGT_DLL name _PU + 'igGetKeyData_ContextPtr';

function igGetKeyData_Key(key: ImGuiKey): PImGuiKeyData; cdecl;
  external SGT_DLL name _PU + 'igGetKeyData_Key';

function igGetKeyChordName(key_chord: ImGuiKeyChord): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igGetKeyChordName';

function igMouseButtonToKey(button: ImGuiMouseButton): ImGuiKey; cdecl;
  external SGT_DLL name _PU + 'igMouseButtonToKey';

function igIsMouseDragPastThreshold(button: ImGuiMouseButton; lock_threshold: Single): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseDragPastThreshold';

procedure igGetKeyMagnitude2d(pOut: PImVec2; key_left: ImGuiKey; key_right: ImGuiKey; key_up: ImGuiKey; key_down: ImGuiKey); cdecl;
  external SGT_DLL name _PU + 'igGetKeyMagnitude2d';

function igGetNavTweakPressedAmount(axis: ImGuiAxis): Single; cdecl;
  external SGT_DLL name _PU + 'igGetNavTweakPressedAmount';

function igCalcTypematicRepeatAmount(t0: Single; t1: Single; repeat_delay: Single; repeat_rate: Single): Integer; cdecl;
  external SGT_DLL name _PU + 'igCalcTypematicRepeatAmount';

procedure igGetTypematicRepeatRate(flags: ImGuiInputFlags; repeat_delay: PSingle; repeat_rate: PSingle); cdecl;
  external SGT_DLL name _PU + 'igGetTypematicRepeatRate';

procedure igTeleportMousePos(pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igTeleportMousePos';

procedure igSetActiveIdUsingAllKeyboardKeys(); cdecl;
  external SGT_DLL name _PU + 'igSetActiveIdUsingAllKeyboardKeys';

function igIsActiveIdUsingNavDir(dir: ImGuiDir): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsActiveIdUsingNavDir';

function igGetKeyOwner(key: ImGuiKey): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetKeyOwner';

procedure igSetKeyOwner(key: ImGuiKey; owner_id: ImGuiID; flags: ImGuiInputFlags); cdecl;
  external SGT_DLL name _PU + 'igSetKeyOwner';

procedure igSetKeyOwnersForKeyChord(key: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags); cdecl;
  external SGT_DLL name _PU + 'igSetKeyOwnersForKeyChord';

procedure igSetItemKeyOwner(key: ImGuiKey; flags: ImGuiInputFlags); cdecl;
  external SGT_DLL name _PU + 'igSetItemKeyOwner';

function igTestKeyOwner(key: ImGuiKey; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTestKeyOwner';

function igGetKeyOwnerData(ctx: PImGuiContext; key: ImGuiKey): PImGuiKeyOwnerData; cdecl;
  external SGT_DLL name _PU + 'igGetKeyOwnerData';

function igIsKeyDown_ID(key: ImGuiKey; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyDown_ID';

function igIsKeyPressed_ID(key: ImGuiKey; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyPressed_ID';

function igIsKeyReleased_ID(key: ImGuiKey; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyReleased_ID';

function igIsMouseDown_ID(button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseDown_ID';

function igIsMouseClicked_ID(button: ImGuiMouseButton; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseClicked_ID';

function igIsMouseReleased_ID(button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseReleased_ID';

function igIsMouseDoubleClicked_ID(button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsMouseDoubleClicked_ID';

function igIsKeyChordPressed_ID(key_chord: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsKeyChordPressed_ID';

procedure igSetNextItemShortcut(key_chord: ImGuiKeyChord); cdecl;
  external SGT_DLL name _PU + 'igSetNextItemShortcut';

function igShortcut(key_chord: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igShortcut';

function igSetShortcutRouting(key_chord: ImGuiKeyChord; owner_id: ImGuiID; flags: ImGuiInputFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSetShortcutRouting';

function igTestShortcutRouting(key_chord: ImGuiKeyChord; owner_id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTestShortcutRouting';

function igGetShortcutRoutingData(key_chord: ImGuiKeyChord): PImGuiKeyRoutingData; cdecl;
  external SGT_DLL name _PU + 'igGetShortcutRoutingData';

procedure igDockContextInitialize(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDockContextInitialize';

procedure igDockContextShutdown(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDockContextShutdown';

procedure igDockContextClearNodes(ctx: PImGuiContext; root_id: ImGuiID; clear_settings_refs: Boolean); cdecl;
  external SGT_DLL name _PU + 'igDockContextClearNodes';

procedure igDockContextRebuildNodes(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDockContextRebuildNodes';

procedure igDockContextNewFrameUpdateUndocking(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDockContextNewFrameUpdateUndocking';

procedure igDockContextNewFrameUpdateDocking(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDockContextNewFrameUpdateDocking';

procedure igDockContextEndFrame(ctx: PImGuiContext); cdecl;
  external SGT_DLL name _PU + 'igDockContextEndFrame';

function igDockContextGenNodeID(ctx: PImGuiContext): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igDockContextGenNodeID';

procedure igDockContextQueueDock(ctx: PImGuiContext; target: PImGuiWindow; target_node: PImGuiDockNode; payload: PImGuiWindow; split_dir: ImGuiDir; split_ratio: Single; split_outer: Boolean); cdecl;
  external SGT_DLL name _PU + 'igDockContextQueueDock';

procedure igDockContextQueueUndockWindow(ctx: PImGuiContext; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igDockContextQueueUndockWindow';

procedure igDockContextQueueUndockNode(ctx: PImGuiContext; node: PImGuiDockNode); cdecl;
  external SGT_DLL name _PU + 'igDockContextQueueUndockNode';

procedure igDockContextProcessUndockWindow(ctx: PImGuiContext; window: PImGuiWindow; clear_persistent_docking_ref: Boolean); cdecl;
  external SGT_DLL name _PU + 'igDockContextProcessUndockWindow';

procedure igDockContextProcessUndockNode(ctx: PImGuiContext; node: PImGuiDockNode); cdecl;
  external SGT_DLL name _PU + 'igDockContextProcessUndockNode';

function igDockContextCalcDropPosForDocking(target: PImGuiWindow; target_node: PImGuiDockNode; payload_window: PImGuiWindow; payload_node: PImGuiDockNode; split_dir: ImGuiDir; split_outer: Boolean; out_pos: PImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDockContextCalcDropPosForDocking';

function igDockContextFindNodeByID(ctx: PImGuiContext; id: ImGuiID): PImGuiDockNode; cdecl;
  external SGT_DLL name _PU + 'igDockContextFindNodeByID';

procedure igDockNodeWindowMenuHandler_Default(ctx: PImGuiContext; node: PImGuiDockNode; tab_bar: PImGuiTabBar); cdecl;
  external SGT_DLL name _PU + 'igDockNodeWindowMenuHandler_Default';

function igDockNodeBeginAmendTabBar(node: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDockNodeBeginAmendTabBar';

procedure igDockNodeEndAmendTabBar(); cdecl;
  external SGT_DLL name _PU + 'igDockNodeEndAmendTabBar';

function igDockNodeGetRootNode(node: PImGuiDockNode): PImGuiDockNode; cdecl;
  external SGT_DLL name _PU + 'igDockNodeGetRootNode';

function igDockNodeIsInHierarchyOf(node: PImGuiDockNode; parent: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDockNodeIsInHierarchyOf';

function igDockNodeGetDepth(const node: PImGuiDockNode): Integer; cdecl;
  external SGT_DLL name _PU + 'igDockNodeGetDepth';

function igDockNodeGetWindowMenuButtonId(const node: PImGuiDockNode): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igDockNodeGetWindowMenuButtonId';

function igGetWindowDockNode(): PImGuiDockNode; cdecl;
  external SGT_DLL name _PU + 'igGetWindowDockNode';

function igGetWindowAlwaysWantOwnTabBar(window: PImGuiWindow): Boolean; cdecl;
  external SGT_DLL name _PU + 'igGetWindowAlwaysWantOwnTabBar';

procedure igBeginDocked(window: PImGuiWindow; p_open: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igBeginDocked';

procedure igBeginDockableDragDropSource(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igBeginDockableDragDropSource';

procedure igBeginDockableDragDropTarget(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igBeginDockableDragDropTarget';

procedure igSetWindowDock(window: PImGuiWindow; dock_id: ImGuiID; cond: ImGuiCond); cdecl;
  external SGT_DLL name _PU + 'igSetWindowDock';

procedure igDockBuilderDockWindow(const window_name: PUTF8Char; node_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderDockWindow';

function igDockBuilderGetNode(node_id: ImGuiID): PImGuiDockNode; cdecl;
  external SGT_DLL name _PU + 'igDockBuilderGetNode';

function igDockBuilderGetCentralNode(node_id: ImGuiID): PImGuiDockNode; cdecl;
  external SGT_DLL name _PU + 'igDockBuilderGetCentralNode';

function igDockBuilderAddNode(node_id: ImGuiID; flags: ImGuiDockNodeFlags): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igDockBuilderAddNode';

procedure igDockBuilderRemoveNode(node_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderRemoveNode';

procedure igDockBuilderRemoveNodeDockedWindows(node_id: ImGuiID; clear_settings_refs: Boolean); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderRemoveNodeDockedWindows';

procedure igDockBuilderRemoveNodeChildNodes(node_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderRemoveNodeChildNodes';

procedure igDockBuilderSetNodePos(node_id: ImGuiID; pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderSetNodePos';

procedure igDockBuilderSetNodeSize(node_id: ImGuiID; size: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderSetNodeSize';

function igDockBuilderSplitNode(node_id: ImGuiID; split_dir: ImGuiDir; size_ratio_for_node_at_dir: Single; out_id_at_dir: PImGuiID; out_id_at_opposite_dir: PImGuiID): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igDockBuilderSplitNode';

procedure igDockBuilderCopyDockSpace(src_dockspace_id: ImGuiID; dst_dockspace_id: ImGuiID; in_window_remap_pairs: PImVector_const_charPtr); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderCopyDockSpace';

procedure igDockBuilderCopyNode(src_node_id: ImGuiID; dst_node_id: ImGuiID; out_node_remap_pairs: PImVector_ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderCopyNode';

procedure igDockBuilderCopyWindowSettings(const src_name: PUTF8Char; const dst_name: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderCopyWindowSettings';

procedure igDockBuilderFinish(node_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDockBuilderFinish';

procedure igPushFocusScope(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igPushFocusScope';

procedure igPopFocusScope(); cdecl;
  external SGT_DLL name _PU + 'igPopFocusScope';

function igGetCurrentFocusScope(): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetCurrentFocusScope';

function igIsDragDropActive(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsDragDropActive';

function igBeginDragDropTargetCustom(bb: ImRect; id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginDragDropTargetCustom';

procedure igClearDragDrop(); cdecl;
  external SGT_DLL name _PU + 'igClearDragDrop';

function igIsDragDropPayloadBeingAccepted(): Boolean; cdecl;
  external SGT_DLL name _PU + 'igIsDragDropPayloadBeingAccepted';

procedure igRenderDragDropTargetRect(bb: ImRect; item_clip_rect: ImRect); cdecl;
  external SGT_DLL name _PU + 'igRenderDragDropTargetRect';

function igGetTypingSelectRequest(flags: ImGuiTypingSelectFlags): PImGuiTypingSelectRequest; cdecl;
  external SGT_DLL name _PU + 'igGetTypingSelectRequest';

type
  igTypingSelectFindMatch_get_item_name_func = function(p1: Pointer; p2: Integer): PUTF8Char; cdecl;

function igTypingSelectFindMatch(req: PImGuiTypingSelectRequest; items_count: Integer; get_item_name_func: igTypingSelectFindMatch_get_item_name_func; user_data: Pointer; nav_item_idx: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'igTypingSelectFindMatch';

type
  igTypingSelectFindNextSingleCharMatch_get_item_name_func = function(p1: Pointer; p2: Integer): PUTF8Char; cdecl;

function igTypingSelectFindNextSingleCharMatch(req: PImGuiTypingSelectRequest; items_count: Integer; get_item_name_func: igTypingSelectFindNextSingleCharMatch_get_item_name_func; user_data: Pointer; nav_item_idx: Integer): Integer; cdecl;
  external SGT_DLL name _PU + 'igTypingSelectFindNextSingleCharMatch';

type
  igTypingSelectFindBestLeadingMatch_get_item_name_func = function(p1: Pointer; p2: Integer): PUTF8Char; cdecl;

function igTypingSelectFindBestLeadingMatch(req: PImGuiTypingSelectRequest; items_count: Integer; get_item_name_func: igTypingSelectFindBestLeadingMatch_get_item_name_func; user_data: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'igTypingSelectFindBestLeadingMatch';

procedure igSetWindowClipRectBeforeSetChannel(window: PImGuiWindow; clip_rect: ImRect); cdecl;
  external SGT_DLL name _PU + 'igSetWindowClipRectBeforeSetChannel';

procedure igBeginColumns(const str_id: PUTF8Char; count: Integer; flags: ImGuiOldColumnFlags); cdecl;
  external SGT_DLL name _PU + 'igBeginColumns';

procedure igEndColumns(); cdecl;
  external SGT_DLL name _PU + 'igEndColumns';

procedure igPushColumnClipRect(column_index: Integer); cdecl;
  external SGT_DLL name _PU + 'igPushColumnClipRect';

procedure igPushColumnsBackground(); cdecl;
  external SGT_DLL name _PU + 'igPushColumnsBackground';

procedure igPopColumnsBackground(); cdecl;
  external SGT_DLL name _PU + 'igPopColumnsBackground';

function igGetColumnsID(const str_id: PUTF8Char; count: Integer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetColumnsID';

function igFindOrCreateColumns(window: PImGuiWindow; id: ImGuiID): PImGuiOldColumns; cdecl;
  external SGT_DLL name _PU + 'igFindOrCreateColumns';

function igGetColumnOffsetFromNorm(const columns: PImGuiOldColumns; offset_norm: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igGetColumnOffsetFromNorm';

function igGetColumnNormFromOffset(const columns: PImGuiOldColumns; offset: Single): Single; cdecl;
  external SGT_DLL name _PU + 'igGetColumnNormFromOffset';

procedure igTableOpenContextMenu(column_n: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableOpenContextMenu';

procedure igTableSetColumnWidth(column_n: Integer; width: Single); cdecl;
  external SGT_DLL name _PU + 'igTableSetColumnWidth';

procedure igTableSetColumnSortDirection(column_n: Integer; sort_direction: ImGuiSortDirection; append_to_sort_specs: Boolean); cdecl;
  external SGT_DLL name _PU + 'igTableSetColumnSortDirection';

function igTableGetHoveredColumn(): Integer; cdecl;
  external SGT_DLL name _PU + 'igTableGetHoveredColumn';

function igTableGetHoveredRow(): Integer; cdecl;
  external SGT_DLL name _PU + 'igTableGetHoveredRow';

function igTableGetHeaderRowHeight(): Single; cdecl;
  external SGT_DLL name _PU + 'igTableGetHeaderRowHeight';

function igTableGetHeaderAngledMaxLabelWidth(): Single; cdecl;
  external SGT_DLL name _PU + 'igTableGetHeaderAngledMaxLabelWidth';

procedure igTablePushBackgroundChannel(); cdecl;
  external SGT_DLL name _PU + 'igTablePushBackgroundChannel';

procedure igTablePopBackgroundChannel(); cdecl;
  external SGT_DLL name _PU + 'igTablePopBackgroundChannel';

procedure igTableAngledHeadersRowEx(angle: Single; max_label_width: Single); cdecl;
  external SGT_DLL name _PU + 'igTableAngledHeadersRowEx';

function igGetCurrentTable(): PImGuiTable; cdecl;
  external SGT_DLL name _PU + 'igGetCurrentTable';

function igTableFindByID(id: ImGuiID): PImGuiTable; cdecl;
  external SGT_DLL name _PU + 'igTableFindByID';

function igBeginTableEx(const name: PUTF8Char; id: ImGuiID; columns_count: Integer; flags: ImGuiTableFlags; outer_size: ImVec2; inner_width: Single): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTableEx';

procedure igTableBeginInitMemory(table: PImGuiTable; columns_count: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableBeginInitMemory';

procedure igTableBeginApplyRequests(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableBeginApplyRequests';

procedure igTableSetupDrawChannels(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableSetupDrawChannels';

procedure igTableUpdateLayout(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableUpdateLayout';

procedure igTableUpdateBorders(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableUpdateBorders';

procedure igTableUpdateColumnsWeightFromWidth(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableUpdateColumnsWeightFromWidth';

procedure igTableDrawBorders(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableDrawBorders';

procedure igTableDrawDefaultContextMenu(table: PImGuiTable; flags_for_section_to_display: ImGuiTableFlags); cdecl;
  external SGT_DLL name _PU + 'igTableDrawDefaultContextMenu';

function igTableBeginContextMenuPopup(table: PImGuiTable): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTableBeginContextMenuPopup';

procedure igTableMergeDrawChannels(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableMergeDrawChannels';

function igTableGetInstanceData(table: PImGuiTable; instance_no: Integer): PImGuiTableInstanceData; cdecl;
  external SGT_DLL name _PU + 'igTableGetInstanceData';

function igTableGetInstanceID(table: PImGuiTable; instance_no: Integer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igTableGetInstanceID';

procedure igTableSortSpecsSanitize(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableSortSpecsSanitize';

procedure igTableSortSpecsBuild(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableSortSpecsBuild';

function igTableGetColumnNextSortDirection(column: PImGuiTableColumn): ImGuiSortDirection; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnNextSortDirection';

procedure igTableFixColumnSortDirection(table: PImGuiTable; column: PImGuiTableColumn); cdecl;
  external SGT_DLL name _PU + 'igTableFixColumnSortDirection';

function igTableGetColumnWidthAuto(table: PImGuiTable; column: PImGuiTableColumn): Single; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnWidthAuto';

procedure igTableBeginRow(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableBeginRow';

procedure igTableEndRow(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableEndRow';

procedure igTableBeginCell(table: PImGuiTable; column_n: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableBeginCell';

procedure igTableEndCell(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableEndCell';

procedure igTableGetCellBgRect(pOut: PImRect; const table: PImGuiTable; column_n: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableGetCellBgRect';

function igTableGetColumnName_TablePtr(const table: PImGuiTable; column_n: Integer): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnName_TablePtr';

function igTableGetColumnResizeID(table: PImGuiTable; column_n: Integer; instance_no: Integer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igTableGetColumnResizeID';

function igTableGetMaxColumnWidth(const table: PImGuiTable; column_n: Integer): Single; cdecl;
  external SGT_DLL name _PU + 'igTableGetMaxColumnWidth';

procedure igTableSetColumnWidthAutoSingle(table: PImGuiTable; column_n: Integer); cdecl;
  external SGT_DLL name _PU + 'igTableSetColumnWidthAutoSingle';

procedure igTableSetColumnWidthAutoAll(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableSetColumnWidthAutoAll';

procedure igTableRemove(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableRemove';

procedure igTableGcCompactTransientBuffers_TablePtr(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableGcCompactTransientBuffers_TablePtr';

procedure igTableGcCompactTransientBuffers_TableTempDataPtr(table: PImGuiTableTempData); cdecl;
  external SGT_DLL name _PU + 'igTableGcCompactTransientBuffers_TableTempDataPtr';

procedure igTableGcCompactSettings(); cdecl;
  external SGT_DLL name _PU + 'igTableGcCompactSettings';

procedure igTableLoadSettings(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableLoadSettings';

procedure igTableSaveSettings(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableSaveSettings';

procedure igTableResetSettings(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igTableResetSettings';

function igTableGetBoundSettings(table: PImGuiTable): PImGuiTableSettings; cdecl;
  external SGT_DLL name _PU + 'igTableGetBoundSettings';

procedure igTableSettingsAddSettingsHandler(); cdecl;
  external SGT_DLL name _PU + 'igTableSettingsAddSettingsHandler';

function igTableSettingsCreate(id: ImGuiID; columns_count: Integer): PImGuiTableSettings; cdecl;
  external SGT_DLL name _PU + 'igTableSettingsCreate';

function igTableSettingsFindByID(id: ImGuiID): PImGuiTableSettings; cdecl;
  external SGT_DLL name _PU + 'igTableSettingsFindByID';

function igGetCurrentTabBar(): PImGuiTabBar; cdecl;
  external SGT_DLL name _PU + 'igGetCurrentTabBar';

function igBeginTabBarEx(tab_bar: PImGuiTabBar; bb: ImRect; flags: ImGuiTabBarFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igBeginTabBarEx';

function igTabBarFindTabByID(tab_bar: PImGuiTabBar; tab_id: ImGuiID): PImGuiTabItem; cdecl;
  external SGT_DLL name _PU + 'igTabBarFindTabByID';

function igTabBarFindTabByOrder(tab_bar: PImGuiTabBar; order: Integer): PImGuiTabItem; cdecl;
  external SGT_DLL name _PU + 'igTabBarFindTabByOrder';

function igTabBarFindMostRecentlySelectedTabForActiveWindow(tab_bar: PImGuiTabBar): PImGuiTabItem; cdecl;
  external SGT_DLL name _PU + 'igTabBarFindMostRecentlySelectedTabForActiveWindow';

function igTabBarGetCurrentTab(tab_bar: PImGuiTabBar): PImGuiTabItem; cdecl;
  external SGT_DLL name _PU + 'igTabBarGetCurrentTab';

function igTabBarGetTabOrder(tab_bar: PImGuiTabBar; tab: PImGuiTabItem): Integer; cdecl;
  external SGT_DLL name _PU + 'igTabBarGetTabOrder';

function igTabBarGetTabName(tab_bar: PImGuiTabBar; tab: PImGuiTabItem): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igTabBarGetTabName';

procedure igTabBarAddTab(tab_bar: PImGuiTabBar; tab_flags: ImGuiTabItemFlags; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igTabBarAddTab';

procedure igTabBarRemoveTab(tab_bar: PImGuiTabBar; tab_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igTabBarRemoveTab';

procedure igTabBarCloseTab(tab_bar: PImGuiTabBar; tab: PImGuiTabItem); cdecl;
  external SGT_DLL name _PU + 'igTabBarCloseTab';

procedure igTabBarQueueFocus(tab_bar: PImGuiTabBar; tab: PImGuiTabItem); cdecl;
  external SGT_DLL name _PU + 'igTabBarQueueFocus';

procedure igTabBarQueueReorder(tab_bar: PImGuiTabBar; tab: PImGuiTabItem; offset: Integer); cdecl;
  external SGT_DLL name _PU + 'igTabBarQueueReorder';

procedure igTabBarQueueReorderFromMousePos(tab_bar: PImGuiTabBar; tab: PImGuiTabItem; mouse_pos: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igTabBarQueueReorderFromMousePos';

function igTabBarProcessReorder(tab_bar: PImGuiTabBar): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTabBarProcessReorder';

function igTabItemEx(tab_bar: PImGuiTabBar; const &label: PUTF8Char; p_open: PBoolean; flags: ImGuiTabItemFlags; docked_window: PImGuiWindow): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTabItemEx';

procedure igTabItemCalcSize_Str(pOut: PImVec2; const &label: PUTF8Char; has_close_button_or_unsaved_marker: Boolean); cdecl;
  external SGT_DLL name _PU + 'igTabItemCalcSize_Str';

procedure igTabItemCalcSize_WindowPtr(pOut: PImVec2; window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igTabItemCalcSize_WindowPtr';

procedure igTabItemBackground(draw_list: PImDrawList; bb: ImRect; flags: ImGuiTabItemFlags; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igTabItemBackground';

procedure igTabItemLabelAndCloseButton(draw_list: PImDrawList; bb: ImRect; flags: ImGuiTabItemFlags; frame_padding: ImVec2; const &label: PUTF8Char; tab_id: ImGuiID; close_button_id: ImGuiID; is_contents_visible: Boolean; out_just_closed: PBoolean; out_text_clipped: PBoolean); cdecl;
  external SGT_DLL name _PU + 'igTabItemLabelAndCloseButton';

procedure igRenderText(pos: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; hide_text_after_hash: Boolean); cdecl;
  external SGT_DLL name _PU + 'igRenderText';

procedure igRenderTextWrapped(pos: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; wrap_width: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderTextWrapped';

procedure igRenderTextClipped(pos_min: ImVec2; pos_max: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; const text_size_if_known: PImVec2; align: ImVec2; const clip_rect: PImRect); cdecl;
  external SGT_DLL name _PU + 'igRenderTextClipped';

procedure igRenderTextClippedEx(draw_list: PImDrawList; pos_min: ImVec2; pos_max: ImVec2; const text: PUTF8Char; const text_end: PUTF8Char; const text_size_if_known: PImVec2; align: ImVec2; const clip_rect: PImRect); cdecl;
  external SGT_DLL name _PU + 'igRenderTextClippedEx';

procedure igRenderTextEllipsis(draw_list: PImDrawList; pos_min: ImVec2; pos_max: ImVec2; clip_max_x: Single; ellipsis_max_x: Single; const text: PUTF8Char; const text_end: PUTF8Char; const text_size_if_known: PImVec2); cdecl;
  external SGT_DLL name _PU + 'igRenderTextEllipsis';

procedure igRenderFrame(p_min: ImVec2; p_max: ImVec2; fill_col: ImU32; border: Boolean; rounding: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderFrame';

procedure igRenderFrameBorder(p_min: ImVec2; p_max: ImVec2; rounding: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderFrameBorder';

procedure igRenderColorRectWithAlphaCheckerboard(draw_list: PImDrawList; p_min: ImVec2; p_max: ImVec2; fill_col: ImU32; grid_step: Single; grid_off: ImVec2; rounding: Single; flags: ImDrawFlags); cdecl;
  external SGT_DLL name _PU + 'igRenderColorRectWithAlphaCheckerboard';

procedure igRenderNavHighlight(bb: ImRect; id: ImGuiID; flags: ImGuiNavHighlightFlags); cdecl;
  external SGT_DLL name _PU + 'igRenderNavHighlight';

function igFindRenderedTextEnd(const text: PUTF8Char; const text_end: PUTF8Char): PUTF8Char; cdecl;
  external SGT_DLL name _PU + 'igFindRenderedTextEnd';

procedure igRenderMouseCursor(pos: ImVec2; scale: Single; mouse_cursor: ImGuiMouseCursor; col_fill: ImU32; col_border: ImU32; col_shadow: ImU32); cdecl;
  external SGT_DLL name _PU + 'igRenderMouseCursor';

procedure igRenderArrow(draw_list: PImDrawList; pos: ImVec2; col: ImU32; dir: ImGuiDir; scale: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderArrow';

procedure igRenderBullet(draw_list: PImDrawList; pos: ImVec2; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igRenderBullet';

procedure igRenderCheckMark(draw_list: PImDrawList; pos: ImVec2; col: ImU32; sz: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderCheckMark';

procedure igRenderArrowPointingAt(draw_list: PImDrawList; pos: ImVec2; half_sz: ImVec2; direction: ImGuiDir; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igRenderArrowPointingAt';

procedure igRenderArrowDockMenu(draw_list: PImDrawList; p_min: ImVec2; sz: Single; col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igRenderArrowDockMenu';

procedure igRenderRectFilledRangeH(draw_list: PImDrawList; rect: ImRect; col: ImU32; x_start_norm: Single; x_end_norm: Single; rounding: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderRectFilledRangeH';

procedure igRenderRectFilledWithHole(draw_list: PImDrawList; outer: ImRect; inner: ImRect; col: ImU32; rounding: Single); cdecl;
  external SGT_DLL name _PU + 'igRenderRectFilledWithHole';

function igCalcRoundingFlagsForRectInRect(r_in: ImRect; r_outer: ImRect; threshold: Single): ImDrawFlags; cdecl;
  external SGT_DLL name _PU + 'igCalcRoundingFlagsForRectInRect';

procedure igTextEx(const text: PUTF8Char; const text_end: PUTF8Char; flags: ImGuiTextFlags); cdecl;
  external SGT_DLL name _PU + 'igTextEx';

function igButtonEx(const &label: PUTF8Char; size_arg: ImVec2; flags: ImGuiButtonFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igButtonEx';

function igArrowButtonEx(const str_id: PUTF8Char; dir: ImGuiDir; size_arg: ImVec2; flags: ImGuiButtonFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igArrowButtonEx';

function igImageButtonEx(id: ImGuiID; texture_id: ImTextureID; image_size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4; flags: ImGuiButtonFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igImageButtonEx';

procedure igSeparatorEx(flags: ImGuiSeparatorFlags; thickness: Single); cdecl;
  external SGT_DLL name _PU + 'igSeparatorEx';

procedure igSeparatorTextEx(id: ImGuiID; const &label: PUTF8Char; const label_end: PUTF8Char; extra_width: Single); cdecl;
  external SGT_DLL name _PU + 'igSeparatorTextEx';

function igCheckboxFlags_S64Ptr(const &label: PUTF8Char; flags: PImS64; flags_value: ImS64): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCheckboxFlags_S64Ptr';

function igCheckboxFlags_U64Ptr(const &label: PUTF8Char; flags: PImU64; flags_value: ImU64): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCheckboxFlags_U64Ptr';

function igCloseButton(id: ImGuiID; pos: ImVec2): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCloseButton';

function igCollapseButton(id: ImGuiID; pos: ImVec2; dock_node: PImGuiDockNode): Boolean; cdecl;
  external SGT_DLL name _PU + 'igCollapseButton';

procedure igScrollbar(axis: ImGuiAxis); cdecl;
  external SGT_DLL name _PU + 'igScrollbar';

function igScrollbarEx(bb: ImRect; id: ImGuiID; axis: ImGuiAxis; p_scroll_v: PImS64; avail_v: ImS64; contents_v: ImS64; flags: ImDrawFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igScrollbarEx';

procedure igGetWindowScrollbarRect(pOut: PImRect; window: PImGuiWindow; axis: ImGuiAxis); cdecl;
  external SGT_DLL name _PU + 'igGetWindowScrollbarRect';

function igGetWindowScrollbarID(window: PImGuiWindow; axis: ImGuiAxis): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetWindowScrollbarID';

function igGetWindowResizeCornerID(window: PImGuiWindow; n: Integer): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetWindowResizeCornerID';

function igGetWindowResizeBorderID(window: PImGuiWindow; dir: ImGuiDir): ImGuiID; cdecl;
  external SGT_DLL name _PU + 'igGetWindowResizeBorderID';

function igButtonBehavior(bb: ImRect; id: ImGuiID; out_hovered: PBoolean; out_held: PBoolean; flags: ImGuiButtonFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igButtonBehavior';

function igDragBehavior(id: ImGuiID; data_type: ImGuiDataType; p_v: Pointer; v_speed: Single; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDragBehavior';

function igSliderBehavior(bb: ImRect; id: ImGuiID; data_type: ImGuiDataType; p_v: Pointer; const p_min: Pointer; const p_max: Pointer; const format: PUTF8Char; flags: ImGuiSliderFlags; out_grab_bb: PImRect): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSliderBehavior';

function igSplitterBehavior(bb: ImRect; id: ImGuiID; axis: ImGuiAxis; size1: PSingle; size2: PSingle; min_size1: Single; min_size2: Single; hover_extend: Single; hover_visibility_delay: Single; bg_col: ImU32): Boolean; cdecl;
  external SGT_DLL name _PU + 'igSplitterBehavior';

function igTreeNodeBehavior(id: ImGuiID; flags: ImGuiTreeNodeFlags; const &label: PUTF8Char; const label_end: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeBehavior';

procedure igTreePushOverrideID(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igTreePushOverrideID';

procedure igTreeNodeSetOpen(id: ImGuiID; open: Boolean); cdecl;
  external SGT_DLL name _PU + 'igTreeNodeSetOpen';

function igTreeNodeUpdateNextOpen(id: ImGuiID; flags: ImGuiTreeNodeFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTreeNodeUpdateNextOpen';

procedure igSetNextItemSelectionUserData(selection_user_data: ImGuiSelectionUserData); cdecl;
  external SGT_DLL name _PU + 'igSetNextItemSelectionUserData';

function igDataTypeGetInfo(data_type: ImGuiDataType): PImGuiDataTypeInfo; cdecl;
  external SGT_DLL name _PU + 'igDataTypeGetInfo';

function igDataTypeFormatString(buf: PUTF8Char; buf_size: Integer; data_type: ImGuiDataType; const p_data: Pointer; const format: PUTF8Char): Integer; cdecl;
  external SGT_DLL name _PU + 'igDataTypeFormatString';

procedure igDataTypeApplyOp(data_type: ImGuiDataType; op: Integer; output: Pointer; const arg_1: Pointer; const arg_2: Pointer); cdecl;
  external SGT_DLL name _PU + 'igDataTypeApplyOp';

function igDataTypeApplyFromText(const buf: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const format: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDataTypeApplyFromText';

function igDataTypeCompare(data_type: ImGuiDataType; const arg_1: Pointer; const arg_2: Pointer): Integer; cdecl;
  external SGT_DLL name _PU + 'igDataTypeCompare';

function igDataTypeClamp(data_type: ImGuiDataType; p_data: Pointer; const p_min: Pointer; const p_max: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDataTypeClamp';

function igInputTextEx(const &label: PUTF8Char; const hint: PUTF8Char; buf: PUTF8Char; buf_size: Integer; size_arg: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igInputTextEx';

procedure igInputTextDeactivateHook(id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igInputTextDeactivateHook';

function igTempInputText(bb: ImRect; id: ImGuiID; const &label: PUTF8Char; buf: PUTF8Char; buf_size: Integer; flags: ImGuiInputTextFlags): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTempInputText';

function igTempInputScalar(bb: ImRect; id: ImGuiID; const &label: PUTF8Char; data_type: ImGuiDataType; p_data: Pointer; const format: PUTF8Char; const p_clamp_min: Pointer; const p_clamp_max: Pointer): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTempInputScalar';

function igTempInputIsActive(id: ImGuiID): Boolean; cdecl;
  external SGT_DLL name _PU + 'igTempInputIsActive';

function igGetInputTextState(id: ImGuiID): PImGuiInputTextState; cdecl;
  external SGT_DLL name _PU + 'igGetInputTextState';

procedure igColorTooltip(const text: PUTF8Char; const col: PSingle; flags: ImGuiColorEditFlags); cdecl;
  external SGT_DLL name _PU + 'igColorTooltip';

procedure igColorEditOptionsPopup(const col: PSingle; flags: ImGuiColorEditFlags); cdecl;
  external SGT_DLL name _PU + 'igColorEditOptionsPopup';

procedure igColorPickerOptionsPopup(const ref_col: PSingle; flags: ImGuiColorEditFlags); cdecl;
  external SGT_DLL name _PU + 'igColorPickerOptionsPopup';

type
  igPlotEx_values_getter = function(data: Pointer; idx: Integer): Single; cdecl;

function igPlotEx(plot_type: ImGuiPlotType; const &label: PUTF8Char; values_getter: igPlotEx_values_getter; data: Pointer; values_count: Integer; values_offset: Integer; const overlay_text: PUTF8Char; scale_min: Single; scale_max: Single; size_arg: ImVec2): Integer; cdecl;
  external SGT_DLL name _PU + 'igPlotEx';

procedure igShadeVertsLinearColorGradientKeepAlpha(draw_list: PImDrawList; vert_start_idx: Integer; vert_end_idx: Integer; gradient_p0: ImVec2; gradient_p1: ImVec2; col0: ImU32; col1: ImU32); cdecl;
  external SGT_DLL name _PU + 'igShadeVertsLinearColorGradientKeepAlpha';

procedure igShadeVertsLinearUV(draw_list: PImDrawList; vert_start_idx: Integer; vert_end_idx: Integer; a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2; clamp: Boolean); cdecl;
  external SGT_DLL name _PU + 'igShadeVertsLinearUV';

procedure igShadeVertsTransformPos(draw_list: PImDrawList; vert_start_idx: Integer; vert_end_idx: Integer; pivot_in: ImVec2; cos_a: Single; sin_a: Single; pivot_out: ImVec2); cdecl;
  external SGT_DLL name _PU + 'igShadeVertsTransformPos';

procedure igGcCompactTransientMiscBuffers(); cdecl;
  external SGT_DLL name _PU + 'igGcCompactTransientMiscBuffers';

procedure igGcCompactTransientWindowBuffers(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igGcCompactTransientWindowBuffers';

procedure igGcAwakeTransientWindowBuffers(window: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igGcAwakeTransientWindowBuffers';

procedure igDebugLog(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igDebugLog';

procedure igDebugLogV(const fmt: PUTF8Char; args: Pointer); cdecl;
  external SGT_DLL name _PU + 'igDebugLogV';

procedure igDebugAllocHook(info: PImGuiDebugAllocInfo; frame_count: Integer; ptr: Pointer; size: NativeUInt); cdecl;
  external SGT_DLL name _PU + 'igDebugAllocHook';

procedure igErrorCheckEndFrameRecover(log_callback: ImGuiErrorLogCallback; user_data: Pointer); cdecl;
  external SGT_DLL name _PU + 'igErrorCheckEndFrameRecover';

procedure igErrorCheckEndWindowRecover(log_callback: ImGuiErrorLogCallback; user_data: Pointer); cdecl;
  external SGT_DLL name _PU + 'igErrorCheckEndWindowRecover';

procedure igErrorCheckUsingSetCursorPosToExtendParentBoundaries(); cdecl;
  external SGT_DLL name _PU + 'igErrorCheckUsingSetCursorPosToExtendParentBoundaries';

procedure igDebugDrawCursorPos(col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igDebugDrawCursorPos';

procedure igDebugDrawLineExtents(col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igDebugDrawLineExtents';

procedure igDebugDrawItemRect(col: ImU32); cdecl;
  external SGT_DLL name _PU + 'igDebugDrawItemRect';

procedure igDebugLocateItem(target_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDebugLocateItem';

procedure igDebugLocateItemOnHover(target_id: ImGuiID); cdecl;
  external SGT_DLL name _PU + 'igDebugLocateItemOnHover';

procedure igDebugLocateItemResolveWithLastItem(); cdecl;
  external SGT_DLL name _PU + 'igDebugLocateItemResolveWithLastItem';

procedure igDebugBreakClearData(); cdecl;
  external SGT_DLL name _PU + 'igDebugBreakClearData';

function igDebugBreakButton(const &label: PUTF8Char; const description_of_location: PUTF8Char): Boolean; cdecl;
  external SGT_DLL name _PU + 'igDebugBreakButton';

procedure igDebugBreakButtonTooltip(keyboard_only: Boolean; const description_of_location: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugBreakButtonTooltip';

procedure igShowFontAtlas(atlas: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'igShowFontAtlas';

procedure igDebugHookIdInfo(id: ImGuiID; data_type: ImGuiDataType; const data_id: Pointer; const data_id_end: Pointer); cdecl;
  external SGT_DLL name _PU + 'igDebugHookIdInfo';

procedure igDebugNodeColumns(columns: PImGuiOldColumns); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeColumns';

procedure igDebugNodeDockNode(node: PImGuiDockNode; const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeDockNode';

procedure igDebugNodeDrawList(window: PImGuiWindow; viewport: PImGuiViewportP; const draw_list: PImDrawList; const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeDrawList';

procedure igDebugNodeDrawCmdShowMeshAndBoundingBox(out_draw_list: PImDrawList; const draw_list: PImDrawList; const draw_cmd: PImDrawCmd; show_mesh: Boolean; show_aabb: Boolean); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeDrawCmdShowMeshAndBoundingBox';

procedure igDebugNodeFont(font: PImFont); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeFont';

procedure igDebugNodeFontGlyph(font: PImFont; const glyph: PImFontGlyph); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeFontGlyph';

procedure igDebugNodeStorage(storage: PImGuiStorage; const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeStorage';

procedure igDebugNodeTabBar(tab_bar: PImGuiTabBar; const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeTabBar';

procedure igDebugNodeTable(table: PImGuiTable); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeTable';

procedure igDebugNodeTableSettings(settings: PImGuiTableSettings); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeTableSettings';

procedure igDebugNodeInputTextState(state: PImGuiInputTextState); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeInputTextState';

procedure igDebugNodeTypingSelectState(state: PImGuiTypingSelectState); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeTypingSelectState';

procedure igDebugNodeWindow(window: PImGuiWindow; const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeWindow';

procedure igDebugNodeWindowSettings(settings: PImGuiWindowSettings); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeWindowSettings';

procedure igDebugNodeWindowsList(windows: PImVector_ImGuiWindowPtr; const &label: PUTF8Char); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeWindowsList';

procedure igDebugNodeWindowsListByBeginStackParent(windows: PPImGuiWindow; windows_size: Integer; parent_in_begin_stack: PImGuiWindow); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeWindowsListByBeginStackParent';

procedure igDebugNodeViewport(viewport: PImGuiViewportP); cdecl;
  external SGT_DLL name _PU + 'igDebugNodeViewport';

procedure igDebugRenderKeyboardPreview(draw_list: PImDrawList); cdecl;
  external SGT_DLL name _PU + 'igDebugRenderKeyboardPreview';

procedure igDebugRenderViewportThumbnail(draw_list: PImDrawList; viewport: PImGuiViewportP; bb: ImRect); cdecl;
  external SGT_DLL name _PU + 'igDebugRenderViewportThumbnail';

function igImFontAtlasGetBuilderForStbTruetype(): PImFontBuilderIO; cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasGetBuilderForStbTruetype';

procedure igImFontAtlasUpdateConfigDataPointers(atlas: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasUpdateConfigDataPointers';

procedure igImFontAtlasBuildInit(atlas: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildInit';

procedure igImFontAtlasBuildSetupFont(atlas: PImFontAtlas; font: PImFont; font_config: PImFontConfig; ascent: Single; descent: Single); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildSetupFont';

procedure igImFontAtlasBuildPackCustomRects(atlas: PImFontAtlas; stbrp_context_opaque: Pointer); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildPackCustomRects';

procedure igImFontAtlasBuildFinish(atlas: PImFontAtlas); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildFinish';

procedure igImFontAtlasBuildRender8bppRectFromString(atlas: PImFontAtlas; x: Integer; y: Integer; w: Integer; h: Integer; const in_str: PUTF8Char; in_marker_char: UTF8Char; in_marker_pixel_value: Byte); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildRender8bppRectFromString';

procedure igImFontAtlasBuildRender32bppRectFromString(atlas: PImFontAtlas; x: Integer; y: Integer; w: Integer; h: Integer; const in_str: PUTF8Char; in_marker_char: UTF8Char; in_marker_pixel_value: Cardinal); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildRender32bppRectFromString';

procedure igImFontAtlasBuildMultiplyCalcLookupTable(out_table: PByte; in_multiply_factor: Single); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildMultiplyCalcLookupTable';

procedure igImFontAtlasBuildMultiplyRectAlpha8(table: PByte; pixels: PByte; x: Integer; y: Integer; w: Integer; h: Integer; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'igImFontAtlasBuildMultiplyRectAlpha8';

procedure igLogText(const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'igLogText';

procedure ImGuiTextBuffer_appendf(buffer: PImGuiTextBuffer; const fmt: PUTF8Char) varargs; cdecl;
  external SGT_DLL name _PU + 'ImGuiTextBuffer_appendf';

function igGET_FLT_MAX(): Single; cdecl;
  external SGT_DLL name _PU + 'igGET_FLT_MAX';

function igGET_FLT_MIN(): Single; cdecl;
  external SGT_DLL name _PU + 'igGET_FLT_MIN';

function ImVector_ImWchar_create(): PImVector_ImWchar; cdecl;
  external SGT_DLL name _PU + 'ImVector_ImWchar_create';

procedure ImVector_ImWchar_destroy(self: PImVector_ImWchar); cdecl;
  external SGT_DLL name _PU + 'ImVector_ImWchar_destroy';

procedure ImVector_ImWchar_Init(p: PImVector_ImWchar); cdecl;
  external SGT_DLL name _PU + 'ImVector_ImWchar_Init';

procedure ImVector_ImWchar_UnInit(p: PImVector_ImWchar); cdecl;
  external SGT_DLL name _PU + 'ImVector_ImWchar_UnInit';

function ImGui_ImplOpenGL2_Init(): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_Init';

procedure ImGui_ImplOpenGL2_Shutdown(); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_Shutdown';

procedure ImGui_ImplOpenGL2_NewFrame(); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_NewFrame';

procedure ImGui_ImplOpenGL2_RenderDrawData(draw_data: Pointer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_RenderDrawData';

function ImGui_ImplOpenGL2_CreateFontsTexture(): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_CreateFontsTexture';

procedure ImGui_ImplOpenGL2_DestroyFontsTexture(); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_DestroyFontsTexture';

function ImGui_ImplOpenGL2_CreateDeviceObjects(): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_CreateDeviceObjects';

procedure ImGui_ImplOpenGL2_DestroyDeviceObjects(); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplOpenGL2_DestroyDeviceObjects';

function ImGui_ImplGlfw_InitForOpenGL(window: Pointer; install_callbacks: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_InitForOpenGL';

function ImGui_ImplGlfw_InitForVulkan(window: Pointer; install_callbacks: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_InitForVulkan';

function ImGui_ImplGlfw_InitForOther(window: Pointer; install_callbacks: Boolean): Boolean; cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_InitForOther';

procedure ImGui_ImplGlfw_Shutdown(); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_Shutdown';

procedure ImGui_ImplGlfw_NewFrame(); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_NewFrame';

procedure ImGui_ImplGlfw_InstallCallbacks(window: Pointer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_InstallCallbacks';

procedure ImGui_ImplGlfw_RestoreCallbacks(window: Pointer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_RestoreCallbacks';

procedure ImGui_ImplGlfw_SetCallbacksChainForAllWindows(chain_for_all_windows: Boolean); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_SetCallbacksChainForAllWindows';

procedure ImGui_ImplGlfw_WindowFocusCallback(window: Pointer; focused: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_WindowFocusCallback';

procedure ImGui_ImplGlfw_CursorEnterCallback(window: Pointer; entered: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_CursorEnterCallback';

procedure ImGui_ImplGlfw_CursorPosCallback(window: Pointer; x: Double; y: Double); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_CursorPosCallback';

procedure ImGui_ImplGlfw_MouseButtonCallback(window: Pointer; button: Integer; action: Integer; mods: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_MouseButtonCallback';

procedure ImGui_ImplGlfw_ScrollCallback(window: Pointer; xoffset: Double; yoffset: Double); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_ScrollCallback';

procedure ImGui_ImplGlfw_KeyCallback(window: Pointer; key: Integer; scancode: Integer; action: Integer; mods: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_KeyCallback';

procedure ImGui_ImplGlfw_CharCallback(window: Pointer; c: Cardinal); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_CharCallback';

procedure ImGui_ImplGlfw_MonitorCallback(monitor: Pointer; event: Integer); cdecl;
  external SGT_DLL name _PU + 'ImGui_ImplGlfw_MonitorCallback';

function nsvgParseFromFile(const filename: PUTF8Char; const units: PUTF8Char; dpi: Single): PNSVGimage; cdecl;
  external SGT_DLL name _PU + 'nsvgParseFromFile';

function nsvgParse(input: PUTF8Char; const units: PUTF8Char; dpi: Single): PNSVGimage; cdecl;
  external SGT_DLL name _PU + 'nsvgParse';

function nsvgDuplicatePath(p: PNSVGpath): PNSVGpath; cdecl;
  external SGT_DLL name _PU + 'nsvgDuplicatePath';

procedure nsvgDelete(image: PNSVGimage); cdecl;
  external SGT_DLL name _PU + 'nsvgDelete';

function nsvgCreateRasterizer(): PNSVGrasterizer; cdecl;
  external SGT_DLL name _PU + 'nsvgCreateRasterizer';

procedure nsvgRasterize(r: PNSVGrasterizer; image: PNSVGimage; tx: Single; ty: Single; scale: Single; dst: PByte; w: Integer; h: Integer; stride: Integer); cdecl;
  external SGT_DLL name _PU + 'nsvgRasterize';

procedure nsvgDeleteRasterizer(p1: PNSVGrasterizer); cdecl;
  external SGT_DLL name _PU + 'nsvgDeleteRasterizer';

implementation

{ImGuiTableColumnSortSpecs}

function ImGuiTableColumnSortSpecs.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumnSortSpecs.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImFontGlyph}

function ImFontGlyph.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImFontGlyph.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiNextItemData}

function ImGuiNextItemData.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiNextItemData.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiDockNode}

function ImGuiDockNode.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiDockNode.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiStackLevelInfo}

function ImGuiStackLevelInfo.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiStackLevelInfo.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiContext}

function ImGuiContext.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiContext.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiWindow}

function ImGuiWindow.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiWindow.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiWindow}

function ImGuiWindow.GetData1Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data1 shr Offset) and Mask;
end;

procedure ImGuiWindow.SetData1Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data1 := (Data1 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTableColumn}

function ImGuiTableColumn.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumn.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTable}

function ImGuiTable.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTable.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTableColumnSettings}

function ImGuiTableColumnSettings.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumnSettings.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;


end.
