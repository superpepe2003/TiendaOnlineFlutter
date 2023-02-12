import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/producto/producto_controller.dart';

class ProductoPage extends GetView<ProductoController> {
  @override
  Widget build(BuildContext context) {
    ProductoModel produ = Get.find<ProductoController>().producto;

    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).appBarTheme.brightness,
        centerTitle: true,
        title: Text(
          'Producto',
          style: TextStyle(
              color: Theme.of(context).appBarTheme.foregroundColor,
              fontFamily: 'Samantha',
              fontSize: 40),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
      ),
      drawer: MenuPrincipal(),
      body: Container(
        padding: EdgeInsets.only(top: 75),
        width: double.infinity,
        color: Theme.of(context).canvasColor,
        child: Column(
          children: [
            Container(
              height: 250,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).canvasColor.withOpacity(0.3),
                        spreadRadius: -5,
                        blurRadius: 15,
                        offset: Offset(10, 10))
                  ]),
              child: Hero(
                tag: produ.id,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    child: (produ.img != null)
                        ? FadeInImage(
                            image: NetworkImage(produ.img),
                            placeholder: AssetImage('assets/giphy.gif'),
                            fit: BoxFit.cover)
                        : Image.asset('assets/no-image-tienda.jpg',
                            fit: BoxFit.cover)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                SizedBox(height: 20),
                Text(
                  '${produ.nombre}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10),
                Text('${produ.subtitulo}',
                    style: Theme.of(context).textTheme.headline2),
                SizedBox(height: 10),
                Text('${produ.precio.toString()}',
                    style: Theme.of(context).textTheme.headline2),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
