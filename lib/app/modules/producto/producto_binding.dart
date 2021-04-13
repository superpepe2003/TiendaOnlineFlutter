

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/producto/producto_controller.dart';

class ProductoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductoController>(() => ProductoController());
  }


}