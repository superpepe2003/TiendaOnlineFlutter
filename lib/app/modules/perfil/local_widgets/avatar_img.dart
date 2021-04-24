import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';

import '../perfil_controller.dart';

class AvatarImg extends StatelessWidget {
  const AvatarImg({
    @required this.controller,
    @required this.user,
  });

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
