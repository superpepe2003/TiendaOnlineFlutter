import 'package:flutter/material.dart';

import '../home_pages.dart';

class MovieHorizontal extends StatelessWidget {
  final List<TipoBanner> banner;

  MovieHorizontal({@required this.banner});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.3);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    // _pageController.addListener( () {

    //   if( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ) {
    //     //siguientePagina();
    //   }

    // });

    return Container(
      height: _screenSize.height * 0.25,
      child: PageView(
        pageSnapping: false,
        controller: _pageController,
        children: _tarjetas(context),
        //itemCount: banner.length,
        //itemBuilder: ( context, i ) => _tarjeta( context, banner[i] ),
      ),
    );
  }

  Widget _tarjeta(BuildContext context, TipoBanner banner) {
    final peliculaTarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.png'),
              image: AssetImage(banner.url),
              fit: BoxFit.cover,
              height: 160.0,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }

  List<Widget> _tarjetas(BuildContext context) {
    return banner.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.png'),
                image: AssetImage(pelicula.url),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      );
    }).toList();
  }
}
