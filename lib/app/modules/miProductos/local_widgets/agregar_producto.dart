import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class AgregarProducto extends GetView<MiProductosController> {
  const AgregarProducto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Container(
      height: _resp.hp(60),
      width: _resp.wp(90),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _resp.hp(5),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Text(
                  (controller.isModificar)
                      ? 'Modificar Producto'
                      : 'Agregar Producto',
                  style: TextStyle(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: controller.nombre,
                decoration: InputDecoration(
                    hintText: 'Nombre',
                    labelText: 'Nombre del Producto',
                    icon: Icon(Icons.add_shopping_cart),
                    hintStyle: TextStyle(color: Theme.of(context).accentColor),
                    labelStyle:
                        TextStyle(color: Theme.of(context).accentColor)),
                onChanged: (value) => controller.nombre = value,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: controller.subtitulo,
                decoration: InputDecoration(
                    hintText: 'Descripcion',
                    labelText: 'Describe el producto',
                    icon: Icon(Icons.ballot_outlined)),
                onChanged: (value) => controller.subtitulo = value,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: controller.precio.toString(),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Precio',
                    labelText: 'Precio',
                    icon: Icon(Icons.attach_money)),
                onChanged: (value) =>
                    controller.precio = double.tryParse(value) ?? 0,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Destacado'),
                Text('Disponible'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Obx(() => CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: controller.destacado,
                      onChanged: (value) {
                        controller.destacado = value;
                      },
                    )),
                Obx(() => CupertinoSwitch(
                      activeColor: Theme.of(context).primaryColor,
                      value: controller.disponible,
                      onChanged: (value) {
                        controller.disponible = value;
                      },
                    )),
              ],
            ),
            //Expanded(child: Container()),
            SizedBox(
              height: _resp.hp(5),
            ),
            MaterialButton(
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                child: Text((controller.isModificar)
                    ? 'Modificar Producto'
                    : 'Agregar Producto'),
                onPressed: () async {
                  var result = await controller.guardarProducto();
                  if (result) {
                    Get.back();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
