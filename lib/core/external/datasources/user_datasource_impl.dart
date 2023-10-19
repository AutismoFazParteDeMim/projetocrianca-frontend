import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:projeto_crianca/core/domain/entities/child_entity.dart';
import 'package:projeto_crianca/core/domain/entities/user_entity.dart';
import 'package:projeto_crianca/core/infra/datasources/user_datasource.dart';

class UserDatasourceImpl implements UserDatasource {
  UserDatasourceImpl() {
    _databaseInstance.settings = const Settings(persistenceEnabled: true);
  }

  final FirebaseAuth _authInstance = FirebaseAuth.instance;
  final FirebaseFirestore _databaseInstance = FirebaseFirestore.instance;

  @override
  UserEntity? getCurrentUser() {
    if (_authInstance.currentUser != null) {
      final user = _authInstance.currentUser;
      return UserEntity(
        uid: user?.uid,
        name: user?.displayName,
        email: user?.email,
        isEmailVerified: user?.emailVerified,
        photoURL: user?.photoURL,
      );
    }

    return null;
  }

  @override
  Future<ChildEntity?> getCurrentChild() async {
    final userUID = _authInstance.currentUser?.uid;

    if (userUID != null) {
      final child =
          await _databaseInstance.collection('users').doc(userUID).get();

      return ChildEntity(
        name: child['childName'] as String?,
        sex: child['childSex'] as String?,
        photoURL: child['childPic'] as String?,
      );
    }

    return null;
  }

  @override
  Stream<ChildEntity>? getChildStream() {
    final userUID = _authInstance.currentUser?.uid;

    if (userUID != null) {
      final stream =
          _databaseInstance.collection('users').doc(userUID).snapshots();

      return stream.map(
        (value) => ChildEntity(
          name: value['childName'] as String?,
          sex: value['childSex'] as String?,
          photoURL: value['childPic'] as String?,
        ),
      );
    }

    return null;
  }

  @override
  Future<void> createChild(User userInstance, ChildEntity child) async {
    final userUID = userInstance.uid;

    if (child.name != null && child.sex != null && child.photoURL != null) {
      await _databaseInstance.collection('users').doc(userUID).set({
        'childName': child.name,
        'childSex': child.sex,
        'childPic': child.photoURL,
      });
    }
  }

  @override
  Future<void> updateUser(User userInstance, UserEntity user) async {
    if (user.name != null) {
      await userInstance.updateDisplayName(
        user.name,
      );
    }
  }

  @override
  Future<void> updateChild(User userInstance, ChildEntity child) async {
    final userUID = userInstance.uid;

    final data = <String, dynamic>{}
      ..addIf(child.name != null, 'childName', child.name)
      ..addIf(child.sex != null, 'childSex', child.sex)
      ..addIf(child.photoURL != null, 'childPic', child.photoURL);

    if (data.isNotEmpty) {
      await _databaseInstance.collection('users').doc(userUID).update(data);
    }
  }

  @override
  Future<void> updateCurrentChild(ChildEntity child) async {
    final userUID = _authInstance.currentUser?.uid;

    final data = <String, dynamic>{}
      ..addIf(child.name != null, 'childName', child.name)
      ..addIf(child.sex != null, 'childSex', child.sex)
      ..addIf(child.photoURL != null, 'childPic', child.photoURL);

    if (userUID != null && data.isNotEmpty) {
      await _databaseInstance.collection('users').doc(userUID).update(data);
    }
  }
}
