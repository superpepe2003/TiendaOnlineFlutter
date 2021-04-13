import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final String imageRoute;

  const IconHeader({
    @required this.icon, 
    @required this.titulo, 
    @required this.subtitulo, 
    @required this.imageRoute,
    });

  

  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground( routeImage: imageRoute),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(
            this.icon,
            size: 250,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox( height: 100, width: double.infinity),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all( Radius.circular(40))
              ),
              child: Text( 'Tienda ${this.titulo}', style: TextStyle( fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold),),
            ),
            
          ]
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final String routeImage;

  const _IconHeaderBackground({
   @required this.routeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage( routeImage ),
            fit: BoxFit.cover
          ), 
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
      )          
    );
  }
}
