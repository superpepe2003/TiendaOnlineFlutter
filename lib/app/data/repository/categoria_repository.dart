
import 'package:tienda_online_flutter/app/data/model/categoria_model.dart';
import 'package:tienda_online_flutter/app/data/provider/categoria_provider.dart';

class CategoriaRepository {

  final CategoriaProvider _api; //= Get.find<CategoriaProvider>();

  CategoriaRepository( this._api );

  Future<List<CategoriaModel>> getCategoria() => _api.getCategoria( );

}