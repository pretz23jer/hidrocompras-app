import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hidroapp/api_conection/api_conexion.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class NewContrasenia extends StatefulWidget {
  @override
  State<NewContrasenia> createState() => _GenerarNuevaPassword();
}

class _GenerarNuevaPassword extends State<NewContrasenia> {
  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var clave2Controller = TextEditingController();
  var OcultarPass2 = true.obs;

/*seccion restauraucion de contraseña*/
  cambiarPasword() async {
    try {
      var respuesta = await http.post(
        Uri.parse(API.updatePaswordUser),
        body: {
          'correo': emailController.text.trim(),
          'clave': clave2Controller.text.trim(),
        },
      );

//DESDE LA APLICACIÓN FLUTTER La conexión con la API al servidor - éxito
      if (respuesta.statusCode == 200) {
        var respuestaRegtistro = jsonDecode(respuesta.body);
        if (respuestaRegtistro['Exitoso'] == true) {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.success,
                  title: "Exitoso!",
                  text: "Se a actualizado la nueva clave"));

          setState(() {
            emailController.clear();
            clave2Controller.clear();
          });

          Future.delayed(Duration(milliseconds: 1500), () {
            Navigator.of(context).pushNamed('/two');
          });
        } else {
          ArtSweetAlert.show(
              context: context,
              artDialogArgs: ArtDialogArgs(
                  type: ArtSweetAlertType.danger,
                  title: "Oops...",
                  text:
                      "Error de registro. \n Verifique el correo electrónico que está registrando"));
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

//validar longitud de la contraseña
  ///Passing a key to access the validate function
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();
  bool _isAcceptTermsAndConditions = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Contraseña'),
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
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text(
                                    'Restaurar Contraseña',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 20, 20, 20),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'Ingrese su correo electrónico registrado',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 1, 68, 0.89),
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
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
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Ingrese la nueva contraseña',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 1, 68, 0.89),
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                /*seccion contraseña*/
                                /*activar y desactivar la visuzalizaicón de la contraseñña*/
                                Obx(
                                  () => TextFormField(
                                    controller: clave2Controller,
                                    obscureText: OcultarPass2.value,
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
                                              OcultarPass2.value =
                                                  !OcultarPass2.value;
                                            },
                                            child: Icon(
                                              OcultarPass2.value
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
                                  height: 20.0,
                                ),
                                //boton para ingresar a la app
                                SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color.fromARGB(255, 11, 0, 114),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    onPressed: _isAcceptTermsAndConditions
                                        ? () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              cambiarPasword();
                                            }
                                          }
                                        : null,
                                    child: Text(
                                      'Actualizar contraseña',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: new FlutterPwValidator(
                                    key: validatorKey,
                                    controller: clave2Controller,
                                    minLength: 8,
                                    uppercaseCharCount: 1,
                                    numericCharCount: 2,
                                    specialCharCount: 1,
                                    normalCharCount: 4,
                                    width: 400,
                                    height: 150,
                                    onSuccess: () {
                                      print("Coincide");
                                      setState(() {
                                        _isAcceptTermsAndConditions = true;
                                      });
                                    },
                                    onFail: () {
                                      print("No coincide");
                                      setState(() {
                                        _isAcceptTermsAndConditions = false;
                                      });
                                    },
                                  ),
                                ),
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
