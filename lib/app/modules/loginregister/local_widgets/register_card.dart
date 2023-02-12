import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/local_widgets/form_register.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class RegisterCard extends GetView<LoginregisterController> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceOut,
          width: controller.ancho2,
          height: controller.alto,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Get.width * 0.2))
              //color: Colors.blue
              ),
          child: (controller.ancho2 >= Get.width * 0.8)
              ? FormRegister()
              : Container(),
          //)
        ));
  }
}
