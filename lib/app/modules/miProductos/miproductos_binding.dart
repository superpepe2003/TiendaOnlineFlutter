

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';

class MiProductosBinding extends Bindings {
  
  @override
  void dependencies() {
    
    Get.lazyPut<MiProductosController>(() => MiProductosController());
    
  }

}