import 'dart:convert';

class ClienteType {
  ClienteType({
    this.codigoEmpleado,
    this.tipoIdentificacion,
    this.identificacion,
    this.nombres,
    this.apellidos,
    this.empresa,
    this.cargo,
    this.fechaIngreso,
    this.area,
    this.rucEmpresa,
    this.grupoEmpresarial,
    this.correo,
    this.grupoCorporativoRrhh,
    this.sueldo,
    this.cargoCorporativoRrhh,
    this.encargadoCorporativoRrhh,
    //
    this.tipoNovedad,
    this.direccionEmpleado,
    this.tipoContrato,
    this.actividadSectorial,
    this.aportacionNominal,
    this.representanteLegal,
    this.sucursal,
    //
    this.observacion,
    this.totalIngresos,
    this.totalEgresos,
    this.netoPagar,
  });

  int? codigoEmpleado;
  String? tipoIdentificacion;
  String? identificacion;
  String? nombres;
  String? apellidos;
  String? empresa;
  String? cargo;
  DateTime? fechaIngreso;
  String? area;
  String? rucEmpresa;
  String? grupoEmpresarial;
  String? correo;
  String? grupoCorporativoRrhh;
  double? sueldo;
  String? cargoCorporativoRrhh;
  String? encargadoCorporativoRrhh;

  String? tipoNovedad;
  String? direccionEmpleado;
  String? tipoContrato;
  String? actividadSectorial;
  String? aportacionNominal;
  String? representanteLegal;
  String? sucursal;

  String? observacion;
  double? totalIngresos;
  double? totalEgresos;
  double? netoPagar;

  factory ClienteType.fromJson(String str) =>
      ClienteType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClienteType.fromMap(Map<String, dynamic> json) => ClienteType(
        codigoEmpleado: json["codigoEmpleado"],
        tipoIdentificacion: json["tipoIdentificacion"],
        identificacion: json["identificacion"],
        nombres: json["nombres"],
        apellidos: json["apellidos"],
        empresa: json["empresa"],
        cargo: json["cargo"],
        fechaIngreso: DateTime.parse(json["fechaIngreso"]),
        area: json["area"],
        rucEmpresa: json["rucEmpresa"],
        grupoEmpresarial: json["grupoEmpresarial"],
        correo: json["correo"],
        grupoCorporativoRrhh: json["grupoCorporativoRrhh"],
        sueldo: json["sueldo"],
        cargoCorporativoRrhh: json["cargoCorporativoRrhh"],
        encargadoCorporativoRrhh: json["encargadoCorporativoRrhh"],
        tipoNovedad: json["tipoNovedad"],
        direccionEmpleado: json["direccionEmpleado"],
        tipoContrato: json["tipoContrato"],
        actividadSectorial: json["actividadSectorial"],
        aportacionNominal: json["aportacionNominal"],
        representanteLegal: json["representanteLegal"],
        sucursal: json["sucursal"],
        observacion: json["observacion"],
        totalIngresos: json["totalIngresos"],
        totalEgresos: json["totalEgresos"],
        netoPagar: json["netoPagar"],
      );

  Map<String, dynamic> toMap() => {
        "codigoEmpleado": codigoEmpleado,
        "tipoIdentificacion": tipoIdentificacion,
        "identificacion": identificacion,
        "nombres": nombres,
        "apellidos": apellidos,
        "empresa": empresa,
        "cargo": cargo,
        "fechaIngreso": fechaIngreso,
        "area": area,
        "rucEmpresa": rucEmpresa,
        "grupoEmpresarial": grupoEmpresarial,
        "correo": correo,
        "grupoCorporativoRrhh": grupoCorporativoRrhh,
        "sueldo": sueldo,
        "cargoCorporativoRrhh": cargoCorporativoRrhh,
        "encargadoCorporativoRrhh": encargadoCorporativoRrhh,
        "tipoNovedad": tipoNovedad,
        "direccionEmpleado": direccionEmpleado,
        "tipoContrato": tipoContrato,
        "actividadSectorial": actividadSectorial,
        "aportacionNominal": aportacionNominal,
        "representanteLegal": representanteLegal,
        "sucursal": sucursal,
        "observacion": observacion,
        "totalIngresos": totalIngresos,
        "totalEgresos": totalEgresos,
        "netoPagar": netoPagar,
      };
}
