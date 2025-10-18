// hola como estas

import 'package:flutter/material.dart';
import 'package:proyecto_4_octubre_2025/src/providers/menu_provider.dart';
import 'package:proyecto_4_octubre_2025/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargaDatos(),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data ?? [], context),
        );
      },
    );
  }


  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];
    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.amber),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
        },
      );
      opciones
      ..add(widgetTemp)
      ..add(Divider());
    });

    return opciones;
  }


}
