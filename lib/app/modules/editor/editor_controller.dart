import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/data/enums/msg_state.dart';
import 'package:ypb_photos/app/data/handlers/camera_handler.dart';
import 'package:ypb_photos/app/data/handlers/file_handler.dart';
import 'package:ypb_photos/app/data/handlers/permission_handler.dart';
import 'package:ypb_photos/app/data/models/decode_model.dart';
import 'package:ypb_photos/app/data/models/resp_model.dart';
import 'package:ypb_photos/app/data/providers/cache_provider.dart';
import 'package:ypb_photos/app/routes/app_pages.dart';

class EditorController extends GetxController with WidgetsBindingObserver {
  final _cameraHandler = CameraHandler.createController();
  final _fileHandler = Get.find<FileHandler>();
  final _permissionHandler = PermissionHandler();
  final _formKey = GlobalKey<FormState>();

  final cameraResp = Resp().obs;
  final _exposure = (CacheProvider.exposure
          .getValue(defaultValue: AppConstant.def.exposure) as double)
      .obs;
  var _width =
      CacheProvider.width.getValue(defaultValue: AppConstant.def.width) as int;
  var _height = CacheProvider.height
      .getValue(defaultValue: AppConstant.def.height) as int;
  final _photosLimit = (CacheProvider.photosLimit
          .getValue(defaultValue: AppConstant.def.photosLimit) as int)
      .obs;

  GlobalKey<FormState> get formKey => _formKey;

  int get width => _width;

  int get height => _height;

  int get photosLimit => _photosLimit.value;

  double get exposure => _exposure.value;

  setWidth(String value) {
    if (value.isEmpty) return;
    _width = int.parse(value);
  }

  setHeight(String value) {
    if (value.isEmpty) return;
    _height = int.parse(value);
  }

  setExposure(double value) {
    _exposure.value = value;
    _cameraHandler.controller!.setExposureOffset(value);
    CacheProvider.exposure.setValue(value);
  }

  setPhotosLimit(int? value) {
    if (value == null) return;
    _photosLimit.value = value;
    CacheProvider.photosLimit.setValue(value);
  }

  saveImage() async {
    //* Check permission
    final isGranted = await _permissionHandler.isStorageGranted;
    if (!isGranted) {
      await _permissionHandler.reqStorage();
      return;
    }
    //* Height Width validate and camera
    if (_cameraHandler.controller == null ||
        !_formKey.currentState!.validate()) {
      return;
    }
    //* Set Width and Height locally when save image
    CacheProvider.width.setValue(_width);
    CacheProvider.height.setValue(_height);

    final pd = ProgressDialog(context: Get.context);
    pd.show(
        max: 100, msg: 'Taking Photos...', progressType: ProgressType.valuable);
    int progress = 0;

    //* Take photos
    final files = <XFile>[];
    int eachProgress = (40 / photosLimit).floor();
    for (int i = 0; i < photosLimit; i++) {
      pd.update(value: progress += eachProgress, msg: 'Taking Photos...');
      files.add(await _cameraHandler.controller!.takePicture());
    }

    //* Resize
    //* Used isolate cause of image decoding will block the UI
    final resizedPhotos = <Uint8List>[];
    for (var file in files) {
      pd.update(value: progress += eachProgress, msg: 'Resizing...');
      final receivePort = ReceivePort();
      await Isolate.spawn(
        decodeIsolate,
        Decode(
          file: File(file.path),
          height: height,
          width: width,
          sendPort: receivePort.sendPort,
        ),
      );
      final resizedPhoto = await receivePort.first as Uint8List;
      resizedPhotos.add(resizedPhoto);
    }

    //* Save
    final photos = <String>[];
    eachProgress = (20 / photosLimit).floor();
    for (var photo in resizedPhotos) {
      pd.update(value: progress += eachProgress, msg: 'Saving...');
      final savedImage = await _fileHandler.saveImage(photo);
      photos.add(savedImage.path);
    }
    pd.close();
    Get.toNamed(Routes.PHOTOS, arguments: photos);
  }

  //* Camera Initializing
  _initializeCamera() {
    //* If camera empty
    if (CameraHandler.cameras!.isEmpty) {
      cameraResp.value =
          Resp(data: 'No valid camera found', message: MsgState.error);
    } else {
      //* Initialize
      _cameraHandler.initialize().then((_) {
        //* After initailize update UI accordingly
        cameraResp.value =
            Resp(data: _cameraHandler.controller, message: MsgState.data);
        _cameraHandler.controller!.setExposureOffset(CacheProvider.exposure
            .getValue(defaultValue: AppConstant.def.exposure) as double);
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance!.addObserver(this);
    _initializeCamera();
  }

  @override
  void onClose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.onClose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (_cameraHandler.controller == null ||
        !_cameraHandler.controller!.value.isInitialized) {
      return;
    }
    //* Need to reinitialize cause of we can't use the preview camera outside of the app.
    if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }
}
