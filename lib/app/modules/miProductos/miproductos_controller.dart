import 'dart:io';

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/data/repository/producto_repository.dart';

class MiProductosController extends GetxController {
  ProductoRepository _repository = Get.find<ProductoRepository>();
  RxList<ProductoModel> _productos = <ProductoModel>[].obs;
  String idTienda = '';

  //PROPIEDADES PARA CREAR UN PRODUCTO
  RxString _nombre = ''.obs;
  RxString _subtitulo = ''.obs;
  RxDouble _precio = (0.0).obs;
  RxBool _destacado = false.obs;
  RxBool _disponible = true.obs;

  RxBool _cargandoFoto = false.obs;
  RxInt _index = (-1).obs;
  Rx<File> _fileImagen = Rx<File>(null);

  bool isModificar = false;

  String Titulo = 'Productos';

  List<ProductoModel> get productos => _productos.toList();
  bool get cargandoFoto => _cargandoFoto.value;
  int get index => _index.value;

  String get nombre => _nombre.value;
  set nombre(String value) => _nombre.value = value;

  String get subtitulo => _subtitulo.value;
  set subtitulo(String value) => _subtitulo.value = value;

  double get precio => _precio.value;
  set precio(double value) => _precio.value = value;

  bool get destacado => _destacado.value;
  set destacado(bool value) => _destacado.value = value;

  bool get disponible => _disponible.value;
  set disponible(bool value) => _disponible.value = value;

  File get fileImagen => _fileImagen.value;
  set fileImagen(File value) => _fileImagen.value = value;

  @override
  void onInit() async {
    super.onInit();

    idTienda = Get.arguments;

    _productos.assignAll(await _repository.getProductosTienda(idTienda));
  }

  void grabarFoto(int index) async {
    _cargandoFoto.value = true;
    _index.value = index;

    try {
      String foto =
          await _repository.subirImagen(fileImagen, productos[index].id);
      productos[index].img = foto;
      productos[index] = await _repository.updateProducto(productos[index]);
      //_miTienda.refresh();
    } catch (e) {
      Get.snackbar('Error', 'Error al subir imagen');
    }

    _cargandoFoto.value = false;
    _index.value = -1;
  }

  Future<bool> guardarProducto() async {
    if (nombre.length > 0 && precio != null) {
      ProductoModel produ = ProductoModel();
      produ.nombre = nombre;
      produ.subtitulo = subtitulo;
      produ.precio = precio;
      produ.disponible = disponible;
      produ.destacado = destacado;
      produ.tienda = this.idTienda;
      try {
        produ = await _repository.createProducto(produ);

        this._productos.add(produ);

        return true;
      } catch (e) {
        Get.snackbar('Error', 'Error al grabar un producto');
      }
    } else {
      Get.snackbar('Error', 'El nombre y el precio son necesarios');
    }

    return false;
  }

  cargarProductoModificar(ProductoModel produ) {
    isModificar = true;
    nombre = produ.nombre;
    subtitulo = produ.subtitulo;
    precio = produ.precio;
    destacado = produ.destacado;
    disponible = produ.disponible;
  }

  limpiarCampos() {
    this.nombre = '';
    this.subtitulo = '';
    this.precio = 0;
    this.disponible = false;
    this.destacado = false;
    this.isModificar = false;
  }
}
