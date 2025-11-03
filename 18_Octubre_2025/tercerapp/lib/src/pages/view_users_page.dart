import 'package:flutter/material.dart';
import '../Services/usuario_service.dart';
import '../models/usuario.dart';

class ViewUsersPage extends StatefulWidget {
  @override
  _ViewUsersPageState createState() => _ViewUsersPageState();
}

class _ViewUsersPageState extends State<ViewUsersPage> {
  final TextEditingController _searchController = TextEditingController();
  final UsuarioService _usuarioService = UsuarioService();

  // Este Futuro almacenará los resultados de la búsqueda o la lista completa
  Future<List<Usuario>>? _usuariosFuture;

  @override
  void initState() {
    super.initState();
    // Opcional: Cargar todos los usuarios al iniciar la página
    // _verTodos();
  }

  // Llama al servicio para obtener todos los usuarios
  void _verTodos() {
    setState(() {
      _usuariosFuture = _usuarioService.getUsuarios();
    });
  }

  // Llama al servicio para buscar un usuario por ID
  void _buscarPorId() async {
    if (_searchController.text.isEmpty) return;

    try {
      final id = int.parse(_searchController.text);

      // Usamos 'await' para obtener el usuario y luego lo envolvemos en una lista
      // para que sea compatible con el Future<List<Usuario>>
      final usuario = await _usuarioService.getUsuarioPorId(id);

      setState(() {
        // Creamos un Futuro que ya está resuelto con la lista de un solo usuario
        _usuariosFuture = Future.value([usuario]);
      });
    } catch (e) {
      print("Error: $e");


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: Usuario no encontrado")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ver / Buscar Usuarios"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Barra de Búsqueda y Botones
            TextField(
              controller: _searchController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Buscar por ID",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _buscarPorId,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _verTodos,
              child: Text("Ver Todos los Usuarios"),
            ),
            SizedBox(height: 20),

            // Lista de Resultados
            Expanded(
              child: _buildUserList(),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para construir la lista de usuarios
  Widget _buildUserList() {
    // Si _usuariosFuture es nulo, no se ha buscado nada
    if (_usuariosFuture == null) {
      return Center(child: Text("."));
    }

    // Usamos FutureBuilder para manejar los estados de carga
    return FutureBuilder<List<Usuario>>(
      future: _usuariosFuture,
      builder: (context, snapshot) {
        //Estado de Carga
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        //Estado de Error
        if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        }

        //Estado sin Datos
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No se encontraron usuarios."));
        }

        //Estado con Datos
        final usuarios = snapshot.data!;
        return ListView.builder(
          itemCount: usuarios.length,
          itemBuilder: (context, index) {
            final usuario = usuarios[index];
            return ListTile(
              title: Text(usuario.nombre),
              subtitle: Text("ID: ${usuario.id}"),
            );
          },
        );
      },
    );
  }
}
