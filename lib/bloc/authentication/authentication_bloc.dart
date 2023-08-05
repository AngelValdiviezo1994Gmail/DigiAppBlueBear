import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../_environments/index.dart';
import '../../models/index.dart';

import 'dart:convert'; 
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:local_auth/local_auth.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

/*
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
*/

const storage = FlutterSecureStorage();
FeatureApp objFeatureAppAuth = FeatureApp();

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  int obtieneToken = 0;
  UsuarioType objUsBloc = UsuarioType(
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
    id: '1',  
  );

  bool tieneFeatureNotificacion = false;

  AuthenticationBloc() : super(AuthenticationState(varObtieneToken: 0)) {
    on<OnNewAutenticacionEvent>(_onReInitPosition);
    on<GetNewAutenticacionEvent>(_onNewUser);
  }

  Future<void> init() async {
    add( OnNewAutenticacionEvent(obtieneToken),);
    add( GetNewAutenticacionEvent(objUsBloc),);
  }

  void _onReInitPosition( OnNewAutenticacionEvent event, Emitter<AuthenticationState> emit ) {
    emit( state.copyWith( getToken: obtieneToken ) );
  }

  void _onNewUser( GetNewAutenticacionEvent event, Emitter<AuthenticationState> emit ) {
    emit( state.copyWith( getToken: obtieneToken, objUsuario: objUsBloc ) );
  }

  void getPosicion() {
    //PosicionInicial 
    add(OnNewAutenticacionEvent(obtieneToken));
  }

  void setInicicaSesion(int obtuvoToken) {
    obtieneToken = obtuvoToken;
    add(OnNewAutenticacionEvent(obtuvoToken));
  }

  void setUsuarioLog(UsuarioType objUser) {
    objUsBloc = objUser;
    add(GetNewAutenticacionEvent(objUser));
  }


  @override
  //ignore: unnecessary_overrides
  Future<void> close() {
    return super.close();
  }

}
