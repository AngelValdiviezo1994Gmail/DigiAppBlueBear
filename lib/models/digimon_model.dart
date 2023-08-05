import 'dart:convert';

import 'index.dart';

class DigimonModel {
    List<DigiDataModel> content;
    Pageable pageable;

    DigimonModel({
        required this.content,
        required this.pageable,
    });

    factory DigimonModel.fromRawJson(String str) => DigimonModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DigimonModel.fromJson(Map<String, dynamic> json) => DigimonModel(
        content: List<DigiDataModel>.from(json["content"].map((x) => DigiDataModel.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
    );

    Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
    };
}
