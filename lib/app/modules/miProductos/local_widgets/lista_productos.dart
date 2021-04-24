import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../miproductos_controller.dart';
import 'producto.dart';

class ListaProductos extends GetView<MiProductosController> {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Container(
        child: Obx(() => ListView.builder(
            itemCount: controller.productos.length,
            itemBuilder: (BuildContext context, int index) {
              var produ = controller.productos[index];
              return Producto(produ: produ, index: index);
            })));
  }
}
