import 'package:get/get.dart';

import 'controller/login_controller.dart';
import 'controller/loginregister_controller.dart';
import 'controller/register_controller.dart';

class LoginregisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginregisterController>(
      () => LoginregisterController(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
  }
}
