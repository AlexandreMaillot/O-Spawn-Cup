import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart'
    as mock_fire;
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/repository/firestorage_service.dart';

class MockFile extends Mock implements File {}

class MockReference extends Mock implements Reference {}

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

class MockUploadTask extends Mock implements UploadTask {}

class MockTaskSnapshot extends Mock implements TaskSnapshot {}

class MockAssetBundle extends Mock implements AssetBundle {}

class MockPlatformAssetBundle extends Mock implements PlatformAssetBundle {}

class MockDownloadTask extends Mock implements DownloadTask {}

class MockDefaultCacheManager extends Mock implements DefaultCacheManager {}

void main() {
  late FirestorageService firestorageService;
  late MockFile file;
  late MockReference reference;
  late MockFirebaseStorage storage;
  late MockUploadTask uploadTask;
  late MockTaskSnapshot taskSnapshot;
  late Uint8List uint8list;
  late ByteData byteData;
  late MockAssetBundle assetBundle;
  late MockPlatformAssetBundle platformAssetBundle;
  late MockDownloadTask downloadTask;
  late MockDefaultCacheManager defaultCacheManager;

  setUp(() {
    storage = MockFirebaseStorage();
    uploadTask = MockUploadTask();
    taskSnapshot = MockTaskSnapshot();
    downloadTask = MockDownloadTask();
    assetBundle = MockAssetBundle();
    defaultCacheManager = MockDefaultCacheManager();
    platformAssetBundle = MockPlatformAssetBundle();
    uint8list = Uint8List(10);
    byteData = ByteData(10);
    file = MockFile();
    reference = MockReference();
    firestorageService = FirestorageService(
      firebaseStorage: storage,
      defaultCacheManager: defaultCacheManager,
    );
  });
  test('getPreffixImage', () {
    final preffix = firestorageService.getPreffixImage();
    expect(preffix.length, 13);
  });
  // TODO(Tamarok): test downloadFileImage
  test('dowloadFileImage', () async {
    // var name = 'nameTest';
    // when(() => storage.ref('tournaments/' + name + ''))
    // .thenAnswer((invocation) => reference);
    // when(() => reference.writeToFile(file))
    // .thenAnswer((invocation) => downloadTask);
    // when(() => reference.putFile(file)).thenAnswer((invocation) => uploadTask);
    // when(() => reference.getDownloadURL())
    // .thenAnswer((invocation) => Future.value('monlien/monimagetest.png'));
    // when(() async => await defaultCacheManager
    // .getSingleFile('monlien/monimagetest.png'))
    // .thenAnswer((invocation) async => Future.value(file));
    // var finalFile = await firestorageService.downloadFileImage(name);
    // Directory appDocDir = await getApplicationDocumentsDirectory();
    // expect(finalFile.path, '${appDocDir.path}/test.jpeg');
  });
  test('addImageToStorage avec camera/gallery', () async {
    when(() => storage.ref()).thenReturn(reference);
    when(() => reference.child(any())).thenReturn(reference);
    when(() => reference.putFile(file))
        .thenAnswer((invocation) => mock_fire.MockUploadTask(reference));
    when(() => taskSnapshot.ref).thenReturn(reference);
    when(() => reference.getDownloadURL())
        .thenAnswer((invocation) => Future.value('url'));
    await firestorageService.addImageToStorage(
      imageName: 'fileName',
      file: file,
      takeByCamera: true,
    );
  });

  // TODO(Tamarok): test image predefini a faire
  test('addImageToStorage avec image predefinie', () async {
    // when(() => storage.ref()).thenReturn(reference);
    // when(() => reference.child(any())).thenReturn(reference);
    // when(() => file.path).thenReturn('test');
    // when(() => assetBundle.load('test')).thenAnswer((invocation) => Future.value(byteData));
    // when(() => platformAssetBundle.load('test')).thenAnswer((invocation) => Future.value(byteData));
    // when(() => reference.putData(uint8list)).thenAnswer((invocation) => uploadTask);
    // when(() => uploadTask.snapshot).thenAnswer((invocation) => taskSnapshot);
    // when(() => taskSnapshot.ref).thenReturn(reference);
    // when(() => reference.getDownloadURL()).thenAnswer((invocation) => Future.value('url'));
    // await firestorageService.addImageToStorage(file, false);
  });
}
