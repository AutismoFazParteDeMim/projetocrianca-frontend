import 'package:cloud_firestore/cloud_firestore.dart';

class ChildModel {
  String? name;
  String? sex;
  String? photoURL;

  ChildModel({
    this.name,
    this.sex,
    this.photoURL,
  });

  ChildModel.fromDocumentSnapshot({
    required DocumentSnapshot documentSnapshot,
  }) {
    name = documentSnapshot["childName"];
    sex = documentSnapshot["childSex"];
    photoURL = documentSnapshot["childPic"];
  }
}
