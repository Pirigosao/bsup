import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:bsup/services/auth_service.dart';

class ResetPasswordPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _resetPassword(LoginData data) async {
    String? errorMessage;
    try {
      await AuthService().resetPassword(data.name);
    } catch (error) {
      errorMessage = error.toString();
    }
    return errorMessage;
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'BSup',
      onResetPassword: _resetPassword,
      onSignup: null,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pop();
      },
      messages: LoginMessages(
        resetPasswordButton: 'Enviar Email de Recuperação',
        confirmPasswordHint: 'Confirmar Senha',
        confirmPasswordError: 'As senhas não coincidem',
        recoverPasswordIntro: 'Informe o email associado a sua conta para recuperar sua senha.',
      ),
    );
  }
}
