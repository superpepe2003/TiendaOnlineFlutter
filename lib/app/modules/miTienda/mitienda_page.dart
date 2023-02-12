import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/cargando.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/local_widgets/mostrar_tienda.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/mitienda_controller.dart';

class MitiendaPage extends GetView<MiTiendaController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.isLoading)
        ? Scaffold(
            appBar: AppBar(
              brightness: Theme.of(context).appBarTheme.brightness,
              centerTitle: true,
              title: Text(
                'Mi Tienda',
                style: TextStyle(
                    color: Theme.of(context).appBarTheme.backgroundColor,
                    fontFamily: 'Samantha',
                    fontSize: 40),
              ),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              iconTheme: IconThemeData(
                  color: Theme.of(context).appBarTheme.foregroundColor),
            ),
            body: Center(
              child: Cargando(),
            ))
        : MostrarTienda());
  }
}
