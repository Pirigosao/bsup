import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bsup/blocs/auth_bloc.dart';
import 'package:bsup/blocs/auth_event.dart';
import 'package:bsup/blocs/auth_state.dart';
import 'package:bsup/screens/home_screen.dart';

class AuthenticatedWrapper extends StatelessWidget {
  const AuthenticatedWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = context.watch<User>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-vindo!'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Você está autenticado como:'),
            Text(user.email ?? ''),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Acessar perfil'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => HomeScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
