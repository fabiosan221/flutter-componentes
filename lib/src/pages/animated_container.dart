import 'package:flutter/material.dart';
//Paquete de dart que incluye a la funcion random
import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  //Propiedades de modificación del contenedor
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        //Contenedor al que se le van a aplicar las propiedades especificadas
        child: AnimatedContainer(
          //El parametro duration indica el tiempo que debe pasar para cambiar
          //el widget de un estado a otro y de esa manera reflejar el cambio
          //de las propiedades establecidas
          duration: Duration(milliseconds: 500),
          //Curves son animaciones predefinidas en flutter con varias opciones
          //de efectos https://api.flutter.dev/flutter/animation/Curves-class.html
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _height,
          //Para aplicar color y borde, se hace sobre la propiedad decoration
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarForma,
      ),
    );
  }

  //Método para cambiar las propiedades definidas al hacer click en el botón de
  //play
  void _cambiarForma() {
    //Para modificar las propiedades de manera aleatoria, se debe utilizar una
    //funcion random, incluida en los paquetes de dart, que permita esa
    //aleatoriedad en las propiedades establecidas
    //
    final random = Random();

    //La funcion SetState permite el redibujado del widget. Esta va a ser
    //la funcion basica
    setState(() {
      //Ancho aleatorio
      _width = random.nextInt(300).toDouble();
      //Alto aleatorio
      _height = random.nextInt(300).toDouble();
      //Color aleatorio
      _color = Color.fromRGBO(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      //Borde aleatorio
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
