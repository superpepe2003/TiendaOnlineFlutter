

import 'dart:io';

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/data/repository/user_repository.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';

class PerfilController extends GetxController{
  final UserRepository _repository = Get.find<UserRepository>();
  UsuarioModel user = Get.find<UserService>().user;
  RxString _nombre = ''.obs;
  RxString _telefono = ''.obs;
  Rx<DateTime> _fechaNac = DateTime.now().obs;


  var _imagen = ''.obs;
  Rx<File> _fileImagen = Rx<File>( null );
  RxBool _isCargando = false.obs;
  
  String get imagen => _imagen.value;
  File get fileImagen => _fileImagen.value;
  bool get isCargando => _isCargando.value;

  String get nombre => _nombre.value;
  String get telefono => _telefono.value;
  DateTime get fechaNac => _fechaNac.value;
  
  set imagen( String value ) => _imagen.value = value;
  set fileImagen( File value ) => _fileImagen.value = value;

  set nombre( String value ) => _nombre.value = value;
  set telefono( String value ) => _telefono.value = value;
  set fechaNac( DateTime value ) => _fechaNac.value = value;

  @override
  void onInit() {
    nombre = user.nombre;
    telefono = user.telefono;
    fechaNac = user.fechaNac;
    super.onInit();
  }

  void grabarFoto() async {

    _isCargando.value = true;

    try {

      var user = Get.find<UserService>().user;
      String foto = await _repository.subirImagen( fileImagen, user.id );
      user.img = foto;
      await _repository.updateUser(user);      
    } catch (e) {
      Get.snackbar('Error', 'Error al subir imagen');
    }

    _isCargando.value = false;

  }

  void guardarPerfil() async {
    user.nombre = this.nombre;
    user.telefono = this.telefono;
    user.fechaNac = this.fechaNac;

    _isCargando.value = true;

    try {      
      await _repository.updateUser(user);      
      Get.snackbar('Grabado', 'Perfil Modificado');
    } catch (e) {
      Get.snackbar('Error', 'Error al subir imagen');
    }

    _isCargando.value = false;

  }
}