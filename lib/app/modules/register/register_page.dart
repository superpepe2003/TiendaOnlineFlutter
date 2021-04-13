import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tienda_online_flutter/app/global_widgets/avatar_inicial.dart';
import 'package:tienda_online_flutter/app/global_widgets/circulo.dart';
import 'package:tienda_online_flutter/app/modules/register/local_widgets/form_register.dart';
import 'package:tienda_online_flutter/app/modules/register/register_controller.dart';
import 'package:tienda_online_flutter/app/routes/app_routes.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);
    return Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            //HeaderRegister( ),
            Positioned(
              top: responsive.wp(-30),
              left: responsive.wp(-10),
              child: Circulo(
                size: responsive.wp(90),
                colors: [
                  Color(0xffE082F9),
                  Color(0xffCE4BF1),
                  Color(0xffA30FCB),
                ],
              ),
            ),
            Positioned(
              top: responsive.wp(-20),
              right: responsive.wp(-5),
              child: Circulo(
                size: responsive.wp(60),
                colors: [
                  Color(0xffF982D8),
                  Color(0xffE813AE),
                ],
              ),
            ),
            Positioned(
              top: responsive.hp(10),
              child: AvatarInicial(img: 'assets/shopping2.png', size: responsive.wp(20))
            ),
            FormRegister(),
            Center(
              child: Container(
                width: responsive.wp(60),
                margin: EdgeInsets.only( top: responsive.hp(50)),
                child: _crearBoton()
              )
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only( top: responsive.hp(70)),
                child: GestureDetector(
                  onTap: () {
                    Get.offAllNamed(AppRoutes.LOGIN);
                  },
                  child: Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 30),
                      child: Text('Ya tengo cuenta Loguearme')),
                )
              )
            )
          ],
    ));
  }
}




class _crearBoton extends GetWidget<RegisterController> {
  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Obx(() {
        if (controller.isLoading) {
          return LinearProgressIndicator();
        }
        return ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0))),
            elevation: 0.0,
            onPrimary: Colors.white,
            primary: miTema().primaryColor,
          ),
          onPressed: controller.submitFunc,
          icon: FaIcon(FontAwesomeIcons.registered),
          label: Text(' Registrarme '),
        );
      }),
    );
  }
}
