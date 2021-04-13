

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController() );
  
  }

}