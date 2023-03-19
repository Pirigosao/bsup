import 'package:flutter/material.dart';
import 'package:my_app/screens/half_access_profile.dart';
import 'package:my_app/screens/full_access_home.dart';
import 'package:my_app/models/user.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  User? user;

  @override
  void initState() {
    super.initState();
    user = null; // o usuário ainda não está logado
  }

  void onLogin(User newUser) {
    setState(() {
      user = newUser;
      if (user!.profileDataCompleted()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => FullAccessHome(user: user!)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HalfAccessProfile(user: user!)),
        );
      }
    });
  }

  void onLogout() {
    setState(() {
      user = null; // o usuário saiu
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Auth()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return HalfAccessProfile(onLogin: onLogin);
    } else if (user!.profileDataCompleted()) {
      return FullAccessHome(user: user!, onLogout: onLogout);
    } else {
      return HalfAccessProfile(user: user!, onLogin: onLogin);
    }
  }
}
