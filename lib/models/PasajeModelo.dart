// To parse this JSON data, do
//
//     final pasajeModelo = pasajeModeloFromJson(jsonString);
import 'dart:convert';

PasajeModelo pasajeModeloFromJson(String str) =>
    PasajeModelo.fromJson(json.decode(str));

String pasajeModeloToJson(PasajeModelo data) => json.encode(data.toJson());

class PasajeModelo {
  PasajeModelo({
    required this.rutas,
    required this.paradas,
  });

  List<Ruta> rutas;
  List<Parada> paradas;

  factory PasajeModelo.fromJson(Map<String, dynamic> json) => PasajeModelo(
        rutas: List<Ruta>.from(json["rutas"].map((x) => Ruta.fromJson(x))),
        paradas:
            List<Parada>.from(json["paradas"].map((x) => Parada.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "rutas": List<dynamic>.from(rutas.map((x) => x.toJson())),
        "paradas": List<dynamic>.from(paradas.map((x) => x.toJson())),
      };
}

class Parada {
  Parada({required this.id, required this.idRuta, required this.nombre});

  int id;
  int idRuta;
  String nombre;

  factory Parada.fromJson(Map<String, dynamic> json) =>
      Parada(id: json["id"], idRuta: json["id_ruta"], nombre: json["nombre"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "id_ruta": idRuta, "nombre": nombre};
}

class Ruta {
  Ruta({required this.id, required this.idEmpresa, required this.nombre});

  int id;
  int idEmpresa;
  String nombre;

  factory Ruta.fromJson(Map<String, dynamic> json) => Ruta(
      id: json["id"], idEmpresa: json["id_empresa"], nombre: json["nombre"]);

  Map<String, dynamic> toJson() =>
      {"id": id, "id_empresa": idEmpresa, "nombre": nombre};
}
