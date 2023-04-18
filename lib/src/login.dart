import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hidroapp/sesion/recuperar.dart';
import 'package:hidroapp/usuario/user.dart';
import 'package:get/get.dart';

void main() => runApp(MyAppForm());
String usuario = '';

class MyAppForm extends StatefulWidget {
  _LoginageState createState() => _LoginageState();
}

class _LoginageState extends State<MyAppForm> {
  String? _usuario;

  TextEditingController controllerUser = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();

  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var paswordController = TextEditingController();
  var OcultarPass = true.obs;

  String mensaje = '';
/*
  Future<List> _login() async {
    final result = await http
        .post("http://192.168.1.22/apps/hidrocompras-app/login.php", body: {
      "usuario": controllerUser.text,
      "contrasenia": controllerPass.text,
    });
  }

  var datauser = json.decode(result.body);

  if ( datauser.length == 0 ){
    setState(() {
      mensaje = "usuario o contraseña incorrectas";
    });
  } else {
    if (datauser[0]['rol']=='plomero'){
      Navigator.pushReplacementNamed(context, '/five');
    }

    setState(() {
      usuario = datauser[0]['usuario'];
    });
    return datauser;
  }
*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
            padding: EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 100.0,
                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
                  backgroundImage: AssetImage('images/hidroa.png'),
                ),
                Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 160.0,
                  height: 15.0,
                  child: Divider(
                    color: Colors.blue,
                  ),
                ),
                TextField(
                  enableInteractiveSelection: false,
                  autofocus: true,
                  textCapitalization: TextCapitalization.characters,
                  decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onSubmitted: (valor) {
                    _usuario = valor;
                    print('El usuario es $_usuario');
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                /*seccion contraseña*/
                /*activar y desactivar la visuzalizaicón de la contraseñña*/
                Obx(
                  () => TextFormField(
                    controller: paswordController,
                    obscureText: OcultarPass.value,
                    validator: (val) =>
                        val == "" ? "Por favor inrese su contraseña" : null,
                    decoration: InputDecoration(
                        labelText: 'Contraseña',
                        prefixIcon: const Icon(
                          Icons.vpn_key_sharp,
                          color: Colors.black,
                        ),
                        suffixIcon: Obx(
                          () => GestureDetector(
                            onTap: () {
                              OcultarPass.value = !OcultarPass.value;
                            },
                            child: Icon(
                              OcultarPass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Color.fromARGB(255, 2, 0, 97),
                            ),
                          ),
                        ),
                        hintText: "Contraseña",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ))),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                //boton para ingresar a la app
                Material(
                  color: Color.fromARGB(255, 0, 18, 121),
                  borderRadius: BorderRadius.circular(30),
                  child: InkWell(
                    onTap: () {
                      //_login();
                      //Navigator.pop(context);
                      Navigator.of(context).pushNamed('/five');
                    },
                    borderRadius: BorderRadius.circular(30),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 28,
                      ),
                      child: Text(
                        'Ingresar',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/tree');
                    },
                    child: Text(
                      '¿Has olvidado tu contraseña? Recuperar',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/seven');
                      },
                      child: Text(
                        'Regístrate',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 26, 82),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
