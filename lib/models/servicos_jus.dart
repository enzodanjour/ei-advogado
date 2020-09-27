import 'dart:convert';

import 'package:advo_help/models/perguntas_frequentes.dart';

class ServicosJus {
    int id;
    String nome;
    String descricao;
    bool advogado;
    bool cidadao;
    PerguntasFrequentes perguntas;
  ServicosJus({
    this.id,
    this.nome,
    this.descricao,
    this.advogado,
    this.cidadao,
    this.perguntas,
  });
    

  ServicosJus copyWith({
    int id,
    String nome,
    String descricao,
    bool advogado,
    bool cidadao,
    PerguntasFrequentes perguntas,
  }) {
    return ServicosJus(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      descricao: descricao ?? this.descricao,
      advogado: advogado ?? this.advogado,
      cidadao: cidadao ?? this.cidadao,
      perguntas: perguntas ?? this.perguntas,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'advogado': advogado,
      'cidadao': cidadao,
      'perguntas': perguntas?.toMap(),
    };
  }

  factory ServicosJus.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ServicosJus(
      id: map['id'],
      nome: map['nome'],
      descricao: map['descricao'],
      advogado: map['advogado'],
      cidadao: map['cidadao'],
      perguntas: PerguntasFrequentes.fromMap(map['perguntas']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ServicosJus.fromJson(String source) => ServicosJus.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ServicosJus(id: $id, nome: $nome, descricao: $descricao, advogado: $advogado, cidadao: $cidadao, perguntas: $perguntas)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ServicosJus &&
      o.id == id &&
      o.nome == nome &&
      o.descricao == descricao &&
      o.advogado == advogado &&
      o.cidadao == cidadao &&
      o.perguntas == perguntas;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      nome.hashCode ^
      descricao.hashCode ^
      advogado.hashCode ^
      cidadao.hashCode ^
      perguntas.hashCode;
  }
}

