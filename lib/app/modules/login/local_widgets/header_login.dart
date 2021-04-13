

import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class HeaderLogin extends StatelessWidget{

 
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive( context );
    return Container(
      height: responsive.hp(35),
      width: double.infinity,
      decoration: BoxDecoration(
        color: miTema().primaryColor,
        borderRadius: BorderRadius.only( bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100)),
      ),      
    );
  }
}