import 'dart:convert';

import 'index.dart';


class ProspectoTypeResponse {
    ProspectoTypeResponse({
        required this.succeeded,
        this.message,
        required this.statusCode,
        required this.errors,
        this.data,
    });

    bool succeeded;
    dynamic message;
    String statusCode;
    Errors errors;
    ProspectoType? data;

    factory ProspectoTypeResponse.fromJson(String str) => ProspectoTypeResponse.fromMap(json.decode(str));

    factory ProspectoTypeResponse.fromMap(Map<String, dynamic> json) => ProspectoTypeResponse(
        succeeded: json["succeeded"],
        message: json["message"],
        statusCode: json["statusCode"].toString(),
        errors: Errors.fromMap(json["errors"]),
        data: json["data"] != null ? ProspectoType.fromMap(json["data"]) : null,
    );
/*
    Map<String, dynamic> toMap() => {
        "succeeded": succeeded,
        "message": message,
        "statusCode": statusCode,
        "errors": errors.toMap(),
        "data": data.toMap(),
    };
    */
}
