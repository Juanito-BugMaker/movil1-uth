import 'package:flutter/material.dart';
import '../Services/usuario_service.dart';
import '../models/usuario.dart';

class UpdateUserPage extends StatefulWidget {
  @override
  _UpdateUserPageState createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final UsuarioService _usuarioService = UsuarioService();

  void _actualizarUsuario() async {
    try {
      final usuario = Usuario(
        id: int.parse(_idcontroller.text),
        nombre: _nombreController.text,
      );

      String mensaje = await _usuarioService.actualizarUsuario(usuario);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje)),
      );

      _idcontroller.clear();
      _nombreController.clear();
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al actualizar el usuario: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Actualizar Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _idcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "ID del Usuario a Actualizar",
              ),
            ),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: "Nuevo Nombre",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _actualizarUsuario,
              child: Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }
}