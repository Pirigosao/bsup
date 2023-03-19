import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bsup/blocs/auth_bloc.dart';
import 'package:bsup/blocs/auth_event.dart';
import 'package:bsup/blocs/auth_state.dart';

class SemiAuthWrapper extends StatelessWidget {
  const SemiAuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semi-Authenticated'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Continue with email'),
          onPressed: () {
            final authBloc = BlocProvider.of<AuthBloc>(context);
            authBloc.add(ContinueWithEmailEvent());
          },
        ),
      ),
    );
  }
}
