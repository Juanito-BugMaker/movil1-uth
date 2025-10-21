import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final estilos = const TextStyle(fontSize: 45);
  final TextEditingController numeroControlTexto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Título', style: estilos),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Prueba numero', style: estilos),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: numeroControlTexto,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ingresa un número',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          double numero = double.parse(numeroControlTexto.text);
          print('Doble es: ${numero * 2}');
        },
      ),
    );
  }
}
