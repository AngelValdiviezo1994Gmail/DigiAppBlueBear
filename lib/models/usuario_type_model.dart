import 'dart:convert';

class UsuarioType {
    UsuarioType({
      required this.id,
      required this.codigoEmpleado,
      required this.tipoIdentificacion,
      required this.identificacion,
      required this.nombres,
      required this.apellidos,
      required this.empresa,
      required this.cargo,
      required this.codEmpresa,
      required this.fechaIngreso,
      required this.area,
      required this.rucEmpresa,
      required this.grupoEmpresarial,
      required this.correo,
      required this.sueldo,
      required this.tipoContrato,
      required this.dispositivoId,
      required this.latitudLocalidad,
      required this.longitudLocalidad,
      this.fotoPerfil,
      required this.codigoIntegracion,
      required this.codigoConvivencia,
      required this.alias,
      required this.latitud,
      required this.longitud,
      required this.direccion,
      required this.celular,
      required this.tipoIdentificacionFamiliar,
      required this.indentificacionFamiliar,
      required this.fechaRegistro,
      required this.servicioActivo,
      required this.estado,
      required this.sesionColaborador,
      required this.codUdn,
      required this.udn,
      required this.codArea,
      required this.codScc,
      required this.scc,
      required this.colaborador,
      required this.cedula,
      required this.codigo,
      required this.idJefe,
      required this.jefe,
      required this.idReemplazo,
      required this.reemplazo
    }
  );

    String id;
    String? codUdn;
    String? udn;
    String? codArea;
    String? codScc;
    String? scc;
    String? colaborador;
    String? cedula;
    String? codigo;
    String? idJefe;
    String? jefe;
    String? idReemplazo;
    String? reemplazo;
    int codigoEmpleado;
    String celular;
    String tipoIdentificacion;
    String codigoIntegracion;
    String codigoConvivencia;
    String identificacion;
    String nombres;
    String apellidos;
    String empresa;
    String cargo;
    String codEmpresa;
    String alias;
    DateTime fechaIngreso;
    DateTime fechaRegistro;
    String area;
    String rucEmpresa;
    String grupoEmpresarial;
    String correo;
    String tipoIdentificacionFamiliar;
    String indentificacionFamiliar;
    dynamic sueldo;
    String tipoContrato;
    String dispositivoId;
    String direccion;
    double latitudLocalidad;
    double longitudLocalidad;
    double latitud;
    double longitud;
    String? fotoPerfil;
    String? idCliente;
    bool servicioActivo;
    String estado;
    String sesionColaborador;
    String? tipoCliente;
    String? direccionPrincipal;

    factory UsuarioType.fromJson(String str) => UsuarioType.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory UsuarioType.fromMap(Map<String, dynamic> json) => UsuarioType(
      id: json["id"] ?? '',
      codigoEmpleado: json["codigoEmpleado"] ?? 0,
      tipoIdentificacionFamiliar: json["tipoIdentificacionFamiliar"] ?? '',
      indentificacionFamiliar: json["IndentificacionFamiliar"] ?? '',
      tipoIdentificacion: json["tipoIdentificacion"] ?? '',
      celular: json["celular"] ?? '',
      codigoIntegracion: json["codigoIntegracion"] ?? '',
      codigoConvivencia: json["codigoConvivencia"] ?? '',
      direccion: json["direccion"] ?? '',
      identificacion: json["identificacion"] ??'',
      nombres: json["nombres"] ?? '',
      apellidos: json["apellidos"] ?? '',
      empresa: json["empresa"] ?? '',
      cargo: json["cargo"] ?? '',
      codEmpresa: json["codEmpresa"] ?? '',
      alias: json["alias"] ?? '',
      fechaIngreso: json["fechaIngreso"] != null ? DateTime.parse(json["fechaIngreso"]) : DateTime.now(),
      fechaRegistro: json["fechaRegistro"] != null ? DateTime.parse(json["fechaRegistro"]) : DateTime.now(),
      area: json["area"] ?? '',
      rucEmpresa: json["rucEmpresa"] ?? '',
      grupoEmpresarial: json["grupoEmpresarial"] ?? '',
      correo: json["correo"] ?? json["Correo"] ?? '',
      sueldo: json["sueldo"] ?? 0.0,
      tipoContrato: json["tipoContrato"] ?? '',
      dispositivoId: json["dispositivoId"] ?? '',
      fotoPerfil: json["fotoPerfil"] ?? '',
      latitudLocalidad: json["latitudLocalidad"]?.toDouble() ?? 0.0,
      longitudLocalidad: json["longitudLocalidad"]?.toDouble() ?? 0.0,
      latitud: json["latitudLocalidad"] != null ? json["latitudLocalidad"]?.toDouble() ?? 0.0 : json["latitud"]?.toDouble() ?? 0.0,
      longitud: json["longitudLocalidad"] != null ? json["longitudLocalidad"]?.toDouble() ?? 0.0 : json["longitud"]?.toDouble() ?? 0.0,      
      servicioActivo: json["servicioActivo"] ?? false,
      estado: json["estado"] ?? '',
      sesionColaborador: json["sesionColaborador"] ?? '',
      codUdn: json["codUdn"] ?? '',
      udn: json["udn"] ?? '',
      codArea: json["codArea"] ?? '',
      codScc: json["codScc"] ?? '',
      scc: json["scc"] ?? '',
      colaborador: json["colaborador"] ?? '',
      cedula: json["cedula"] ?? '',
      codigo: json["codigo"] ?? '',
      idJefe: json["idJefe"] ?? '',
      jefe: json["jefe"] ?? '',
      idReemplazo: json["idReemplazo"] ?? '',
      reemplazo: json["reemplazo"] ?? ''
    );

    Map<String, dynamic> toMap() => {
      "id": id,
      "codigoEmpleado": codigoEmpleado,
      "codUdn": codUdn,
      "udn": udn,
      "codArea": codArea,
      "codScc": codScc,
      "scc": scc,
      "colaborador": colaborador,
      "jefe": jefe,
      "tipoIdentificacion": tipoIdentificacion,
      "identificacion": identificacion,
      "nombres": nombres,
      "apellidos": apellidos,
      "empresa": empresa,
      "cargo": cargo,
      "codEmpresa": codEmpresa,
      "fechaIngreso": fechaIngreso.toIso8601String(),
      "area": area,
      "rucEmpresa": rucEmpresa,
      "grupoEmpresarial": grupoEmpresarial,
      "correo": correo,
      "sueldo": sueldo,
      "tipoContrato": tipoContrato,
      "dispositivoId": dispositivoId,
      "latitudLocalidad": latitudLocalidad,
      "longitudLocalidad": longitudLocalidad,
      "fotoPerfil": fotoPerfil,
      "sesionColaborador": sesionColaborador,
      "estado": estado,
      "servicioActivo": servicioActivo,
      "fechaRegistro": fechaRegistro.toIso8601String(),
      "indentificacionFamiliar": indentificacionFamiliar,
      "tipoIdentificacionFamiliar": tipoIdentificacionFamiliar,
      "celular": celular,
      "cedula": cedula,
      "codigo": codigo,
      "idReemplazo": idReemplazo,
      "reemplazo": reemplazo
    };
}