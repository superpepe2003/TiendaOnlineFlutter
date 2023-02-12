import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';

import 'form_login.dart';

class LoginCard extends StatelessWidget {
  final controller = Get.find<LoginregisterController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceOut,
          width: controller.ancho1,
          height: controller.alto,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Get.width * 0.2)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black38,
                ),
              ]),
          child: (controller.ancho2 >= Get.width * 0.8)
              ? FormLogin()
              : Container(),
          //)
        ));
  }
}

// class _Login extends GetView<LoginregisterController> {
//   @override
//   Widget build(BuildContext context) {
//     final Responsive responsive = Responsive(context);

//     return AnimatedContainer(
//       duration: Duration(milliseconds: 700),
//       curve: Curves.bounceOut,
//       width: controller.ancho1,
//       height: controller.alto,
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           FormLogin(),
//           Center(
//               child: Container(
//                   width: responsive.wp(50),
//                   margin: EdgeInsets.only(top: responsive.hp(40)),
//                   child: _crearBoton())),
//         ],
//       ),
//     );
//   }
// }

//
