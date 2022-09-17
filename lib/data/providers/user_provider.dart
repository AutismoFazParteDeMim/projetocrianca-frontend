import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';

class UserProvider {
  static final FirebaseAuth _authInstance = FirebaseAuth.instance;
  static final FirebaseFirestore _databaseInstance = FirebaseFirestore.instance;

  UserProvider() {
    _databaseInstance.settings = const Settings(persistenceEnabled: true);
  }

  UserModel? getCurrentUser() {
    if (_authInstance.currentUser != null) {
      return UserModel.fromFirebaseUser(user: _authInstance.currentUser!);
    }

    return null;
  }

  Future<ChildModel?> getCurrentChild() async {
    final String? userUID = _authInstance.currentUser?.uid;

    if (userUID != null) {
      return await _databaseInstance
          .collection("users")
          .doc(userUID)
          .get()
          .then(
            (DocumentSnapshot doc) =>
                ChildModel.fromDocumentSnapshot(documentSnapshot: doc),
          );
    }

    return null;
  }
}
