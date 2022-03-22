class JournalModel {
  int id;
  String title;
  String description;



  JournalModel(
      {required this.id,
      required this.title,
      required this.description,
     

      });

  Map<String, dynamic> toMap() {
    return ({
      "id": id,
      "title": title,
      "description": description,
     
    });
    
  }
    factory JournalModel.fromJson(Map<String, dynamic> json) {
      return JournalModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
       
      );
    }
}