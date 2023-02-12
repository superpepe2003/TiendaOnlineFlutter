import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';
import '../../global_widgets/cargando.dart';
import 'local_widgets/login_card.dart';
import 'local_widgets/register_card.dart';
import 'controller/loginregister_controller.dart';

class LoginregisterView extends GetView<LoginregisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //margin: EdgeInsets.only(top: Get.height * 0.2),
        child: Center(
          child: GetX<LoginregisterController>(
              init: LoginregisterController(),
              builder: (controller) {
                controller.screens = [LoginCard(), RegisterCard()];
                // Verifico si esta cargando que puede ser el token y si no esta cargando verifico que no haya usuario
                // para que no muestre el login y vaya directo a la pagina home
                return (controller.isCargando)
                    ? Cargando()
                    // Decido que ventana aparece arriba si login o register
                    : (Get.find<UserService>().user.email != null)
                        ? Container()
                        : Stack(
                            alignment: Alignment.center,
                            children: (controller.index == 0)
                                ? controller.screens.reversed
                                    .toList()
                                    .map((e) => Positioned(
                                          right:
                                              (controller.screens.indexOf(e) !=
                                                      controller.index)
                                                  ? Get.width * 0.04
                                                  : Get.width * 0.04,
                                          top: Get.height *
                                              0.07 *
                                              (controller.screens.indexOf(e) /
                                                      1.2 +
                                                  3),
                                          child: e,
                                        ))
                                    .toList()
                                : controller.screens
                                    .map((e) => Positioned(
                                          right:
                                              (controller.screens.indexOf(e) !=
                                                      controller.index)
                                                  ? Get.width * 0.04
                                                  : Get.width * 0.04,
                                          top: (Get.height *
                                              0.07 *
                                              (controller.screens.indexOf(e) /
                                                      1.2 +
                                                  3)),
                                          child: e,
                                        ))
                                    .toList());
              }),
        ),
      ),
    );
  }
}
