// file_functions.dart -- file functions
// by allen brunson  august 19 2021

import "package:finger_signer/finger_signer.dart";


/******************************************************************************/
/*                                                                            */
/***  file functions                                                        ***/
/*                                                                            */
/******************************************************************************/

Future<bool> deleteFileAsync(File? file) async {
    try {
        if (file is File) await file.delete(recursive:true);
        return true;
    }
    catch (e) {
        return false;
    }
}

Future<bool> fileExistsAsync(File? file) async {
    try {
        return (file is File) && (await file.exists());
    }
    catch (e) {
        return false;
    }
}

Future<bool> fileHasLengthAsync(File? file) async {
    return (await fileLengthAsync(file)) >= 1;
}

Future<int> fileLengthAsync(File? file) async {
    if (file == null) return 0;
    if (await fileExistsAsync(file)) return file.length();
    return 0;
}

Future<File?> fileWriteBytesAsync(String path, Uint8List bytes) async {
    assert(path.isNotEmpty);
    try {
        final file = File(path);
        await file.writeAsBytes(bytes, flush:true);
        return file;
    }
    catch (e) {
        return null;
    }
}

String randomPNGpath() {
    final ival = Random.secure().nextInt(0x7FFFFFFF);
    final root = Directory.systemTemp;
    return "${root.path}/image${ival}.png";
}
