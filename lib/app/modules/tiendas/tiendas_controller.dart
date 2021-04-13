

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/tienda_model.dart';
import 'package:tienda_online_flutter/app/data/repository/tienda_repository.dart';

class TiendasController extends GetxController{

  RxList<TiendaModel> _tiendas = List<TiendaModel>().obs;
  TiendaRepository _repository = Get.find<TiendaRepository>();
  RxBool _cargando = false.obs;

  bool get cargando => _cargando.value;
  List<TiendaModel> get tiendas => _tiendas.toList();

  @override
  void onInit() {
    
    super.onInit();
    cargarTiendas();
  }

  void cargarTiendas() async{

    _cargando.value = true;

    try {
      _tiendas.assignAll( await _repository.getTiendas());
    } catch (e) {
    }
    
    _cargando.value = false;
  }

  Future<void> actualizar() async {
    try {
      List<TiendaModel> item = await _repository.getTiendas();
      _tiendas.assignAll( item );
    } catch (e) {
      print(e);
    }
  }

}