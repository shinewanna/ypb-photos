import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ypb_photos/app/modules/editor/editor_controller.dart';
import 'package:ypb_photos/app/modules/photos/widgets/photo.dart';
import 'package:ypb_photos/app/modules/widgets/items_grid.dart';
import 'package:ypb_photos/app/routes/app_pages.dart';

import 'photos_controller.dart';

class PhotosView extends GetView<PhotosController> {
  @override
  Widget build(BuildContext context) {
    final photos = Get.arguments as List<String>;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Photos'),
        ),
        body: ItemGrid(
          children: photos
              .map(
                (e) => Photo(
                  path: e,
                  onTap: () => Get.toNamed(Routes.PHOTOS_VIEWER, arguments: {
                    'photos': photos,
                    //* Initial index is need to mange the init photo
                    //* You can change photos by swiping left, right of the photo
                    'initialIndex': photos.indexOf(e),
                  }),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    Get.find<EditorController>().clearPhotos();
    return true;
  }
}
