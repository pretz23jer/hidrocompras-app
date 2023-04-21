import 'dart:ffi';

class User {
  String nombre;
  String apellido;
  String correo;
  String telefono;
  String password;

  User(
    this.nombre,
    this.apellido,
    this.correo,
    this.telefono,
    this.password,
  );

  factory User.fromJson(Map<String, dynamic> json) => User(
        json["id_usuario"],
        json["nombre"],
        json["apellido"],
        json["correo"],
        json["telefono"],
      );

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'telefono': telefono,
        'password': password,
      };
}
