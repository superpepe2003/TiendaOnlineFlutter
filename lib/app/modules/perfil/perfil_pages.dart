import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/global_widgets/circulo.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/perfil/local_widgets/fondo.dart';
import 'package:tienda_online_flutter/app/modules/perfil/perfil_controller.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'local_widgets/avatar_img.dart';
import 'local_widgets/primer_form.dart';
import 'local_widgets/segundo_form.dart';

class PerfilPage extends GetWidget<PerfilController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: MenuPrincipal(),
      body: Stack(
        children: [
          Fondo(),
          Positioned(
              child: Column(
            children: [
              SizedBox(
                height: _resp.hp(2),
              ),
              AvatarImg(controller: controller, user: controller.user),
              SizedBox(
                height: _resp.hp(2),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '${controller.user.email}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: _resp.hp(10)),
            ],
          )),
          Container(
            padding: EdgeInsets.only(top: _resp.hp(45)),
            width: double.infinity,
            height: _resp.hp(90),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormPrimero(),
                  SizedBox(
                    height: _resp.hp(5),
                  ),
                  SegundoForm(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Center(
              child: Container(
                height: _resp.hp(5),
                width: _resp.wp(100),
                child: MaterialButton(
                    color: miTema().primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Text('Grabar Perfil'),
                    onPressed: () {
                      controller.guardarPerfil();
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
