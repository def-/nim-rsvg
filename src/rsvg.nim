{.deadCodeElim: on.}
import glib2, gdk2pixbuf

when defined(windows): 
  const 
    rsvglib* = "librsvg-2.dll"
elif defined(macosx): 
  const 
    rsvglib* = "librsvg-2.dylib"
else: 
  const 
    rsvglib* = "librsvg-2.so"

type 
  RsvgError* {.size: sizeof(cint).} = enum 
    RSVG_ERROR_FAILED

  RsvgHandleClass* = object
    parent*: TGObjectClass
    abi_padding*: array[15, gpointer]

  RsvgHandle* = object 
    parent*: TGObject
    priv*: pointer
    abi_padding*: array[15, gpointer]

  RsvgDimensionData* = object 
    width*: cint
    height*: cint
    em*: gdouble
    ex*: gdouble

  RsvgPositionData* = object 
    x*: cint
    y*: cint

  RsvgHandleFlags* {.size: sizeof(cint).} = enum 
    RSVG_HANDLE_FLAGS_NONE = 0

proc handle_get_type*(): GType {.cdecl, importc: "rsvg_handle_get_type", 
                                 dynlib: rsvglib.}
proc cleanup*() {.cdecl, importc: "rsvg_cleanup", dynlib: rsvglib.}
proc set_default_dpi*(dpi: cdouble) {.cdecl, 
    importc: "rsvg_set_default_dpi", dynlib: rsvglib.}
proc set_default_dpi_x_y*(dpi_x: cdouble; dpi_y: cdouble) {.cdecl, 
    importc: "rsvg_set_default_dpi_x_y", dynlib: rsvglib.}
proc handle_set_dpi*(handle: ptr RsvgHandle; dpi: cdouble) {.cdecl, 
    importc: "rsvg_handle_set_dpi", dynlib: rsvglib.}
proc handle_set_dpi_x_y*(handle: ptr RsvgHandle; dpi_x: cdouble; 
                              dpi_y: cdouble) {.cdecl, 
    importc: "rsvg_handle_set_dpi_x_y", dynlib: rsvglib.}
proc handle_new*(): ptr RsvgHandle {.cdecl, importc: "rsvg_handle_new", 
    dynlib: rsvglib.}
proc handle_write*(handle: ptr RsvgHandle; buf: ptr guchar; count: gsize; 
                   error: pointer): gboolean {.cdecl, 
    importc: "rsvg_handle_write", dynlib: rsvglib.}
proc handle_close*(handle: ptr RsvgHandle; error: ptr pointer): gboolean {.
    cdecl, importc: "rsvg_handle_close", dynlib: rsvglib.}
proc handle_get_pixbuf*(handle: ptr RsvgHandle): PPixbuf {.cdecl, 
    importc: "rsvg_handle_get_pixbuf", dynlib: rsvglib.}
proc handle_get_pixbuf_sub*(handle: ptr RsvgHandle; id: cstring): PPixbuf {.
    cdecl, importc: "rsvg_handle_get_pixbuf_sub", dynlib: rsvglib.}
proc handle_get_base_uri*(handle: ptr RsvgHandle): cstring {.cdecl, 
    importc: "rsvg_handle_get_base_uri", dynlib: rsvglib.}
proc handle_set_base_uri*(handle: ptr RsvgHandle; base_uri: cstring) {.
    cdecl, importc: "rsvg_handle_set_base_uri", dynlib: rsvglib.}
proc handle_get_dimensions*(handle: ptr RsvgHandle; 
                            dimension_data: ptr RsvgDimensionData) {.cdecl, 
    importc: "rsvg_handle_get_dimensions", dynlib: rsvglib.}
proc handle_get_dimensions_sub*(handle: ptr RsvgHandle; 
                                dimension_data: ptr RsvgDimensionData; 
                                id: cstring): gboolean {.cdecl, 
    importc: "rsvg_handle_get_dimensions_sub", dynlib: rsvglib.}
proc handle_get_position_sub*(handle: ptr RsvgHandle; 
                              position_data: ptr RsvgPositionData; 
                              id: cstring): gboolean {.cdecl, 
    importc: "rsvg_handle_get_position_sub", dynlib: rsvglib.}
proc handle_has_sub*(handle: ptr RsvgHandle; id: cstring): gboolean {.
    cdecl, importc: "rsvg_handle_has_sub", dynlib: rsvglib.}
proc handle_new_with_flags*(flags: RsvgHandleFlags): ptr RsvgHandle {.
    cdecl, importc: "rsvg_handle_new_with_flags", dynlib: rsvglib.}
proc handle_set_base_gfile*(handle: ptr RsvgHandle; base_file: ptr TFile) {.
    cdecl, importc: "rsvg_handle_set_base_gfile", dynlib: rsvglib.}
proc handle_read_stream_sync*(handle: ptr RsvgHandle; 
                              stream: ptr TFile; 
                              cancellable: pointer; 
                              error: pointer): gboolean {.cdecl, 
    importc: "rsvg_handle_read_stream_sync", dynlib: rsvglib.}
proc handle_new_from_gfile_sync*(file: ptr TFile; flags: RsvgHandleFlags; 
                                 cancellable: pointer; 
                                 error: pointer): ptr RsvgHandle {.
    cdecl, importc: "rsvg_handle_new_from_gfile_sync", dynlib: rsvglib.}
proc handle_new_from_stream_sync*(input_stream: ptr TFile; 
                                  base_file: ptr TFile; 
                                  flags: RsvgHandleFlags; 
                                  cancellable: pointer; 
                                  error: pointer): ptr RsvgHandle {.
    cdecl, importc: "rsvg_handle_new_from_stream_sync", dynlib: rsvglib.}
proc handle_new_from_data*(data: ptr guint8; data_len: gsize; 
                           error: pointer): ptr RsvgHandle {.cdecl, 
    importc: "rsvg_handle_new_from_data", dynlib: rsvglib.}
proc handle_new_from_file*(file_name: cstring; error: pointer): ptr RsvgHandle {.
    cdecl, importc: "rsvg_handle_new_from_file", dynlib: rsvglib.}
