class API {
  //direccion donde se encuentra la api conexion ↓↓↓
  static const hostConnect = "http://192.168.1.9/api_plomero";
  static const hostConnectUser = "http://192.168.1.9/api_plomero/usuario";

  //registro de nuevo usuario
  static const crearUsuario =
      "http://192.168.1.9/api_plomero/usuario/crear_usuario.php";

  //validar si ya existe el correo electrónico
  static const validarCorreoUsuario =
      "http://192.168.1.9/api_plomero/usuario/validar_correo.php";

  //api para iniciar sesión por medio de la app
  static const loginUsuario =
      "http://192.168.1.9/api_plomero/usuario/login.php";

  //api para validar si existe registro este correo para recuperar
  static const validarCorreoRegistrado =
      "http://192.168.1.9/api_plomero/restaurar/validar_correo.php";

  //api para actualizar contraseña del usuario
  static const updatePaswordUser =
      "http://192.168.1.9/api_plomero/restaurar/actualizar_contrasena.php";
}
