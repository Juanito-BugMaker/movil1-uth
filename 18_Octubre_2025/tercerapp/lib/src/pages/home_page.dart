import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Usuarios'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                child: Text('Agregar Usuario'),
                onPressed: () {
                  Navigator.pushNamed(context, '/add');
                },
              ),
              SizedBox(height: 12),
              ElevatedButton(
                child: Text('Actualizar Usuario'),
                onPressed: () {
                  Navigator.pushNamed(context, '/update');
                },
              ),
              SizedBox(height: 12),
              ElevatedButton(
                child: Text('Ver o Buscar Usuarios'),
                onPressed: () {
                  Navigator.pushNamed(context, '/view');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}