import 'dart:io';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:ypb_photos/app/core/configs/app_constant.dart';
import 'package:ypb_photos/app/core/utils/app_util.dart';
import 'package:ypb_photos/app/data/enums/msg_state.dart';
import 'package:ypb_photos/app/data/handlers/camera_handler.dart';
import 'package:ypb_photos/app/data/handlers/file_handler.dart';
import 'package:ypb_photos/app/data/handlers/permission_handler.dart';
import 'package:ypb_photos/app/data/models/decode_model.dart';
import 'package:ypb_photos/app/data/models/resp_model.dart';
import 'package:ypb_photos/app/data/providers/cache_provider.dart';
import 'package:ypb_photos/app/routes/app_pages.dart';

class EditorController extends GetxController with WidgetsBindingObserver {
  CameraController? _cameraController;
  final _fileHandler = Get.find<FileHandler>();
  final _permissionHandler = PermissionHandler();

  final cameraResp = Resp().obs;
  final _exposure = (CacheProvider.width
          .getValue(defaultValue: AppConstant.def.exposure) as double)
      .obs;
  var _width =
      CacheProvider.width.getValue(defaultValue: AppConstant.def.width) as int;
  var _height = CacheProvider.height
      .getValue(defaultValue: AppConstant.def.height) as int;
  final _photosLimit = (CacheProvider.photosLimit
          .getValue(defaultValue: AppConstant.def.photosLimit) as int)
      .obs;
  final _photos = <String>[];

  int get width => _width;

  int get height => _height;

  int get photosLimit => _photosLimit.value;

  double get exposure => _exposure.value;

  setWidth(String value) {
    if (value.isEmpty) return;
    _width = int.parse(value);
    CacheProvider.width.setValue(_width);
  }

  setHeight(String value) {
    if (value.isEmpty) return;
    _height = int.parse(value);
    CacheProvider.height.setValue(_height);
  }

  setExposure(double value) {
    _exposure.value = value;
    _cameraController!.setExposureOffset(value);
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
    if (_cameraController == null) return;

    final pd = ProgressDialog(context: Get.context);
    pd.show(
        max: 100, msg: 'Taking Photo...', progressType: ProgressType.valuable);
    //* Take photo
    pd.update(value: 0, msg: 'Taking Photo...');
    final file = await _cameraController!.takePicture();
    //* Resize
    //* Used isolate cause of image decoding will block the UI
    pd.update(value: 50, msg: 'Resizing...');
    final receivePort = ReceivePort();
    await Isolate.spawn(
        decodeIsolate,
        Decode(
            file: File(file.path),
            height: height,
            width: width,
            sendPort: receivePort.sendPort));
    final resizedImage = await receivePort.first as Uint8List;
    //* Save
    pd.update(value: 90, msg: 'Saving...');
    final savedImage = await _fileHandler.saveImage(resizedImage);
    pd.close();
    _photos.add(savedImage.path);
    //* Check limit reach
    if (_photos.length >= photosLimit) {
      Get.toNamed(Routes.PHOTOS, arguments: _photos);
    } else {
      //* Otherwise inform user that photo saved successfully
      AppUtil.snack('Saved Successfully');
    }
  }

  clearPhotos() => _photos.clear();

  //* Camera Initializing
  _initializeCamera() {
    if (CameraHandler.cameras!.isEmpty) {
      cameraResp.value =
          Resp(data: 'No valid camera found', message: MsgState.error);
    } else {
      _cameraController = CameraController(
        CameraHandler.cameras![0],
        ResolutionPreset.medium,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.yuv420,
      );

      _cameraController!.initialize().then((_) {
        cameraResp.value =
            Resp(data: _cameraController, message: MsgState.data);
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

    if (_cameraController == null || !_cameraController!.value.isInitialized) {
      return;
    }
    //* Need to reinitialize cause of we can't use the preview camera outside of the app.
    if (state == AppLifecycleState.resumed) {
      _initializeCamera();
    }
  }
}
