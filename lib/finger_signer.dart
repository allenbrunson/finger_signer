// finger_signer.dart -- finger_signer master export module
// by allen brunson  august 17 2021


/******************************************************************************/
/*                                                                            */
/***  finger_signer master export module                                    ***/
/*                                                                            */
/******************************************************************************/

// preamble
library finger_signer;

// dart packages
export "dart:io";
export "dart:math";
export "dart:typed_data";

// dart graphics
export "dart:ui" show Color, Offset, Radius, Rect, RRect, Size;
export "dart:ui" show Canvas, PictureRecorder;
export "dart:ui" show Image, ImageByteFormat, instantiateImageCodec;

// flutter
export "package:flutter/material.dart" hide Image;

// geometry
export "geometry/mutable_size.dart";
export "geometry/rect.dart";
export "geometry/screen.dart";
export "geometry/size.dart";

// scribbler state
export "scribbler_state/path_state.dart";
export "scribbler_state/point_state.dart";
export "scribbler_state/scribbler_state.dart";

// support
export "support/alert_display.dart";
export "support/app_bar.dart";
export "support/dialog_functions.dart";
export "support/file_functions.dart";
export "support/file_image_dialog.dart";
export "support/graphics.dart";
export "support/paint_functions.dart";
export "support/scribble_painter.dart";
export "support/widget_wrappers.dart";

// widgets
export "widgets/app_widget.dart";
export "widgets/home_widget.dart";
export "widgets/scribbler.dart";
