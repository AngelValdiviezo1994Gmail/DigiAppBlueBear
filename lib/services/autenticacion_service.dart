import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pruebatecnicaav/models/index.dart';
import 'package:pruebatecnicaav/utils/index.dart';

import '../_environments/index.dart';

FeatureApp objFeatureAppAuth = FeatureApp();

class AutenticacionService extends ChangeNotifier{
  final String endPoint = CadenaConexion().apiEndpoint;
  final String endPointLdap = CadenaConexion().apiEndPointLdap;
  final String endPointWorkFlow = CadenaConexion().apiEndPointWorkFlow;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProspectoTypeResponse? objTipoRsp;
  ClienteValidoTypeResponse? objClienteValido;
  ClientTypeResponse? objRspReenvio;
  String tipoIdent = '';
  String numIdent = '';
  String passWord = '';
  String tokenUser = '';
  ClientTypeResponse? objRspInicioSesion;
  UsuarioTypeResponse? objRspUsuarioDatos;
  UsuarioType? objRspUsuario;

  final storage = const FlutterSecureStorage();

  bool isLoading = false;
  bool get varIsLoading => isLoading;
  set varIsLoading (bool value){
    isLoading = value;
    notifyListeners();
  }

  bool isLoadingCambioClave = false;
  bool get varIsLoadingCambioClave => isLoadingCambioClave;
  set varIsLoadingCambioClave (bool value){
    isLoadingCambioClave = value;
    notifyListeners();
  }

  String cedulaSelect = 'assets/BtnCedula_Gris.png';
  String pasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
  String colaboradorSelect = 'assets/BtnColaborador_Naranja.png';
  String familiarSelect = 'assets/BtnFamiliar_Gris.png';

  String get varColaboradorSelect => colaboradorSelect;
  set varColaboradorSelect (String value){
    colaboradorSelect = value;
    notifyListeners();
  }

  String get varFamiliarSelect => familiarSelect;
  set varFamiliarSelect (String value){
    familiarSelect = value;
    notifyListeners();
  }

  String get varCedulaSelect => cedulaSelect;
  set varCedulaSelect (String value){
    cedulaSelect = value;
    notifyListeners();
  }

  String get varPasaporteSelect => pasaporteSelect;
  set varPasaporteSelect (String value){
    pasaporteSelect = value;
    notifyListeners();
  }

  String varCedula = '';
  String varPasaporte = '';


  bool isOscured = true;
  bool get varIsOscured => isOscured;
  set varIsOscured (bool value){
    isOscured = value;
    notifyListeners();
  }

  bool isPasaporte = false;
  bool get varIsPasaporte => isPasaporte;
  set varIsPasaporte (bool value){
    isPasaporte = value;
    notifyListeners();
  }

  bool isValidForm(){
    return formKey.currentState?.validate() ?? false;
  }

  bool validaFormulario(String fecNac, String noGen, String noDir, String noCorreoVar){
    bool permiteIngreso = true;

    if(fecNac != '' && noGen != '' && noDir != '' && noCorreoVar != ''){
      permiteIngreso = false;
    }

    return permiteIngreso;
  }

  bool isValidFormAutenticacion(){
    var valCed = ValidacionesUtils().validaCedula(varCedula);
    if(valCed == 'Ok'){
      return true;
    }
    else{
      return false;
    }
    //return FormKey.currentState?.validate() ?? false;
  }

 
  Future<bool> datosEmpleado(String numIdent) async {
    final baseURL = '${endPoint}Empleados/$numIdent';

    tokenUser = await readToken();

    final responseLogin = await http.get(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $tokenUser',
      },
    );

    if(responseLogin.statusCode != 200) return false;

    var reponseRs = responseLogin.body;
    final objResp = UsuarioTypeResponse.fromJson(reponseRs);
    objRspUsuarioDatos = objResp;
    if(objResp.data != null) {
      
      objRspUsuario = objResp.data;
      
      final baseURL2 = '${endPointWorkFlow}Workflow/GetInfoCargoRolColaborador?identificacion=$numIdent&uidCanal=${objFeatureAppAuth.featureDigiApp}';

      final responseLogin2 = await http.get(
        Uri.parse(baseURL2),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $tokenUser',
        },
      );

      if(responseLogin2.statusCode != 200) return false;

      if(objRspUsuario != null) {
        storage.write(key: 'objUsuario', value: objRspUsuario!.toJson());
        storage.write(key: 'objUsuarioLleno', value: 'SI');
      } else {
        logOut();
      }
      return true;
    } else {

      return false;
    }
    
  }

  getClienteUser(String numIdent) async {
    try{
      final baseURL = '${endPoint}Clientes/GetClienteByIdentificacion/$numIdent';

      final varResponse = await http.get(Uri.parse(baseURL));
      if(varResponse.statusCode != 200) return null;

      final prospRsp = ClienteValidoTypeResponse.fromJson(varResponse.body);
      objClienteValido = prospRsp;
      notifyListeners();
    
    }
    catch(_) {
      
    }
  }

  autenticacion(String varNumIdVal, String password) async { 
    final baseURL = '${endPointLdap}LdapUser/AuthenticateLdapUser';

    String tipoCliente = await storage.read(key: 'tipoCliente') ?? '';
    //String tokenIdDevice = await FirebaseMessaging.instance.getToken() ?? '';

    final response = await http.post(
      Uri.parse(baseURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>
        {
          "tipoCliente": tipoCliente,
          "identificacion": varNumIdVal,
          "password": password,
          //"idDevice": tokenIdDevice
        }
      ),
    );

    var reponseRs = response.body;
    final clienteRsp = ClientTypeResponse.fromJson(reponseRs);//aquí va a variar el objeto de respuesta cuando se cree el token por el api
    tokenUser = clienteRsp.data;

    objRspInicioSesion = clienteRsp;
    storage.write(key: 'jwtEnrolApp', value: tokenUser);
    bool traeDataUser = false;//await datosEmpleado(varNumIdVal);
    traeDataUser = await datosEmpleado(varNumIdVal);
    

    if(!traeDataUser) {
      storage.write(key: 'jwtEnrolApp', value: '');
    }

    notifyListeners();
  }

  reenviaCorreoActivacion(String numIdent, String email) async {

    final baseURL = '${endPoint}Clientes/ReenviarActivacion?Identificacion=$numIdent&Correo=$email';

    final varResponse = await http.put(Uri.parse(baseURL));
    if(varResponse.statusCode != 200) return null;

    final prospRsp = ClientTypeResponse.fromJson(varResponse.body);
    objRspReenvio = prospRsp;
    notifyListeners();
  }

  Future logOut() async {
    await storage.delete(key: 'jwtEnrolApp');
    await storage.delete(key: 'objUsuario');
    await storage.delete(key: 'objUsuarioLleno');
    await storage.delete(key: 'objClienteEcommerce');
    await storage.delete(key: 'direccionEscogida');
    await storage.delete(key: 'idClienteEcommerce');
    await storage.delete(key: 'objUsuarioCargo');
    await storage.delete(key: 'inaccesoTemporal');
    await storage.delete(key: 'tipoCliente');
    await storage.delete(key: 'esEdicionData');
    await storage.delete(key: 'cedula');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'jwtEnrolApp') ?? '';
  }

  Future<String> readObjCliente() async {
    storage.write(key: 'objUsuarioLleno', value: '');
    return await storage.read(key: 'objUsuario') ?? ''; 
  }

}
