import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/categoriastiendas/categoriastiendas_controller.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class FavoritoTab extends GetView<CategoriastiendasController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinterestGrid(),
    );
  }
}

class PinterestGrid extends GetView<CategoriastiendasController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.cargando)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: controller.favoritos.length,
            itemBuilder: (BuildContext context, int index) =>
                _PinterestItem(index, controller),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 3 : 2.5),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ));
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  final CategoriastiendasController controller;

  _PinterestItem(this.index, this.controller);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.TIENDA, arguments: controller.favoritos[index]);
      },
      child: Obx(() => Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            child: Column(children: [
              Expanded(
                child: Container(
                  width: _responsive.wp(40),
                  height: _responsive.hp(40),
                  child: ClipRRect(
                      clipBehavior: Clip.antiAlias,
                      borderRadius: BorderRadius.circular(20.0),
                      child: (controller.favoritos[index].img != null)
                          ? FadeInImage(
                              placeholder: AssetImage('assets/giphy.gif'),
                              image: NetworkImage(
                                  '${controller.favoritos[index].img}'),
                              fit: BoxFit.cover)
                          : Image(
                              image: AssetImage('assets/no-image-tienda.jpg'),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              GetBuilder<CategoriastiendasController>(
                  builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              '${controller.favoritos[index].nombre}',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.overline,
                            ),
                          ),
                          IconButton(
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                controller.eliminarFavoritos(
                                    controller.favoritos[index].id);
                              })
                        ],
                      )),
            ]),
          )),
    );
  }
}
