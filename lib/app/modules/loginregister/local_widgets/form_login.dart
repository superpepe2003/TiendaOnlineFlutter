import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/login_controller.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Center(
      child: Container(
          // padding: EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(240),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Get.width * 0.1),
                topLeft: Radius.circular(Get.width * 0.1),
              ),
              //: BorderRadius.all(Radius.circular(Get.width * 0.1)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black38,
                ),
              ]),
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.find<LoginregisterController>().index = 0;
              },
              child: Container(
                width: double.infinity,
                height: Get.height * 0.06,
                decoration: BoxDecoration(
                  color: miTema().primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width * 0.1),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
            _crearEmail(),
            _crearPassword(),
            Expanded(child: Container()),
            _crearBoton()
          ])),
    );
  }
}

class _crearEmail extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: GetX<LoginController>(
            init: LoginController(),
            builder: (_) {
              return TextFormField(
                initialValue: 'a@a.com',
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: 'Email',
                    labelText: 'Email',
                    errorText: _.errorEmail,
                    icon: Icon(Icons.email)),
                onChanged: _.emailChanged,
              );
            }));
  }
}

class _crearPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: Obx(() {
              return TextFormField(
                initialValue: '123123',
                obscureText: _.mostrarPassword,
                decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'password',
                    errorText: _.errorPassword,
                    icon: Icon(Icons.security),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed: () {
                        _.mostrarPassword = !_.mostrarPassword;
                      },
                    )),
                onChanged: _.passwordChanged,
              );
            }));
      },
    );
  }
}

class _crearBoton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return Container(
          width: Get.width * 0.6,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              spreadRadius: 1,
              blurRadius: 15,
              color: Colors.black26,
            ),
          ]),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0))),
              elevation: 0.0,
              onPrimary: miTema().primaryColor,
              primary: Colors.white,
            ),
            onPressed: _.loginFunc,
            icon: FaIcon(FontAwesomeIcons.registered),
            label: Text(' Ingresar '),
          ));
    });
  }
}
