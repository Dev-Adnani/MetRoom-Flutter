import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:metroom/core/api/supabase.api.dart';

class PhotoService with ChangeNotifier {
  final _picker = ImagePicker();
  var imageFile;
  String? photo_url;
  String? errorUpload;

  Future selectFile() async {
    imageFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
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
      print(imageUrlResponse.data);
      return true;
    }
    
  }
}
