import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  //Variable para almacenar el valor del slider
  double _valorSlider = 200.0;
  //Variable para bloquear el slider
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        ),
      ),
    );
  }

  //Widget slider
  Widget _crearSlider() {
    return Slider(
        //Color del slider
        activeColor: Colors.indigoAccent,
        //Etiqueta
        label: 'Tamaño de imagen',
        //Divisiones en valores de la barra del slider
        //divisions: 20,
        //Valor por defecto de entrada
        value: _valorSlider,
        //Valor minimo
        min: 10.0,
        //Valor maximo
        max: 400.0,
        //Recibe el valor del slider
        //Se agrega un condicional para bloquear o no el slider segun el valor
        //de la variable del checkbox o del switch
        onChanged: (_bloquearCheck)
            ? null
            : (valor) {
                //Redibuja el widget para mostrar movimiento del slider
                setState(() {
                  _valorSlider = valor;
                });
              });
  }

  //widget checkbox
  Widget _crearCheckbox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearCheck = valor!;
    //       });
    //     });

    return CheckboxListTile(
        title: Text('Checkbox bloqueo slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });
  }

  //Widget switch
  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Switch bloqueo slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor!;
          });
        });
  }

  //Imagen que se configura con el slider
  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://kinsta.com/es/wp-content/uploads/sites/8/2021/12/back-end-developer.png'),
      //Ancho de la imagen
      width: _valorSlider,
      //Permite configurar los margenes para que la imagen se vea correcta
      fit: BoxFit.contain,
    );
  }
}
