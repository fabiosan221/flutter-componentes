import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        //Los ListView poseen la propieda padding para manejar los espacios de
        //los bordes con respectos a otros elementos
        padding: EdgeInsets.all(10.0),
        children: [
          _cardTipo1(),
          //Permite colocar una separación entre las distintas tarjetas
          SizedBox(
            height: 30.0,
          ),
          _cardTipo2(),
          SizedBox(
            height: 30.0,
          ),
          _cardTipo3(),
        ],
      ),
    );
  }

  //Tarjeta solo texto
  Widget _cardTipo1() {
    //Se retorna un widget de tipo tarjeta
    return Card(
      //Elevation simula altura mediante efecto de sombras
      elevation: 10.0,
      //Permite redondear las esquinas de un widget que acepta la propiedad shape
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Column(
        children: [
          ListTile(
            //Se establace el icono de la tarjeta
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            //Se establace el titulo
            title: Text('Título de la Tarjeta'),
            //Se establece el cuerpo de la tajeta
            subtitle: Text(
                'Este texto forma parte del cuerpo de la tarjeta. Puede contener texto que describa el comportamiento de la misma'),
          ),
          //Se genera un widget de tipo Row para almacenar 2 botones
          Row(
            //Alineacion de los botones a la derecha
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              //Creacion de un boton
              TextButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  //Tarjeta con imagen
  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: <Widget>[
          //Se utiliza el widget FadeInImage para agregar un placeholder que
          //funcionara como un loader hasta visualizar la imagen original
          //Este placeholder debe contener una imagen que se debe almacenar
          //en el dispositivo
          FadeInImage(
            //Obtenemos la imagen que funcionara como loading
            placeholder: AssetImage('assets/loading-img.gif'),
            image: NetworkImage(
                'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6_3x2.jpg'),
            //Duracion de la animacion de la imagen que aparece en la tarjeta
            fadeInDuration: Duration(milliseconds: 200),
            //Propiedad para fijar alto de la imagen de la tarjeta
            height: 300.0,
            //Propiedad para indicar como la imagen debe ocupar el espacio
            //asignado dentro de la tarjeta
            fit: BoxFit.cover,
          ),
          //Se utiliza el widget Image para contener una imagen desde internet
          // Image(
          //     image: NetworkImage(
          //         'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6_3x2.jpg')
          //         ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Descripción de la imagen de tarjeta'))
        ],
      ),
    );
  }

  //Contenedor con aspecto de Tarjeta
  Widget _cardTipo3() {
    //Se genera una variable final de tipo contenedor que simula una tarjeta
    final card = Container(
      child: Column(
        children: <Widget>[
          FadeInImage(
            placeholder: AssetImage('assets/loading-img.gif'),
            image: NetworkImage(
                'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6_3x2.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
          ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Contenedor con aspecto de Tarjeta'))
        ],
      ),
    );

    //Se retorna un contenedor
    return Container(
      //Se utiliza la propiedad ClipRRect para recortar cualquier contenido que
      //se ubique fuera del contenedor
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
      //Se aplican las propiedades estéticas al contenedor
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          //Color del contenedor
          color: Colors.white,
          //Se genera una lista de tipo boxShadow para mostrar una sombra
          boxShadow: <BoxShadow>[
            BoxShadow(
                //Color negro con un indice de opacidad 26
                color: Colors.black26,
                //Se establece la que tan difuminada se ve una sombra
                blurRadius: 10.0,
                //se establece la extension de la sombra
                spreadRadius: 2.0,
                //Posicion de la sombra en un plano xy con coordenadas
                offset: Offset(2.0, 8.0)),
          ]),
    );
  }
}
