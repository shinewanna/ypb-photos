import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

import 'photos_viewer_controller.dart';

class PhotosViewerView extends GetView<PhotosViewerController> {
  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final photos = args['photos'];
    final initialIndex = args['initialIndex'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Photos Viewer'),
      ),
      body: PhotoViewGallery.builder(
        backgroundDecoration: const BoxDecoration(color: Colors.white),
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: FileImage(File(photos[index])),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained,
          );
        },
        itemCount: photos.length,
        pageController: PageController(initialPage: initialIndex),
      ),
    );
  }
}
