import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';

import '../register_controller.dart';

class FormRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
          width: size.width * 0.9,
          height: size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white.withAlpha(220),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black38,
                ),
              ]),
          child: Column(children: [
            Container(
              color: miTema().primaryColor,
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text(
                  'Registro',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            _crearEmail(),
            _crearPassword(),
            _crearNombre(),
          ])),
    );
  }
}

class _crearEmail extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Obx(() => TextFormField(
            controller: controller.controllerEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'Email',
              labelText: 'Email',
              errorText: controller.errorEmail,
              icon: Icon(Icons.email),
            ),
            onChanged: controller.emailChanged,
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
      child: Obx(() => TextFormField(
            controller: controller.controllerPassword,
            obscureText: controller.mostrarPassword,
            decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                errorText: controller.errorPassword,
                icon: Icon(Icons.security),
                suffixIcon: IconButton(
                  icon: Icon(Icons.remove_red_eye_sharp),
                  onPressed: () {
                    controller.mostrarPassword = !controller.mostrarPassword;
                  },
                )),
            onChanged: controller.passwordChanged,
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
        child: Obx(() => TextFormField(
              controller: controller.controllerNombre,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Nombre',
                labelText: 'Nombre',
                errorText: controller.errorNombre,
                icon: Icon(Icons.supervised_user_circle),
              ),
              onChanged: controller.nombreChanged,
              onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
            )));
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild.context.widget is! EditableText);
  }
}
