import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meu_projeto/blocs/auth_bloc.dart';
import 'package:meu_projeto/blocs/auth_event.dart';
import 'package:meu_projeto/blocs/auth_state.dart';
import 'package:meu_projeto/wrappers/semi_auth_wrapper.dart';
import 'package:meu_projeto/wrappers/authenticated_wrapper.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return AuthenticatedWrapper();
        } else if (state is SemiAuthenticatedState) {
          return SemiAuthWrapper();
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
