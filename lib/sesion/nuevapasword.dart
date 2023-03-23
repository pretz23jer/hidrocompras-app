import 'package:flutter/material.dart';

class NewContrasenia extends StatelessWidget {
  String? _pasword1;
  String? _pasword2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Contraseña'),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  'NUEVA CONTRASEÑA',
                  style: TextStyle(
                    color: Color.fromARGB(255, 20, 20, 20),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Ingrese la dirección de correo',
                  style: TextStyle(
                    color: Color.fromARGB(255, 20, 20, 20),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Por favor crear tu nueva contraseña para poder acceder',
                  style: TextStyle(
                    color: Color.fromARGB(255, 156, 102, 0),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Nueva contraseña',
                    labelText: 'Nueva contraseña',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _pasword1 = valor;
                  print('La contraseña es $_pasword1');
                },
              ),
              Divider(
                height: 15.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Repetir contraseña',
                    labelText: 'Repetir contraseña',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _pasword2 = valor;
                  print('La contraseña es $_pasword2');
                },
              ),
              Divider(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Cambiar',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 18, 121)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
