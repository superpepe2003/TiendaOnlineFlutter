import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/app/modules/categorias/categorias_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'boton_agregar_categoria.dart';
import 'boton_agregar_sub.dart';
import 'boton_categoria.dart';

class CategoriaPadreYAgregar extends StatelessWidget {
  const CategoriaPadreYAgregar({
    @required this.controller,
  });

  final CategoriasController controller;

  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BotonCategorias(controller: controller),
            BotonAgregarCategoria()
          ],
        ),
        SizedBox(
          height: _responsive.wp(5),
        ),
        BotonAgregarSubCategoria()
      ],
    );
  }
}
