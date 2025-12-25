// alert_display.dart -- show and hide alert dialogs
// by allen brunson  february 24 2019

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  alert display functions                                               ***/
/*                                                                            */
/******************************************************************************/

// dismiss a modal alert and return an object

void dismissModalWidget<T>(BuildContext? context, [T? result]) {
    if (context is BuildContext) Navigator.of(context).pop(result);
}

// hide any kind of alert

void hideAlert(BuildContext? context) {
    if (context is BuildContext) Navigator.of(context).pop();
}

// wrapper around showDialog() to make it more usable

Future<T?> showAlertWidget<T>(BuildContext? ctxt, Widget widget) async {
    if (ctxt == null) return null;
    final proc = (_){return widget;};
    return showDialog<T>(barrierDismissible:false, builder:proc, context:ctxt);
}

// display a full-screen modal widget

Future<T?> showModalWidget<T>(BuildContext? context, Widget widget) async {
    return showAlertWidget<T>(context, _dialog(widget));
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

Dialog _dialog(Widget child) {
    return Dialog(child:child, insetPadding:dialogInsetPadding());
}
