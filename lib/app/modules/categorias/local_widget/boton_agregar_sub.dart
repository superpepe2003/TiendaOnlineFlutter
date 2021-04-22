import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tienda_online_flutter/app/theme/miTema_light.dart';
import 'package:tienda_online_flutter/app/utils/responsive.dart';

import 'agregar_subcategoria.dart';

class BotonAgregarSubCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive _responsive = Responsive(context);
    return Container(
      width: _responsive.wp(60),
      height: _responsive.wp(10),
      decoration: BoxDecoration(
        //color: miTema().primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: miTema().primaryColor),
      ),
      child: MaterialButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              FontAwesomeIcons.plus,
              color: miTema().primaryColor,
            ),
            SizedBox(
              width: _responsive.wp(5),
            ),
            Text(
              'Subcategoría',
              style: TextStyle(fontSize: 18, color: miTema().primaryColor),
            ),
          ],
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      contentPadding: EdgeInsets.all(0.0),
                      content: AgregarSubCategoria()),
                );
              });
        },
      ),
    );
  }
}
