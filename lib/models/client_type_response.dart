import 'dart:convert';
import 'package:pruebatecnicaav/models/index.dart';

class ClientTypeResponse {
    ClientTypeResponse({
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
    String data;//este tipo de dato va a cambiar

    factory ClientTypeResponse.fromJson(String str) => ClientTypeResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ClientTypeResponse.fromMap(Map<String, dynamic> json) => ClientTypeResponse(
        succeeded: json["succeeded"] ?? false,
        message: json["message"] ?? '',
        statusCode: json["statusCode"] ?? '',
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] ?? '',
    );

    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors.toMap(),
        "data": data,
    };
}
