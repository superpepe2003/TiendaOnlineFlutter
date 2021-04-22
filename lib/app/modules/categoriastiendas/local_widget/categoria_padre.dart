import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class CategoriaPadre extends GetView<CategoriastiendasController> {
  final int index;

  CategoriaPadre({this.index});

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return InkWell(
      onTap: () {
        controller.currentPadre = controller.categoriasPadres[index].id;
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: _resp.wp(2), vertical: _resp.wp(2)),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFE6952C),
            Color(0xFFFCA129),
            Color(0xFFECC38D),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            '${controller.categoriasPadres[index].nombre}',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize:
                    (controller.categoriasPadres[index].nombre.length > 14)
                        ? 28
                        : 30,
                fontFamily: 'Samantha'),
          ),
        ),
      ),
    );
  }
}
