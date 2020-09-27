import 'package:cloud_firestore/cloud_firestore.dart';

class Peticao {

  String uid;
  String titulo;
  bool concluida;
  String detalhes;
  bool pegaAdvogado;
  String tipo;
  String dataCadastro;
  

  Peticao(this.uid, this.titulo, this.detalhes, this.tipo, this.concluida, this.pegaAdvogado, this.dataCadastro);

  factory Peticao.fromFirebase(DocumentSnapshot docPeticao){
    Map peticao = docPeticao.data;
    return Peticao(peticao['uid'], peticao['titulo'],peticao['detalhes'], peticao['tipo'], peticao['concluida'], peticao['pega_Advogado'], peticao['data_cadastro']='');
  }

}