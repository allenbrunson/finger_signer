// file_image_dialog -- file image dialog creator
// by allen brunson  august 19 2021

import "package:finger_signer/finger_signer.dart";
import "package:flutter/material.dart" as flutter;


/******************************************************************************/
/*                                                                            */
/***  image dialog                                                          ***/
/*                                                                            */
/******************************************************************************/

AlertDialog imageFileDialog(BuildContext context, String title, File? image) {
    final list = _actionList(context);
    final view = _imageWidget(image);
    return AlertDialog(actions:list, content:view, title:Text(title));
}


/******************************************************************************/
/*                                                                            */
/***  private utility functions                                             ***/
/*                                                                            */
/******************************************************************************/

List<Widget> _actionList(BuildContext context) {
    final list = <Widget>[];
    list.add(_button(context));
    return list;
}

Widget _button(BuildContext context) {
    return button("OK", (){Navigator.of(context).pop();});
}

Widget _imageWidget(File? imageFile) {
    if (imageFile is File) return flutter.Image.file(imageFile);
    return const Center();
}
