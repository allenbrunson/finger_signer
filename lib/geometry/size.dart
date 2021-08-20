// size.dart -- size functions
// by allen brunson  december 11 2018

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  Size functions                                                        ***/
/*                                                                            */
/******************************************************************************/

Size sizeFloor(Size size) {
    return Size(size.width.floorToDouble(), size.height.floorToDouble());
}
