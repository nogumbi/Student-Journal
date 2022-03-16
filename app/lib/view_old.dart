import 'package:flutter/material.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(224, 230, 233, 1.0),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
          title: const Text("View Old Entry"),
        ));
  }
}
