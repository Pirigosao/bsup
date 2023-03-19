import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class LoginScreen extends StatelessWidget {
  final Function(LoginData) onLogin;

  LoginScreen({required this.onLogin});

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'BSUP',
      onLogin: onLogin,
      onSignup: (_) {},
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed('/home');
      },
      onRecoverPassword: (_) {},
      theme: LoginTheme(
        primaryColor: Colors.deepPurple,
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
        bodyStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 16,
        ),
        textFieldStyle: TextStyle(
          color: Colors.deepPurple,
          shadows: [Shadow(color: Colors.yellow, blurRadius: 2)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
}
