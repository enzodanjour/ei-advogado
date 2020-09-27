import 'dart:convert';

class PerguntasFrequentes {
    String pergunta;
    String resposta;
  PerguntasFrequentes({
    this.pergunta,
    this.resposta,
  });

  Map<String, dynamic> toMap() {
    return {
      'pergunta': pergunta,
      'resposta': resposta,
    };
  }

  factory PerguntasFrequentes.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return PerguntasFrequentes(
      pergunta: map['pergunta'],
      resposta: map['resposta'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PerguntasFrequentes.fromJson(String source) => PerguntasFrequentes.fromMap(json.decode(source));

  PerguntasFrequentes copyWith({
    String pergunta,
    String resposta,
  }) {
    return PerguntasFrequentes(
      pergunta: pergunta ?? this.pergunta,
      resposta: resposta ?? this.resposta,
    );
  }

  @override
  String toString() => 'PerguntasFrequentes(pergunta: $pergunta, resposta: $resposta)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is PerguntasFrequentes &&
      o.pergunta == pergunta &&
      o.resposta == resposta;
  }

  @override
  int get hashCode => pergunta.hashCode ^ resposta.hashCode;
}
