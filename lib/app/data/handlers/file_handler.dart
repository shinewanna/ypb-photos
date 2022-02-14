import 'dart:io';
import 'dart:typed_data';
import 'package:image/image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/data/models/decode_model.dart';

class FileHandler {
  Future<String> get getDbPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  Future<String> get _imagePath async =>
      Vx.isAndroid ? AppConstant.file.imagePath : '${await getDbPath}/';

  //! Gallery Image Saver is not working well now, it can't return the right save path for the latest update
  //! I have to make my custom save image process
  Future<File> saveImage(Uint8List data) async {
    return File(
            '${await _imagePath}${DateTime.now().millisecondsSinceEpoch}.jpg')
        .writeAsBytes(data);
  }
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
