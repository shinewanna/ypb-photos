import 'dart:io';

import 'dart:isolate';

class Decode {
  final File file;
  final int width;
  final int height;
  final SendPort sendPort;

  Decode(
      {required this.file,
      required this.width,
      required this.height,
      required this.sendPort});
}
