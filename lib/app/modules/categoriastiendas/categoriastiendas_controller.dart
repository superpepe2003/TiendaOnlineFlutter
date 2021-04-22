import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/categoria_model.dart';
import 'package:tienda_online_flutter/app/data/repository/categoria_repository.dart';

class CategoriastiendasController extends GetxController {
  CategoriaRepository _repositoryCategoria = Get.find<CategoriaRepository>();

  RxList<CategoriaModel> _categorias = <CategoriaModel>[].obs;
  RxList<CategoriaModel> _categoriasPadres = <CategoriaModel>[].obs;
  Map<String, List<CategoriaModel>> _categoriaHijas =
      Map<String, List<CategoriaModel>>().obs;

  final _currentPadre = ''.obs;
  get currentPadre => this._currentPadre.value;
  set currentPadre(value) => this._currentPadre.value = value;

  List<CategoriaModel> get categoriasPadres => this._categoriasPadres;

  set categoriasPadres(List<CategoriaModel> value) =>
      this._categoriasPadres.assignAll(value);

  List<CategoriaModel> categoriasHijas(String idPadre) =>
      this._categoriaHijas[idPadre] ?? [];

  set categorias(List<CategoriaModel> value) =>
      this._categorias.assignAll(value);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    cargarCategorias();
  }

  void cargarCategorias() async {
    try {
      categorias = await _repositoryCategoria.getCategoria();

      this.categoriasPadres.assignAll(_categorias
          .toList()
          .where((element) => element.idPadre?.length == 0)
          .toList());

      if (currentPadre.length == 0) currentPadre = categoriasPadres[0]?.id;

      _categoriaHijas.clear();
      for (var e in this._categoriasPadres) {
        _categoriaHijas[e.id] =
            _categorias.where((el) => el.idPadre == e.id).toList();
      }
    } catch (e) {
      Get.snackbar('Error', 'Error al leer la tienda');
    }
  }

  CategoriaModel categoriaPadre(String id) {
    return this.categoriasPadres.firstWhere((element) => element.id == id);
  }
}
