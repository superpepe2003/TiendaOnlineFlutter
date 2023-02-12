import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/categorias/categorias_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class ListadoCategoriaPadres extends GetView<CategoriasController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Container(
      height: _resp.hp(70),
      width: _resp.wp(90),
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
              color: Theme.of(context).primaryColor,
              child: Text(
                'Categorias',
                style: TextStyle(
                    fontSize: 18, color: Theme.of(context).accentColor),
              )),
          SizedBox(
            height: _resp.wp(5),
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.categoriasPadres.length,
              itemBuilder: (context, index) {
                return TextButton(
                    onPressed: () {
                      controller.currentPadre =
                          controller.categoriasPadres[index].id;
                      Get.back();
                    },
                    child: Text(
                      '${controller.categoriasPadres[index].nombre}',
                      style: TextStyle(
                        color: Theme.of(context).hintColor,
                        fontSize: 18,
                      ),
                    ));
              },
              separatorBuilder: (BuildContext context, int index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
