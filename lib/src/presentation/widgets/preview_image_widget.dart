import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PreviewImageWidget extends StatelessWidget {
  final XFile pickedImage;
  final double? width;
  final double? height;
  final VoidCallback? onCanceled;

  const PreviewImageWidget({
    super.key,
    required this.pickedImage,
    this.width,
    this.height,
    this.onCanceled,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.file(
                File(pickedImage.path),
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Text('This image type is not supported'),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: -12.0,
            right: -12.0,
            child: IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: onCanceled,
            ),
          )
        ],
      ),
    );
  }
}
