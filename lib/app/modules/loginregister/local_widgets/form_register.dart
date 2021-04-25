import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/register_controller.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';

class FormRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(240),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(Get.width * 0.1),
                topLeft: Radius.circular(Get.width * 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black38,
                ),
              ]),
          child: Column(children: [
            _crearEmail(),
            _crearPassword(),
            _crearNombre(),
            Expanded(child: Container()),
            _crearBoton(),
            GestureDetector(
              onTap: () {
                Get.find<LoginregisterController>().index = 1;
              },
              child: Container(
                width: double.infinity,
                height: Get.height * 0.06,
                decoration: BoxDecoration(
                    color: miTema().primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(Get.width * 0.1),
                    )),
                child: Center(
                  child: Text(
                    'Registro',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}

class _crearEmail extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: GetX<RegisterController>(
          init: RegisterController(),
          builder: (_) => TextFormField(
                controller: _.controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  errorText: _.errorEmail,
                  icon: Icon(Icons.email),
                ),
                onChanged: _.emailChanged,
                onFieldSubmitted: (_) => context.nextEditableTextFocus(),
              )),
    );
  }
}

class _crearPassword extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: GetX<RegisterController>(
          init: RegisterController(),
          builder: (_) => TextFormField(
                controller: _.controllerPassword,
                obscureText: _.mostrarPassword,
                decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    errorText: _.errorPassword,
                    icon: Icon(Icons.security),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      onPressed: () {
                        _.mostrarPassword = !_.mostrarPassword;
                      },
                    )),
                onChanged: _.passwordChanged,
                onFieldSubmitted: (_) => context.nextEditableTextFocus(),
              )),
    );
  }
}

class _crearNombre extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        child: GetX<RegisterController>(
            init: RegisterController(),
            builder: (_) => TextFormField(
                  controller: _.controllerNombre,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    labelText: 'Nombre',
                    errorText: _.errorNombre,
                    icon: Icon(Icons.supervised_user_circle),
                  ),
                  onChanged: _.nombreChanged,
                  onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                )));
  }
}

class _crearBoton extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
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
      child: GetX<RegisterController>(
          init: RegisterController(),
          builder: (_) {
            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0))),
                elevation: 0.0,
                onPrimary: miTema().primaryColor,
                primary: Colors.white,
              ),
              onPressed: _.submitFunc,
              icon: FaIcon(FontAwesomeIcons.registered),
              label: Text(' Registrarme '),
            );
          }),
    );
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild.context.widget is! EditableText);
  }
}
