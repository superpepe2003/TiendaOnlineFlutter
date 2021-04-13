

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/tienda/tienda_controller.dart';

class TiendaBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<TiendaController>(() => TiendaController());
  }


}