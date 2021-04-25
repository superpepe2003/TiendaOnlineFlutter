import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';
import 'package:tienda_online_flutter/app/data/repository/user_repository.dart';
import 'package:get/route_manager.dart';

import 'loginregister_controller.dart';

class RegisterController extends GetxController {
  final UserRepository _repository = Get.find<UserRepository>();

  RxBool _mostrarPassword = true.obs;
  var _email = ''.obs;
  var _password = ''.obs;
  var _nombre = ''.obs;

  // ERRORES
  RxString _errorEmail = RxString(null);
  RxString _errorPassword = RxString(null);
  RxString _errorNombre = RxString(null);

  Rx<Function> _submitFunc = Rx<Function>(null);

  RxBool _isLoading = false.obs;

  // CONTROLLER DE REGISTER
  TextEditingController controllerNombre = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();

  /////////////////
  // METODOS GET
  ////////////////

  bool get mostrarPassword => _mostrarPassword.value;

  Function get submitFunc => _submitFunc.value;

  bool get isLoading => _isLoading.value;

  String get email => _email.value;
  String get password => _password.value;
  String get nombre => _nombre.value;

  String get errorEmail => _errorEmail.value;
  String get errorPassword => _errorPassword.value;
  String get errorNombre => _errorNombre.value;

  set mostrarPassword(bool value) {
    _mostrarPassword.value = value;
  }

  @override
  void onInit() async {
    debounce(_email, validarEmail, time: Duration(milliseconds: 500));
    debounce(_password, validarPassword, time: Duration(milliseconds: 500));
    debounce(_nombre, validarNombre, time: Duration(milliseconds: 500));
    _email.value = 'a@a.com';
    _password.value = '123123';

    _submitFunc.value = submitFunction();
    super.onInit();
  }

  /////////////////////
  /// METODOS DE CAMBIO
  /// /////////////////

  void emailChanged(String value) {
    _email.value = value;
  }

  void passwordChanged(String value) {
    _password.value = value;
  }

  void nombreChanged(String value) {
    _nombre.value = value;
  }

  validarEmail(String val) async {
    _errorEmail.value = null;

    if (!val.isEmail) {
      _errorEmail.value = 'Debe ingresar un email valido';
      _submitFunc.value = null;
    }
    if (errorEmail == null && errorPassword == null && errorNombre == null) {
      _submitFunc.value = submitFunction();
    }
  }

  ///////////////////////
  // METODOS PARA VALIDAR
  ///////////////////////

  validarPassword(String val) async {
    _errorPassword.value = null;
    if (val.length < 6) {
      _errorPassword.value = 'El password debe contener mínimo 6 caracteres';
      _submitFunc.value = null;
    }
    if (errorEmail == null && errorPassword == null && errorNombre == null) {
      _submitFunc.value = submitFunction();
    }
  }

  validarNombre(String val) async {
    _errorNombre.value = null;
    if (val.length < 1) {
      _errorNombre.value = 'El nombre no puede estar vacio';
      _submitFunc.value = null;
    }
    if (errorEmail == null && errorPassword == null && errorNombre == null) {
      _submitFunc.value = submitFunction();
    }
  }

  //////////////////////////
  ///CREAR USUARIO//////////
  //////////////////////////

  void Function() submitFunction() {
    return () async {
      _isLoading.value = true;
      Get.find<LoginregisterController>().isCargando = true;

      try {
        UsuarioModel result = await _repository.createUser(
            this._email.value, this._password.value, this._nombre.value);
        if (result.email != null) {
          Get.snackbar('Usuario', 'Usuario Creado',
              snackPosition: SnackPosition.BOTTOM);
          limpiarCampos();
        }
      } catch (e) {
        Get.snackbar('Error', 'El mail existe o hay datos incorrectos',
            snackPosition: SnackPosition.BOTTOM);
      }

      Get.find<LoginregisterController>().isCargando = false;
      _isLoading.value = false;
    };
  }

  void limpiarCampos() {
    this.controllerEmail.clear();
    this.controllerPassword.clear();
    this.controllerNombre.clear();
  }
}
