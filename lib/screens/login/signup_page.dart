import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class SignupPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _signupUser(LoginData data) async {
    try {
      //TODO: Implement Firebase Authentication signup logic here
      await Future.delayed(loginTime);
      return null;
    } catch (error) {
      return error.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'BSUP',
      onSignup: _signupUser,
      messages: LoginMessages(
        usernameHint: 'Email',
        passwordHint: 'Senha',
        confirmPasswordHint: 'Confirmar senha',
        signupButton: 'Cadastrar',
        confirmPasswordError: 'As senhas não coincidem',
        recoverPasswordDescription: 'Informe o email utilizado para cadastro',
        recoverPasswordButton: 'RECUPERAR SENHA',
        goBackButton: 'Voltar',
        flushbarTitleSuccess: 'Sucesso',
        flushbarTitleError: 'Erro',
      ),
      theme: LoginTheme(
        primaryColor: Color(0xFF2F78C4),
        accentColor: Color(0xFFF6D365),
        errorColor: Color(0xFFFFA0A0),
        pageColorLight: Color(0xFFE6E6E6),
        pageColorDark: Color(0xFF303030),
        titleStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Colors.white,
          letterSpacing: 2,
        ),
        bodyStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.white,
          letterSpacing: 1.5,
        ),
        textFieldStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 16,
        ),
        buttonStyle: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 20,
          color: Colors.white,
        ),
        cardTheme: CardTheme(
          color: Colors.white,
          elevation: 5,
          margin: EdgeInsets.only(top: 15),
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(75),
          ),
        ),
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white.withOpacity(0.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Color(0xFFFFA0A0),
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            fontFamily: 'Quicksand',
            fontSize: 16,
            color: Colors.white70,
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(75),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(75),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(75),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(75),
          ),
        ),
      ),
    );
  }
}
