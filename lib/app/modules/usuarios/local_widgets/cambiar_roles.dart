import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/modules/usuarios/usuarios_controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class CambiarRoles extends GetView<UsuariosController> {
  final user;

  CambiarRoles({this.user});

  final Roles = ['ADMIN', 'USUARIO', 'OPERADOR'];

  @override
  Widget build(BuildContext context) {
    Responsive _resp = Responsive(context);
    return Container(
      padding: EdgeInsets.all(_resp.wp(6)),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: _resp.wp(80),
      height: _resp.hp(20),
      child: Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                user.role = Roles[index];
                controller.updateUsuario(user);
                Get.back();
              },
              child: Container(
                child: Text(
                  '${Roles[index]}',
                  style: Theme.of(context).textTheme.headline2,
                ),
                color: (Roles[index] == user.role)
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).canvasColor,
              ),
            );
          },
        ),
      ),
    );
  }
}
