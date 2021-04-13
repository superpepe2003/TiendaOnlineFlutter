import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/local_widgets/agregar_producto.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/local_widgets/foto_producto.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

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
                    return SingleChildScrollView(
                      
                                          child: AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))
                        ),
                        contentPadding: EdgeInsets.all(0.0),
                        content: AgregarProducto()
                      ),
                    );
                  }
                );
              },
            ),          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: _listarProductos(controller),
        )
      );
  }

  Widget _listarProductos(MiProductosController controller) {
    return Obx(() => ListView.builder(
            itemCount: controller.productos.length,
            itemBuilder: (BuildContext context, int index) {
              Responsive _responsive = Responsive(context);
              var produ = controller.productos[index];
              return Container(
                height: _responsive.hp(20),
                margin: EdgeInsets.all(5),
                child: Row(
                  children: [
                    FotoProducto( index ),                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            produ.nombre,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        ( produ.subtitulo != null)
                          ? Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                          child: Text('\$ ${produ.precio.toString() }')
                        ),
                      ],
                    ),
              ],
            ),
          );
        })
    );
  }
}
