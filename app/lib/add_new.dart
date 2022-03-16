import 'package:flutter/material.dart';

class AddNewPage extends StatelessWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 230, 233, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
        title: const Text("Add New Entry"),
    ),
    body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
                hintText: 'Enter the title of your text',
              ),
            )
          )
        ]
      )

    )
    );
  }
}