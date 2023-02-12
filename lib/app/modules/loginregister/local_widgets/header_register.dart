import 'package:flutter/material.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

class HeaderRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive(context);

    return Container(
      height: responsive.hp(20),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),
      ),
    );
  }
}
