import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/data/repository/user_repository.dart';

class UsuariosController extends GetxController {
  //TODO: Implement UsuariosController
  UserRepository _repository = Get.find<UserRepository>();

  RxList<UsuarioModel> _usuarios = List<UsuarioModel>().obs;
  List<UsuarioModel> get usuarios => this._usuarios.toList();
  set usuarios(value) => this._usuarios.assignAll(value);

  RxBool _isCargando = false.obs;
  bool get isCargando => this._isCargando.value;
  set isCargando(value) => this._isCargando.value = value;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    cargarUsuarios();
  }

  cargarUsuarios() async {
    isCargando = true;
    try {
      usuarios = await _repository.getUsers();
      _usuarios.refresh();
    } catch (e) {
      Get.snackbar('Error', 'No se puede cargar los usuarios');
    }
    isCargando = false;
  }

  updateUsuario(UsuarioModel user) async {
    isCargando = true;

    try {
      var index = usuarios.indexWhere((element) => element.id == user.id);
      usuarios[index] = await _repository.updateUser(user);
      _usuarios.refresh();
    } catch (e) {}

    isCargando = false;
  }
}
