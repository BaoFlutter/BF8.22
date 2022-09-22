import 'package:get/get.dart';

import '../models/user.dart';

class UserController extends GetxController{
  User? user;

  updateUser({required User user}){
    this.user = user;
    update();
  }

}



