import 'dart:io';

import 'package:tienda_online_flutter/app/data/model/tienda_model.dart';
import 'package:tienda_online_flutter/app/data/provider/tienda_provider.dart';

class TiendaRepository {
  final TiendaProvider _api;

  TiendaRepository(this._api);

  Future<TiendaModel> getTiendaUser(String idUser) =>
      _api.getTiendaUser(idUser);

  Future<List<TiendaModel>> getTiendasCategoria(String categoria) =>
      _api.getTiendaCategoria(categoria);

  Future<TiendaModel> createTienda(TiendaModel tienda) =>
      _api.createTienda(tienda);

  Future<TiendaModel> updateTienda(TiendaModel tienda) =>
      _api.updateTienda(tienda);

  Future<String> subirImagen(File imagen, String id) =>
      _api.subirImagen(imagen, id);

  Future<List<TiendaModel>> getTiendas() => _api.getTiendas();
  Future<TiendaModel> getTienda(String id) => _api.getTienda(id);
}
