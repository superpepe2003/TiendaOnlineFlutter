import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_widgets/cargando.dart';
import 'local_widgets/login_card.dart';
import 'local_widgets/register_card.dart';
import 'controller/loginregister_controller.dart';

class LoginregisterView extends GetView<LoginregisterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: Get.height * 0.2),
      child: Center(
        child: GetX<LoginregisterController>(
            init: LoginregisterController(),
            builder: (controller) {
              controller.screens = [LoginCard(), RegisterCard()];
              return (controller.isCargando)
                  ? Cargando()
                  : Stack(
                      alignment: Alignment.center,
                      children: (controller.index == 0)
                          ? controller.screens.reversed
                              .toList()
                              .map((e) => Positioned(
                                    right: (controller.screens.indexOf(e) !=
                                            controller.index)
                                        ? Get.width * 0.04
                                        : Get.width * 0.04,
                                    top: Get.height *
                                        0.07 *
                                        (controller.screens.indexOf(e) / 1.2 +
                                            1),
                                    child: e,
                                  ))
                              .toList()
                          : controller.screens
                              .map((e) => Positioned(
                                    right: (controller.screens.indexOf(e) !=
                                            controller.index)
                                        ? Get.width * 0.04
                                        : Get.width * 0.04,
                                    top: (Get.height *
                                        0.07 *
                                        (controller.screens.indexOf(e) / 1.2 +
                                            1)),
                                    child: e,
                                  ))
                              .toList());
            }),
      ),
    ));
  }
}
