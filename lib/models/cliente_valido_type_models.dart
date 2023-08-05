
import 'dart:convert';

class ClienteValido {
    ClienteValido({
       required this.id,
       required this.codigoIntegracion,
       required this.codigoConvivencia,
       required this.tipoIdentificacion,
       required this.identificacion,
       required this.nombres,
       required this.apellidos,
       required this.alias,
       required this.latitud,
       required this.longitud,
       required this.direccion,
       required this.celular,
       required this.tipoIdentificacionFamiliar,
       required this.indentificacionFamiliar,
       required this.correo,
       required this.fechaRegistro,
       required this.servicioActivo,
       required this.estado,
    });

    String id;
    String codigoIntegracion;
    String codigoConvivencia;
    String tipoIdentificacion;
    String identificacion;
    String nombres;
    String apellidos;
    String alias;
    double latitud;
    double longitud;
    String direccion;
    String celular;
    String tipoIdentificacionFamiliar;
    String indentificacionFamiliar;
    String correo;
    DateTime fechaRegistro;
    bool servicioActivo;
    String estado;

    factory ClienteValido.fromJson(String str) => ClienteValido.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClienteValido.fromMap(Map<String, dynamic> json) => ClienteValido(
        id: json["id"],
        codigoIntegracion: json["codigoIntegracion"] ?? '',
        codigoConvivencia: json["codigoConvivencia"] ?? '',
        tipoIdentificacion: json["tipoIdentificacion"] ?? '',
        identificacion: json["identificacion"] ?? '',
        nombres: json["nombres"] ?? '',
        apellidos: json["apellidos"] ?? '',
        alias: json["alias"] ?? '',
        latitud: json["latitud"].toDouble(),
        longitud: json["longitud"].toDouble(),
        direccion: json["direccion"],
        celular: json["celular"],
        tipoIdentificacionFamiliar: json["tipoIdentificacionFamiliar"] ?? '',
        indentificacionFamiliar: json["IndentificacionFamiliar"] ?? '',
        correo: json["Correo"] ?? '',
        fechaRegistro: DateTime.parse(json["fechaRegistro"]),
        servicioActivo: json["servicioActivo"] ?? '',
        estado: json["estado"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "codigoIntegracion": codigoIntegracion,
        "codigoConvivencia": codigoConvivencia,
        "tipoIdentificacion": tipoIdentificacion,
        "identificacion": identificacion,
        "nombres": nombres,
        "apellidos": apellidos,
        "alias": alias,
        "latitud": latitud,
        "longitud": longitud,
        "direccion": direccion,
        "celular": celular,
        "tipoIdentificacionFamiliar": tipoIdentificacionFamiliar,
        "IndentificacionFamiliar": indentificacionFamiliar,
        "Correo": correo,
        "fechaRegistro": fechaRegistro.toIso8601String(),
        "servicioActivo": servicioActivo,
        "estado": estado,
    };
}
