import 'dart:convert';

class ProspectoType {
    ProspectoType({
        required this.id,
        required this.tipoIdentificacion,
        required this.identificacion,
        required this.nombres,
        required this.apellidos,
        required this.alias,
        required this.celular,
        required this.grupoEmpresarial,
        required this.empresa,
        required this.codigoEmpresa,
        required this.area,
        required this.departamento,
        required this.fechaNacimiento,
        this.genero,
        this.direccion,
        required this.latitud,
        required this.longitud,
        required this.email,
        required this.fechaNacDate,
        required this.password,
        required this.tipoCliente,
        required this.autorizadoPor
    });

    String id;
    String tipoIdentificacion;
    String identificacion;
    String nombres;
    String apellidos;
    String alias;
    String celular;
    String grupoEmpresarial;
    String empresa;
    String codigoEmpresa;
    String area;
    String departamento;
    String fechaNacimiento = '';
    dynamic genero;
    dynamic direccion;
    double latitud;
    double longitud;
    String email;
    DateTime fechaNacDate;
    String password;
    String tipoCliente;
    String? autorizadoPor;

    factory ProspectoType.fromJson(String str) => ProspectoType.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProspectoType.fromMap(Map<String, dynamic> json) => ProspectoType(
        id: json["id"],
        tipoIdentificacion: json["tipoIdentificacion"],
        identificacion: json["identificacion"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        alias: json["alias"],
        celular: json["celular"],
        grupoEmpresarial: json["grupoEmpresarial"],
        empresa: json["empresa"],
        codigoEmpresa: json["codigoEmpresa"],
        area: json["area"],
        departamento: json["departamento"],
        fechaNacimiento: json["fechaNacimiento"] ?? '',
        genero: json["genero"],
        direccion: json["direccion"],
        latitud: double.parse(json["latitud"].toString()),
        longitud: double.parse(json["longitud"].toString()),
        email: json["email"],
        fechaNacDate: DateTime.now(),
        password: '',
        tipoCliente: json["tipoCliente"] ?? '',
        autorizadoPor: json["autorizadoPor"] ?? ''
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "tipoIdentificacion": tipoIdentificacion,
        "identificacion": identificacion,
        "nombres": nombres,
        "apellidos": apellidos,
        "alias": alias,
        "celular": celular,
        "grupoEmpresarial": grupoEmpresarial,
        "empresa": empresa,
        "codigoEmpresa": codigoEmpresa,
        "area": area,
        "departamento": departamento,
        "fechaNacimiento": fechaNacimiento,
        "genero": genero,
        "direccion": direccion,
        "latitud": latitud,
        "longitud": longitud,
        "email": email,
        "password": password,
        "tipoCliente": tipoCliente,
        "autorizadoPor": autorizadoPor
    };
}
