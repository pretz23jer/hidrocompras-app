import 'package:flutter/material.dart';
import 'package:hidroapp/src/mensajes.dart';
import 'package:flutter/gestures.dart';

class Usuario extends StatelessWidget {
  final double coverHeight = 90;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 5, 77),
        title: Text(
          'Regresar',
          style: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildTop(),
          buildContenido(),
        ],
      ),
    );
  }

//se genera un padre para llamar a las imagenes de fondo
  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 2;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCoverImage(),
        ),
        Positioned(
          top: top,
          child: buildProfileImage(),
        ),
      ],
    );
  }

//fondo azul de la foto del usuario
  Widget buildCoverImage() => Container(
        color: Color.fromARGB(255, 0, 4, 43),
        child: Image.asset(
          'images/fondo3.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
//seccion de la fotografia
  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundImage: AssetImage('images/persona.png'),
      );
// Agregando texto

  Widget buildContenido() => Column(
        children: [
          const SizedBox(height: 1),
          Text(
            'José González',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 1),
          Text(
            'Plomero',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
          const SizedBox(height: 5.0),
          Divider(),
          buildAbout(),
          const SizedBox(height: 4),
          contenidoUsuario(),
        ],
      );
  Widget buildAbout() => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Calificación y Reseñas',
              style: TextStyle(fontSize: 15),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.star_half,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Icon(
                    Icons.star_outline,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  Text(
                    '3.5',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: SizedBox(
                height: 60.0,
                width: 80.0,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.wallet,
                        size: 30,
                      ),
                      Text('Pagos'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget contenidoUsuario() => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.email_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                    Text(
                      'Mensajes',
                      style: TextStyle(
                          fontSize: 14, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.local_offer,
                      size: 30,
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                    Text(
                      'Promociones Hidrocomrpas',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.favorite,
                      size: 30,
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                    Text(
                      'Productos más vendidos',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.settings_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                    Text(
                      'Generar Ganancias: Vender',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 255, 255)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.apps_outage_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 31, 31, 31),
                    ),
                    Text(
                      'Legal',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
