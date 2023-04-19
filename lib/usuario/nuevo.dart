import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:hidroapp/api_conection/api_conexion.dart';
import 'package:get/get.dart';
import 'package:hidroapp/usuario/model/usuario.dart';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';

class NuevoUsuario extends StatefulWidget {
  @override
  State<NuevoUsuario> createState() => _NuevoUsuarioApp();
}

class _NuevoUsuarioApp extends State<NuevoUsuario> {
  var formkey = GlobalKey<FormState>();

  var nombreController = TextEditingController();
  var apellidoController = TextEditingController();
  var emailController = TextEditingController();
  var telefonoController = TextEditingController();
  var passwordController = TextEditingController();
  var OcultarPass = true.obs;
//seccion validar correo electronico registrado
  validarCorreo() async {
    try {
      var respuesta = await http.post(
        Uri.parse(API.validarCorreoUsuario),
        body: {
          'correo': emailController.text.trim(),
        },
      );
      //Desde la aplicación Flutter la conexión con la API
      if (respuesta.statusCode == 200) {
        var respuestaBodyCorreo = jsonDecode(respuesta.body);
        if (respuestaBodyCorreo['Existe'] == true) {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.danger,
                  title: "Oops...",
                  text:
                      "El correo electrónico ya está en uso. Prueba con otro correo."));
        } else {
          //registrar al nuevo usuario
          registroNuevoUsuario();
        }
      }
    } catch (e) {
      print(e.toString());
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.warning,
            title: "A question?",
            text: e.toString(),
          ));
    }
  }

//seccion registro de nuevo usuario
  registroNuevoUsuario() async {
    User usuarioModel = User(
      nombreController.text.trim(),
      apellidoController.text.trim(),
      emailController.text.trim(),
      telefonoController.text.trim(),
      passwordController.text.trim(),
    );

    try {
      var respuesta = await http.post(
        Uri.parse(API.crearUsuario),
        body: usuarioModel.toJson(),
      );

//DESDE LA APLICACIÓN FLUTTER La conexión con la API al servidor - éxito
      if (respuesta.statusCode == 200) {
        var respuestaRegtistro = jsonDecode(respuesta.body);
        if (respuestaRegtistro['Exitoso'] == true) {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Excelente!",
                  text: "Registro Exitoso"));
        } else {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.danger,
                  title: "Oops...",
                  text: "Error de registro :("));
        }
      }
    } catch (e) {
      print(e.toString());
      ArtSweetAlert.show(
          context: context,
          artDialogArgs: ArtDialogArgs(
            type: ArtSweetAlertType.warning,
            title: "A question?",
            text: e.toString(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 5, 77),
        title: Text(
          'Crear Cuenta',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: LayoutBuilder(builder: (context, cons) {
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
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: nombreController,
                                  validator: (val) => val == ""
                                      ? "Por favor ingrese su nombre"
                                      : null,
                                  enableInteractiveSelection: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: 'Nombres',
                                      labelText: 'Nombres',
                                      suffixIcon: Icon(Icons.perm_contact_cal),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: apellidoController,
                                  validator: (val) => val == ""
                                      ? "Por favor ingrese su apellido"
                                      : null,
                                  enableInteractiveSelection: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: 'Apellidos',
                                      labelText: 'Apellidos',
                                      suffixIcon: Icon(Icons.perm_contact_cal),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  validator: (val) => val == ""
                                      ? "Por favor ingrese su correo electrónico"
                                      : null,
                                  controller: emailController,
                                  enableInteractiveSelection: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: 'Correo electrónico',
                                      labelText: 'Correo electrónico',
                                      suffixIcon: Icon(Icons.email),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(10.0),
                                child: TextFormField(
                                  validator: (val) => val == ""
                                      ? "Por favor ingrese su número de teléfono"
                                      : null,
                                  controller: telefonoController,
                                  enableInteractiveSelection: false,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                      hintText: 'Teléfono',
                                      labelText: 'Teléfono',
                                      suffixIcon: Icon(Icons.phone_android),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                ),
                              ),
                              /*seccion contraseña*/
                              /*activar y desactivar la visuzalizaicón de la contraseñña*/
                              Obx(
                                () => Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: TextFormField(
                                    controller: passwordController,
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
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text:
                                              'Esta app esta protegida con derechos, está sujeta a las',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text:
                                                    ' políticas de privacidad',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 18),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.of(context)
                                                            .pushNamed(
                                                                '/eigth');
                                                      }),
                                            TextSpan(
                                              text: ' y a las ',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontSize: 18),
                                            ),
                                            TextSpan(
                                                text:
                                                    ' condiciones del servicio.',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 18),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.of(context)
                                                            .pushNamed('/nine');
                                                      }),
                                          ]),
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.all(10),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'Acepto las ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'Condiciones de Servicio',
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 18),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        // navigate to desired screen
                                                      }),
                                          ]),
                                    ),
                                  )),
                              Material(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(30),
                                child: InkWell(
                                  onTap: () {
                                    if (formkey.currentState!.validate()) {
                                      validarCorreo();
                                    }
                                  },
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 28),
                                    child: Text(
                                      'Aceptar y Registrar',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
