import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:hidroapp/api_conection/api_conexion.dart';
import 'package:get/get.dart';
import 'package:hidroapp/usuario/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:hidroapp/usuario/model/preferenciaUsuario/preferencia_usuario.dart';

class MyAppForm extends StatefulWidget {
  @override
  State<MyAppForm> createState() => _LoginageState();
}

class _LoginageState extends State<MyAppForm> {
  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var paswordController = TextEditingController();
  var OcultarPass = true.obs;

//seccion para iniciar sesion
  iniciarSesion() async {
    try {
      var respuesta = await http.post(
        Uri.parse(API.loginUsuario),
        body: {
          'correo': emailController.text.trim(),
          'password': paswordController.text.trim(),
        },
      );

      //Desde la aplicación Flutter la conexión con la API
      if (respuesta.statusCode == 200) {
        var respuestaLogin = jsonDecode(respuesta.body);
        if (respuestaLogin['success'] == true) {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Hola",
                  text: "Bienvenido a la aplicación"));

          User usuarioInfo = User.fromJson(respuestaLogin["usuarioData"]);

          //guardar datos del usuario de forma local para usar las preferencias.
          await RecordarPrefeUs.guardarPreferenciaUsuario(usuarioInfo);

          Future.delayed(Duration(milliseconds: 1500), () {
            Get.to(direccionIr());
          });
        } else {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.danger,
                  title: "Opss..",
                  text:
                      "Credenciales Incorrectos.\n Por favor ingrese su correo o contraseña correctamente. \n Intente nuevamente"));
        }
      }
    } catch (errorMsg) {
      print("Error :: " + errorMsg.toString());
    }
  }

  direccionIr() {
    setState(() {
      emailController.clear();
      paswordController.clear();
    });
    Navigator.pushReplacementNamed(context, '/five');
    //Navigator.of(context).pushNamed('/five');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, cons) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: cons.maxHeight,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //formulario para registro de nuevo usuario
                        Form(
                          key: formkey,
                          child: Container(
                            padding: EdgeInsets.all(30.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 100.0,
                                  backgroundColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                  backgroundImage:
                                      AssetImage('images/hidroa.png'),
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
                                TextFormField(
                                  controller: emailController,
                                  validator: (val) => val == ""
                                      ? "Por favor ingrese su correo electrónico"
                                      : null,
                                  enableInteractiveSelection: true,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: 'Correo electrónico',
                                      labelText: 'Correo electrónico',
                                      suffixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
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
                                    validator: (val) => val == ""
                                        ? "Por favor ingrese su contraseña"
                                        : null,
                                    decoration: InputDecoration(
                                        labelText: 'Contraseña',
                                        prefixIcon: const Icon(
                                          Icons.vpn_key_sharp,
                                          color: Colors.black,
                                        ),
                                        suffixIcon: Obx(
                                          () => GestureDetector(
                                            onTap: () {
                                              OcultarPass.value =
                                                  !OcultarPass.value;
                                            },
                                            child: Icon(
                                              OcultarPass.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                              color:
                                                  Color.fromARGB(255, 2, 0, 97),
                                            ),
                                          ),
                                        ),
                                        hintText: "Contraseña",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
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
                                      if (formkey.currentState!.validate()) {
                                        iniciarSesion();
                                      }
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
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
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
                                        Navigator.of(context)
                                            .pushNamed('/seven');
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
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
