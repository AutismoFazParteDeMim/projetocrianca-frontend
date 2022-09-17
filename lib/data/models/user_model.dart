import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? name;
  String? email;
  bool? isEmailVerified;
  String? photoURL;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.isEmailVerified,
  });

  UserModel.fromFirebaseUser({required User user}) {
    uid = user.uid;
    name = user.displayName;
    email = user.email;
    isEmailVerified = user.emailVerified;
    photoURL = user.photoURL;
  }
}
