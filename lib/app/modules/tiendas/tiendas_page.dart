import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/tiendas/tiendas_controller.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class TiendasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).appBarTheme.brightness,
        centerTitle: true,
        title: Text(
          'Tiendas MP',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
      ),
      drawer: MenuPrincipal(),
      body: Center(
        child: PinterestGrid(),
      ),
    );
  }
}

class PinterestGrid extends GetView<TiendasController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.cargando)
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: controller.actualizar,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: controller.tiendas.length,
              itemBuilder: (BuildContext context, int index) =>
                  _PinterestItem(index, controller),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 3 : 2.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ));
  }
}

class _PinterestItem extends StatelessWidget {
  final int index;
  final TiendasController controller;

  _PinterestItem(this.index, this.controller);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.TIENDA, arguments: controller.tiendas[index]);
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
                      child: (controller.tiendas[index].img != null)
                          ? FadeInImage(
                              placeholder: AssetImage('assets/giphy.gif'),
                              image: NetworkImage(
                                  '${controller.tiendas[index].img}'),
                              fit: BoxFit.cover)
                          : Image(
                              image: AssetImage('assets/no-image-tienda.jpg'),
                              fit: BoxFit.cover,
                            )),
                ),
              ),
              GetBuilder<TiendasController>(
                  builder: (_) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                '${controller.tiendas[index].nombre}',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.overline,
                              ),
                            ),
                          ),
                          IconButton(
                              icon: (controller.buscarFavoritos(
                                      controller.tiendas[index].id))
                                  ? Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : Icon(Icons.favorite_border_outlined),
                              onPressed: () {
                                controller.grabarFavoritos(
                                    controller.tiendas[index].id);
                              })
                        ],
                      )),
            ]),
          )),
    );
  }
}
