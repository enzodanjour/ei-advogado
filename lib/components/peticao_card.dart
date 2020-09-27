import 'package:advo_help/models/peticao.dart';
import 'package:advo_help/services/database_firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PeticaoCard extends StatefulWidget {
  @override
  _PeticaoCardState createState() => _PeticaoCardState();
}

class _PeticaoCardState extends State<PeticaoCard> {

  static List<Peticao> _peticoes = []; 
  
  @override
  Widget build(BuildContext context) {
  
    final usuarios = Provider.of<QuerySnapshot>(context);

    if (usuarios != null && _peticoes.isEmpty) {
      for (var usuario in usuarios.documents) {
        DatabaseFirebaseService().usuariosCollection.document(usuario.documentID).collection("peticoes").snapshots().listen((snapshot) {
          for (var peticao in snapshot.documents) {
            _peticoes.add(Peticao.fromFirebase(peticao));   
          }
        });
      }
    }

    return ListView(
          children: listCarPeticoes(),
          
        );
  }

  List<Widget> listCarPeticoes () {

      List<Widget> cardPeticoes = [];

      if (_peticoes.isNotEmpty) {
          for (Peticao p in _peticoes) {
            cardPeticoes.add(cardPeticao(p));
          }
      }

      return cardPeticoes;
  }

  Widget cardPeticao (Peticao peticao) {

    return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: Text(peticao.titulo!=null?peticao.titulo:''),
          subtitle: Text(peticao.dataCadastro!=null?peticao.dataCadastro:''),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(peticao.detalhes!=null?peticao.detalhes:''),
        )
      ],
    ),
  );


  }

}