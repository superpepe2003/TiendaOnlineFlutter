import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/login_model.dart';
import 'package:tienda_online_flutter/app/data/repository/auth_repository.dart';
import 'package:tienda_online_flutter/app/data/service/user_service.dart';
import 'package:tienda_online_flutter/app/modules/loginregister/controller/loginregister_controller.dart';
import 'package:tienda_online_flutter/app/modules/root/root.dart';

class LoginController extends GetxController {
  final AuthRepository _repository = Get.find<AuthRepository>();

  final box = GetStorage();

  //Rx<UsuarioModel> _user = UsuarioModel().obs;
  var _email = 'a@a.com'.obs;
  var _password = '123123'.obs;
  RxString _errorEmail = RxString(null);
  RxString _errorPassword = RxString(null);
  Rx<Function> _loginFunc = Rx<Function>(null);
  RxBool _isLoading = false.obs;
  RxBool _mostrarPassword = true.obs;
  var controller;

  bool get mostrarPassword => _mostrarPassword.value;

  set mostrarPassword(bool value) {
    _mostrarPassword.value = value;
  }

  String get email => _email.value;
  String get password => _password.value;

  String get errorEmail => _errorEmail.value;
  String get errorPassword => _errorPassword.value;

  Function get loginFunc => _loginFunc.value;

  // UsuarioModel get user => _user.value;

  bool get isLoading => _isLoading.value;

  void emailChanged(String value) {
    _email.value = value;
  }

  void passwordChanged(String value) {
    _password.value = value;
  }

  @override
  void onInit() async {
    controller = Get.find<UserService>();
    debounce(_email, validarEmail, time: Duration(milliseconds: 500));
    debounce(_password, validarPassword, time: Duration(milliseconds: 500));
    _loginFunc.value = login();
    await verificaToken();
    super.onInit();
  }

  validarEmail(String val) async {
    _errorEmail.value = null;

    if (!val.isEmail) {
      _errorEmail.value = 'Debe ingresar un email valido';
      _loginFunc.value = null;
    }
    if (errorEmail == null && errorPassword == null) {
      _loginFunc.value = login();
    }
  }

  validarPassword(String val) async {
    _errorPassword.value = null;
    if (val.length < 6) {
      _errorPassword.value = 'El password debe contener mínimo 6 caracteres';
      _loginFunc.value = null;
    }
    if (errorEmail == null && errorPassword == null) {
      _loginFunc.value = login();
    }
  }

  verificaToken() async {
    String token = await box.read('token');
    Get.find<LoginregisterController>().isCargando = true;
    if (token != null) {
      try {
        LoginModel loginModel = await _repository.verificaToken(token);
        await box.write('token', loginModel.accessToken);
        controller.user = loginModel.user;
        controller.menu = loginModel.menu;

        Get.off(() => RootPage());
      } catch (e) {
        print(e);
      }
    }
    Get.find<LoginregisterController>().isCargando = false;
  }

  void Function() login() {
    return () async {
      Get.find<LoginregisterController>().isCargando = true;

      try {
        LoginModel loginModel =
            await _repository.login(this._email.value, this._password.value);
        await box.write('token', loginModel.accessToken);
        controller.user = loginModel.user;
        controller.menu = loginModel.menu;
        Future.delayed(Duration.zero, () {
          Get.off(() => RootPage());
        });
      } catch (e) {
        Get.snackbar('Login', 'Los datos no son correctos',
            snackPosition: SnackPosition.BOTTOM);
      }

      Get.find<LoginregisterController>().isCargando = false;
    };
  }
}
