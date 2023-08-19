import 'package:cloud_firestore/cloud_firestore.dart';

class ChildModel {
  ChildModel({
    this.name,
    this.sex,
    this.photoURL,
  });

  ChildModel.fromDocumentSnapshot({
    required DocumentSnapshot documentSnapshot,
  }) {
    name = documentSnapshot['childName'] as String?;
    sex = documentSnapshot['childSex'] as String?;
    photoURL = documentSnapshot['childPic'] as String?;
  }

  String? name;
  String? sex;
  String? photoURL;
}
