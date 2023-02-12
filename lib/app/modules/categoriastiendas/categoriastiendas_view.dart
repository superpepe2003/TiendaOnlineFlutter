import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../../utils/responsive.dart';
import 'categoriastiendas_controller.dart';
import 'local_widget/categoria_tab.dart';

class CategoriastiendasView extends GetView<CategoriastiendasController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
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
      body: Obx(
        () => PageStorage(
          child: controller.screens[controller.currentTab],
          bucket: controller.bucket,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        backgroundColor: Theme.of(context).appBarTheme.foregroundColor,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Obx(() => Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    controller.currentScreen = CategoriaTab();
                    controller.currentTab = 0;
                  },
                  child: Column(
                    children: [
                      Icon(Icons.analytics_outlined,
                          color: controller.currentTab == 0
                              ? Theme.of(context).hintColor
                              : Theme.of(context).primaryColorDark),
                      Text('Categorías',
                          style: TextStyle(
                              color: controller.currentTab == 0
                                  ? Theme.of(context).hintColor
                                  : Theme.of(context).primaryColorDark))
                    ],
                  ),
                ),
                SizedBox(
                  width: _resp.wp(10),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    controller.currentScreen = CategoriaTab();
                    controller.currentTab = 1;
                  },
                  child: Column(
                    children: [
                      Icon(Icons.favorite,
                          color: controller.currentTab == 1
                              ? Theme.of(context).hintColor
                              : Theme.of(context).primaryColorDark),
                      Text('Favoritos',
                          style: TextStyle(
                              color: controller.currentTab == 1
                                  ? Theme.of(context).hintColor
                                  : Theme.of(context).primaryColorDark))
                    ],
                  ),
                )
              ],
            ))),
      ),
    );
  }
}
