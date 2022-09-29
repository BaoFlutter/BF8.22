import 'package:api_lession/data_sources/api_service.dart';

class Repository {
  final ApiService _apiService = ApiService();

  // Login
Future signIn({required Map data}) => _apiService.signIn(loginData: data);


}