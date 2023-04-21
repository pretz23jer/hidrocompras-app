import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hidroapp/api_conection/api_conexion.dart';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';

class RecuperarContrasenia extends StatefulWidget {
  @override
  State<RecuperarContrasenia> createState() => _correoValidar();
}

class _correoValidar extends State<RecuperarContrasenia> {
  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  //seccion validar correo electronico registrado
  validarCorreo() async {
    try {
      var respuesta = await http.post(
        Uri.parse(API.validarCorreoRegistrado),
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
                  type: ArtSweetAlertType.success,
                  title: "Excelente",
                  text: "El correo electrónico se encuentra registrado :D"));
          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.of(context).pushNamed('/four');
          });
          emailController.clear();
        } else {
          //no existe el correo mostrar el mensaje de error
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.danger,
                  title: "Oops...",
                  text:
                      "El correo electrónico que está ingresando no se encuentra registrado. \n Intente nuevamente."));
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
        title: Text('Recuperar Contraseña'),
      ),
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
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 100.0,
                                      backgroundColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      backgroundImage:
                                          AssetImage('images/hidroa.png'),
                                    ),
                                    SizedBox(
                                      width: 160.0,
                                      height: 15.0,
                                      child: Divider(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        '¿Haz olvidado tu contraseña?',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 20, 20),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Ingrese la dirección de correo electrónico registrado para poder recuperar.',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 20, 20),
                                          fontSize: 15,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15.0,
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
                                    //boton para ingresar a la app
                                    Material(
                                      color: Color.fromARGB(255, 0, 18, 121),
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: () {
                                          if (formkey.currentState!
                                              .validate()) {
                                            validarCorreo();
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 28,
                                          ),
                                          child: Text(
                                            'Validar',
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
                                  ],
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
