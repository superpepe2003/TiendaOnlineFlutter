import 'dart:convert';

CategoriaModel categoriaModelFromJson(String str) =>
    CategoriaModel.fromJson(json.decode(str));

String categoriaModelToJson(CategoriaModel data) => json.encode(data.toJson());

class CategoriaModel extends Comparable {
  @override
  int compareTo(other) {
    int nameComp = this.nombre.compareTo(other.nombre);
    return nameComp;
  }

  CategoriaModel(
      {this.id,
      this.nombre,
      this.descripcion,
      this.state,
      this.createdAt,
      this.updateAt,
      //this.children,
      this.idPadre});

  String id;
  String nombre;
  String descripcion;
  bool state;
  DateTime createdAt;
  DateTime updateAt;
  //List<dynamic> children;
  String idPadre;

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
      id: json["_id"],
      nombre: json["nombre"],
      descripcion: json["descripcion"],
      state: json["state"],
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      updateAt:
          json["updateAt"] == null ? null : DateTime.parse(json["updateAt"]),
      //children: List<dynamic>.from(json["children"].map((x) => x)),
      idPadre: json["idPadre"]);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "descripcion": descripcion,
        "state": state,
        "idPadre": idPadre
        //"children": List<dynamic>.from(children.map((x) => x)),
      };
}
