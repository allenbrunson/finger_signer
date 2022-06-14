// screen.dart -- screen functions
// by allen brunson  december 8 2018

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  screen functions                                                      ***/
/*                                                                            */
/******************************************************************************/

// screen size rounded down to the nearest pixel

Size screenSize() {
    return sizeFloor(_rawScreenSize());
}

// screen width rounded down to the nearest pixel

double screenWidth() {
    return screenSize().width;
}

// media query data from the window singleton

MediaQueryData windowMediaQueryData() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window);
}


/******************************************************************************/
/*                                                                            */
/***  private screen functions                                              ***/
/*                                                                            */
/******************************************************************************/

// 1) width and height are swapped when rotating from portrait to landscape
// 2) android devices can report fractional pixel counts

Size _rawScreenSize() {
    return windowMediaQueryData().size;
}
