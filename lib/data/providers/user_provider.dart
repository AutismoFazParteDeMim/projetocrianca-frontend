import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/data/models/child_model.dart';
import 'package:projeto_crianca/data/models/user_model.dart';

class UserProvider {
  UserProvider() {
    _databaseInstance.settings = const Settings(persistenceEnabled: true);
  }

  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseFirestore _databaseInstance = FirebaseFirestore.instance;

  UserModel? getCurrentUser() {
    if (_authInstance.currentUser != null) {
      return UserModel.fromFirebaseUser(user: _authInstance.currentUser!);
    }

    return null;
  }

  Future<ChildModel?> getCurrentChild() async {
    final userUID = _authInstance.currentUser?.uid;

    if (userUID != null) {
      return _databaseInstance.collection('users').doc(userUID).get().then(
            (DocumentSnapshot doc) => ChildModel.fromDocumentSnapshot(
              documentSnapshot: doc,
            ),
          );
    }

    return null;
  }

  Stream<ChildModel>? getChildStream() {
    final userUID = _authInstance.currentUser?.uid;

    if (userUID != null) {
      final stream =
          _databaseInstance.collection('users').doc(userUID).snapshots();

      return stream.map(
        (value) => ChildModel(
          name: value['childName'] as String?,
          sex: value['childSex'] as String?,
          photoURL: value['childPic'] as String?,
        ),
      );
    }

    return null;
  }

  Future<void> createChild(User userInstance, ChildModel child) async {
    final userUID = userInstance.uid;
    final data = {
      'childName': child.name ?? '',
      'childSex': child.sex ?? '',
      'childPic': child.photoURL ?? '',
    };

    if (data.isNotEmpty) {
      await _databaseInstance.collection('users').doc(userUID).set(data);
    }
  }

  Future<void> updateUser(User userInstance, UserModel user) async {
    final data = <String, dynamic>{}
      ..addIf(user.name != null, 'displayName', user.name);

    if (data.isNotEmpty) {
      await userInstance.updateDisplayName(data['displayName'] as String?);
    }
  }

  Future<void> updateChild(User userInstance, ChildModel child) async {
    final userUID = userInstance.uid;
    final data = <String, dynamic>{}
      ..addIf(child.name != null, 'childName', child.name)
      ..addIf(child.sex != null, 'childSex', child.sex)
      ..addIf(child.photoURL != null, 'childPic', child.photoURL);

    if (data.isNotEmpty) {
      await _databaseInstance.collection('users').doc(userUID).update(data);
    }
  }

  Future<void> updateCurrentChild(ChildModel child) async {
    final userUID = _authInstance.currentUser?.uid;
    final data = <String, dynamic>{}
      ..addIf(child.name != null, 'childName', child.name)
      ..addIf(child.sex != null, 'childSex', child.sex)
      ..addIf(child.photoURL != null, 'childPic', child.photoURL);

    if (userUID != null) {
      await _databaseInstance.collection('users').doc(userUID).update(data);
    }
  }
}
