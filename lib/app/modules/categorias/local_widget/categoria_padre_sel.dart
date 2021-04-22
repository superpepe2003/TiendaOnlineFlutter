import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/app/modules/categorias/categorias_controller.dart';

class CategoriaPadreSelect extends StatelessWidget {
  const CategoriaPadreSelect({
    @required this.controller,
  });

  final CategoriasController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: controller.currentPadre,
        items: controller.listaCategoriaPadres(),
        onChanged: (select) {
          controller.currentPadre = select;
        },
      ),
    );
  }
}
