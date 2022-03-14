import 'package:app/add_new.dart';
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
      initialRoute: '/',
      routes: {'/': (context) => const HomePage(),
      '/view_old': (context) => const ViewPage(),
      "/add_new": (context) => const AddNewPage(),
      }
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Journal Memories"),
      ),
    );
  }
}
