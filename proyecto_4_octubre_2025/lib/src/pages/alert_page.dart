import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => _mostrarAlerta(context),
            child: Text('Mostrar Alerta'),
            style: TextButton.styleFrom(foregroundColor: Colors.amber)),
      ),

floatingActionButton: FloatingActionButton(
  child: Icon(Icons.logout, color: Colors.amber),
  onPressed: (){
    Navigator.pop(context);
  },
),

    );
  }
}

void _mostrarAlerta(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text("Este es el contenido de alerta"),
              FlutterLogo(
                size: 100.0,
              )
            ],
          ),
        );
      });
}
