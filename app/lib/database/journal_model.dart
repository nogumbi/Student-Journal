class JournalModel {
  int id;
  String title;
  String description;


  JournalModel(
      {required this.id,
      required this.title,
      required this.description});

  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "title": title,
      "description": description,
     
    });
    
  }
}