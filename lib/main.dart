import 'package:flutter/material.dart';
import 'package:hidroapp/src/login.dart';
import 'package:hidroapp/inicio.dart';
import 'package:hidroapp/sesion/recuperar.dart';
import 'package:hidroapp/sesion/nuevapasword.dart';
import 'package:hidroapp/principal.dart';
import 'package:hidroapp/usuario/user.dart';
import 'package:hidroapp/usuario/nuevo.dart';
import 'package:hidroapp/usuario/politicas.dart';
import 'package:hidroapp/usuario/condiciones.dart';
import 'package:hidroapp/src/mensajes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIDROCOMPRAS',
      routes: {
        '/one': (context) => Inicio(),
        '/two': (context) => MyAppForm(),
        '/tree': (context) => RecuperarContrasenia(),
        '/four': (context) => NewContrasenia(),
        '/five': (context) => Principal(),
        '/six': (context) => Usuario(),
        '/seven': (context) => NuevoUsuario(),
        '/eigth': (context) => PoliticasPrivacidad(),
        '/nine': (context) => Condiciones(),
        '/ten': (context) => Mensajes(),
      },
      initialRoute: '/one',
    );
  }
}
