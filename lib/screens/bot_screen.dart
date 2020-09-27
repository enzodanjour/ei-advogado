import 'package:advo_help/constants.dart';
import 'package:flutter/material.dart';

class BootScreen extends StatefulWidget {
  BootScreen({Key key}) : super(key: key);

  @override
  _BootScreenState createState() => _BootScreenState();
}

class _BootScreenState extends State<BootScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: kMainBackgroundImage,
          child: ListView(
            children: [
              SizedBox(height: 10),
              Container(
                child: Image.network("https://enem.inep.gov.br/participante/static/media/normal.ef09b19d.png",
                width: 120,
                ),
              ),
              Center(
                child: Text("Olá, como posso lhe ajudar?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26
                ),
                ),
              ),
              Center(
                child: TextField(
                  decoration: InputDecoration( fillColor: Colors.white, filled: true),
                  keyboardType: TextInputType.multiline,
                  autocorrect: true,
                  autofocus: true,
                  minLines: 3,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}