import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';

  //Elementos del dropdown
  List<String> _profesiones = [
    'Sin dato',
    'Contador',
    'Abogado',
    'Ingeniero',
    'Periodista',
    'Programador'
  ];

  //Opcion que se selecciona en el dropdown
  String _opcionSeleccionadaDropdown = 'Sin dato';

  //Se genera una propiedad que permite almacenar la fecha seleccionada para
  //colocarla en la caja de texto. Permite relacionar el calendario con el
  //input de la fecha
  TextEditingController _inputFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          //Llamamos al metodo que nos devuelve el formulario
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  //Widget para generar un inputs para texto
  Widget _crearInput() {
    return TextField(
      //Posición del cursos en el input
      //La capitalizacion permite colocar Mayusculas a las palabras escritas
      //Esto es util para colocar la primera letra en mayuscula del nombre
      //y apellido
      textCapitalization: TextCapitalization.sentences,
      //Decoration incluye las propiedades para cambiar el estilo de los input
      decoration: InputDecoration(
          //Propiedad para cambiar el estilo de los bordes de los inputs
          border: OutlineInputBorder(
              //Estilo del redondeo de las esquinas del input
              borderRadius: BorderRadius.circular(10.0)),
          //Etiqueta contadora de caracteres
          counter: Text('Letras ${_nombre.length}'),
          //Texto de sugerencia para completar un input
          hintText: 'Nombre de la persona',
          //Etiqueta del input
          labelText: 'Nombre',
          //Texto de ayuda ubicado debajo del input
          helperText: 'Solo nombre',
          //Icono que se incluye dentro del input
          suffixIcon: Icon(Icons.accessibility),
          //Icono que aparece al princiopio del input
          icon: Icon(Icons.account_circle)),
      //onChanged es un metodo que permite obtener el valor que se ingresa al
      //input para poder procesarlo. Recibe como parametro el valor que se
      //escribe en la caja de texto
      onChanged: (valor) {
        //El setState va a permitir redibujar el widget para mostrar cada letra
        //que el usuario ingresa en la caja de texto
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  //Widget para generar un inputs para email
  Widget _crearEmail() {
    return TextField(
      //keyboardType permite que en el teclado del dispositivo movil se encuentre accesible
      //el arroba (@) con el fin de escribir las direcciones de correo con mayor
      //facilidad
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  //Widget para generar un inputs para password
  Widget _crearPassword() {
    return TextField(
      //obscureText permite ocultar los caracteres que se ingresan en un input
      //reemplazandolos por asteriscos
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (valor) {
        setState(() {});
      },
    );
  }

  //Widget para generar un inputs para seleccionar una fecha
  Widget _crearFecha(BuildContext context) {
    return TextField(
      //enableInteractiveSelection permite bloquear la copia de informacion
      //de dicho campo fecha
      enableInteractiveSelection: false,
      //Se asigna el enlace del calendario con el input
      controller: _inputFieldController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      //onTap permite lanzar un metodo para mostrar un modal con un calendario
      //sobre el cual seleccionar la fecha
      onTap: () {
        //Elimina el foco para poder mostrar el modal selector de fecha
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  //Widget para lanzar un modal con el calendario para seleccionar fecha
  _selectDate(BuildContext context) async {
    //Se genera una variable para inicializar los datos de un calendario selector
    DateTime? calendario = await showDatePicker(
        context: context,
        //Fecha actual
        initialDate: new DateTime.now(),
        //Fecha inicial desde la cual se puede empezar a seleccionar una fecha
        firstDate: new DateTime(2022),
        //Fecha final hasta la que se puede seleccionar una fecha
        lastDate: new DateTime(2024),
        //Cambio de idioma en el cuadro de calendario
        locale: Locale('es', 'ES'));

    //Validacion para colocar la fecha seleccionada en la caja de texto
    if (calendario != null) {
      setState(() {
        //Se asigna la fecha selecionada
        _fecha = calendario.toString();
        //Se coloca la fecha en el input
        _inputFieldController.text = _fecha;
      });
    }
  }

  //Se genera la lista de elementos para el dropdown
  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _profesiones.forEach((profesion) {
      lista.add(DropdownMenuItem(
        child: Text(profesion),
        value: profesion,
      ));
    });
    return lista;
  }

  //Widget para generar un dropdown
  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(
          width: 30.0,
        ),
        Expanded(
            child: DropdownButton(
                //Valor por defecto del dropdown
                value: _opcionSeleccionadaDropdown,
                items: getOpcionesDropdown(),
                onChanged: (opt) {
                  setState(() {
                    _opcionSeleccionadaDropdown = opt.toString();
                  });
                }))
      ],
    );
  }

  //Se genera un listTile para mostrar el texto que se carga en la caja de texto
  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email: $_email'),
      trailing: Text(_opcionSeleccionadaDropdown),
    );
  }
}
