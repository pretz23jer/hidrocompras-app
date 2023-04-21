class API {
  //direccion donde se encuentra la api conexion ↓↓↓
  static const hostConnect =
      "https://electriconenergy.com.gt/hidroapp/api_plomero";
  static const hostConnectUser =
      "https://electriconenergy.com.gt/hidroapp/api_plomero/usuario";

  //registro de nuevo usuario
  static const crearUsuario =
      "https://electriconenergy.com.gt/hidroapp/api_plomero/usuario/crear_usuario.php";

  //validar si ya existe el correo electrónico
  static const validarCorreoUsuario =
      "https://electriconenergy.com.gt/hidroapp/api_plomero/usuario/validar_correo.php";

  //api para iniciar sesión por medio de la app
  static const loginUsuario =
      "https://electriconenergy.com.gt/hidroapp/api_plomero/usuario/login.php";

  //api para validar si existe registro este correo para recuperar
  static const validarCorreoRegistrado =
      "https://electriconenergy.com.gt/hidroapp/api_plomero/restaurar/validar_correo.php";

  //api para actualizar contraseña del usuario
  static const updatePaswordUser =
      "https://electriconenergy.com.gt/hidroapp/api_plomero/restaurar/actualizar_contrasena.php";
}
