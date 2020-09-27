import 'package:advo_help/models/user.dart';
import 'package:advo_help/screens/chat_screen.dart';
import 'package:advo_help/screens/contact_screen.dart';
import 'package:advo_help/screens/home_screen.dart';
import 'package:advo_help/screens/login_screen.dart';
import 'package:advo_help/screens/peticao_screen.dart';
import 'package:advo_help/screens/register_screen.dart';
import 'package:advo_help/screens/splash_screen.dart';
import 'package:advo_help/services/auth_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value( // Usar para gerenciar o login e logout https://www.youtube.com/watch?v=v3sY3RWciNw
      value: AuthFirebaseService().user,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            HomeScreen.id: (context) => HomeScreen(),
            LoginScreen.id: (context) => LoginScreen(),
            RegisterScreen.id: (context) => RegisterScreen(),
            PeticaoScreen.id: (context) => PeticaoScreen(),
            ContactScreen.id: (context) => ContactScreen(),
            ChatScreen.id: (context) => ChatScreen()
          }),
    );
  }
}
