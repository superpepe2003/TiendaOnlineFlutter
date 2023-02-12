import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mitienda_controller.dart';

class BotonGuardar extends GetView<MiTiendaController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.hayTienda)
        ? SliverFillRemaining(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Obx(() => (controller.guardando)
                  ? LinearProgressIndicator()
                  : MaterialButton(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Text('Grabar Cambios'),
                      onPressed: () {
                        controller.updateTienda();
                      })),
            ),
          )
        : SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Obx(
                () => (controller.guardando)
                    ? LinearProgressIndicator()
                    : MaterialButton(
                        color: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: Text('Crear Tienda'),
                        onPressed: () {
                          controller.crearTienda();
                        }),
              ),
            ),
          ));
  }
}
