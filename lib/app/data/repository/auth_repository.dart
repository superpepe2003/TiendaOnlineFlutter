

import 'package:tienda_online_flutter/app/data/model/login_model.dart';
import 'package:tienda_online_flutter/app/data/provider/auth_provider.dart';

class AuthRepository {
  
  final AuthProvider _api;

  AuthRepository(this._api); // = Get.find<AuthProvider>();

  Future<LoginModel> login (String email, String password) => _api.login(email, password);

  Future<LoginModel> verificaToken (String token ) => _api.verificaToken(token);

}