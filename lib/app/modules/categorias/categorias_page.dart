import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'categorias_controller.dart';
import 'local_widget/categoria_padre.dart';
import 'local_widget/lista_subcategoria.dart';

class CategoriasPage extends GetView<CategoriasController> {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).appBarTheme.brightness,
        centerTitle: true,
        title: Text(
          'Tiendas MP',
          style: TextStyle(
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontFamily: 'Samantha',
              fontSize: 40),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
      ),
      drawer: MenuPrincipal(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 40),
                child: CategoriaPadreYAgregar(controller: controller),
              ),
              SizedBox(
                height: _responsive.hp(6),
              ),
              ListSubcategorias(controller: controller)
            ],
          ),
        ),
      ),
    );
  }
}
