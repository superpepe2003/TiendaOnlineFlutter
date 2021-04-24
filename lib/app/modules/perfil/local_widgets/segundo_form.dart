import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:tienda_online_flutter/app/modules/perfil/perfil_controller.dart';

class SegundoForm extends GetView<PerfilController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withAlpha(200)),
        color: Colors.grey.withAlpha(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.calendar,
                color: Colors.black45,
              ),
              FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context, showTitleActions: true,
                      onConfirm: (date) {
                    controller.fechaNac = date;
                  }, currentTime: DateTime.now(), locale: LocaleType.es);
                },
                child: Obx(
                  () => (controller.fechaNac == null)
                      ? Text(
                          'Seleccione una fecha de cumpleaños',
                          style: TextStyle(color: Colors.black54),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text(
                                'Fecha de Nacimiento',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.black54),
                              ),
                              Text(
                                //'${controller.fechaNac.day}/${controller.fechaNac.month}/${controller.fechaNac.year} ',
                                '${DateFormat('dd/MM/yyyy').format(controller.fechaNac)}',
                              ),
                            ]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
