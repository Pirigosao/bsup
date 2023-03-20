import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/auth_state.dart';
import '../blocs/auth_event.dart';
import '../wrappers/authenticated_wrapper.dart';
import '../pages/login_page.dart';



class SemiAuthWrapper extends StatefulWidget {
  const SemiAuthWrapper({Key? key}) : super(key: key);

  @override
  _SemiAuthWrapperState createState() => _SemiAuthWrapperState();
}

class _SemiAuthWrapperState extends State<SemiAuthWrapper> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthBloc>(context).add(AppStarted());
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
