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
      backgroundColor: const Color.fromRGBO(224, 230, 233, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(74, 51, 65, 1.0),
        title: const Text("Student Journal Memories"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
        child: Icon(Icons.add),
        onPressed: () {
          print("Add new journal entry.");
          Navigator.pushNamed(context, "/add_new");
        },
      ),
    );
  }
}
