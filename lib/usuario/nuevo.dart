import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class NuevoUsuario extends StatelessWidget {
  String? correo, password, nombre, apellido, telefono;

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
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                enableInteractiveSelection: false,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Nombres',
                    labelText: 'Nombres',
                    suffixIcon: Icon(Icons.perm_contact_cal),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (value) {
                  correo = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                enableInteractiveSelection: false,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Apellidos',
                    labelText: 'Apellidos',
                    suffixIcon: Icon(Icons.perm_contact_cal),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (value) {
                  apellido = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                enableInteractiveSelection: false,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    labelText: 'Correo electrónico',
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (value) {
                  nombre = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                enableInteractiveSelection: false,
                obscureText: false,
                decoration: InputDecoration(
                    hintText: 'Teléfono',
                    labelText: 'Teléfono',
                    suffixIcon: Icon(Icons.phone_android),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (value) {
                  nombre = value;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onChanged: (value) {
                  password = value;
                },
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
            ElevatedButton(
                child: Text('Aceptar y Registrar'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
