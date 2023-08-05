
import 'dart:convert';
import 'package:pruebatecnicaav/models/index.dart';

class ClienteValidoTypeResponse {
    ClienteValidoTypeResponse({
       required this.succeeded,
       required this.message,
       required this.statusCode,
       required this.errors,
       required this.data,
    });

    bool succeeded;
    String message;
    String statusCode;
    Errors errors;
    ClienteValido? data;

    factory ClienteValidoTypeResponse.fromJson(String str) => ClienteValidoTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClienteValidoTypeResponse.fromMap(Map<String, dynamic> json) => ClienteValidoTypeResponse(
        succeeded: json["succeeded"],
        message: json["message"],
        statusCode: json["statusCode"],
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] != null ? ClienteValido.fromMap(json["data"]) : null,
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors.toMap(),
        "data": data!.toMap(),
    };
}
