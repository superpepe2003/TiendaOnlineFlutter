

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';

class ProductoProvider {

  final Dio dio = Get.find<Dio>();
  final box = GetStorage();

  ProductoProvider() { 
    var token = box.read('token');
    dio.options.headers = { 'Authorization': 'bearer $token' };
  }

  Future<List<ProductoModel>> getProductosTienda( String idTienda ) async {
    Response response = await dio.get('producto/tienda/$idTienda');

    if( response.data.length == 0 ) return [];
    return response.data['data'].map<ProductoModel>( (p) => ProductoModel.fromJson(p)).toList();
  }

  Future<ProductoModel> createProducto( ProductoModel producto) async {    

    dio.options.headers.addAll( { 'Content-Type': 'application/json' });                            

    Response response = await dio.post('producto',
            data: producto.toJson())
            .catchError((e) => {
              print(e)
            });

    return ProductoModel.fromJson( response.data['data'] );

  }

  Future<ProductoModel> updateProducto( ProductoModel producto) async{

    dio.options.headers.addAll({ 'Content-Type': 'application/json' });                            

    Response response = await dio.put('producto/${producto.id}', data: producto.toJson())
                    .catchError((e){
                      return e.response;
                    });

    return ProductoModel.fromJson( response.data['data'] );
    
  }

  Future<String> subirImagen( File imagen, String id ) async {

    String fileName = imagen.path.split('/').last;

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile( imagen.path, filename: fileName),
    });

    var response = await dio.post( 'upload/producto/$id' , data: formData );

    return response.data['data'];
    
  }

}