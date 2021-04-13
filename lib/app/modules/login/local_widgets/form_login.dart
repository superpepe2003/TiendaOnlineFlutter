import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../login_controller.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    return Center(
      child: Container(
          padding: EdgeInsets.only(bottom: 50),
          width: responsive.wp(80),
          height: responsive.hp(40),
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(220),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(responsive.wp(20))),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black38,
                ),
              ]),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                color: miTema().primaryColor,
                width: double.infinity,
                height: responsive.wp(15),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              _crearEmail(),
              _crearPassword(),
            ]),
          )),
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
