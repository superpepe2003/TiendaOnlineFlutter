import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../mitienda_controller.dart';

class FotoTienda extends GetView<MiTiendaController> {
  @override
  Widget build(BuildContext context) {
    Responsive _responsive = Responsive(context);
    return Row(
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(_responsive.wp(4)),
              width: _responsive.wp(40),
              height: _responsive.hp(30),
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(_responsive.wp(4)),
                child: Obx(() => (controller.cargandoFoto)
                    ? Image(
                        image: AssetImage('assets/giphy.gif'),
                        fit: BoxFit.cover,
                      )
                    : Image(
                        image: (controller.miTienda.img != null)
                            ? NetworkImage(controller.miTienda.img)
                            : AssetImage('assets/no-image-tienda.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            Positioned(
              bottom: _responsive.wp(4),
              left: _responsive.wp(4),
              child: Container(
                width: _responsive.wp(32),
                height: _responsive.wp(11),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(190),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(_responsive.wp(4)),
                      bottomLeft: Radius.circular(_responsive.wp(4))),
                ),
              ),
            ),
            Positioned(
              bottom: _responsive.wp(7.5),
              right: _responsive.wp(12.5),
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorLight,
                    shape: BoxShape.circle),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  iconSize: _responsive.wp(10),
                  onPressed: () async {
                    await _procesarImagen(ImageSource.gallery);
                    controller.grabarFoto();
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // width: _responsive.wp(50),
              child: MaterialButton(
                  child: Padding(
                    padding: EdgeInsets.all(_responsive.wp(2)),
                    child: Icon(Icons.gps_fixed,
                        size: _responsive.wp(10), color: Colors.white),
                  ),
                  color: Theme.of(context).primaryColor,
                  shape: CircleBorder(),
                  onPressed: () {}),
            ),
            SizedBox(
              height: _responsive.hp(5),
            ),
            Container(
              // width: _responsive.wp(50),
              child: MaterialButton(
                  child: Padding(
                    padding: EdgeInsets.all(_responsive.wp(2)),
                    child: Icon(Icons.access_time,
                        size: _responsive.wp(10), color: Colors.white),
                  ),
                  shape: CircleBorder(),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }

  _procesarImagen(ImageSource origen) async {
    controller.fileImagen = await ImagePicker.pickImage(source: origen);
  }
}
