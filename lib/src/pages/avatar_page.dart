import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          //El CircleAvatar es un widget que permite colocar un avatar
          //como es comunmente utilizado en las listas de contacto
          //Avatar con imagen
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://media.istockphoto.com/id/543042022/es/vector/hombre-de-negocios-iconos-de-perfil-hombre-avatar-imagen-dise%C3%B1o-plano-vector-de-icono.jpg?s=170667a&w=0&k=20&c=Y41Qex1UKyuPPeYo76V5RZhwHZqzTpScrwiIVWIJ8Gw=')),
          ),
          //Se agrega un contenedor para poder separar el avatar del borde
          Container(
            //Se agrega un margen derecho
            margin: EdgeInsets.only(right: 10.0),
            //Avatar con texto
            child: CircleAvatar(
              child: Text('FS'),
              backgroundColor: Colors.amber,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://media.istockphoto.com/id/543042022/es/vector/hombre-de-negocios-iconos-de-perfil-hombre-avatar-imagen-dise%C3%B1o-plano-vector-de-icono.jpg?s=170667a&w=0&k=20&c=Y41Qex1UKyuPPeYo76V5RZhwHZqzTpScrwiIVWIJ8Gw='),
          placeholder: AssetImage('assets/loading-img.gif'),
        ),
      ),
    );
  }
}
