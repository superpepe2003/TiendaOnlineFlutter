import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/global_widgets/circulo.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/perfil/perfil_controller.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class PerfilPage extends GetWidget<PerfilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      drawer: MenuPrincipal(),
      body: Stack(
        children: [
          _fondo(),
          Container(
              padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _AvatarImg(controller: controller, user: controller.user),
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
                    SizedBox(height: 20),
                    TextFormField(
                      initialValue: controller.nombre,
                      decoration: InputDecoration(
                          hintText: 'Nombre',
                          labelText: 'Nombre Completo',
                          icon: FaIcon(FontAwesomeIcons.user)),
                      onChanged: ( value ) => controller.nombre = value,
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      initialValue: controller.telefono.toString(),
                      decoration: InputDecoration(
                          hintText: 'Telefono',
                          labelText: 'Telefono',
                          icon: FaIcon(FontAwesomeIcons.phone)),
                      onChanged: ( value ) => controller.telefono = value,
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        FaIcon(FontAwesomeIcons.calendar),
                        FlatButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true, onConfirm: (date) {
                              controller.fechaNac = date;
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.es);
                          },
                          child: Obx(
                            () => (controller.fechaNac == null)
                                ? Text('Seleccione una fecha de cumpleaños')
                                : Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                        Text(
                                          'Fecha de Nacimiento',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Colors.black54
                                          ),
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
                    SizedBox(height: 30),
                    Expanded( child: Text(''),),
                    Center(
                      child: MaterialButton(
                        color: miTema().primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only( topLeft: Radius.circular(20), bottomRight: Radius.circular(20) )
                        ),
                        child: Text('Grabar Perfil'),
                        onPressed: () {
                          controller.guardarPerfil();
                        }
                      ),
                    )
                  ],
                ),
              ),
        ],
      ),
    );
  }
}

class _AvatarImg extends StatelessWidget {
  const _AvatarImg({
    Key key,
    @required this.controller,
    @required this.user,
  }) : super(key: key);

  final UsuarioModel user;
  final PerfilController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'miPerfil',
        child: GestureDetector(
          onTap: () async {
            await _procesarImagen(ImageSource.gallery);
            controller.grabarFoto();
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.black38, spreadRadius: 5)
              ],
            ),
            child: Obx(() => (controller.isCargando)
                ? CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/giphy.gif'),
                  )
                : CircleAvatar(
                    radius: 100,
                    backgroundImage: (user.img != null)
                        ? NetworkImage(user.img)
                        : (controller.fileImagen == null)
                            ? AssetImage('assets/no-image.png')
                            : Image.file(controller.fileImagen,
                                    fit: BoxFit.cover)
                                .image,
                  )),
          ),
        ),
      ),
    );
  }

  _procesarImagen(ImageSource origen) async {
    controller.fileImagen = await ImagePicker.pickImage(source: origen);
  }
}

class _fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var responsive = Responsive.of(context);
    return Stack(
      children: [
        Positioned(
          top: responsive.wp(-20),
          left: responsive.wp(-10),
          child: Circulo(
            colors: [
              Color(0xffFDD4A4),
              Color(0xffB89369),
            ],
            size: responsive.wp(60),
          ),
        ),
        Positioned(
          top: responsive.wp(-20),
          right: responsive.wp(-20),
          child: Circulo(
            colors: [
              Color(0xffefa6da),
              Color(0xffe96dc4),
              Color(0xffe2178a),
            ],
            size: responsive.wp(80),
          ),
        )
      ],
    );
  }
}
