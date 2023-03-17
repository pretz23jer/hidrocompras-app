import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hidrocompras App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('HIDROCOMPRAS'),
          backgroundColor: Color.fromARGB(255, 0, 18, 68),
        ),
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("/fondo.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            new Center(
              child: new Text(
                "Bienvenido",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // background
                onPrimary: Colors.white, // foreground
              ),
              onPressed: () {},
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
