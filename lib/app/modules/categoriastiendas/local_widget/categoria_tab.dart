import 'package:flutter/material.dart';

import '../../../utils/responsive.dart';
import 'lista_cat_padres.dart';
import 'lista_subcat.dart';

class CategoriaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive _resp = Responsive(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          SizedBox(
            height: _resp.wp(15),
          ),
          Container(
            margin: EdgeInsets.only(top: _resp.wp(30)),
            child: SafeArea(child: ListaCatHijas()),
          ),
          SizedBox(
            height: _resp.wp(4),
          ),
          ListaCatPadres(),
        ],
      ),
    );
  }
}
