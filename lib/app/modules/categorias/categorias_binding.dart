import 'package:get/get.dart';

import 'categorias_controller.dart';

class CategoriasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoriasController>(
      () => CategoriasController(),
    );
  }
}
