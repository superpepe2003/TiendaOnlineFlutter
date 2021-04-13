
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/categoria_model.dart';

class CategoriaProvider {

  final Dio dio = Get.find<Dio>();
  final box = GetStorage();

  CategoriaProvider() { 
    var token = box.read('token');
    dio.options.headers = { 'Authorization': 'bearer $token' };
  }

  Future<List<CategoriaModel>> getCategoria( ) async {

    dio.options.headers.addAll( { 'Content-Type': 'application/json' });                            

    Response response = await dio.get('categoria',            
            );

    if( response.data.length == 0 ) return null;
    var datos = response.data['data'];
    return datos.map<CategoriaModel>( (cat) => CategoriaModel.fromJson( cat )).toList();

  }

}