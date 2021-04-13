import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:tienda_online_flutter/app/modules/home/home_pages.dart';

class CardSwiper extends StatelessWidget {

  final List<TipoBanner> banner;

  CardSwiper({ @required this.banner }); 

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      
      child: Swiper(
        autoplay: true,
        duration: 200,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context,int index){

          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: GestureDetector(
              child: FadeInImage(
                image: AssetImage( banner[index].url ),
                placeholder: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              ),
              onTap: () => {},
            )
          );          
                  
        },
        itemCount: banner.length,
        //pagination: new SwiperPagination(),
        //control: new SwiperControl(),
      ),
    );


  }
}