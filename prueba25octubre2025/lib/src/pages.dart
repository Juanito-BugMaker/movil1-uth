import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final TextEditingController palabra1 = TextEditingController();
  final TextEditingController palabra2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prueba 3'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: palabra1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Palabra 1',
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: palabra2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Palabra 2',
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print(palabra1.text + ' ' + palabra2.text);
        },
      ),
    );
  }
}
