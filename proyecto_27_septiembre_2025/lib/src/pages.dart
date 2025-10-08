import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  final estilos = const TextStyle(fontSize:45);
  @override

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo', style:estilos),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mi primera App', style: estilos),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: (){
            print('Hola Mundo');
          },
      ),
      );
  }
}