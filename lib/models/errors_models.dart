import 'dart:convert';
class Errors {
    Errors();

    factory Errors.fromJson(String str) => Errors.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Errors.fromMap(Map<String, dynamic> json) => Errors(
    );

    Map<String, dynamic> toMap() => {
      
    };
}
