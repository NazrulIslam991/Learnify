import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:learnify/core/routes/route_name.dart';

class PreviewImageScreen extends StatefulWidget {
  final String imagePath;
  const PreviewImageScreen({super.key, required this.imagePath});

  @override
  State<PreviewImageScreen> createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  String? _currentImagePath;

  @override
  void initState() {
    super.initState();
    _currentImagePath = widget.imagePath;
  }

  // ক্রপিং লজিক
  Future<void> _cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: _currentImagePath!,
      // এখানে aspectRatioPresets সরাতে হবে
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.deepPurple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
          // aspectRatioPresets এখানে আনতে হবে
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
          ],
        ),
        IOSUiSettings(
          title: 'Crop Image',
          // iOS এর জন্য এখানে সেট করুন
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
          ],
        ),
      ],
    );

    if (croppedFile != null) {
      setState(() {
        _currentImagePath = croppedFile.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Preview"),
        actions: [
          IconButton(icon: const Icon(Icons.crop), onPressed: _cropImage),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: Image.file(File(_currentImagePath!))),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.imageProcessionScreen);
              },
              child: const Text("Use this Image"),
            ),
          ),
        ],
      ),
    );
  }
}
