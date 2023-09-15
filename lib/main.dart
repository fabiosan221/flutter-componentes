import 'package:flutter/material.dart';
//import 'package:componentes/src/pages/home_temp.dart';

//Paquete para cambiar el idioma por defecto
import 'package:flutter_localizations/flutter_localizations.dart';

//Se importan las paginas de las secciones
// import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/alert_page.dart';
// import 'package:componentes/src/pages/avatar_page.dart';

//Se importa el archivo de rutas
import 'package:componentes/src/pages/routes/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      //home: HomePageTemp(),
      //home: HomePage(),
      //Se configura la ruta inicial de la aplicacion
      initialRoute: '/',
      //La configuracion de la rutas comienzan con la creacion de un mapa
      // routes: <String, WidgetBuilder>{
      //   '/': (BuildContext context) => HomePage(),
      //   'alert': (BuildContext context) => AlertPage(),
      //   'avatar': (BuildContext context) => AvatarPage(),
      // },
      //Se llama al metodo del archivo routes.dart para obtener el string
      //con las rutas de navegacion
      routes: getAplicationRoutes(),
      //Se genera la propiedad onGenerateRoute que es un metodo que permite generar
      //rutas de cualquier tipo o rutas dinamicas
      onGenerateRoute: (RouteSettings settings) {
        //print('Ruta llamada: ${settings.name}');
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPage());
      },
    );
  }
}
