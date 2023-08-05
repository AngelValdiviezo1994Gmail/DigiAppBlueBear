part of 'authentication_bloc.dart';
/*
@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
*/

final String endPointLdap = CadenaConexion().apiEndPointLdap;
final String endPoint = CadenaConexion().apiEndpoint;
final String endPointWorkFlow = CadenaConexion().apiEndPointWorkFlow;
String tokenUserGeneral = '';
const storageGenial = FlutterSecureStorage();
bool authLocal = false;

UsuarioType? objRspUsuario;
  
final LocalAuthentication auth = LocalAuthentication(); 

//ignore: must_be_immutable
class AuthenticationState extends Equatable {

  final int varObtieneToken;
  
  UsuarioType objUs = UsuarioType(
    cedula: '',
    codArea: '',
    codScc: '',
    codUdn: '',
    codigo: '',
    colaborador: '',
    idJefe: '',
    idReemplazo: '',
    jefe: '',
    reemplazo: '',
    scc: '',
    udn: '',
    fotoPerfil: '',
    alias: '',
    celular: '',
    codigoConvivencia: '',
    codigoIntegracion: '',
    direccion: '',
    estado: '',
    fechaRegistro: DateTime.now(),
    indentificacionFamiliar: '',
    latitud: 0,
    longitud: 0,
    servicioActivo: true,
    sesionColaborador: '',
    tipoIdentificacionFamiliar: '',
    apellidos: 'Test',
    area: 'Test',
    cargo: 'Test',
    codigoEmpleado: 616,
    correo: 'Test',
    empresa: 'Test',
    fechaIngreso: DateTime.now(),
    grupoEmpresarial: 'Test',
    identificacion: 'Test',
    nombres: 'Test',
    rucEmpresa: 'Test',
    sueldo: 2000,
    tipoContrato: 'Test',
    tipoIdentificacion: 'Test',
    codEmpresa: 'Test',
    dispositivoId: 'Test',
    latitudLocalidad: 0,
    longitudLocalidad: 0,
    id: '1'
  );

  bool tieneFeatureNotificacion = false;
  int numNotificaciones = 0;

  AuthenticationState(
  {
    varObtieneToken = 0,
    objUs,
    lstBannerEnRolAppGen,
    numNotificaciones
  }) : varObtieneToken = varObtieneToken ?? 0;
  

  AuthenticationState copyWith({
    int? getToken,
    UsuarioType? objUsuario,
    int? cantNot
  }) 
  => AuthenticationState(
    varObtieneToken: getToken ?? varObtieneToken,
    objUs: objUsuario ?? objUs,
    numNotificaciones: cantNot ?? numNotificaciones
  );

  Future<String> readToken() async {
    try{
      
      var connectivityResult = await (Connectivity().checkConnectivity());
    
      if (connectivityResult != ConnectivityResult.mobile && connectivityResult != ConnectivityResult.wifi) {
        return 'NI';
      }

      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      String nombreSistemaOperativo = '';

      if(Platform.isAndroid) {
        nombreSistemaOperativo = 'Android';
      }
      
      if(Platform.isIOS) {
        nombreSistemaOperativo = 'iOS';
      }

      var inaccesoTemporal = await storage.read(key: 'inaccesoTemporal') ?? '';
      var objLleno = await storage.read(key: 'objUsuarioLleno') ?? '';
      if(objLleno != '') {
        var objTmp = await storage.read(key: 'objUsuario') ?? '';
        if(objTmp != '') 
        {
          objUs = UsuarioType.fromJson(objTmp);
          objUs.tipoCliente = await storage.read(key: 'tipoCliente') ?? '';
          bool permiteGestionPrincipalScreen = false;

          tieneFeatureNotificacion = permiteGestionPrincipalScreen;
        }
      }
      
      if(inaccesoTemporal == 'S') {
        return '';
      } else {
        final baseURL2 = '${endPointWorkFlow}Workflow/GetInfoCargoRolColaborador?identificacion=${objUs.identificacion}&uidCanal=${objFeatureAppAuth.featureDigiApp}';

        String tokenUser = await storage.read(key: 'jwtEnrolApp') ?? '';

        final responseLogin2 = await http.get(
          Uri.parse(baseURL2),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $tokenUser',
          },
        );

        if(responseLogin2.statusCode != 200) return '';

        var reponseRs2 = responseLogin2.body;
      }

      return await storage.read(key: 'jwtEnrolApp') ?? ''; 
    }
    catch(ex) {
      return '';
    }
    
  }

  Future<String> autenticacionLogin(String varNumIdVal, String passWord) async {

    String tipoCliente = await storage.read(key: 'tipoCliente') ?? '';

    try{
      final baseURL = '${endPointLdap}LdapUser/AuthenticateLdapUser'; 

      final response = await http.post(
        Uri.parse(baseURL),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>
        {
          "tipoCliente": tipoCliente,
          "identificacion": varNumIdVal,
          "password": passWord
        }
        ),
      ); 
    /*
      final clienteRsp = ClientTypeResponse.fromJson(response.body);//aquí va a variar el objeto de respuesta cuando se cree el token por el api
      tokenUserGeneral = clienteRsp.data;
      */

      storage.write(key: 'jwtEnrolApp', value: tokenUserGeneral);

      await readToken();
    }
    catch(_){
      return '';
    }

    if(tipoCliente == 'C') {
      return datosEmpleado(varNumIdVal);
    }

    return '';
  }

  Future<String> datosEmpleado(String numIdent) async {
    final baseURL = '${endPoint}Empleados/$numIdent';

    tokenUserGeneral = await readToken();

    final response = await http.get(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenUserGeneral',
      },
    );

    if(response.statusCode != 200) return '';


    final baseURL2 = '${endPointWorkFlow}Workflow/GetInfoCargoRolColaborador?identificacion=${objUs.identificacion}&uidCanal=${objFeatureAppAuth.featureDigiApp}';

    final responseLogin2 = await http.get(
      Uri.parse(baseURL2),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenUserGeneral',
      },
    );

    if(objRspUsuario != null) {
      storage.write(key: 'objUsuario', value: objRspUsuario!.toJson());
      storage.write(key: 'objUsuarioLleno', value: 'SI');
    } 
    
    return '${objRspUsuario?.toJson() ?? ''}___${objRspUsuario?.fotoPerfil}';
  }

  @override
  List<Object> get props => [varObtieneToken,objUs];
}