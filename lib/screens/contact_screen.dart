import 'package:advo_help/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  static const id = 'ContactScreen';

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
      body: mesageList(context),
    );
  }
}

Widget mesageList(context) {
  return Card(
    color: Colors.grey[50],
    child: ListTile(
      leading:CircleAvatar(
        backgroundImage: NetworkImage(
            'https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg'
        ),
      ),
      title: Text('Ricardo Braz'),
      subtitle: Text('Teaser'),
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.id);
      }
    ),
  );
}