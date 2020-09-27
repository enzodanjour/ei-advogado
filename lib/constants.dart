import 'package:flutter/material.dart';

//themes
const bBottomThemeData = IconThemeData(
  color: Colors.black,
  size: 30,
);

//Widgets
const bVoidWidget = SizedBox(
  height: 0,
);
//Mensagem
const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

//botão enviar mensagem
const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Digite sua mensagem aqui.',
  border: InputBorder.none,
);

const kMainBackgroundImage = BoxDecoration(
  image: DecorationImage(
    image: NetworkImage("https://cartadeservicos.jfrn.jus.br/jfrn10.12fc346bb7d624767f01.jpg"),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(Colors.blue, BlendMode.modulate),
  ),
);
