// ignore_for_file: noop_primitive_operations

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FirestorageService {
  storage.FirebaseStorage firebaseStorage;
  DefaultCacheManager defaultCacheManager;
  FirestorageService({
    required this.firebaseStorage,
    required this.defaultCacheManager,
  });

  String getPreffixImage() {
    return DateTime.now().millisecondsSinceEpoch.toInt().toString();
  }

  Future<String> addImageToStorage({
    required String imageName,
    required File file,
    required bool takeByCamera,
  }) async {
    final ref = firebaseStorage.ref().child('tournaments').child(imageName);
    storage.UploadTask task;
    if (takeByCamera) {
      task = ref.putFile(file);
    } else {
      final byteData = await rootBundle.load(file.path);
      task = ref.putData(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );
    }
    final snapshot = await task.whenComplete(() => null);

    return snapshot.ref.getDownloadURL();
  }

  Future<File> downloadFileImage(String? name) async {
    final cupImgRef = firebaseStorage.ref('tournaments/${name!}');

    return defaultCacheManager.getSingleFile(await cupImgRef.getDownloadURL());
  }
}
