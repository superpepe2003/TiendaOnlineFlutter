import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/menu_model.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';
import 'package:tienda_online_flutter/app/global_widgets/circulo.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/theme/temas.controller.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class MenuPrincipal extends StatelessWidget {
  final menu = Get.find<UserService>().menu;
  @override
  Widget build(BuildContext context) {
    List<MenuModel> menu = Get.find<UserService>().menu;
    return Drawer(
        elevation: 0,
        child: Column(
          children: [
            _Header(),
            Expanded(
              child: ListView.builder(
                  itemCount: menu.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (_, item) {
                    return (menu[item].icon == '0')
                        ? Divider()
                        : ListTile(
                            leading: Icon(
                              IconData(int.parse(menu[item].icon),
                                  fontFamily: 'MaterialIcons'),
                              color: Theme.of(context).hintColor,
                            ),
                            title: Text(
                              '${menu[item].name}',
                              style: Theme.of(context).textTheme.caption,
                            ),
                            onTap: () {
                              //Navigator.pushNamed( context, '${menu[item].redirectTo}');
                              Get.offAllNamed('${menu[item].redirectTo}');
                            },
                          );
                  }),
            ),
            SafeArea(
                bottom: true,
                top: false,
                left: false,
                right: false,
                child: GetX<TemasController>(
                  init: Get.find<TemasController>(),
                  builder: (_) {
                    return ListTile(
                      leading: Icon(Icons.add_to_home_screen,
                          color: Theme.of(context).hintColor),
                      title: Text('Modo Oscuro',
                          style: Theme.of(context).textTheme.caption),
                      trailing: Switch.adaptive(
                        //value: appTheme.customTheme,
                        value: _.temaOscuro,
                        activeColor: Theme.of(context).hintColor,
                        onChanged: (value) {
                          Get.changeThemeMode(Get.isDarkMode
                              ? ThemeMode.light
                              : ThemeMode.dark);

                          _.temaOscuro = !Get.isDarkMode;
                        },
                      ),
                    );
                  },
                )),
          ],
        ));
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserService>();
    final Responsive responsive = Responsive(context);
    return Stack(
      children: [
        Positioned(
          top: responsive.wp(-25),
          left: responsive.wp(-20),
          child: Circulo(colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor,
            Theme.of(context).highlightColor,
          ], size: responsive.wp(60)),
        ),
        Positioned(
          top: responsive.wp(-30),
          right: responsive.wp(-30),
          child: Circulo(
            size: responsive.wp(80),
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).hintColor,
              Theme.of(context).hintColor,
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: -20,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: FlatButton(
              onPressed: () {
                controller.singOut();
              },
              child: Icon(
                Icons.logout,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: 300,
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${controller.user.nombre}',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  )),
              Obx(() => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text('${controller.user.email}',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                  )),
              Center(
                //margin: EdgeInsets.only(top: 10),
                child: Hero(
                  tag: 'miPerfil',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              blurRadius: 15,
                              offset: Offset(0, 1))
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: GestureDetector(
                        child: Obx(() => FadeInImage(
                              width: 120,
                              height: 120,
                              placeholder: AssetImage('assets/giphy.gif'),
                              image: (controller.user.img == null)
                                  ? AssetImage('assets/no-image.png')
                                  : NetworkImage(controller.user.img),
                              fit: BoxFit.cover,
                            )),
                        onTap: () {
                          //Navigator.pushNamed(context, 'perfil');
                          Get.toNamed(AppRoutes.PERFIL);
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
