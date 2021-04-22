import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/categorias/categorias_controller.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class AgregarSubCategoria extends GetView<CategoriasController> {
  final isCategoria;

  AgregarSubCategoria({this.isCategoria = false});

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Container(
      width: _resp.wp(80),
      height: _resp.hp(60),
      padding:
          EdgeInsets.symmetric(vertical: _resp.wp(10), horizontal: _resp.wp(5)),
      child: Column(
        children: [
          Text(
            (isCategoria)
                ? 'Agregar Categoria Principal'
                : 'Agregar SubCategoria a ${controller.categoriaPadre(controller.currentPadre).nombre}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(
            height: _resp.wp(10),
          ),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Nombre',
                labelText: (isCategoria)
                    ? 'Nombre de Categoria'
                    : 'Nombre de Subcategoria',
                icon: Icon(Icons.analytics_outlined)),
            onChanged: (value) => controller.nombre = value.trim(),
          ),
          SizedBox(
            height: _resp.wp(10),
          ),
          TextFormField(
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration: InputDecoration(
                hintText: 'Descripcion',
                labelText: (isCategoria)
                    ? 'Describe la categoria'
                    : 'Describe la subcategoria',
                icon: Icon(Icons.article_outlined)),
            onChanged: (value) => controller.descripcion = value.trim(),
          ),
          Expanded(child: SizedBox()),
          MaterialButton(
              color: miTema().primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Text(
                  (isCategoria) ? 'Grabar Categoria' : 'Grabar SubCategoria'),
              onPressed: () async {
                controller.agregarCategoria(isCategoria);
                Get.back();
                //}
              }),
        ],
      ),
    );
  }
}
