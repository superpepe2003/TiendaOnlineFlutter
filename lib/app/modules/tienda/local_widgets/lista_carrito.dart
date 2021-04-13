
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/productoCart.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../tienda_controller.dart';

class ListaCarrito extends GetView<TiendaController> {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Container(
      padding: EdgeInsets.all(_responsive.wp(10)),
      child: Obx(() => ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: controller.productosCart.length,
          itemExtent: 150,
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsets.symmetric( vertical:_responsive.wp(3) ),
              child: ProductoCart(
                item: controller.productosCart[index],
                index: index,
              ),
            );
          })),
    );
  }
}
