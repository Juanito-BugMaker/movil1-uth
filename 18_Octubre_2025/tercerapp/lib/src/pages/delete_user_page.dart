import 'package:flutter/material.dart';
import '../Services/usuario_service.dart';
import '../models/usuario.dart';

class DeleteUserPage extends StatefulWidget {
  @override
  _DeleteUserPageState createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
  final UsuarioService _usuarioService = UsuarioService();
  Future<List<Usuario>>? _usuariosFuture;

  @override
  void initState() {
    super.initState();
    // al abrir la pagina se cargan
    _cargarUsuarios();
  }

  // Función para (re)cargar la lista de usuarios
  void _cargarUsuarios() {
    setState(() {
      _usuariosFuture = _usuarioService.getUsuarios();
    });
  }

  // Función para manejar la eliminación
  void _eliminarUsuario(int id) async {
    try {
      // Llamar al servicio para eliminar
      String mensaje = await _usuarioService.deleteUsuario(id);

      // Muestra la SnackBar de éxito
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(mensaje)),
      );

      // Refresca la lista de usuarios
      _cargarUsuarios();

    } catch (e) {
      print("Error al eliminar: $e");
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al eliminar: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eliminar Usuario"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Menos padding para la lista
        child: _buildUserList(),
      ),
    );
  }

  // Widget para construir la lista (parecido a ViewUsersPage)
  Widget _buildUserList() {
    return FutureBuilder<List<Usuario>>(
      future: _usuariosFuture,
      builder: (context, snapshot) {
        // Estado de Carga
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        
        // Estado de Error
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }
        
        // Estado sin Datos
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No hay usuarios para eliminar."));
        }

        // Estado con Datos
        final usuarios = snapshot.data!;
        return ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            final usuario = usuarios[index];
            return Card( // Usamos Card para que se vea mejor
              child: ListTile(
                title: Text(usuario.nombre),
                subtitle: Text("ID: ${usuario.id}"),
                
                // Añadimos un botón de ícono al final de la fila
                trailing: IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red[700]),
                  onPressed: () {
                    _eliminarUsuario(usuario.id);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}