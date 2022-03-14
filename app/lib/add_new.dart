import 'package:flutter/material.dart';

class AddNewPage extends StatelessWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text("Add New Entry"),
    ));
  }
}