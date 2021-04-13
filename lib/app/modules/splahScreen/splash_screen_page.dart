import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/app/global_widgets/circulo.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';


class SplashScreenPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: Stack(
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
          ),

          Positioned(
            top: responsive.hp(0),
            left: responsive.wp(0),
            child: Container(
              height: responsive.hp(100),
              width: responsive.wp(100),
              child: Image.asset('assets/splashscreen.jpg', fit: BoxFit.cover,)
            ),
          )
        ]
      ),
   );
  }
}