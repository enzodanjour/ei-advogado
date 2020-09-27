import 'package:advo_help/components/navigation_bar.dart';
import 'package:advo_help/components/peticao_card.dart';
import 'package:advo_help/screens/bot_screen.dart';
import 'package:advo_help/screens/contact_screen.dart';
import 'package:advo_help/screens/peticao_screen.dart';
import 'package:advo_help/services/database_firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _children = [
    HomePage(),
    ContactScreen(),
    PeticaoScreen(),
    BootScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseFirebaseService().peticoes,
      child: Container(
        color: Colors.grey,
        child: PeticaoCard(),
      ),
    );
  }
}


