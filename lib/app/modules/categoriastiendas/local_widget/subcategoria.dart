import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class SubCategoria extends GetView<CategoriastiendasController> {
  final int index;

  const SubCategoria({this.index});
  @override
  Widget build(BuildContext context) {
    final Responsive _resp = Responsive(context);
    return InkWell(
      onTap: () async {
        var valor = await Get.toNamed('tiendas',
            arguments:
                controller.categoriasHijas(controller.currentPadre)[index].id);
        controller.cargarFavoritos();
      },
      child: Container(
        //margin: EdgeInsets.all(_resp.wp(4)),
        width: controller.itemSize,
        height: controller.itemSize,
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Theme.of(context).accentColor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                offset: Offset(0, 5),
              )
            ]),
        child: Center(
          child: Text(
            '${controller.categoriasHijas(controller.currentPadre)[index].nombre}',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }
}
