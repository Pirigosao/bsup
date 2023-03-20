import 'package:flutter/material.dart';
import 'package:bsup/screens/login_screen.dart';
import 'package:bsup/utils/constants.dart';
import 'package:bsup/utils/routes.dart';
import 'package:bsup/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: themeData,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}