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
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(right: 15, left: 15),
                ),
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Title filed can't be empty";
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter Your Journal Entry',
                  border: OutlineInputBorder(),
                  contentPadding:
                      EdgeInsets.only(right: 15, top: 15, bottom: 50, left: 15),
                ),
                maxLines: 7,
                validator: (String? val) {
                  if (val!.isEmpty) {
                    return "Body field can't be empty";
                  }
                },
              ),

              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
        onPressed: () {
          print("New entry added.");
          Navigator.pushNamed(context, "/view_old");
        },
        label: const Text("ADD"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
