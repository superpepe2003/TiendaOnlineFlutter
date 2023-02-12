import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/login_controller.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Center(
      child: Container(
          // padding: EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
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
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width * 0.1),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: Theme.of(context).appBarTheme.textTheme.headline1,
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
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                    hintText: 'Email',
                    //hintStyle: Theme.of(context).textTheme.headline3,
                    labelText: 'Email',
                    errorText: _.errorEmail,
                    errorStyle: Theme.of(context).textTheme.headline4,
                    icon: Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    )),
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
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                    hintText: 'password',
                    labelText: 'password',
                    errorText: _.errorPassword,
                    errorStyle: Theme.of(context).textTheme.headline6,
                    icon: Icon(
                      Icons.security,
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.remove_red_eye_sharp,
                        color: Theme.of(context).primaryColor,
                      ),
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
              onPrimary: Colors.white,
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: _.loginFunc,
            icon: FaIcon(
              FontAwesomeIcons.registered,
              color: Theme.of(context).textTheme.button.color,
            ),
            label: Text(
              ' Ingresar ',
              style: Theme.of(context).textTheme.button,
            ),
          ));
    });
  }
}
