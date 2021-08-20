// rect.dart -- rect functions
// by allen brunson  november 19 2018

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  rect functions                                                        ***/
/*                                                                            */
/******************************************************************************/

Rect rectFromParts(Offset offset, Size size) {
    return Rect.fromLTWH(offset.dx, offset.dy, size.width, size.height);
}

Rect rectFromSize(Size size) {
    return rectFromParts(Offset.zero, size);
}
