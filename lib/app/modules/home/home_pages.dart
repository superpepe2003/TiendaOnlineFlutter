import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/global_widgets/menu_principal.dart';
import 'package:tienda_online_flutter/app/modules/home/local_widget/swiper_principal.dart';
import 'package:tienda_online_flutter/app/theme/temas.controller.dart';

import 'local_widget/swiper_horizontal.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        brightness: Theme.of(context).appBarTheme.brightness,
        title: Text(
          'Tiendas MP',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        iconTheme:
            IconThemeData(color: Theme.of(context).appBarTheme.foregroundColor),
      ),
      drawer: MenuPrincipal(),
      body: PinterestGrid(),
    );
  }
}

class TipoBanner {
  String url;
  int index;

  TipoBanner(this.url, this.index);
}

class PinterestGrid extends StatelessWidget {
  final List<TipoBanner> items = [
    TipoBanner('assets/publicidad/img-1.jpeg', 1),
    TipoBanner('assets/publicidad/img-2.jpeg', 2),
    TipoBanner('assets/publicidad/img-3.jpeg', 3),
    TipoBanner('assets/publicidad/img-4.jpeg', 4),
    TipoBanner('assets/publicidad/img-5.jpeg', 5),
    TipoBanner('assets/publicidad/img-6.jpeg', 6),
    TipoBanner('assets/publicidad/img-7.jpeg', 7),
    TipoBanner('assets/publicidad/img-8.jpeg', 8),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            MovieHorizontal(banner: items),
            CardSwiper(banner: items),
          ],
        ),
      ),
    );
  }
}
