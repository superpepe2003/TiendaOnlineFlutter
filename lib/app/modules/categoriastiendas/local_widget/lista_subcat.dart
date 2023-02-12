import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'subcategoria.dart';

class ListaCatHijas extends GetView<CategoriastiendasController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return GetBuilder<CategoriastiendasController>(
        builder: (_) => Obx(() => Container(
              child: Container(
                margin: EdgeInsets.only(top: 0),
                child: GridView.builder(
                    //scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    controller: controller.scrollController,
                    physics: BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,

                      // controller.calcular(controller.categoriasHijas(controller.currentPadre)[index],
                      //     index)
                    ),
                    itemCount: controller
                        .categoriasHijas(controller.currentPadre)
                        .length,
                    itemBuilder: (context, index) {
                      //print(controller.scrollController.offset);
                      controller.calcular(
                          controller.categoriasHijas(controller.currentPadre),
                          index);
                      return Opacity(
                        opacity: controller.percent,
                        child: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..scale(controller.percent, 1.0),
                            child: SubCategoria(index: index)),
                      );
                    }),
              ),
            )));
  }
}
// class ListaCatHijas extends GetView<CategoriastiendasController> {
//   @override
//   Widget build(BuildContext context) {
//     Responsive _resp = Responsive(context);
//     return CustomScrollView(
//       controller: controller.scrollController,
//       slivers: [
//         SliverGrid(
//           delegate: SliverChildBuilderDelegate(
//             (context, index) {
//               controller.calcular(
//                   controller.categoriasHijas(controller.currentPadre), index);
//               return Obx(() => Opacity(
//                     opacity: controller.percent,
//                     child: Transform(
//                         alignment: Alignment.center,
//                         transform: Matrix4.identity()
//                           ..scale(controller.percent, 1.0),
//                         child: SubCategoria(index: index)),
//                   ));
//             },
//             childCount:
//                 controller.categoriasHijas(controller.currentPadre).length,
//           ),
//           gridDelegate:
//               SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         )
//       ],
//     );
//   }
// }
