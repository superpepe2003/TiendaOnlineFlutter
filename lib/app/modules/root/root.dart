import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';
import 'package:tienda_online_flutter/app/modules/home/home_pages.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/loginregister_view.dart';
import 'package:tienda_online_flutter/app/modules/splahScreen/splash_screen_page.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    Get.changeThemeMode(
        (box.read('isOscuro') ?? false) ? ThemeMode.dark : ThemeMode.light);

    return Obx(() {
      return (Get.find<UserService>().cargando)
          ? SplashScreenPage()
          : (Get.find<UserService>().user?.email != null)
              ? HomePage()
              : LoginregisterView();
      //: LoginregisterView();
    });
  }
}
