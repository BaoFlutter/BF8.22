class WordModel {
  // các thuộc tính

  int? word_id;
  String? word;
  String? pronounce;
  String? meaning;

  WordModel({
    required this.word_id,
    required this.word,
    required this.pronounce,
    required this.meaning
});

  // fromJson
  WordModel.fromJson(Map json):
        this.word_id = json['word_id'],
        this.word = json['word'],
        this.pronounce = json['pronounce'],
        this.meaning = json['meaning'] ;

/*
  WordModel.fromJson1(Map json){
    this.word_id = json['word_id'];
    this.word = json['word'];
    this.pronounce = json['pronounce'];
    this.meaning = json['meaning'];
  }
 */
  //  App ------- JSON ( Map) ----------- Database

   // to Json
  toJson(){
    return {
      'word_id': this.word_id,
      'word': this.word,
      'pronounce': this.pronounce,
      'meaning': this.meaning
    };
  }




}