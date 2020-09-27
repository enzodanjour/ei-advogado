import 'package:flutter/material.dart';
import '../constants.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({this.selectedIndex, this.onItemTapped});

  final int selectedIndex;
  final Function onItemTapped;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            blurRadius: 15,
            spreadRadius: 10
          )
        ]
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: bBottomThemeData.copyWith(
          color: Colors.blue[200]
        ),
        unselectedIconTheme: bBottomThemeData.copyWith(
          color:Colors.grey
        ),
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: bVoidWidget,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: bVoidWidget,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            title: bVoidWidget,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: bVoidWidget,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      ),
    );
  }
}