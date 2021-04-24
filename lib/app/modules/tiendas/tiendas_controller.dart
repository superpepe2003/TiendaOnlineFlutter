import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/tienda_model.dart';
import 'package:tienda_online_flutter/app/data/repository/tienda_repository.dart';

class TiendasController extends GetxController {
  final Box = GetStorage();

  RxList<TiendaModel> _tiendas = List<TiendaModel>().obs;
  TiendaRepository _repository = Get.find<TiendaRepository>();
  RxBool _cargando = false.obs;

  String categoria = '';

  bool get cargando => _cargando.value;
  List<TiendaModel> get tiendas => _tiendas.toList();

  List<dynamic> favoritos = [];

  @override
  void onInit() {
    categoria = Get.arguments;

    super.onInit();
    cargarTiendas();
    cargarFavoritos();
  }

  void cargarTiendas() async {
    _cargando.value = true;

    try {
      _tiendas.assignAll(await _repository.getTiendasCategoria(this.categoria));
    } catch (e) {}

    _cargando.value = false;
  }

  Future<void> actualizar() async {
    try {
      List<TiendaModel> item = await _repository.getTiendas();
      _tiendas.assignAll(item);
    } catch (e) {
      print(e);
    }
  }

  void cargarFavoritos() async {
    favoritos = await Box.read('favoritos') ?? [];
    print(favoritos);
  }

  bool buscarFavoritos(String id) {
    //if (favoritos == null) return false;
    return favoritos.contains(id);
  }

  void grabarFavoritos(String id) async {
    print(id);
    if (buscarFavoritos(id)) {
      favoritos.remove(id);
    } else {
      favoritos.add(id);
    }

    await Box.write('favoritos', favoritos);
    cargarFavoritos();
    update();
  }
}
