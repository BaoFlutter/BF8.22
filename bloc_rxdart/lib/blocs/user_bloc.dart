import 'package:rxdart/rxdart.dart';
import 'dart:convert' as json;

import '../data_sources/repository.dart';
import '../resources/utils/log.dart';

class UserBloc {
  final _repository = Repository();

  final userSubject = PublishSubject<Map>();

  signIn({required loginData}) async {
    var response;
    try {
       response = await _repository.signIn(data: loginData);
    }
    catch(e){
      print(e.toString());
    }
    var body = json.jsonDecode(response.body);
    Log().printJson(json: body);
    return body;
  }
  // Tạo Stream cho view
  Stream<Map> get userStream => userSubject.stream;

  //
  dispose(){
    userSubject.close();
  }


}