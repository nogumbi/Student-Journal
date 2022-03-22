import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'database/journal_model.dart';

class AddNewPage extends StatefulWidget {
  const AddNewPage({Key? key}) : super(key: key);

  @override
  _AddNewPageState createState() => _AddNewPageState();
}

Future<List<JournalModel>> sendData() async {
  final response = await http.get(Uri.parse('http://localhost:5000/entries'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => JournalModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

Future<JournalModel> updateData(String title) async {
  final response = await http.put(
    Uri.parse('http://localhost:5000/entries'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return JournalModel.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}


class _AddNewPageState extends State<AddNewPage> {
  final TextEditingController _controller = TextEditingController();
  late Future<List<JournalModel>> futureData;
  @override
  void initState() {
    super.initState();
    futureData = sendData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 230, 233, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
        title: const Text("Add New Entry"),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<JournalModel>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text(snapshot.data.title),
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
                    // ElevatedButton(
                      
                    //   onPressed: () {
                    //     setState(() {
                    //       futureData = updateData(_controller.text) as Future<List<JournalModel>>;
                    //     });
                    //   },
                    //   child: const Text('Update Data'),
                    // ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
        onPressed: () {
          // setState(() {
          //   futureData = updateData(_controller.text) as Future<List<JournalModel>>;
          //   });
          print("New entry added.");
          Navigator.pushNamed(context, "/view_old");
        },
        label: const Text("ADD NEW"),
      ),
      //  floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
      //   onPressed: () {
      //     setState(() {
      //       futureData = updateData(_controller.text) as Future<List<JournalModel>>;
      //       });
      //     print("New entry added.");
      //     Navigator.pushNamed(context, "/view_old");
      //   },
      //   label: const Text("ADD NEW"),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
