import 'package:advo_help/screens/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'SplashScreen';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    pushHome();
  }

  void pushHome(){
    Future.delayed(
      Duration(seconds:5),
      () => Navigator.pushNamed(context, LoginScreen.id)
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
          'images/logo_background.png',
          fit: BoxFit.contain,
          )
    );
  }
}