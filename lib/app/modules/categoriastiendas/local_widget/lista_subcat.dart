import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'subcategoria.dart';

class ListaCatHijas extends GetView<CategoriastiendasController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Obx(() => Container(
          child: GridView.builder(
            //scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount:
                controller.categoriasHijas(controller.currentPadre).length,
            itemBuilder: (context, index) => SubCategoria(index: index),
          ),
        ));
  }
}
