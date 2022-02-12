import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/data/models/decode_model.dart';

class FileHandler {
  Future<String> get getDbPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<File> saveImage(Uint8List data) async => File(
          '${AppConstant.file.imagePath}${DateTime.now().millisecondsSinceEpoch}.png')
      .writeAsBytes(data);

  // Future<Uint8List> resize(String path, int width, int height) async {

  // }
}

void decodeIsolate(Decode decode) {
  final image = decodeImage(decode.file.readAsBytesSync())!;
  final modified = copyResize(
    image,
    width: decode.width,
    height: decode.height,
  );
  final uint8List = Uint8List.fromList(encodePng(modified));
  decode.sendPort.send(uint8List);
}
