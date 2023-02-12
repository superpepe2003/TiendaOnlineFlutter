import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'categoria_padre.dart';

class ListaCatPadres extends GetView<CategoriastiendasController> {
  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Obx(() => Container(
          width: double.infinity,
          height: _resp.hp(15),
          child: PageView.builder(
              controller: _pageController,
              pageSnapping: false,
              itemCount: controller.categoriasPadres.length,
              itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: CategoriaPadre(index: index))),
        ));
  }
}
