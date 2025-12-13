// offset.dart -- offset functions
// by allen brunson  december 13 2025

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  Offset functions                                                      ***/
/*                                                                            */
/******************************************************************************/

Offset sanitizeOffset(dynamic offset) {
    if (offset is Offset) return offset;
    return Offset.zero;
}
