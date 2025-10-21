// este es para la clase usuario

class Usuario {
  final int id;
  final String nombre;
  Usuario({required this.id, required this.nombre});

  factory Usuario.fromJson(Map<String, dynamic>json){
    return Usuario(id: json['id'], 
    nombre: json['nombre'],
    );
  }
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'nombre': nombre.trim(),
    };
  }
}