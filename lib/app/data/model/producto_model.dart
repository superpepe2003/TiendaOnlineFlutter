import 'dart:convert';

ProductoModel productoModelFromJson(String str) => ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
    ProductoModel({
        this.state,
        this.disponible,
        this.destacado,
        this.id,
        this.nombre,
        this.subtitulo,
        this.img,
        this.precio,
        this.tienda,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    bool state;
    bool disponible;
    bool destacado;
    String id;
    String nombre;
    String subtitulo;
    String img;
    double precio;
    String tienda;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory ProductoModel.fromJson(Map<String, dynamic> json) => ProductoModel(
        state: json["state"],
        id: json["_id"],
        disponible: json["disponible"],
        destacado: json["destacado"],
        nombre: json["nombre"],
        subtitulo: json["subtitulo"],
        img: json["img"],
        precio: (json["precio"]).toDouble(),
        tienda: json["tienda"],
        createdAt: (json["createdAt"] == null) ? null : DateTime.parse(json["createdAt"]),
        updatedAt: (json["updatedAt"] == null) ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "disponible": disponible,
        "destacado": destacado,
        "nombre": nombre,
        "subtitulo": subtitulo,
        "img": img,
        "precio": precio,
        "tienda": tienda
    };
}
