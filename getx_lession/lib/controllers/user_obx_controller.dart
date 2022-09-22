import 'package:get/get.dart';

import '../models/user.dart';

class UserObxController extends GetxController{
  // obx: observer + getx
  // obs <-> static : strìng , int , User


  var obsUser; // Dữ liệu kiểu  obs
  updateObsUser({required User user})
  {
    // static -> obs: thêm obs phía sdu
    // obs -> static : du_lieu_obs.value;

    this.obsUser = user.obs;
    update();
  }

}