import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'categoriastiendas_controller.dart';
import 'local_widget/lista_cat_padres.dart';
import 'local_widget/lista_subcat.dart';

class CategoriastiendasView extends GetView<CategoriastiendasController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tiendas MP',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Samantha', fontSize: 40),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MenuPrincipal(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SizedBox(
              height: _resp.wp(15),
            ),
            Container(
              margin: EdgeInsets.only(top: _resp.wp(30)),
              child: SafeArea(child: ListaCatHijas()),
            ),
            SizedBox(
              height: _resp.wp(4),
            ),
            ListaCatPadres(),
          ],
        ),
      ),
    );
  }
}
