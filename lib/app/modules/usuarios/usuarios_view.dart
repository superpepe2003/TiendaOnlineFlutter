import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/cargando.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import './usuarios_controller.dart';
import 'local_widgets/listado_usuarios.dart';

class UsuariosView extends GetView<UsuariosController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Scaffold(
      // appBar: AppBar(
      //   brightness: Theme.of(context).appBarTheme.brightness,
      //   centerTitle: true,
      //   title: Text(
      //     'Tiendas MP',
      //     style: TextStyle(
      //         color: Theme.of(context).appBarTheme.foregroundColor,
      //         fontFamily: 'Samantha',
      //         fontSize: 40),
      //   ),
      //   backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      //   iconTheme:
      //       IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
      // ),
      drawer: MenuPrincipal(),
      body: Obx(() => (controller.isCargando)
          ? Cargando()
          : Center(
              child: Container(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 300,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.only(top: _resp.wp(8)),
                      centerTitle: true,
                      collapseMode: CollapseMode.parallax,
                      title: Text(
                        'Usuarios',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      background: Image.network(
                        'https://i.picsum.photos/id/329/200/300.jpg?hmac=_yLyj0EqdpQ-cX84OlMxz3YzOjjd7liq6b25ldkVSpA',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  ListadoUsuarios()
                  // Container(
                  //   height: Get.height * 0.2,
                  // ),
                  // Expanded(
                  //   child: ListadoUsuarios(),
                  // ),
                ],
              ),
            ))),
    );
  }
}
