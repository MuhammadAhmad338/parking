// ignore_for_file: unused_field
import 'package:parking/Models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  late final CollectionReference _users = _instance.collection("users");

  CollectionReference<UserModel> get userDataInTheUserModel {
    return _users.withConverter(
        fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
        toFirestore: (model, _) => model.toJson());
  }

  void addDetails() {}
}
