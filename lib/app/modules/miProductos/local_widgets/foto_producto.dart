import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tienda_online_flutter/app/modules/miProductos/miproductos_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class FotoProducto extends GetView<MiProductosController> {
  final int index;

  FotoProducto(this.index);

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(_resp.wp(4)),
              width: _resp.wp(40),
              height: _resp.wp(50),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(_resp.wp(4)),
                child: Obx(() => (controller.cargandoFoto &&
                        (controller.index == index || controller.index == -1))
                    ? Image(
                        image: AssetImage('assets/giphy.gif'),
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: (controller.productos[index].img != null)
                            ? NetworkImage(controller.productos[index].img)
                            : AssetImage('assets/no-image-tienda.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              bottom: _resp.wp(4),
              left: _resp.wp(4),
              child: Container(
                width: _resp.wp(32),
                height: _resp.wp(8),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(190),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(_resp.wp(4)),
                      bottomLeft: Radius.circular(_resp.wp(4))),
                ),
              ),
            ),
            Positioned(
              bottom: _resp.wp(5),
              right: _resp.wp(14.5),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  iconSize: _resp.wp(8),
                  onPressed: (controller.cargandoFoto)
                      ? null
                      : () async {
                          await _procesarImagen(ImageSource.gallery);
                          controller.grabarFoto(index);
                        },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  _procesarImagen(ImageSource origen) async {
    controller.fileImagen = await ImagePicker.pickImage(source: origen);
  }
}
