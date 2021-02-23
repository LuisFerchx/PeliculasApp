import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic> peliculas;

  CardSwiper(
      {@required //pedido a fuerza
          this.peliculas});

  @override
  Widget build(BuildContext context) {
    //cambiar tamanio dependiendo del telefono
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: new Image.network( 
              "http://pa1.narvii.com/6728/e4c445b78721bfed342234c0d4cf07b548157976_00.gif",
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: peliculas.length,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}
