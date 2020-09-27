import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:advo_help/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthFirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _db = Firestore.instance;

  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebase(user));
  }

  Future createUserWithEmailAndPassword(
      {@required String email,
      @required String password,
      @required String nome,
      @required int tipoUsuario,
      String oab}) async {
    
    try {
      
       FirebaseUser newUser = await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((cred) {
              _db.collection('usuarios').document(cred.user.uid).setData(
                  {'nome': nome, 'tipo_usuario': tipoUsuario, 'num_oab': oab});

              return cred.user;

            });
      
      return _userFromFirebase(newUser);

    } catch (e) {
      print(e);
      return null;
    }
    
  }

  Future signInWithEmailAndPassword({String email, String password}) async {

    try {
      
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebase(result.user);

    } catch (e) {
      print(e);
      return null;
    }

  }



}
