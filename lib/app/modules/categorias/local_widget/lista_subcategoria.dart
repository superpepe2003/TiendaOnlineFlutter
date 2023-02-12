import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../categorias_controller.dart';

class ListSubcategorias extends StatelessWidget {
  const ListSubcategorias({
    @required this.controller,
  });

  final CategoriasController controller;

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Obx(() => ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: _responsive.wp(5), vertical: _responsive.wp(3)),
              child: Text(
                '${controller.categoriasHijas(controller.currentPadre)[index].nombre}',
                style:
                    TextStyle(fontSize: 18, color: Theme.of(context).hintColor),
              ),
            );
          },
          itemCount:
              (controller.categoriasHijas(controller.currentPadre) != null)
                  ? controller.categoriasHijas(controller.currentPadre).length
                  : 0,
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ));
  }
}
