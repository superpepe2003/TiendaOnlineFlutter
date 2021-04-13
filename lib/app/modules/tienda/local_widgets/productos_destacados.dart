
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/producto.dart';

import '../tienda_controller.dart';

class ProductosDestacados extends GetView<TiendaController> {
  final PageController pageController = new PageController(
    viewportFraction: 0.8,
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Obx(() => Container(
        width: size.width,
        height: 250, //size.width * 9 / 16,
        child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: controller.productosDestacados.length,
            itemBuilder: (_, index) {
              return _ProductoDestacado(
                  itemDestado: controller.productosDestacados[index]);
            })));
  }
}

class _ProductoDestacado extends GetView<TiendaController> {
  const _ProductoDestacado({@required this.itemDestado});

  final ProductoModel itemDestado;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'producto', arguments: '');
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Producto( item: itemDestado, destacado: true,)
        ),
      ),
    );
  }
}

