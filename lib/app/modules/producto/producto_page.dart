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
        centerTitle: true,
        title: Text(
          'Producto',
          style: TextStyle(
              color: Colors.black, fontFamily: 'Samantha', fontSize: 40),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: MenuPrincipal(),
      body: Container(
              padding: EdgeInsets.only(top: 75),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(15),
                    child: Hero(
                      tag: produ.id,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                        child: 
                          ( produ.img != null )
                          ? FadeInImage(
                              image: NetworkImage( produ.img ),
                              placeholder: AssetImage('assets/giphy.gif'), fit: BoxFit.cover
                            )
                          : Image.asset('assets/no-image-tienda.jpg', fit: BoxFit.cover)
                  ),
                ),
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                SizedBox(height: 20),
                Text(
                  '${ produ.nombre }',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blueGrey,
                    fontFamily: 'Samantha',
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10),
                Text('${ produ.subtitulo }',
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
                SizedBox(height: 10),
                Text(
                    '${ produ.precio.toString() }',
                    style: TextStyle(fontSize: 16, color: Colors.blueGrey)),
              ]),
            )
          ],
        ),
      ),    
    );
  }
}
