

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/tiendas/tiendas_controller.dart';

class TiendasBinding extends Bindings{
  @override
  void dependencies() {
    //Get.put( MiTiendaController());
    Get.lazyPut(() => TiendasController());
  }

}