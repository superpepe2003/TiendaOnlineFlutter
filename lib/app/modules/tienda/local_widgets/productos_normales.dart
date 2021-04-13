
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/producto.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/productos_destacados.dart';

import '../tienda_controller.dart';

class ProdutosNormales extends GetView<TiendaController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final orientation = MediaQuery.of(context).orientation;

    return Obx(() => Container(
          // margin: EdgeInsets.only(top: size.width * 9 / 16 + 70),
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.productosNormales.length,
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return _Producto(item: controller.productosNormales[index]);
              }),
        ));
  }
}

class _Producto extends StatelessWidget {
  final ProductoModel item;

  const _Producto({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      height: 100,
      child: Producto(item: item, destacado: false)      
    );
  }
}
