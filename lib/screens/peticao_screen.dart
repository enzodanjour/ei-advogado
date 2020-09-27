import 'package:flutter/material.dart';

class PeticaoScreen extends StatefulWidget {
  static const id = 'PeticaoScreen';

  @override
  _PeticaoScreenState createState() => _PeticaoScreenState();
}

class _PeticaoScreenState extends State<PeticaoScreen> {
  String dropdownValue = 'Escolha o tipo de causa';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: IconButton(
              icon: Icon(
                Icons.clear,
                color: Colors.grey,
                size: 40,
              ),
              onPressed: null,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'Petições',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w400,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              hintText: 'Qual é o título?',
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Por favor preencha o título';
              }
              return null;
            },
          ),
          DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.blue),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Escolha o tipo de causa', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 15,
            ),
            child: Text(
              'Descreva o problema:',
            ),
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            autocorrect: true,
            autofocus: true,
            minLines: 3,
            maxLines: null,
          ),
        ],
      ),
    );
  }
}
