import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreservices {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;
  late final CollectionReference _users = _instance.collection("users");
}
