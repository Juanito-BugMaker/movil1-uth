import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

class UsuarioService {
  // URL usando HTTP y el emulador
  //final String baseUrl = "http://10.0.2.2:5238/api/Usuario";
  final String baseUrl = "http://127.0.0.1:5238/api/Usuario";

  // Crear usuario
  Future<String> crearUsuario(Usuario usuario) async {
    final jsonBody = jsonEncode(usuario.toJson());
    print("Request JSON: $jsonBody");

    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );

    print("Status Code: ${response.statusCode}");
    print("Response Body: ${response.body}");

    if (response.statusCode == 200) {
      return "Usuario agregado correctamente";
    } else {
      throw Exception(
          "Error al crear usuario: ${response.statusCode} - ${response.body}");
    }
  }

//Tarea de los chicos
  // Obtener lista de usuarios
  Future<List<Usuario>> getUsuarios() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((item) => Usuario.fromJson(item)).toList();
    } else {
      throw Exception("Error al obtener usuarios");
    }
  }
}