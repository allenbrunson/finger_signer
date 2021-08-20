// graphics.dart -- graphics functions
// by allen brunson  august 19 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  graphics functions                                                    ***/
/*                                                                            */
/******************************************************************************/

Future<Uint8List> imageToPNG(Image? image) async {
    final data = await image?.toByteData(format:ImageByteFormat.png);
    if (data is ByteData) return data.buffer.asUint8List();
    return Uint8List(0);
}

Future<Image> pictureRecorderImage(PictureRecorder prec, Size size) async {
    final pict = prec.endRecording();
    return pict.toImage(size.width.toInt(), size.height.toInt());
}
