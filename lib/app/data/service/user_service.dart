

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/menu_model.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';

class UserService extends GetxController {
  Rx<UsuarioModel> _user = UsuarioModel().obs;
  RxBool _cargando = false.obs;
  List<MenuModel> menu;

  final box = GetStorage();

  UsuarioModel get user => _user.value;
  bool get cargando => _cargando.value;

  set user( UsuarioModel user ) =>_user.value = user;

  set cargando( bool value) => _cargando.value = value;

  void singOut() {
    box.remove('token');
    user = UsuarioModel();
    Get.offAllNamed(AppRoutes.ROOT);
  }

  @override
  void onInit() async{
    String jsonString = await rootBundle.loadString('assets/menu.json');
    this.menu = menuFromJson(jsonString);

    super.onInit();
  }
  
}