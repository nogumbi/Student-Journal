// import 'package:app/database/journal_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseProvider {
  
//   DatabaseProvider._();
//   static final DatabaseProvider db = DatabaseProvider._();
//   static Database _database;

//   Future<Database> get database async {
//     // Create a getter database and check if it doesn't already exist.
//     if (_database != null) {
//       return _database;
//     }
//      _database = await initDB();
//      return _database;
//   }

//   initDB() async {
//     return await openDatabase(join(await getDatabasesPath(), "journal.db"),
//     onCreate: (db, version) async {
//       await db.execute('''
//       CREATE TABLE journal (
//         id INTERGER PRIMARY AUTOINCREMET,
//         title TEXT,
//         description TEXT,
//         created DATE
//       )
//       ''');
//     }, version: 1);
//   }
  
//   addJournal(JournalModel entry) async {
//     final db = await database;
//     db.insert("entry", entry.toMap(),
//     conflictAlgorithm:  ConflictAlgorithm.replace);
//   }

//   Future<dynamic> getEntries() async {
//     final db = await database;
//     var res = await db.query("entry");
//     if (res.length == 0) {
//       return null;
//     }else {
//       var result = res.toList();
//       return result.isNotEmpty ? result : Null;
//     }
//   }
// }
 
