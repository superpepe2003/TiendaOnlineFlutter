

import 'package:get/get.dart';
import 'package:tienda_online_flutter/app/data/model/producto_cart_model.dart';
import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/data/model/tienda_model.dart';
import 'package:tienda_online_flutter/app/data/repository/producto_repository.dart';

class TiendaController extends GetxController {

  Rx<TiendaModel> _tienda = TiendaModel().obs;

  ProductoRepository _repository = Get.find<ProductoRepository>();
  RxList<ProductoModel> _productos = List<ProductoModel>().obs;
  RxList<ProductoModel> _productosDestacados = List<ProductoModel>().obs;
  RxList<ProductoModel> _productosNormales = List<ProductoModel>().obs;
  RxList<ProductoCartModel> _productosCart = List<ProductoCartModel>().obs;
  RxBool _listadoCart = false.obs;

  double get totalPrecio => _productosCart.fold(0, (i, e) => i + (e.precio * e.cantidad) );
  int get count => _productosCart.fold(0, (i, e) => i + e.cantidad);

  int countProductos( String id) { 
    var index = _productosCart.indexWhere((p) => p.id == id);

    if( index < 0){
      return 0;
    } else {
      return _productosCart[index].cantidad;
    }

  }
  


  TiendaModel get tienda => _tienda.value;
  List<ProductoModel> get productos => _productos.toList();
  List<ProductoModel> get productosDestacados => _productosDestacados.toList();
  List<ProductoModel> get productosNormales => _productosNormales.toList();
  List<ProductoCartModel> get productosCart => _productosCart.toList();
  bool get listadoCart => _listadoCart.value;

  set listadoCart( bool value ) => _listadoCart.value = value;


  void agregarProductosCart( ProductoModel produc, { int i = 1 }) {
    int index = _productosCart.indexWhere((c) => c.id == produc.id);
    if( index < 0 ){
      _productosCart.add(ProductoCartModel(produc));
    } else {
      _productosCart[ index ].cantidad += i;
      if( _productosCart[index].cantidad == 0 ){
        _productosCart.removeAt(index);
      }
      _productosCart.refresh();
    }
  }

  void addProductos( String id, int i ) {

  }

  @override
  void onInit() async {
    
    super.onInit();
    _tienda.value = Get.arguments;    

    _productos.assignAll( await _repository.getProductosTienda(tienda.id) );
    _productosDestacados.assignAll(_productos.where( (r) => r.destacado == true).toList());
    _productosNormales.assignAll(_productos.where( (r) => r.destacado != true).toList());

  }

  @override
  void onClose() {
    print('NO TE VAS');
    //super.onClose();
  }

}