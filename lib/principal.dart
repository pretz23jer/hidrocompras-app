import 'package:flutter/material.dart';

void main() => runApp(Principal());

class Principal extends StatefulWidget {
  @override
  _MyAplicacion createState() => _MyAplicacion();
}

class _MyAplicacion extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIDROCOMPRAS',
      home: Scaffold(
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
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed('/one');
              },
            ),
          ],
        ),
        body: Text("PRODUCTOS"),
        //backgroundColor: Color.fromARGB(255, 214, 214, 214),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromARGB(255, 0, 5, 77),
          selectedItemColor: Color.fromARGB(255, 126, 236, 255),
          unselectedItemColor: Color.fromARGB(255, 224, 224, 224),
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
              backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.build_circle,
              ),
              label: 'Servicios',
              backgroundColor: Colors.lightBlue,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.assignment,
              ),
              label: 'Actividades',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_shipping,
              ),
              label: 'Pedidos',
            ),
          ],
        ),
      ),
    );
  }
}
