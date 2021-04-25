import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';
import 'package:tienda_online_flutter/app/modules/home/home_pages.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/loginregister_binding.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/loginregister_view.dart';
import 'package:tienda_online_flutter/app/modules/splahScreen/splash_screen_page.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
