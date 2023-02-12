import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/modules/tienda/tienda_controller.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class Producto extends GetView<TiendaController> {
  final ProductoModel item;
  final bool destacado;
  const Producto({Key key, this.item, this.destacado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);

    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.PRODUCTO, arguments: item);
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      offset: Offset(2.0, 2.0),
                      blurRadius: 5.0,
                      spreadRadius: 1.0)
                ]),
          ),
          Hero(
            tag: item.id,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: (item.img != null)
                    ? FadeInImage(
                        placeholder: AssetImage('assets/giphy.gif'),
                        image: NetworkImage(item.img),
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        'assets/no-image-tienda.jpg',
                        fit: BoxFit.cover,
                      )),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              gradient: LinearGradient(
                  colors: [Colors.transparent, Color(0xff555555), Colors.black],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter),
            ),
          ),
          (destacado)
              ? Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.nombre}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text('${item.subtitulo}',
                          style: Theme.of(context).textTheme.headline2),
                      Center(
                        child: Text('\$${item.precio}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16)),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${item.nombre}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Center(
                        child: Text('\$${item.precio}',
                            style:
                                TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ],
                  ),
                ),
          Align(
              alignment: Alignment.topRight,
              child: Container(
                width: _responsive.wp(20),
                decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: MaterialButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.add_shopping_cart, color: Colors.white),
                        Obx(() => Text(
                              '${controller.countProductos(item.id)}',
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    ),
                    onPressed: () {
                      controller.agregarProductosCart(item);
                    }),
              ))
        ],
      ),
    );
  }
}
