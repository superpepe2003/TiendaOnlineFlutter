

import 'dart:io';

import 'package:tienda_online_flutter/app/data/model/producto_model.dart';
import 'package:tienda_online_flutter/app/data/provider/producto_provider.dart';

class ProductoRepository {

  final ProductoProvider _api;

  ProductoRepository(this._api);

  Future<List<ProductoModel>> getProductosTienda( String idTienda ) => this._api.getProductosTienda(idTienda);

  Future<ProductoModel> createProducto( ProductoModel producto ) => _api.createProducto(producto);

  Future<ProductoModel> updateProducto( ProductoModel producto ) => _api.updateProducto(producto);

  Future<String> subirImagen( File imagen, String id) => _api.subirImagen(imagen, id);

}