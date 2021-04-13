
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/perfil/perfil_controller.dart';

class PerfilBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PerfilController>( () => PerfilController());
  }

}