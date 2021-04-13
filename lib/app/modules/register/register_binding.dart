

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/register/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    
    Get.lazyPut<RegisterController>(() => RegisterController() );
    
  }

}