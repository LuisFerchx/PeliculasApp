import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

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
            child: FadeInImage(
              placeholder: NetworkImage('http://www.downgraf.com/wp-content/uploads/2014/09/01-progress.gif'), 
              image: NetworkImage( peliculas[index].getPosterImg() ),
              fit: BoxFit.cover, //adapta la imagen a todo el ancho que tiene
              
            )
          );
        },
        itemCount: peliculas.length,
        itemWidth: _screenSize.width * 0.55,
        itemHeight: _screenSize.height * 0.5,
        layout: SwiperLayout.STACK,
      ),
    );
  }

  

}
