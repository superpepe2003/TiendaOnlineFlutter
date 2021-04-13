import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/local_widgets/mostrar_tienda.dart';
import 'package:tienda_online_flutter/app/modules/miTienda/mitienda_controller.dart';


class MitiendaPage extends GetView<MiTiendaController> {

  @override
  Widget build(BuildContext context) {

    return Obx( () =>
      (controller.isLoading )
        ? Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text(
                'Mi Tienda',
                style: TextStyle(
                    color: Colors.black, fontFamily: 'Samantha', fontSize: 40),
              ),),
            body: Center(
                  child: CircularProgressIndicator(),
              )         
          ) 
        : MostrarTienda()     
    );
  }
}