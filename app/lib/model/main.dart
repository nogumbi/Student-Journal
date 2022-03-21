import 'package:app/model/database/database_provider.dart';
import 'package:app/model/add_new.dart';
import 'package:app/model/home.dart';
import 'package:app/model/view_old.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //Navigation to other screens using routes.
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const HomePage(),
          '/view_old': (context) => const ViewPage(),
          "/add_new": (context) => const AddNewPage(),
        });
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(224, 230, 233, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
          title: const Text("Login"),
        ));
  }
}


