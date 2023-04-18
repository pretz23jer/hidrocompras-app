import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:hidroapp/src/login.dart';

class NuevoUsuario extends StatelessWidget {
  String? nombre, apellido, telefono, correo, password;
  var formkey = GlobalKey<FormState>();

  var nombreController = TextEditingController();
  var apellidoController = TextEditingController();
  var emailController = TextEditingController();
  var telefonoController = TextEditingController();
  var paswordController = TextEditingController();
  var OcultarPass = true.obs;

  validarCorreo() {}

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
      body: Form(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: nombreController,
                  enableInteractiveSelection: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Nombres',
                      labelText: 'Nombres',
                      suffixIcon: Icon(Icons.perm_contact_cal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    nombre = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: apellidoController,
                  enableInteractiveSelection: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Apellidos',
                      labelText: 'Apellidos',
                      suffixIcon: Icon(Icons.perm_contact_cal),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    apellido = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  enableInteractiveSelection: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Correo electrónico',
                      labelText: 'Correo electrónico',
                      suffixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    nombre = value;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: telefonoController,
                  enableInteractiveSelection: false,
                  obscureText: false,
                  decoration: InputDecoration(
                      hintText: 'Teléfono',
                      labelText: 'Teléfono',
                      suffixIcon: Icon(Icons.phone_android),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onChanged: (value) {
                    nombre = value;
                  },
                ),
              ),
              /*seccion contraseña*/
              /*activar y desactivar la visuzalizaicón de la contraseñña*/
              Obx(
                () => Padding(
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
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
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' políticas de privacidad',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed('/eigth');
                                  }),
                            TextSpan(
                              text: ' y a las ',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 18),
                            ),
                            TextSpan(
                                text: ' condiciones del servicio.',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.of(context).pushNamed('/nine');
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
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Condiciones de Servicio',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 18),
                                recognizer: TapGestureRecognizer()
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
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 28),
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
          ),
        ),
      ),
    );
  }
}
