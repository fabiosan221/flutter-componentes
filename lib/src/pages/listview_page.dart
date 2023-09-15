import 'package:flutter/material.dart';
import 'dart:async';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumero = [];
  //Ultimo item de la lista
  int _ultimoItem = 0;

  //Variable para controlar el movimiento del scroll
  ScrollController _scrollController = new ScrollController();

  //Bandera para indicar cuando carga informacion y cuando no
  bool _isloading = false;

  //Iniciador de la clase State
  @override
  void initState() {
    super.initState();
    //Se llama al metodo que agrega 10 numeros a la lista al iniciar la seccion
    _agregar10();

    //Se verifica la posicion del scroll. Cuando esta llega al final de la pagina
    //Se cargan 10 imagenes nuevamente, y asi susesivamente logrando el efecto de
    //un scroll infinito
    //_scrollController.position.pixels => posision en pixeles
    //_scrollController.position.maxScrollExtent => largo maximo de scroll en pixeles
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        //Metodo para traer información
        fetchData();
      }
    });
  }

  //El dispose es un metodo que permite destruir la pagina cuando el usuario
  //ya no se encuentra en la misma
  @override
  void dispose() {
    super.dispose();
    //Esto previene que no se utilicen recursos de memoria cuando el usuario
    //no esta en dicha seccion. Es lo que se conoce como fuga de memoria
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listas'),
        ),
        //El Stack es un widget que permite apilar los widget hijos uno arriba
        //del otro
        body: Stack(
          children: <Widget>[
            _crearLista(),
            _crearLoading(),
          ],
        ));
  }

  //Widget para generar un listview de imagenes
  Widget _crearLista() {
    return RefreshIndicator(
      //Este metodo indica que accion se desea disparar cuando deslizamos la
      //pantalla del dipositivo hacia abajo
      onRefresh: obtenerPaginaInicial,
      child: ListView.builder(
        //Permite configurar el scroll
        controller: _scrollController,
        //Cantidad de items que tiene la lista
        itemCount: _listaNumero.length,
        //Metodo que se encarga de redibujar los elementos de un lista
        itemBuilder: (BuildContext context, int index) {
          //Variable utilizada como indice para obtener nuevas imagenes del servicio
          //de internet
          final imagen = _listaNumero[index];
          return FadeInImage(
              placeholder: AssetImage('assets/loading-img.gif'),
              //Obtenemos las imagenes a partir de un servicio en internet
              image: NetworkImage('https://picsum.photos/id/$imagen/500/300'));
        },
      ),
    );
  }

  //Metodo para mostrar nuevas imagenes al deslizar la pantalla hacia abajo
  Future<Null> obtenerPaginaInicial() async {
    //Tiempo de espera que sucede antes de mostrar las nuevas imagenes
    final duration = new Duration(seconds: 2);
    //Se establece la duracion y la funcion a ejecutar despues del tiempo
    //de espera
    new Timer(duration, () {
      //Se purga la lista de numeros para almacenar unos nuevos
      _listaNumero.clear();
      //Se obtiene un nuevo indice, a partir del cual se van a generar 10 nuevos
      //numeros para la lista
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  //Este metodo agregara 10 imagenes a la lista
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumero.add(_ultimoItem);
    }
    setState(() {});
  }

  //Metodo para agregar pausas a la carga de recursos
  Future fetchData() async {
    _isloading = true;
    setState(() {});
    //Variable de 2 segundos de duracion
    final duracion = new Duration(seconds: 2);
    //Cuando pasen los 2 segundos, se dispara el metodo respuestaHTTP
    return new Timer(duracion, respuestaHTTP);
  }

  //Llamada a una nueva carga de imagenes
  void respuestaHTTP() {
    //Cuando se termina de cargar los recursos
    _isloading = false;
    //Permite generar una animacion que muestra unos pixeles de las proxima
    //imagenes a mostrar en la lista
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    //Vuelve a llamar al metodo para cargar 1o imagenes mas
    _agregar10();
  }

  //Se genera un componente de esperar para mostrar en pantalla mientras cargan
  //las siguientes imagenes a visualizar
  Widget _crearLoading() {
    if (_isloading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Componente circular de carga
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
