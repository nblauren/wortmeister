import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(File file, String path) async {
    try {
      Reference ref = _storage.ref().child(path);
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot taskSnapshot = await uploadTask;
      return await taskSnapshot.ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error uploading file: $e');
    }
  }

  Future<void> deleteFile(String path) async {
    try {
      Reference ref = _storage.ref().child(path);
      await ref.delete();
    } catch (e) {
      throw Exception('Error deleting file: $e');
    }
  }

  Future<String> getFileDownloadUrl(String path) async {
    try {
      Reference ref = _storage.ref().child(path);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception('Error getting file URL: $e');
    }
  }
}
