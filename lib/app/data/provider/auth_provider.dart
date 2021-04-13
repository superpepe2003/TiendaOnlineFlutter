
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/login_model.dart';

final box = GetStorage();

class AuthProvider {
  final Dio dio = Get.find<Dio>();
  
  Future<LoginModel> login( String email, String password ) async {    

    final Response response = await dio.post('auth/login', 
                          data: { 'email': email, 'password': password},
                          options: Options(contentType:Headers.formUrlEncodedContentType ));
                          
    
    return LoginModel.fromJson( response.data );
  }

  Future<LoginModel> verificaToken( String token ) async {  

    Response response = await dio.post('auth/renew', 
                      data: { 'token': token },
                      options: Options(contentType:Headers.formUrlEncodedContentType ));
                    
    
    return LoginModel.fromJson( response.data );
    
  }

}