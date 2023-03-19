import 'package:flutter/material.dart';
import 'package:bsup/authentication_service.dart';
import 'package:bsup/home_page.dart';
import 'package:bsup/authentication_exception.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthenticationService _authenticationService = AuthenticationService();

  bool _isLoading = false;

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _authenticationService.login(
        email: _emailController.text,
        password: _passwordController.text,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on AuthenticationException catch (e) {
      String message = '';

      switch (e.errorCode) {
        case 'invalid-email':
          message = 'E-mail inválido';
          break;
        case 'wrong-password':
          message = 'Senha incorreta';
          break;
        case 'user-not-found':
          message = 'Usuário não encontrado';
          break;
        default:
          message = 'Ocorreu um erro durante o login';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text(message),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Entrar'),
              onPressed: _isLoading ? null : _login,
            ),
          ],
        ),
      ),
    );
  }
}