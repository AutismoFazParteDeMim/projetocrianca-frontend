import 'package:cloud_firestore/cloud_firestore.dart';

class ChildModel {
  String? name;
  String? sex;
  String? photoURL;

  ChildModel({
    required this.name,
    required this.sex,
    required this.photoURL,
  });

  ChildModel.fromDocumentSnapshot({
    required DocumentSnapshot documentSnapshot,
  }) {
    name = documentSnapshot["childName"];
    sex = documentSnapshot["childSex"];
    photoURL = documentSnapshot["childPic"];
  }
}
