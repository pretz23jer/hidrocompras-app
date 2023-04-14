import 'package:flutter/material.dart';

class Mensajes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
        backgroundColor: Color.fromARGB(255, 0, 5, 77),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
            ),
          ],
        ),
      ),
    );
  }
}
