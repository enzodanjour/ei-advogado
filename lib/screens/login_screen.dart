import 'package:advo_help/screens/home_screen.dart';
import 'package:advo_help/screens/register_screen.dart';
import 'package:advo_help/services/auth_firebase_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



class LoginScreen extends StatefulWidget {
  static const id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthFirebaseService _auth = AuthFirebaseService();
  

  bool showSpinner = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                  key: _loginFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset('images/logo.png'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Color(0xFFE8E8E8),
                            filled: true,
                          ),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite um email válido';
                            } else if (!EmailValidator.validate(value)) {
                              return 'Informe um email válido';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Color(0xFFE8E8E8),
                            filled: true,
                          ),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Digite uma senha válida';
                            } else {
                              return null;
                            }
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                          padding: EdgeInsets.all(10.0),
                            child: Text(
                              'LOGIN',
                                // style: kTextStyleWhite.copyWith(fontSize: 15.0),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                setState(() {
                                  showSpinner = true;
                                });
                                _auth.signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                if (_auth.user != null) {
                                    Navigator.pushNamed(context, HomeScreen.id);
                                }
                                setState(() {
                                  showSpinner = false;
                                });
                              } catch (e) {
                                print(e);
                              }
                            }
                            ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Não tem uma conta?',
                          // style: kTextStyle.copyWith(fontSize: 20.0),
                        ),
                        FlatButton(
                          child: Text(
                            'Cadastre-se aqui!',
                            // style: kTextStyle.copyWith(
                            //   fontSize: 18.0,
                            // ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}