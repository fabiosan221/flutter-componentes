import 'package:flutter/material.dart';
import 'package:componentes/src/pages/providers/menu_provider.dart';

//Se importa el metodo para obtener el icono a partir de un string
import 'package:componentes/src/pages/utils/icono_string_util.dart';

//Se importa las paginas de la aplicacion para su navegacion
import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //Se muestra por consola la lectura del menu obtenido desde el archivo JSON
    //print(menuProvider.opciones);

    // return ListView(
    //   children: _listaItems(),
    // );

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: const [],
      //retorna un widget builder que va a permitir dibujar un elemento en pantalla
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          //Se envia como parametro al metodo _listaItems el context
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    // return [
    //   ListTile(
    //     title: Text('Funcionalidad 1'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('Funcionalidad 2'),
    //   ),
    //   Divider(),
    //   ListTile(
    //     title: Text('Funcionalidad 3'),
    //   ),
    //   Divider(),
    // ];
    final List<Widget> opciones = [];
    //Recorremos cada uno de los elementos de la lista, armando los ListTile
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        //Se llama al metodo getIcon() para obtener el icono
        leading: getIcon(opt['icon']),
        trailing: Icon(
          Icons.arrow_forward_ios_outlined,
          color: Colors.blue,
        ),
        onTap: () {
          //Se genera una variable para poder generar la ruta de la pantalla
          //a la cual se va a navegar
          //Se utiliza el metodo MaterialPageRoute para configurar un builder con
          //la ruta de navegacion de manera estatica
          // final route = MaterialPageRoute(builder: (context) {
          //   //Retorna la pagina a la cual se quiere navegar
          //   //Para este ejemplo todas las opciones del menu se dirigen
          //   //hacia la pantalla AlertPage()
          //   return AlertPage();
          // });

          // //Se utiliza el objeto Navigator junto con el metodo push para
          // //colocar una pantalla encima de la pantalla que se esta haciendo
          // //la accion
          // Navigator.push(context, route);

          Navigator.pushNamed(context, opt['ruta']);
        },
      );

      opciones.add(widgetTemp);
      opciones.add(Divider());
    });
    return opciones;
  }
}
