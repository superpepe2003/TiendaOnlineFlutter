import 'package:customizable_multiselect_field/customizable_multiselect_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mitienda_controller.dart';

class CategoriasSeleccion extends GetView<MiTiendaController> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: CustomizableMultiselectField(
      customizableMultiselectWidgetOptions:
          CustomizableMultiselectWidgetOptions(
        hintText: Text('Seleccione las categorias',
            style: TextStyle(color: Theme.of(context).accentColor)),

        // decoration: InputDecoration(
        //     labelText: 'Multiselect Sample teste',
        // ),
        chipColor: Theme.of(context).primaryColor,
        chipShape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).primaryColor, width: 1),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      customizableMultiselectDialogOptions:
          CustomizableMultiselectDialogOptions(),
      dataSourceList: [
        for (var cp in controller.categoriasPadres)
          if (controller.categoriasHijas(cp.id).length > 0)
            DataSource<String>(
              dataList: //(controller.categoriasHijas(cp.id).length > 0)
                  controller
                      .categoriasHijas(cp.id)
                      .map((e) => {'value': e.id, 'label': e.nombre})
                      .toList(),
              // : [],
              valueList: controller.categoriasHijasTienda(cp.id),
              options: DataSourceOptions(
                  valueKey: 'value',
                  labelKey: 'label',
                  title: Text(
                    '${controller.categoriaPadre(cp.id).nombre}',
                    style: TextStyle(color: Theme.of(context).accentColor),
                    textAlign: TextAlign.start,
                  )),
            )
      ],
      onChanged: ((List<List<dynamic>> values) {
        controller.categoriasTienda.clear();
        for (var lc in values) {
          for (var id in lc) {
            controller.categoriasTienda.add(controller.categorias
                .firstWhere((element) => element.id == id));
          }
        }
      }),
    ));
  }
}
