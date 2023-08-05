
import 'dart:convert';

import 'package:pruebatecnicaav/models/index.dart';

class UsuarioTypeResponse {
    UsuarioTypeResponse({
      required this.succeeded,
      required this.message,
      required this.statusCode,
      required this.errors,
      required this.data,
    });

    bool succeeded;
    String message;
    String statusCode;
    Errors? errors;
    UsuarioType? data;

    factory UsuarioTypeResponse.fromJson(String str) => UsuarioTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioTypeResponse.fromMap(Map<String, dynamic> json) => UsuarioTypeResponse(
        succeeded: json["succeeded"],
        message: json["message"],
        statusCode: json["statusCode"],
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] != null ? UsuarioType.fromMap(json["data"]) : null,
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors!.toMap(),
        "data": data!.toMap(),
    };
}
