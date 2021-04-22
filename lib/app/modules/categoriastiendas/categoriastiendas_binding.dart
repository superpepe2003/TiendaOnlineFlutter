import 'package:get/get.dart';

import 'categoriastiendas_controller.dart';

class CategoriastiendasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriastiendasController>(
      () => CategoriastiendasController(),
    );
  }
}
