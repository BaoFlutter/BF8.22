import 'package:api_lession/data_sources/api_url.dart';
import 'package:http/http.dart' as http;
class ApiService {

  // Sign up  - Đăng ký
  Future signUp(Map data){
    var fullUrl = ApiUrl.registerApiUrl;
    Future response =  http.post(
        fullUrl,
         body: data
    );
    return response;
  }

  // Sign in - Đăng nhập
  Future signIn({required Map loginData})
  {
    var loginUrl = ApiUrl.loginApiUrl;
    Future response = http.post(
        loginUrl,
        body: loginData
    );
    return response;
  }

  Future logOut( token){
    var logOut = ApiUrl.lougOutApiUrl;
    Future response = http.delete(logOut,
    headers:{
      "Authorization" : 'Bearer ' + token,
       "Accept" : "application/json"
    });
    return response;

  }
  // get User
  Future  getUserInformation(token){
    var userInforUrl = ApiUrl.getUserInformation;
    Future response= http.get(userInforUrl,
        headers:{
      "Authorization" : 'Bearer ' + token,
      "Accept" : "application/json"
    } );

    return response;
  }




}