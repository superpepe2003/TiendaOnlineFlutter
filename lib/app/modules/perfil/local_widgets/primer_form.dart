import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import '../perfil_controller.dart';

class FormPrimero extends GetView<PerfilController> {
  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha(200)),
        color: Colors.grey.withAlpha(20),
      ),
      child: Column(
        children: [
          TextFormField(
            initialValue: controller.nombre,
            decoration: InputDecoration(
                hintText: 'Nombre',
                labelText: 'Nombre Completo',
                icon: FaIcon(FontAwesomeIcons.user)),
            onChanged: (value) => controller.nombre = value,
          ),
          SizedBox(height: 10),
          TextFormField(
            initialValue: controller.telefono.toString(),
            decoration: InputDecoration(
                hintText: 'Telefono',
                labelText: 'Telefono',
                icon: FaIcon(FontAwesomeIcons.phone),
                border: InputBorder.none),
            onChanged: (value) => controller.telefono = value,
          ),
        ],
      ),
    );
  }
}
