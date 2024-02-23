import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  CameraController? _cameraController;

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
      }).catchError((Object e) {
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController?.value.isInitialized == true) {
      return Scaffold(
        body: CameraPreview(_cameraController!),
      );
    }

    return const SizedBox.shrink();
  }
}
