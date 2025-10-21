import 'package:flutter/material.dart';
import 'package:prueba_18Octubre_2025/src/pages.dart';

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