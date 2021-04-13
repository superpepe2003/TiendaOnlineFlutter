import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class AgregarProducto extends GetView<MiProductosController> {
  const AgregarProducto({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Container(
      height: _resp.hp(60),
      width: _resp.wp(90),
      child: Column(
        children: [
          Container(
            height: _resp.hp(5),
            color: miTema().primaryColor,
            child: Center(
              child: Text(
                'Agregar Producto',
                style: TextStyle(
                  color: Colors.white,
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
                  icon: Icon(Icons.add_shopping_cart)),
              onChanged: ( value ) => controller.nombre = value,
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
              onChanged: ( value ) => controller.subtitulo = value,
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
              onChanged: ( value ) => controller.precio = double.parse(value),
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
                    value: controller.destacado,
                    onChanged: (value) {
                      controller.destacado = value;                      
                    },
                  )),
              Obx(() => CupertinoSwitch(
                    value: controller.disponible,
                    onChanged: (value) {
                      controller.disponible = value;
                    },
                  )),
            ],
          ),

          Expanded( child: Container()),
          MaterialButton(
            color: miTema().primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only( topLeft: Radius.circular(20), bottomRight: Radius.circular(20) )
            ),
            child: Text('Grabar Perfil'),
            onPressed: () async{
              var result = await controller.guardarProducto();
              if( result ) {
                Get.back();
              }
            }
          ),
        ],
      ),
    );
  }
}
