import 'dart:convert';

import 'package:flutter/material.dart';

import 'database/journal_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// call the API and fetch the response
Future<List<JournalModel>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost:5000/entries'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => JournalModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _HomePageState extends State<HomePage> {
  // getEntries() async {
  //   final entry = await DatabaseProvider.db.getEntries();
  //   return entry;
  late Future<List<JournalModel>> getEntries;

  @override
  void initState() {
    super.initState();
    getEntries = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 230, 233, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(74, 51, 65, 1.0),
        title: const Text("Student Journal Memories"),
      ),
      body: Center(
        
        child: FutureBuilder<List<JournalModel>>(
          future: getEntries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<JournalModel>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          
                                padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(126, 105, 145, 1.0)))),
                                  child: Text(
                                    data[index].title,
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                        ),
                         Container(
                           
                                padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Color.fromRGBO(126, 105, 145, 1.0)))),
                                  child: Text(
                          data[index].description,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                          ) ],
                    );
                  });
            } else if (snapshot.hasError) {
              Text(
                snapshot.error.toString(),
              );
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(74, 51, 65, 1.0),
        onPressed: () {
          print("Add new journal entry.");
          Navigator.pushNamed(context, "/add_new");
        },
        
      ),
    );
  }
}
