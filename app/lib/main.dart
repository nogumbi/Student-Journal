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
        backgroundColor: const Color.fromRGBO(224, 230, 233, 1.0),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter,
            colors:[
              Color.fromRGBO(109, 77, 110, 1.0),
              Color.fromRGBO(126, 105, 145, 1.0),
              Color.fromRGBO(163, 164, 190, 1.0),
            ])
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Color.fromRGBO(224, 230, 233, 1.0), fontSize:40),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      "Welcome Back, Share Your Thoughts.",
                      style: TextStyle(color: Color.fromRGBO(224, 230, 233, 1.0), fontSize:18),
                    ),],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child:Container(
                  decoration: const BoxDecoration(
                    color:Color.fromRGBO(224, 230, 233, 1.0),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding (
                      padding: const EdgeInsets.all(30),
                      child: Column (
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(224, 230, 233, 1.0),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(74, 51, 65, 1.0),
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                              ]),
                          
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(126, 105, 145, 1.0)))),
                                        child: const TextField(
                                          decoration: InputDecoration(
                                            hintText: "Email Address",
                                            hintStyle: TextStyle(color: Color.fromRGBO(163, 164, 190, 1.0)), 
                                            border: InputBorder.none),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Color.fromRGBO(126, 105, 145, 1.0)))),
                                                child: const TextField(
                                                  decoration: InputDecoration(
                                                    hintText: "Password",
                                                    hintStyle: TextStyle(color: Color.fromRGBO(163, 164, 190, 1.0)), 
                                                    border: InputBorder.none),
                                                ),
                                              ),
                            ],
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  const Text("Forgot Password?", style: TextStyle(color: Color.fromRGBO(126, 105, 145, 1.0))),
                                // SizedBox(height:20,),
                                // Container(
                                //   height: 50,
                                //   margin:)
                                ],
                              ),
                    ),),),
                          )
                        ]
                  ),
                        ),
                            floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color.fromRGBO(74, 51, 65, 1.0),
        onPressed: () {
          // ignore: avoid_print
          print("Welcome to your memories.");
          Navigator.pushNamed(context, "/home");
        },
        label: const Text("LOGIN"),
      ),
    );
  }
}


