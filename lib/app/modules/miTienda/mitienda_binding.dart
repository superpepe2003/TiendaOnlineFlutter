

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/mitienda_controller.dart';

class MiTiendaBinding extends Bindings{
  @override
  void dependencies() {
    //Get.put( MiTiendaController());
    Get.lazyPut(() => MiTiendaController());
  }

}