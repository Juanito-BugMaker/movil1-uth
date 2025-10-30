import 'package:flutter/material.dart';
import '../Services/usuario_service.dart';
import '../models/usuario.dart';

class AddUser extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<AddUser> {
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final UsuarioService _usuarioService = UsuarioService();

  void _agregarUsuario() async {
    try {
      /* String usuario = _controller.text;
    if (usuario.isNotEmpty) {
      print("Usuario agregado: $usuario");
      _controller.clear();
    } else {
      print("No se agrego ningun usuario");
    }*/
      final usuario = Usuario(
          id: int.parse(_idcontroller.text), nombre: _nombreController.text);
      String mensaje = await _usuarioService.crearUsuario(usuario);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje)),
      );
      _idcontroller.clear();
      _nombreController.clear();
    } catch (e) {
      print("Error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al agregar el usuario")),
      );
    }
  }

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
        SnackBar(content: Text("Error al actualizar el usuario")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gestion de Usuarios"),
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
                labelText: "ID del Usuario",
              ),
            ),
            TextField(
              controller: _nombreController,
              decoration: InputDecoration(
                labelText: "Nombre del usuario",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _agregarUsuario,
              child: Text("Agregar"),
            ),
            SizedBox(height: 10), // Espaciado
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
