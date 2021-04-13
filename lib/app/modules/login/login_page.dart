import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/circulo.dart';
import 'package:tienda_online_flutter/app/global_widgets/avatar_inicial.dart';
import 'package:tienda_online_flutter/app/modules/login/local_widgets/form_login.dart';
import 'package:tienda_online_flutter/app/modules/login/local_widgets/header_login.dart';
import 'package:tienda_online_flutter/app/modules/login/login_controller.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: new LoginController(),
      builder: (_) => Scaffold(
        body: _Login(),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        HeaderLogin(),
        Positioned(
            top: responsive.wp(-30),
            left: responsive.wp(-10),
            child: Circulo(
              size: responsive.wp(60),
              colors: [Color(0xffCC970A), Color(0xffF7C44E)],
            )),
        Positioned(
            top: responsive.wp(-30),
            right: responsive.wp(-10),
            child: Circulo(
              size: responsive.wp(80),
              colors: [Color(0xffFF8E73), Color(0xffFC7758), Color(0xffD62900)],
            )),
        Positioned(
          top: responsive.hp(15),
          child: AvatarInicial(
            img: 'assets/shopping.png',
            size: responsive.wp(20),
          ),
        ),
        FormLogin(),
        Center(
            child: Container(
                width: responsive.wp(50),
                margin: EdgeInsets.only(top: responsive.hp(40)),
                child: _crearBoton())),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: responsive.hp(60)),
            child: GestureDetector(
              onTap: () {
                Get.offAllNamed(AppRoutes.REGISTER);
              },
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 20, 10, 30),
                  child: Text('No tengo cuenta registrarme')),
            ),
          ),
        )
      ],
    );
  }
}

class _crearBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 15,
              color: Colors.black26,
            ),
          ]),
          width: double.infinity,
          child: Obx(() {
            if (_.isLoading) {
              return LinearProgressIndicator();
            }
            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                elevation: 0.0,
                onPrimary: Colors.white,
                primary: miTema().primaryColor,
              ),
              onPressed: _.loginFunc
              //Navigator.pushReplacementNamed(context, 'home');
              ,
              icon: FaIcon(FontAwesomeIcons.registered),
              label: Text(' Ingresar '),
            );
          }));
    });
  }
}
