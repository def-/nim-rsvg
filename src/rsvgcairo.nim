{.deadCodeElim: on.}
import rsvg, cairo, glib2
when defined(windows):
  const rsvglib* = "librsvg-2.dll"
elif defined(macosx):
  const rsvglib* = "librsvg-2.dylib"
else:
  const rsvglib* = "librsvg-2.so"

proc render*(handle: ptr RsvgHandle; cr: PContext): gboolean {.
    cdecl, importc: "rsvg_handle_render_cairo", dynlib: rsvglib.}
proc render_sub*(handle: ptr RsvgHandle; cr: PContext;
                 id: cstring): gboolean {.cdecl,
    importc: "rsvg_handle_render_cairo_sub", dynlib: rsvglib.}
