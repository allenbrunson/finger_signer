// paint_functions -- paint support functions
// by allen brunson  august 18 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  paint support functions                                               ***/
/*                                                                            */
/******************************************************************************/

Paint paintFill(Color color) {
    final data = Paint();
    data.color = color;
    data.style = PaintingStyle.fill;
    return data;
}

Paint paintStroke(Color color) {
    final data = Paint();
    data.color = color;
    data.strokeCap = StrokeCap.round;
    data.strokeWidth = 5.0;
    data.style = PaintingStyle.stroke;
    return data;
}
