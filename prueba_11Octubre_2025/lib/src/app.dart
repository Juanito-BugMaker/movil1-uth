import 'package:flutter/material.dart';
import 'package:proyecto_27_septiembre_2025/src/pages.dart';

class myApp extends StatelessWidget{
  const myApp ({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Center(
        child: HomePage(),

      ),
    );
  }
}