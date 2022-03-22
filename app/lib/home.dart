import 'dart:convert';

import 'package:flutter/material.dart';

import 'database/database_provider.dart';
import 'database/database_provider.dart';
import 'database/journal_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// call the API and fetch the response
// Future<JournalModel> fetchQuote() async {
//   final response = await http.get('http://localhost:5000/entries');
//   if (response.statusCode == 200) {
//     return JournalModel.fromJson(json.decode(response.body));
//   } else {
//     throw Exception('Failed to load Quote');
//   }
// }

class _HomePageState extends State<HomePage> {
  getEntries() async {
    final entry = await DatabaseProvider.db.getEntries();
    return entry;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(224, 230, 233, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(74, 51, 65, 1.0),
        title: const Text("Student Journal Memories"),
      ),
      // body: FutureBuilder(
      //     future: getEntries(),
      //     builder: (context, journalData){
      //       switch (journalData.connectionState) {
      //         case ConnectionState.waiting:
      //           {
      //             return const Center(child: CircularProgressIndicator());
      //           }

      //         case ConnectionState.done:
      //             {
      //             if (journalData.data == Null) {
      //               return const Center(
      //                 child: Text(
      //                     "You do not have any entries yet. Create a new entry"),
      //               );
      //             } else {
      //               return Padding(
      //                 padding: const EdgeInsets.all(8.0),
      //                 child: ListView.builder(
      //                   itemCount: journalData.data.length,
      //                   itemBuilder: (context, index) {
      //                     String title = journalData.data[index]['title'];
      //                     String description = journalData.data[index]['description'];
      //                     String created = journalData.data[index]['created'];
      //                     int id = journalData.data[index]['id'];
      //                     return Card(
      //                       child: ListTile(
      //                         title: Text(title),
      //                         subtitle: Text(description),
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               );
      //             }
      //           }
      //         }
      //       }
      //     ),
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
