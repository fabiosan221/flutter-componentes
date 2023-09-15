import 'package:flutter/material.dart';

//Se genera una variable privada, ya que solo se utilizara en este entorno
//Esta variable sera un mapa (Map) que tendra dos valores.
//Por un lado un string como llave, y un IconData como valor de esa llave
final _icons = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'calculate_outlined': Icons.calculate_outlined,
  'donut_large': Icons.donut_large,
  'input': Icons.input,
  'tune': Icons.tune,
  'list': Icons.list,
};

//Se genera un metodo que devuelve un icono, recibiendo como parametro un string
//con el nombre del mismo
Icon getIcon(String nombreIcono) {
  //Se retorna un widget de tipo Icon con el parametro de tipo string
  //que recibe como parametro getIcon
  //Tambien se agrega la propiedad de color del mismo
  return Icon(
    _icons[nombreIcono],
    color: Colors.blue,
  );
}
