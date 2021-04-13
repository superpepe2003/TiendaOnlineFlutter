

import 'package:flutter/material.dart';

class AvatarInicial extends StatelessWidget {

  final String img;
  final double size;

  const AvatarInicial({Key key, this.img, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular( this.size * 0.15 ),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0,10),
            blurRadius: 20
          )
        ]
      ),
      child: Center(
        child: Image.asset( img, fit: BoxFit.cover )
        
        // CircleAvatar(
        //   backgroundImage: AssetImage( img ),
        //   radius: this.size,
        // ),
      )
    );
  }
}