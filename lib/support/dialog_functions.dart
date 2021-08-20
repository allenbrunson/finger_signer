// dialog_functions.dart -- dialog support functions
// by allen brunson  october 27 2020

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  dialog support functions                                              ***/
/*                                                                            */
/******************************************************************************/

// use this for the insetPadding: parameter when creating Dialog objects

EdgeInsets dialogInsetPadding() {
    return const EdgeInsets.all(30.0);
}

// maximum size for a Dialog child widget

Size dialogMaxSize() {
    final data = windowMediaQueryData();
    final size = MutableSize.fromSize(data.size);
    size.removeInsets(dialogInsetPadding());
    size.removeInsets(data.padding);
    return sizeFloor(size.size());
}
