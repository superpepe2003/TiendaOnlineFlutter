import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, MultipartFile, FormData;
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/tienda_model.dart';

class TiendaProvider {
  final Dio dio = Get.find<Dio>();
  final box = GetStorage();

  TiendaProvider() {
    var token = box.read('token');
    dio.options.headers = {'Authorization': 'bearer $token'};
  }

  Future<TiendaModel> getTiendaUser(String id) async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio.get(
      'tienda/usuario/$id',
    );

    if (response.data.length == 0) return TiendaModel();
    return TiendaModel.fromJson(response.data['data']);
  }

  Future<List<TiendaModel>> getTiendaCategoria(String categoria) async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio.get(
      'tienda/categoria/$categoria',
    );

    if (response.data.length == 0) return [];
    return response.data['data']
        .map<TiendaModel>((t) => TiendaModel.fromJson(t))
        .toList();
  }

  Future<List<TiendaModel>> getTiendas() async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio.get(
      'tienda/',
    );

    if (response.data.length == 0) return [];
    return response.data['data']
        .map<TiendaModel>((t) => TiendaModel.fromJson(t))
        .toList();
  }

  Future<TiendaModel> createTienda(TiendaModel miTienda) async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio
        .post('tienda', data: miTienda.toJson())
        .catchError((e) => {print(e)});

    return TiendaModel.fromJson(response.data['data']);
  }

  Future<TiendaModel> updateTienda(TiendaModel tienda) async {
    dio.options.headers.addAll({'Content-Type': 'application/json'});

    Response response = await dio
        .put('tienda/${tienda.id}', data: tienda.toJson())
        .catchError((e) {
      return e.response;
    });

    return TiendaModel.fromJson(response.data['data']);
  }

  Future<String> subirImagen(File imagen, String id) async {
    String fileName = imagen.path.split('/').last;

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imagen.path, filename: fileName),
    });

    var response = await dio.post('upload/tienda/$id', data: formData);

    return response.data['data'];
  }
}
