import 'package:flutter/material.dart';

class PeticaoScreen extends StatefulWidget {
  static const id = 'PeticaoScreen';

  @override
  _PeticaoScreenState createState() => _PeticaoScreenState();
}

class _PeticaoScreenState extends State<PeticaoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contatos', 
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 26  
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Qual é o título?'
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Por favor preencha o título';
                }
                return null;
              },
            ),
          )
        ],
      ),
    );
  }
}