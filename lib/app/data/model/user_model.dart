// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

UsuarioModel usuarioFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  UsuarioModel(
      {this.fechaNac,
      this.state,
      this.id,
      this.email,
      this.img,
      this.nombre,
      this.role,
      this.telefono,
      this.createdAt,
      this.updatedAt});

  DateTime fechaNac;

  bool state;
  String id;
  String email;
  String nombre;
  String role;
  String img;
  String telefono;
  DateTime createdAt;
  DateTime updatedAt;

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        fechaNac:
            json["fechaNac"] == null ? null : DateTime.parse(json["fechaNac"]),
        state: json["state"],
        id: json["_id"],
        email: json["email"],
        nombre: json["nombre"],
        role: json["role"],
        img: json["img"],
        telefono: json["telefono"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt:
            json["updateAt"] == null ? null : DateTime.parse(json["updateAt"]),
      );

  Map<String, dynamic> toJson() => {
        "fechaNac": fechaNac == null ? '' : fechaNac.toIso8601String(),
        "state": state,
        "email": email,
        "nombre": nombre,
        "role": role,
        "img": img,
        "telefono": telefono
      };
}
