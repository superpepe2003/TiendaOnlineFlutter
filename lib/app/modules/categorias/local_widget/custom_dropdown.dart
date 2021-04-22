import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/categorias/categorias_controller.dart';
import 'package:tienda_online_flutter/app/modules/categorias/local_widget/listado_cate_padres.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class CustomDropDown extends StatelessWidget {
  final CategoriasController controller;

  const CustomDropDown({this.controller});
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    contentPadding: EdgeInsets.all(0.0),
                    content: ListadoCategoriaPadres()),
              );
            });
      },
      child: Container(
        height: _responsive.wp(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(() => Text(
                  '${controller.categoriaPadre(controller.currentPadre).nombre}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
            Spacer(),
            Icon(
              Icons.arrow_drop_down_outlined,
              color: Colors.white,
              size: 28,
            )
          ],
        ),
      ),
    );
  }
}
