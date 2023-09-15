import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      //Se genera el boton que al presionarlo muestra una alerta
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar Alerta'),
          onPressed: () => _mostrarAlerta(context),
        ),
      ),
      //Se crea el boton para regresar a la pantalla inicial
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_circle_left_outlined),
        onPressed: () {
          //Con el metodo Navigator se genera la ruta para volver a la pantalla
          //principal a partir del context
          Navigator.pop(context);
        },
      ),
    );
  }

  //Caja de contenido de la alerta
  void _mostrarAlerta(BuildContext context) {
    showDialog(
        context: context,
        //Permite establecer si una alerta se puede cerrar haciendo click
        //fuera de la misma
        barrierDismissible: true,
        //Se recibe el contexto y se devuelve un widget de tipo AlertDialog que
        //es la tarjeta de la alerta
        builder: (context) {
          return AlertDialog(
            //Propiedad para configurar bordes redondeados en la caja de la
            //alerta
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Text('Título'),
            content: Column(
              //mainAxisSize es una propiedad que permite adaptar el tamaño de
              //la caja de la alerta al contenido de la misma
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text('Contenido de la tarjeta de alerta'),
                //Se puede configurar un logo de flutter mediante la propiedad
                //FlutterLogo e indicando el tamaño en pixeles
                FlutterLogo(
                  size: 100,
                )
              ],
            ),
            //Las acciones permiten cargar un conjunto de widget donde se
            //pueden colocar botones con acciones
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    //Permite cerrar la caja de la alerta
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'))
            ],
          );
        });
  }
}
