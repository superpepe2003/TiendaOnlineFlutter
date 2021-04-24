import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/local_widgets/agregar_producto.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';

import 'local_widgets/lista_productos.dart';

class MiProductoPage extends GetView<MiProductosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Mis Productos',
            style: TextStyle(
                color: Colors.black, fontFamily: 'Samantha', fontSize: 40),
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              icon: FaIcon(FontAwesomeIcons.plus),
              onPressed: () {
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
                    });
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: ListaProductos(),
        ));
  }
}
