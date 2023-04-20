import 'dart:convert';

import 'package:hidroapp/usuario/model/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

//recordar preferencia de usuario
class RecordarPrefeUs {
  static Future<void> guardarPreferenciaUsuario(User usuarioInfo) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String usuarioJsonData = jsonEncode(usuarioInfo.toJson());
    await preferences.setString("usuarioActual", usuarioJsonData);
  }
}
