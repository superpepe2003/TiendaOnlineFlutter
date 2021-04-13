import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/tienda/local_widgets/lista_carrito.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
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
                      topRight: Radius.circular(_responsive.wp(20))
                  ),
                  color: Colors.white.withAlpha(250),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black38,
                      offset: Offset(0,-3),
                      blurRadius: 10
                    )
                  ]
              ),
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
                                      //color: miTema().accentColor,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: -2,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: miTema().accentColor,
                                        ),
                                        width: _responsive.wp(5),
                                        child: Center(
                                          child: Text(
                                            '${controller.count}',
                                            style: TextStyle( color: Colors.white),
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
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                              MaterialButton(
                                child: Container(
                                    padding: EdgeInsets.all(_responsive.wp(3)),
                                    decoration: BoxDecoration(
                                        color: miTema().accentColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      children: [
                                        //Icon(Icons.payment, color: Colors.white, size: 36,),
                                        Text(
                                          'Confirmar',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )),
                                //
                                onPressed: () async {
                                  String message = armarPedido();
                                  await launch(
                                      'https://wa.me/+5491154570186?text=$message');
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
                          color: Colors.white.withAlpha(210),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withAlpha(210),
                              offset: Offset(0, -3),
                              blurRadius: 10
                            )
                          ]
                      ),
                      child: MaterialButton(
                          onPressed: () =>
                              controller.listadoCart = !controller.listadoCart,
                          child: (!controller.listadoCart)
                              ? Icon(Icons.arrow_upward_rounded,
                                  color: Colors.black)
                              : Icon(Icons.arrow_downward_rounded,
                                  color: Colors.black)),
                    ),
                  ),
                ],
              )),
        )));
  }

  String armarPedido() {
    String texto = 'Te llego un mensaje de *Tienda ONline* \n\n';
    for (var c in controller.productosCart) {
      texto += '*${c.nombre}* \n';
      texto += 'cant: ${c.cantidad.toString()} - \$${c.precio.toString()}';
      texto += '\n\n';
    }
    texto += 'Precio estimativo: *\$${controller.totalPrecio}*';
    return texto;
  }
}
