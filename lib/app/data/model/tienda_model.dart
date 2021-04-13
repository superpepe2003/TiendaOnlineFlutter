import 'dart:convert';

TiendaModel tiendaModelFromJson(String str) => TiendaModel.fromJson(json.decode(str));

String tiendaModelToJson(TiendaModel data) => json.encode(data.toJson());

class TiendaModel {
    TiendaModel({
        this.state,
        this.categories,
        this.horarios,
        this.id,
        this.nombre,
        this.direccion,
        this.img,
        this.telefono,
        this.ubicacion,
        this.usuario,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    bool state;
    List<String> categories;
    List<String> horarios;
    String id;
    String nombre;
    String direccion;
    String img;
    String telefono;
    Ubicacion ubicacion;
    String usuario;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    factory TiendaModel.fromJson(Map<String, dynamic> json) => TiendaModel(
        state: json["state"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        horarios: List<String>.from(json["horarios"].map((x) => x)),
        id: json["_id"],
        nombre: json["nombre"],
        direccion: json["direccion"],
        img: json["img"],
        telefono: json["telefono"],
        ubicacion: (json["ubicacion"] == null )? null : Ubicacion.fromJson(json["ubicacion"]),
        usuario: json["usuario"],
        createdAt: json["createdAt"] == null 
                    ? null
                    :DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null 
                    ? null
                    :DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "state": state,
        "categories": List<dynamic>.from(categories.map((x) => x)),
        "horarios": (horarios == null )? '' : List<dynamic>.from(horarios.map((x) => x)),
        "nombre": nombre,
        "direccion": direccion,
        "img": img,
        "telefono": telefono,
        "ubicacion": (ubicacion == null)? null :ubicacion.toJson(),
        "usuario": usuario
    };
}

class Ubicacion {
    Ubicacion({
        this.latitud,
        this.longitud,
    });

    int latitud;
    int longitud;

    factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
        latitud: json["latitud"],
        longitud: json["longitud"],
    );

    Map<String, dynamic> toJson() => {
        "latitud": latitud,
        "longitud": longitud,
    };
}
