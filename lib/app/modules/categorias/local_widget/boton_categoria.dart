import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../categorias_controller.dart';
import 'custom_dropdown.dart';

class BotonCategorias extends StatelessWidget {
  const BotonCategorias({@required this.controller});

  final CategoriasController controller;

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Obx(() => Container(
        padding: EdgeInsets.only(
          left: _responsive.wp(10),
          right: _responsive.wp(10),
        ),
        alignment: Alignment.topCenter,
        width: _responsive.wp(60),
        // height: _responsive.hp(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).hintColor,
        ),
        child: (controller.listaCategoriaPadres().length > 0)
            ? CustomDropDown(controller: controller)
            : Container()));
  }
}
