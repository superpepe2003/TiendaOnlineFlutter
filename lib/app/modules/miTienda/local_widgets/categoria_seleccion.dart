
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../mitienda_controller.dart';

class CategoriasSeleccion extends GetView<MiTiendaController> {
  

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: MultiSelectDialogField(
        items: controller.categorias.map( (cat) => MultiSelectItem( cat, cat.nombre)).toList(),
        initialValue: controller.categoriasTienda,
        title: Text("Categorias"),
        selectedColor: Colors.blue,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(40)),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        buttonIcon: Icon(
          Icons.category,
          color: Colors.blue,
        ),
        buttonText: Text(
          "Categorias",
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 16,
          ),
        ),
        onConfirm: (results) {
          controller.categoriasTienda = results;          
        },
      ),
    );
  }
}