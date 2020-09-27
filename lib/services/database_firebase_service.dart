import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseFirebaseService {

  final CollectionReference usuariosCollection = Firestore.instance.collection("usuarios");

  Stream<QuerySnapshot> get peticoes {
    return usuariosCollection.snapshots();
  }



}