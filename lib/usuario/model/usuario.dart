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

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'apellido': apellido,
        'correo': correo,
        'telefono': telefono,
        'password': password,
      };
}
