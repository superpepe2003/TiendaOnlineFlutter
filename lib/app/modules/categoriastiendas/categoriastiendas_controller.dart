import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tienda_online_flutter/app/data/model/categoria_model.dart';
import 'package:tienda_online_flutter/app/data/repository/categoria_repository.dart';
import '../../data/model/tienda_model.dart';
import '../../data/repository/tienda_repository.dart';
import 'local_widget/categoria_tab.dart';
import 'local_widget/favorito_tab.dart';

class CategoriastiendasController extends GetxController
    with SingleGetTickerProviderMixin {
  CategoriaRepository _repositoryCategoria = Get.find<CategoriaRepository>();
  TiendaRepository _repositoryTienda = Get.find<TiendaRepository>();
  final box = GetStorage();

  RxList<TiendaModel> _favoritos = <TiendaModel>[].obs;
  RxList<CategoriaModel> _categorias = <CategoriaModel>[].obs;
  RxList<CategoriaModel> _categoriasPadres = <CategoriaModel>[].obs;
  Map<String, List<CategoriaModel>> _categoriaHijas =
      Map<String, List<CategoriaModel>>().obs;
  RxInt _currentTab = 0.obs;

  RxBool _cargando = false.obs;
  bool get cargando => this._cargando.value;
  set cargando(bool value) => this._cargando.value = value;

  List<dynamic> fav = [];

  // Control de pantalla
  Widget currentScreen;
  int get currentTab => _currentTab.value;
  set currentTab(int value) => _currentTab.value = value;
  List<Widget> screens = [];
  PageStorageBucket bucket;

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

  List<TiendaModel> get favoritos => _favoritos.toList();

  ScrollController scrollController;

  RxDouble _percent = (0.0).obs;
  get percent => this._percent.value;
  set percent(value) => this._percent.value = value;

  double itemSize = Get.height * 0.30;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    cargarPantallas();
    cargarCategorias();
    scrollController = ScrollController();
    scrollController.addListener(onlisten);
    //scrollController.jumpTo(0);
  }

  onlisten() {
    update();
  }

  @override
  void onClose() {
    print('CERRADO');
    scrollController.removeListener(onlisten);
    scrollController.dispose();
    super.onClose();
  }

  void onReady() {
    cargarFavoritos();
  }

  // Control de pantalla
  void cargarPantallas() {
    bucket = PageStorageBucket();
    currentScreen = CategoriaTab();
    currentTab = 0;
    screens = [
      CategoriaTab(),
      FavoritoTab(),
    ];
  }

  void cargarCategorias() async {
    try {
      categorias = await _repositoryCategoria.getCategoria();

      this.categoriasPadres.assignAll(_categorias
          .toList()
          .where((element) => element.idPadre?.length == 0)
          .toList());

      if (currentPadre.length == 0) currentPadre = categoriasPadres[1]?.id;

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

  cargarFavoritos() async {
    this.cargando = true;
    _favoritos.clear();
    try {
      fav = await box.read('favoritos') ?? [];
      for (var s in fav) {
        TiendaModel tienda = await _repositoryTienda.getTienda(s);
        if (tienda != null) {
          _favoritos.add(tienda);
          _favoritos.refresh();
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Error al cargar los favoritos');
    }
    this.cargando = false;
    print(favoritos);
  }

  eliminarFavoritos(String id) async {
    fav.remove(id);
    _favoritos.removeWhere((element) => element.id == id);
    _favoritos.refresh();
    await box.write('favoritos', fav);
    update();
  }

  calcular(categoria, index) {
    var i = index;
    if (i % 2 > 0) {
      i = i - 1;
    }
    var itemPositionOffset = (((i / 2)) * itemSize);

    var difference = scrollController.offset - itemPositionOffset;
    percent = 1 - (difference / itemSize);
    if (percent > 1) percent = 1.0;
    if (percent < 0) percent = 0.0;

    if (index == 3) {
      print('$itemSize');
      print('${Get.height}');
    }
  }
}
