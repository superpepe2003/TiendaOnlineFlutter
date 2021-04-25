import 'dart:io';

import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/data/provider/user_provider.dart';

class UserRepository {
  final UserProvider _api;

  UserRepository(this._api);
  //= Get.find<UserProvider>();

  Future<UsuarioModel> createUser(
          String email, String password, String nombre) =>
      _api.createUser(email, password, nombre);

  Future<UsuarioModel> updateUser(UsuarioModel user) =>
      _api.updateUsuario(user);

  Future<String> subirImagen(File imagen, String id) =>
      _api.subirImagen(imagen, id);

  Future<List<UsuarioModel>> getUsers() => _api.getUsers();
}
