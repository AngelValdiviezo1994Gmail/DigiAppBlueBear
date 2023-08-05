import 'dart:convert';

class Pageable {
    int currentPage;
    int elementsOnPage;
    int totalElements;
    int totalPages;
    String previousPage;
    String nextPage;

    Pageable({
        required this.currentPage,
        required this.elementsOnPage,
        required this.totalElements,
        required this.totalPages,
        required this.previousPage,
        required this.nextPage,
    });

    factory Pageable.fromRawJson(String str) => Pageable.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        currentPage: json["currentPage"],
        elementsOnPage: json["elementsOnPage"],
        totalElements: json["totalElements"],
        totalPages: json["totalPages"],
        previousPage: json["previousPage"],
        nextPage: json["nextPage"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "elementsOnPage": elementsOnPage,
        "totalElements": totalElements,
        "totalPages": totalPages,
        "previousPage": previousPage,
        "nextPage": nextPage,
    };
}
