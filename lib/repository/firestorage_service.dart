
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:path_provider/path_provider.dart';
class FirestorageService {
  late storage.FirebaseStorage firebaseStorage;
  FirestorageService({required this.firebaseStorage});

  String getPreffixImage(){
    return DateTime.now().millisecondsSinceEpoch.toInt().toString();
  }

  Future<String> addImageToStorage(String imageName, File file,bool takeByCamera) async {
    var ref = firebaseStorage.ref().child('tournaments').child(imageName);
    storage.UploadTask task;
    if(takeByCamera){
      task = ref.putFile(file);
    } else {
      final byteData = await rootBundle.load(file.path);
      task = ref.putData(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
    storage.TaskSnapshot snapshot = await task.whenComplete(() => null);
    String urlString = await snapshot.ref.getDownloadURL();
    return urlString;
  }
  Future<File> downloadFileImage(String? name) async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    File downloadToFile = File('${appDocDir.path}/test.jpeg');

    var cupImgRef = firebaseStorage.ref('tournaments/' + name!);
    downloadToFile = await DefaultCacheManager().getSingleFile(await cupImgRef.getDownloadURL());
    return downloadToFile;

  }

}