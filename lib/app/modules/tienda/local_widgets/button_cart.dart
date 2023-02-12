import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/lista_carrito.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../tienda_controller.dart';

class BottonCart extends GetView<TiendaController> {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Positioned(
        bottom: _responsive.hp(0),
        child: Obx(() => InkWell(
              onTap: () => controller.listadoCart = !controller.listadoCart,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: _responsive.wp(100),
                  height: (controller.listadoCart)
                      ? _responsive.hp(85)
                      : _responsive.hp(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(_responsive.wp(20)),
                          topRight: Radius.circular(_responsive.wp(20))),
                      color: Theme.of(context).canvasColor,
                      boxShadow: [
                        BoxShadow(
                            color:
                                Theme.of(context).appBarTheme.foregroundColor,
                            offset: Offset(0, -3),
                            blurRadius: 10)
                      ]),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: _responsive.wp(4),
                          ),
                          Obx(() => Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(width: _responsive.wp(10)),
                                  Container(
                                    height: _responsive.wp(15),
                                    child: Stack(
                                      overflow: Overflow.visible,
                                      children: [
                                        Image.asset(
                                          'assets/iconos/shoppingcart.png',
                                          //color: Theme.of(context).accentColor,
                                          fit: BoxFit.cover,
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: -2,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            width: _responsive.wp(5),
                                            child: Center(
                                              child: Text(
                                                '${controller.count}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: _responsive.wp(5)),
                                  Expanded(
                                      child: Text(
                                    '\$${controller.totalPrecio}',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )),
                                  MaterialButton(
                                    child: Container(
                                        padding:
                                            EdgeInsets.all(_responsive.wp(3)),
                                        decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.payment,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .button
                                                  .color,
                                              size: 18,
                                            ),
                                            SizedBox(
                                              width: _responsive.wp(2),
                                            ),
                                            Text('Confirmar',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button),
                                          ],
                                        )),
                                    //
                                    onPressed: () async {
                                      String message = armarPedido();
                                      await launch(
                                          'https://wa.me/+549${controller.tienda.telefono}?text=$message');
                                    },
                                  ),
                                  SizedBox(width: _responsive.wp(5))
                                ],
                              )),
                          (controller.listadoCart)
                              ? Expanded(child: ListaCarrito())
                              : Container(),
                        ],
                      ),
                      Positioned(
                        top: _responsive.wp(-5),
                        right: _responsive.wp(40),
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context)
                                  .primaryColorLight
                                  .withAlpha(210),
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor
                                        .withAlpha(210),
                                    offset: Offset(0, -3),
                                    blurRadius: 10)
                              ]),
                          child: MaterialButton(
                              onPressed: () => controller.listadoCart =
                                  !controller.listadoCart,
                              child: (!controller.listadoCart)
                                  ? Icon(Icons.arrow_upward_rounded,
                                      color: Theme.of(context).primaryColorDark)
                                  : Icon(Icons.arrow_downward_rounded,
                                      color:
                                          Theme.of(context).primaryColorDark)),
                        ),
                      ),
                    ],
                  )),
            )));
  }

  String armarPedido() {
    String texto =
        'Te llego un mensaje de *Tienda ONline*\n Del usuario: ${Get.find<UserService>().user.nombre} \n\n';
    for (var c in controller.productosCart) {
      texto += '*${c.nombre.trim()}* \n';
      texto +=
          'cant: ${c.cantidad.toString().trim()} - \$${c.precio.toString().trim()}';
      texto += '\n\n';
    }
    texto +=
        'Precio estimativo: *\$${controller.totalPrecio.toString().trim()}*';
    return texto;
  }
}
