import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../components/shared/app_colors.dart';

Future<String?> cropImage(String? path, BuildContext context) async {
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: path!,
    aspectRatioPresets: [
      CropAspectRatioPreset.square,
      CropAspectRatioPreset.ratio3x2,
      CropAspectRatioPreset.original,
      CropAspectRatioPreset.ratio4x3,
      CropAspectRatioPreset.ratio16x9
    ],
    uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Edit Image',
          toolbarColor: kcWhiteColor,
          toolbarWidgetColor: kcTxtColorDark,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Edit Image',
      ),
      WebUiSettings(
        context: context,
      ),
    ],
  );

  if (croppedFile != null) {
    return croppedFile.path;
  } else {
    return '';
  }
}

Future<String> pickImage({ImageSource? source}) async {
  final picker = ImagePicker();
  String path = '';
  try {
    final selectedImage = await picker.pickImage(source: source!);

    if (selectedImage != null) {
      path = selectedImage.path;
    } else {
      path = '';
    }
  } on PlatformException catch (e) {
    (e);
  }
  return path;
}

void selectImage(BuildContext context) {
  pickImage(source: ImageSource.gallery).then(
    (value) {
      if (value != '') {
        cropImage(value, context).then(
          (value) {
            if (value != '') {
              Navigator.pushNamed(context, '/edit-profile', arguments: value);
            }
          },
        );
      }
    },
  );
}
