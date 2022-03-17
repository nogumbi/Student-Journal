class JournalModel {
  int id;
  String title;
  String description;
  DateTime created;

  JournalModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.created});

  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "title": title,
      "description": description,
      "created": created
    });
    
  }
}
