import 'dart:async';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:metroom/app/constants/app.credentials.dart';

class PhotoService with ChangeNotifier {
  final cloudinary = Cloudinary.full(
    apiKey: AppCredentials.cloudinaryApiKey,
    apiSecret: AppCredentials.cloudinaryApiSecret,
    cloudName: AppCredentials.cloudinaryCloudName,
  );

  FilePickerResult? file;
  String? photo_url;

  Future selectFile() async {
    file = await FilePicker.platform.pickFiles(
      allowCompression: true,
      type: FileType.image,
    );
    notifyListeners();
  }

  Future upload<bool>({required BuildContext context}) async {
    final response = await cloudinary.uploadResource(
      CloudinaryUploadResource(
        filePath: file!.files.single.path,
        resourceType: CloudinaryResourceType.image,
        folder: 'task-app',
        fileName: file!.files.single.name,
        progressCallback: (count, total) {},
      ),
    );

    if (response.isSuccessful) {
      photo_url = response.secureUrl;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
