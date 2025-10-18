import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estilos = const TextStyle(fontSize: 45);
  final TextEditingController nombreControlTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo', style: estilos),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Mi primera App', style: estilos),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: nombreControlTexto,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa el nombre',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          String nombre = nombreControlTexto.text;
          print('Hola, $nombre!');
        },
      ),
    );
  }
}
