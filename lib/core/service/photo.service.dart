import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metroom/core/api/supabase.api.dart';

class PhotoService with ChangeNotifier {
  final picker = ImagePicker();
  var imageFile;
  String? photo_url;
  String? errorUpload;
  File? image;

  Future selectFile() async {
    imageFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    image = File(imageFile.path);
    print(image);
    notifyListeners();
  }

  Future upload<bool>({required BuildContext context}) async {
    final bytes = await imageFile.readAsBytes();
    final fileExt = imageFile.path.split('.').last;
    final fileName = '${DateTime.now().toIso8601String()}.$fileExt';
    final filePath = fileName;

    final response = await SupabaseAPI.supabaseClient.storage
        .from('user-images')
        .uploadBinary(filePath, bytes);
    final error = response.error;

    if (error != null) {
      errorUpload = error.message;
      print(errorUpload!);
      return false;
    } else {
      final imageUrlResponse = SupabaseAPI.supabaseClient.storage
          .from('user-images')
          .getPublicUrl(filePath);
      photo_url = imageUrlResponse.data;
      notifyListeners();
      return true;
    }
  }
}
