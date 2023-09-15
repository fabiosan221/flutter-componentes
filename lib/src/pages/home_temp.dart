import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //Se genera una lista con opciones para un ListTile
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
          //La propiedad children va a permitir agregar varios widget como rows
          //tarjetas, columns, etc. Permitirá realizar la accion de scroll entre los
          //objetos creados
          //Recibimos una lista de items como parámetro
          //children: _crearItems()),
          children: _crearItemsMap()),
    );
  }

  //Se genera un método que devolverá una lista de widget del tipo ListTile
  List<Widget> _crearItems() {
    //Se genera una lista de manera dinámica, es decir, no se especifica el tamaño
    final List<Widget> lista = [];

    //Se genera una estructura de iteración para rellenar la lista
    for (String opt in opciones) {
      //Se genera el ListTile
      final tempWidget = ListTile(
        title: Text(opt),
      );
      //Se agrega a la lista
      lista.add(tempWidget);
      //Se agrega un divisor a la lista de opciones
      lista.add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsMap() {
    //El metodo map regresa una nueva lista de iterables con elementos creados
    //en la funcion. Dicha funcion es anonima
    //Se genera una variable de tipo iterable
    var widgets = opciones.map((item) {
      //Se genera un widget de tipo column para generar el item ListTile y el Divider
      return Column(
        children: [
          ListTile(
            //Propiedad titulo
            title: Text('Map ' + item),
            //Propiedad subtitulo
            subtitle: Text('Subtitulo del ListTile'),
            //Widget que se coloca al inicio. Se agrega un icono como hijo
            leading: Icon(Icons.computer),
            //Widget que se coloca al final. Se agrega un icono como hijo
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            //onTap es un metodo al cual se le pueden asignar funcionalidades
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList(); //Se convierte el iterable a una lista de widget ListTile

    return widgets;
  }
}
