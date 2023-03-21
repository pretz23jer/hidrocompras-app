import 'package:flutter/material.dart';
import 'package:hidroapp/src/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIDROCOMPRAS',
      home: MyAppForm(),
    );
  }
}
