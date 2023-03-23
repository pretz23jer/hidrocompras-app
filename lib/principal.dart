import 'package:flutter/material.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("HIDROCOMPRAS"),
        //color de fondo
        backgroundColor: Color.fromARGB(255, 0, 5, 77),
        // Establecer la imagen de la pantalla frontal
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),

        // Coloca el icono detrás
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.of(context).pushNamed('/six');
            },
          ),
          IconButton(
            icon: Icon(Icons.exit_to_app_rounded),
            onPressed: () {
              Navigator.of(context).pushNamed('/one');
            },
          ),
        ],
      ),
      body: Text("PRODUCTOS"),
      backgroundColor: Color.fromARGB(255, 214, 214, 214),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.badge_outlined),
            label: 'Servicios',
            backgroundColor: Color.fromARGB(255, 0, 5, 77),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Actividades',
            backgroundColor: Color.fromARGB(255, 0, 5, 77),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fire_truck_outlined),
            label: 'Pedidos',
          ),
        ],
        fixedColor: Colors.red,
      ),
    );
  }
}
