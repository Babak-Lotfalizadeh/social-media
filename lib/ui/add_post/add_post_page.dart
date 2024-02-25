import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:social_media/core/theme/static_sizes.dart';
import 'package:social_media/ui/add_post/edit_post_page.dart';
import 'package:social_media/ui/add_post/widget/camera_bottom_bar.dart';
import 'package:social_media/utils/context_extension.dart';
import 'package:social_media/utils/post_type.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  CameraController? _cameraController;
  bool frontCamera = true;
  var postType = PostType.post;
  final pageController = PageController(
    viewportFraction: 0.35,
  );

  @override
  void initState() {
    super.initState();

    availableCameras().then((cameras) {
      _cameraController = CameraController(
        cameras.first,
        ResolutionPreset.ultraHigh,
      );

      _cameraController?.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {});
    });

    pageController.addListener(() {
      if (postType.index != pageController.page?.toInt()) {
        setState(() {
          postType = PostType.values[pageController.page?.toInt() ?? 0];
        });
      }
    });
  }

  void onChangePage(PostType newItem) {
    setState(() {
      postType = newItem;
      pageController.animateToPage(
        newItem.index,
        curve: Curves.linear,
        duration: const Duration(milliseconds: 200),
      );
    });
  }

  void onCameraSwitch() {
    frontCamera = !frontCamera;

    availableCameras().then((cameras) {
      _cameraController?.setDescription(
        frontCamera ? cameras.first : cameras.last,
      );
    });
  }

  void onCameraShot() {
    _cameraController?.takePicture().then((value) {
      var image = File(value.path);
      context.push(EditPostPage(postType: postType, image: image));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController?.value.isInitialized == true) {
      return Scaffold(
        body: SafeArea(
          child: CameraPreview(
            _cameraController!,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
                padding: EdgeInsets.all(StaticSize.paddingLarge),
                child: CameraBottomBar(
                  onCameraShot: onCameraShot,
                  onCameraSwitch: onCameraSwitch,
                  postType: postType,
                  pageController: pageController,
                  onChangePostType: onChangePage,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return const SizedBox.shrink();
  }
}
