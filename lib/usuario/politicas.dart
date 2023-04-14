import 'package:flutter/material.dart';

class PoliticasPrivacidad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('POLÍTICAS DE PRIVACIDAD'),
        backgroundColor: Color.fromARGB(255, 0, 5, 77),
      ),
      body: Center(
        child: Text('Nuestras Políticas'),
      ),
    );
  }
}
