import 'package:flutter/material.dart';

//Se crea el widget contadorPage de tipo StatefulWidget
class ContadorPage extends StatefulWidget {
  @override
  createState() => _ContadorPageState();
}

//Se crea el manejador de estado del widget contadorPage de tipo StatefulWidget
//En el nombre de esta clase se debe incorporar la palabra State y agregar
//el extends de la clase State
//Esta clase es privada porque solo se va a usar dentro de este archivo contador_page.dart
class _ContadorPageState extends State<ContadorPage> {
  //A las propiedades se le agrega el guión bajo para hacerla privadas, ya que
  //solo se van a utilizar dentro de este widget
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 0;

  @override
  Widget build(BuildContext context) {
    //Se retorna un widget personalizado llamado Scaffold
    return Scaffold(
        //Posee una barra superior con el titulo de la aplicacion
        appBar: AppBar(
          title: const Text('Contador de clicks'),
          //Propiedad que permite centrar el título
          centerTitle: true,
        ),
        //Posee un cuerpo donde se mostrara el mensaje "Hola mundo"
        body: Center(
          //Utilizamos el widget Column que nos permite desplegar una lista de
          //widget hijos
          child: Column(
            //Se utiliza la propiedad mainAxisAlignment que permite alinear en el centro
            //de la pantalla el objeto columna
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Se utiliza la propiedad creada para los estilos de los textos
              Text('Número de clicks:', style: _estiloTexto),
              Text('$_conteo', style: _estiloTexto),
            ],
          ),
        ),
        //Se genera un boton flotante
        // floatingActionButton: FloatingActionButton(
        //   //Se agrega un widget de tipo Icon para mostrar en el boton flotante
        //   child: Icon(Icons.add),
        //   //En el evento onPressed se cambia el numero de clicks al apretar el boton
        //   onPressed: () {
        //     _conteo++;
        //     //El metodo setState va a permitir que el widget se redibuje nuevamente para
        //     //mostrar el nuevo valor de cada click que se hace
        //     setState(() {});
        //   },
        // ),
        //Se establece la posicion del boton flotante dentro del scaffold
        //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: _crearBotones());
  }

  //Se genera un nuevo widget que contendrá los botones de la interfaz gráfica
  //con las funcionalidades
  Widget _crearBotones() {
    return Row(
      //Se alinean los botones al final de la fila con MainAxisAlignment.end
      mainAxisAlignment: MainAxisAlignment.end,
      //Se agregan los 3 botones con sus funcionalidades
      children: <Widget>[
        //El SizeBox permite establecer la separacion entre objetos. En este caso
        //se establece el ancho mediante la propiedad width
        const SizedBox(width: 30.0),
        FloatingActionButton(
            onPressed: _cerear, child: Icon(Icons.exposure_zero)),
        //Expanded trata de estirar al widget que tiene como hijo para ocupar el resto de la fila
        const Expanded(child: SizedBox()),
        FloatingActionButton(onPressed: _restar, child: Icon(Icons.remove)),
        const SizedBox(width: 30.0),
        FloatingActionButton(onPressed: _sumar, child: const Icon(Icons.add)),
      ],
    );
  }

  //Método para sumar en el contador
  void _sumar() {
    setState(() {
      _conteo++;
    });
  }

  //Método para restar en el contador
  void _restar() {
    setState(() {
      if (_conteo > 0) {
        _conteo--;
      }
    });
  }

  //Método para volver a cero el contador
  void _cerear() {
    setState(() {
      _conteo = 0;
    });
  }
}
