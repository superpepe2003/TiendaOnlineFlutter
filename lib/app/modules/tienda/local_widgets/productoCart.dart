import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_cart_model.dart';
import 'package:tienda_online_flutter/app/modules/tienda/tienda_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class ProductoCart extends GetView<TiendaController> {
  final ProductoCartModel item;
  final int index;
  const ProductoCart({Key key, this.item, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    TiendaController controller = Get.find<TiendaController>();
    return Row(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).primaryColorDark,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 6.0,
                          spreadRadius: 0.5)
                    ]),
              ),
              ClipRRect(
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      begin: Alignment.center,
                      end: Alignment.bottomCenter),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.nombre}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Center(
                      child: Text('\$${item.precio}',
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: _responsive.wp(40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Theme.of(context).primaryColor,
                          child: IconButton(
                            icon: Icon(Icons.horizontal_rule,
                                color: Theme.of(context).accentColor),
                            onPressed: () {
                              controller.agregarProductosCart(item, i: -1);
                            },
                          ),
                        ),
                        Obx(() => Container(
                              margin: EdgeInsets.all(_responsive.wp(4)),
                              child: Text(
                                '${controller.productosCart[index].cantidad}',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            )),
                        Container(
                          color: Theme.of(context).primaryColor,
                          child: IconButton(
                            icon: Icon(Icons.add,
                                color: Theme.of(context).accentColor),
                            onPressed: () {
                              controller.agregarProductosCart(item);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '\$${(controller.productosCart[index].cantidad * item.precio).toString()}',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
