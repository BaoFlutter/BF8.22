

class Information {
  int? id;
  String?  average_mark;
  String? grade;

  Information({ required this.id, required this.average_mark, required this.grade});

  Information.fromJson(Map json):
      this.id = json['id'],
      this.average_mark = json['average_mark'],
      this.grade = json['grade'];

  toJson(){
    return {
      'id': this.id,
      'average_mark': this.average_mark,
      'grade': this.grade
    };

  }
}