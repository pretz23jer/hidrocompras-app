import 'package:flutter/material.dart';

class Condiciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Condiciones de Servicio'),
        backgroundColor: Color.fromARGB(255, 0, 5, 77),
      ),
      body: Center(
        child: Text('Nuestras Condiciones'),
      ),
    );
  }
}
