import 'package:app/add_new.dart';
import 'package:app/home.dart';
import 'package:app/view_old.dart';
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
        initialRoute: '/home',
        routes: {
          '/home': (context) => const HomePage(),
          '/view_old': (context) => const ViewPage(),
          "/add_new": (context) => const AddNewPage(),
        });
  }
}