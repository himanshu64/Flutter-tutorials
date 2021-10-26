import 'package:app_provider/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future createNewUser(UserModel data) {
    return users.doc(data.uid).set(data.toJson());
  }
}
