import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';

import './usuarios_controller.dart';

class UsuariosView extends GetView<UsuariosController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tiendas MP',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Samantha', fontSize: 40),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MenuPrincipal(),
      body: Center(
        child: Text(
          'UsuariosView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
