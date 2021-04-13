

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';

class ProductoController extends GetxController {

  ProductoModel producto;
  
  @override
  void onInit() {
    super.onInit();

    producto = Get.arguments;
  }
}