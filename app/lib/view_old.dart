import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'database/journal_model.dart';
import 'package:http/http.dart' as http;

class ViewPage extends StatefulWidget {
  const ViewPage({Key? key}) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

// call the API and fetch the response
Future<List<JournalModel>> fetchData() async {
  final response = await http.get(Uri.parse('http://localhost:5000/entries/1'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => JournalModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

class _ViewPageState extends State<ViewPage> {
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
        title: const Text("Old Entry"),
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Animator(
                          triggerOnInit: true,
                          curve: Curves.easeIn,
                          duration: Duration(milliseconds:500),
                          tween: Tween<double>(begin: -1, end: 0),
                          builder: (context, state, child) {
                            return FractionalTranslation(
                              translation: Offset(state.value as double, 0),
                              child: child);
                          },
                          child: Text(data[index].description, 
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: const Color.fromRGBO(126, 105, 145, 1.0),
                          ),),
                            ),
                          const SizedBox(height: 10.0),
                          Animator(
                          triggerOnInit: true,
                          curve: Curves.easeIn,
                          duration: const Duration(milliseconds:500),
                          tween: Tween<double>(begin: -1, end: 0),
                          builder: (context, state, child) {
                            return FractionalTranslation(
                              translation: Offset(state.value as double, 0),
                              child: child);
                          },
                          child: Text(data[index].title, 
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Color.fromRGBO(126, 105, 145, 1.0),
                          ),),
                            ),
                      ],
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
        child: Icon(Icons.add),
        onPressed: () {
          print("Add new journal entry.");
          Navigator.pushNamed(context, "/add_new");
        },
      ),
    );
  }
}

