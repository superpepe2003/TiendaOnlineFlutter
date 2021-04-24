import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'agregar_producto.dart';
import 'foto_producto.dart';

class Producto extends GetView<MiProductosController> {
  final ProductoModel produ;
  final int index;

  const Producto({this.produ, this.index});

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Container(
      height: _responsive.hp(20),
      margin: EdgeInsets.all(5),
      child: Row(
        children: [
          FotoProducto(index),
          Expanded(
            child: InkWell(
              onTap: () {
                controller.cargarProductoModificar(produ);
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            contentPadding: EdgeInsets.all(0.0),
                            content: AgregarProducto()),
                      );
                    }).then((value) => controller.limpiarCampos());
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      produ.nombre,
                      style: TextStyle(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  (produ.subtitulo != null)
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          width: _responsive.wp(50),
                          child: Text(
                            produ.subtitulo,
                            style: TextStyle(fontSize: 12),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      : Container(),
                  Expanded(child: Container()),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      '\$ ${produ.precio.toString()}',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
