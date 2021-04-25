import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/user_model.dart';

class UserProvider {
  final Dio dio = Get.find<Dio>();
  final box = GetStorage();

  UserProvider() {
    var token = box.read('token');
    dio.options.headers = {'Authorization': 'bearer $token'};
  }

  Future<UsuarioModel> createUser(
      String email, String password, String nombre) async {
    Response response = await dio.post('usuario',
        data: {
          'email': email,
          'password': password,
          'nombre': nombre,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));

    return UsuarioModel.fromJson(response.data['data']);
  }

  Future<UsuarioModel> updateUsuario(UsuarioModel user) async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio
        .put('usuario/${user.id}', data: user.toJson())
        .catchError((e) {
      return e;
    });

    return UsuarioModel.fromJson(response.data);
  }

  Future<String> subirImagen(File imagen, String id) async {
    String fileName = imagen.path.split('/').last;

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagen.path, filename: fileName),
    });

    var response = await dio.post('upload/usuario/$id', data: formData);

    return response.data['data'];
  }

  Future<List<UsuarioModel>> getUsers() async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio.get('usuario/').catchError((e) {
      return e;
    });

    if (response.data.length == 0) return [];
    return response.data['data']
        .map<UsuarioModel>((t) => UsuarioModel.fromJson(t))
        .toList();
  }
}
