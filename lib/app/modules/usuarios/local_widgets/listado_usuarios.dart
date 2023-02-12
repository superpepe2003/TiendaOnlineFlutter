import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../usuarios_controller.dart';
import 'cambiar_roles.dart';

class ListadoUsuarios extends GetView<UsuariosController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            var user = controller.usuarios[index];
            return InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            contentPadding: EdgeInsets.all(0.0),
                            content: CambiarRoles(user: user)),
                      );
                    });
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 10,
                child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage: (user.img != null)
                              ? NetworkImage('${user.img}')
                              : AssetImage('assets/no-image.png'),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.width * 0.3,
                            ),
                            Text('${user.nombre}'),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Text(
                              '${user.email}',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Verdana',
                                  fontStyle: FontStyle.italic),
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Container(
                              padding: EdgeInsets.all(2),
                              color: Theme.of(context).primaryColor,
                              child: Text(
                                '${user.role ?? "Sin Role"}',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }, childCount: controller.usuarios.length),
        ));
  }
}
