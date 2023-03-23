import 'package:flutter/material.dart';
import 'package:hidroapp/src/app.dart';
import 'package:hidroapp/inicio.dart';
import 'package:hidroapp/sesion/recuperar.dart';
import 'package:hidroapp/sesion/nuevapasword.dart';
import 'package:hidroapp/principal.dart';
import 'package:hidroapp/usuario/user.dart';

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
      },
      initialRoute: '/one',
    );
  }
}
