import 'package:flutter/material.dart';
import 'package:peliculas/src/providers/peliculas_provider.dart';
import 'package:peliculas/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Peliculas de Cines'),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        //el safearea respeta la barra del dispositivo
        body: Container(
          child: Column(
            children: <Widget>[
              _swiperTarjetas(),
            ],
          ),
        ));
  }

  Widget _swiperTarjetas() {
    return FutureBuilder(
      future: peliculasProvider.getEstrenos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(
              peliculas: snapshot.data); //retorna unicamente cuando existe data en el snapshot
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
              ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }
      },
    );

    //return CardSwiper(peliculas: [1,2,3,4,5]);
  }
}
