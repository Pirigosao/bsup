import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bsup/blocs/auth_bloc.dart';
import 'package:bsup/wrappers/authenticated_wrapper.dart';
import 'package:bsup/pages/login_page.dart';

import '../blocs/auth_state.dart';

class SemiAuthWrapper extends StatefulWidget {
  const SemiAuthWrapper({Key? key}) : super(key: key);

  @override
  _SemiAuthWrapperState createState() => _SemiAuthWrapperState();
}

class _SemiAuthWrapperState extends State<SemiAuthWrapper> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(AuthBlocStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState state) {
        if (state is Authenticated) {
          return AuthenticatedWrapper();
        } else if (state is Unauthenticated) {
          return LoginPage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
