import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bsup/services/auth_service.dart';

class ChangePasswordPage extends StatelessWidget {
  static const routeName = '/change_password_page';

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _changePassword(LoginData data) async {
    try {
      await AuthService.changePassword(data.password!);
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'BSUP',
      onLogin: (_) => Future(),
      onSignup: (_) => Future(),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacementNamed('/');
      },
      onRecoverPassword: (_) => Future(),
      messages: LoginMessages(
        changePasswordButton: 'Alterar senha',
        confirmPasswordError: 'As senhas não coincidem!',
      ),
      theme: LoginTheme(
        primaryColor: Colors.teal,
        accentColor: Colors.white,
        errorColor: Colors.deepOrange,
        pageColorLight: Colors.white,
        pageColorDark: Colors.teal,
        titleStyle: TextStyle(
          color: Colors.white,
          fontFamily: 'Quicksand',
          letterSpacing: 4,
        ),
        textFieldStyle: TextStyle(
          color: Colors.black87,
          shadows: [Shadow(color: Colors.black12, blurRadius: 2)],
        ),
        buttonStyle: TextStyle(
          fontWeight: FontWeight.w800,
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
        inputTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.black.withOpacity(.1),
          contentPadding: EdgeInsets.zero,
          errorStyle: TextStyle(
            backgroundColor: Colors.white.withOpacity(.5),
            color: Colors.deepOrange,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.teal),
            borderRadius: BorderRadius.circular(100),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(100),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
      passwordValidator: (value) {
        if (value == null || value.isEmpty) {
          return 'Senha inválida!';
        }
        return null;
      },
      onSubmit: _changePassword,
      onPasswordConfirm: (value) {
        if (value == null || value.isEmpty) {
          return 'Senha inválida!';
        }
        return null;
      },
    );
  }
}
