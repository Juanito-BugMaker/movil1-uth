import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/usuario.dart';

class UsuarioService {
  // URL base de tu API
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

  // Actualizar usuario
  Future<String> actualizarUsuario(Usuario usuario) async {
    final jsonBody = jsonEncode(usuario.toJson());
    print("Solicitud JSON (Actualizar): $jsonBody");

    final response = await http.put(
      Uri.parse("$baseUrl/${usuario.id}"),
      headers: {"Content-Type": "application/json"},
      body: jsonBody,
    );

    print("Codigo de estado (update): ${response.statusCode}");
    print("Cuerpo de la solicitud (update): ${response.body}");

    if (response.statusCode == 200) {
      return "Usuario actualizado correctamente";
    } else {
      throw Exception(
          "Error al actualizar usuario: ${response.statusCode} - ${response.body}");
    }
  }

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


  // Obtener un solo usuario por ID
  Future<Usuario> getUsuarioPorId(int id) async {
    final response = await http.get(Uri.parse("$baseUrl/$id"));

    if (response.statusCode == 200) {
      // Decodifica el cuerpo de la respuesta que es un solo objeto JSON
      return Usuario.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      throw Exception("Usuario no encontrado");
    } else {
      throw Exception("Error al obtener usuario: ${response.statusCode}");
    }
  }

}

