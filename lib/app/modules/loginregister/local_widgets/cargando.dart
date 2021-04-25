import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';

class Cargando extends GetView<LoginregisterController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Pulse(
        infinite: true,
        child: Container(
          width: Get.width * 0.4,
          height: Get.height * 0.4,
          decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
          child: Center(
            child: FlatButton(
              onPressed: () {
                controller.isCargando = false;
              },
            ),
          ),
        ),
      ),
    );
  }
}
