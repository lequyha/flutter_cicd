import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerManager {
  static final ImagePickerManager _instance = ImagePickerManager._internal();

  late final ImagePicker _picker;

  factory ImagePickerManager() {
    return _instance;
  }

  ImagePickerManager._internal() {
    _picker = ImagePicker();
  }

  Future<XFile?> pickImage(
    ImageSource source, {
    required BuildContext context,
  }) async {
    if (context.mounted) {
      try {
        return await _picker.pickImage(
          source: source,
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
        rethrow;
      }
    }
    return null;
  }
}
