import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Singleton pattern
  FirebaseFirestoreService._privateConstructor();
  static final FirebaseFirestoreService instance =
      FirebaseFirestoreService._privateConstructor();

  // Get a collection reference
  CollectionReference getCollection(String path) {
    return _db.collection(path);
  }

  // Get a document reference
  DocumentReference getDocument(String path) {
    return _db.doc(path);
  }

  // Add a document to a collection
  Future<DocumentReference> addDocument(
      String collectionPath, Map<String, dynamic> data) {
    return _db.collection(collectionPath).add(data);
  }

  // Set a document in a collection
  Future<void> setDocument(String documentPath, Map<String, dynamic> data) {
    return _db.doc(documentPath).set(data);
  }

  // Update a document in a collection
  Future<void> updateDocument(String documentPath, Map<String, dynamic> data) {
    return _db.doc(documentPath).update(data);
  }

  // Delete a document from a collection
  Future<void> deleteDocument(String documentPath) {
    return _db.doc(documentPath).delete();
  }

  // Get a document snapshot
  Future<DocumentSnapshot> getDocumentSnapshot(String documentPath) {
    return _db.doc(documentPath).get();
  }

  // Get a collection snapshot
  Future<QuerySnapshot> getCollectionSnapshot(String collectionPath) {
    return _db.collection(collectionPath).get();
  }

  // Stream a document
  Stream<DocumentSnapshot> streamDocument(String documentPath) {
    return _db.doc(documentPath).snapshots();
  }

  // Stream a collection
  Stream<QuerySnapshot> streamCollection(String collectionPath) {
    return _db.collection(collectionPath).snapshots();
  }
}
