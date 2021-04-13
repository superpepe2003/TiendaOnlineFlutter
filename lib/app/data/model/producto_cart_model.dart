

import 'package:tienda_online_flutter/app/data/model/producto_model.dart';

class ProductoCartModel extends ProductoModel {

  int cantidad = 0;
  bool enCart = false;

  ProductoCartModel( ProductoModel produ) {
    this.state= produ.state;
    this.disponible= produ.disponible;
    this.destacado= produ.destacado;
    this.id= produ.id;
    this.nombre= produ.nombre;
    this.subtitulo= produ.subtitulo;
    this.img= produ.img;
    this.precio= produ.precio;
    this.tienda= produ.tienda;
    this.createdAt= produ.createdAt;
    this.updatedAt= produ.updatedAt;
    this.cantidad = 1;
  }

}