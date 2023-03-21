import 'package:flutter/material.dart';

class MyAppForm extends StatefulWidget {
  MyAppForm();

  @override
  _MyAppFormState createState() => _MyAppFormState();
}

class _MyAppFormState extends State<MyAppForm> {
  String? _nombre;
  String? _pasword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 90.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/hidroa.png'),
              ),
              Text(
                'Iniciar Sesión',
                style: TextStyle(
                  fontSize: 30.0,
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
                    hintText: 'NOMBRE DE USUARIO',
                    labelText: 'Nombre de Usuario',
                    suffixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _nombre = valor;
                  print('El usuario es $_nombre');
                },
              ),
              Divider(
                height: 18.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Contraseña',
                    labelText: 'Contraseña',
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onSubmitted: (valor) {
                  _pasword = valor;
                  print('La contraseña es $_pasword');
                },
              ),
              Divider(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 25.0,
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(255, 0, 18, 121)),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
