import 'package:advo_help/components/text_form_field.dart';
import 'package:advo_help/screens/home_screen.dart';
import 'package:advo_help/screens/login_screen.dart';
import 'package:advo_help/services/auth_firebase_service.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegisterScreen extends StatefulWidget {
  static const id = 'RegisterScreen';
  static String t;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _registerFormKey = GlobalKey<FormState>();

  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();
  final _oabController = TextEditingController();
  final AuthFirebaseService _auth = AuthFirebaseService();
  
  int _tipoUsuario;
  bool _advogado = false;

  String name;
  String email;
  String password;

  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Form(
                  key: _registerFormKey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Center(
                          child: Image.asset('images/logo.png'),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        TextFormFieldCustom(
                            hintText: 'Nome',
                            controller: _nomeController,
                            onChanged: (value) {
                              name = value;
                            },
                            validator: (value) {
                              print(value);
                              if (value.isEmpty) {
                                return 'Preencha o nome';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormFieldCustom(
                            hintText: 'Email',
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value;
                            },
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Preencha o email';
                              } else if (!EmailValidator.validate(value)) {
                                return 'Informe um email válido';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormFieldCustom(
                          hintText: 'Senha',
                          obscureText: true,
                          onChanged: (value) {
                            password = value;
                          },
                          controller: _senhaController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preencha a senha';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormFieldCustom(
                          hintText: 'Confirmação de Senha',
                          obscureText: true,
                          controller: _confirmaSenhaController,
                          onChanged: (value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Preencha uma senha';
                            } else if (value != _senhaController.text) {
                              return 'Senhas diferentes';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              'Você é :',
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Radio(
                                    value: 0,
                                    groupValue: _tipoUsuario,
                                    onChanged: _handleRadioValueChange1),
                                new Text(
                                  'População',
                                  style: new TextStyle(fontSize: 14.0),
                                ),
                                new Radio(
                                    value: 1,
                                    groupValue: _tipoUsuario,
                                    onChanged: _handleRadioValueChange1),
                                new Text(
                                  'Advogado',
                                  style: new TextStyle(
                                    fontSize: 14.0,
                                  ),
                                ),
                              ],
                            ),
                            _advogado
                                ? TextFormFieldCustom(
                                    hintText: 'Número da OAB',
                                    obscureText: true,
                                    controller: _oabController,
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Preencha um número da OAB senha';
                                      }
                                      return null;
                                    },
                                  )
                                : Container()
                          ],
                        ),
                        FlatButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'ENVIAR',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              showSpinner = true;
                            });

                            if (_registerFormKey.currentState.validate()) {
                              try {
                                 await _auth
                                    .createUserWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _senhaController.text,
                                        nome: _nomeController.text,
                                        tipoUsuario:  _tipoUsuario,
                                        oab: _oabController.text);
                                Navigator.pushNamed(context, HomeScreen.id);
                              } catch (e) {
                                print(e);
                              }
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Já possui uma conta?',
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.id);
                          },
                          child: Text(
                            'Faça login aqui!',
                          ),
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

  void _handleRadioValueChange1(int value) {
    setState(() {
      _tipoUsuario = value;
      switch (_tipoUsuario) {
        case 0:
          _advogado = false;
          break;
        case 1:
          _advogado = true;
          break;
        case 2:
          _advogado = false;
          break;
      }
    });
  }
}
