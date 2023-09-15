//Se importa un paquete para el manejo de JSON donde solo se expone un solo
//objeto de ese paquete mediante la palabra show y el nombre del objeto rootBundle
//que contiene las herramientas para leer JSON
import 'package:flutter/services.dart' show rootBundle;

//Se importa dart convert para decodificar los archivos JSON
import 'dart:convert';

//Se genera de manera privada la clase
class _MenuProvider {
  //Se genera una lista dinamica y se inicializa como una lista vacia
  List<dynamic> opciones = [];

  //Se define el constructor
  _MenuProvider() {
    //cargarData();
  }

  // void cargarData() {
  //   //Se utiliza el objeto rootBundle y se especifica la ruta del archivo JSON
  //   //Esto regresa un "Future"
  //   rootBundle.loadString('data/menu_opts.json').then((data) {
  //     //Se obtiene la informacion del menu y se muestra mediante un String
  //     print(data);
  //   });
  // }

  //Convertimos el metodo cargarData en un Future que permite devolver el
  //listado de rutas una vez que se ha leido del archivo JSON
  //El Future va a retornar cuando este disponible, la información en una
  //lista dinamica
  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];

    return opciones;
  }
}

//Se crea la instancia del MenuProvider
final menuProvider = new _MenuProvider();
