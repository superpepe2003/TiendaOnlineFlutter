import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/productos_destacados.dart';
import 'package:tienda_online_flutter/app/modules/tienda/tienda_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'local_widgets/button_cart.dart';
import 'local_widgets/productos_normales.dart';

// class _ProductosList {
//   String url;
//   String nombre;
//   _ProductosList(this.url, this.nombre);
// }

class TiendaPage extends GetView<TiendaController> {
  TiendaController controller = Get.find<TiendaController>();
  @override
  Widget build(BuildContext context) {
    //final index = ModalRoute.of(context).settings.arguments;

    Responsive _responsive = Responsive(context);

    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).appBarTheme.brightness,
        centerTitle: true,
        title: Obx(() => (controller.tienda != null)
            ? Text(
                '${controller.tienda.nombre}',
                style: Theme.of(context).appBarTheme.textTheme.headline1,
              )
            : Container()),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
        actions: [
          Obx(() => (controller.tienda != null && controller.tienda.img != null)
              ? CircleAvatar(
                  radius: 40,
                  backgroundImage: (controller.tienda.img != null)
                      ? NetworkImage(controller.tienda.img)
                      : Image.asset('assets/no-image-tienda.jpg'),
                  backgroundColor: Colors.transparent,
                )
              : Image.asset('assets/no-image-tienda.jpg'))
        ],
      ),
      drawer: MenuPrincipal(),
      body: Container(
        width: _responsive.wp(100),
        height: _responsive.hp(100),
        child: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  ProductosDestacados(),
                  SizedBox(height: 20),
                  ProdutosNormales(),
                  SizedBox(height: 70),
                ],
              ),
            ),
            Obx(() => (controller.count > 0) ? BottonCart() : Container())
          ]),
        ),
      ),
    );
  }
}
