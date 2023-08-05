import 'dart:convert';

class DigiDataModel {
    int id;
    String name;
    String href;
    String image;

    DigiDataModel({
        required this.id,
        required this.name,
        required this.href,
        required this.image,
    });

    factory DigiDataModel.fromRawJson(String str) => DigiDataModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DigiDataModel.fromJson(Map<String, dynamic> json) => DigiDataModel(
        id: json["id"],
        name: json["name"],
        href: json["href"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "href": href,
        "image": image,
    };
}
