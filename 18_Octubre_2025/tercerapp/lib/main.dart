import 'package:flutter/material.dart';
import 'src/pages/add_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Agregar Usuario',
      home: AddUser(),
    );
  }
}
