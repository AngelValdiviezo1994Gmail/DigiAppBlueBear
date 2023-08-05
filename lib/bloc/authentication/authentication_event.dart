part of 'authentication_bloc.dart';

/*
@immutable
abstract class AuthenticationEvent {}
*/


int obtieneTokenUsuario = 0;

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnNewAutenticacionEvent extends AuthenticationEvent {
  final int getTokenUser;
  const OnNewAutenticacionEvent(this.getTokenUser);
}

class GetNewAutenticacionEvent extends AuthenticationEvent {
  final UsuarioType objUsEv;
  const GetNewAutenticacionEvent(this.objUsEv);
}

setTokenAutenticacion(int value) {
  obtieneTokenUsuario = value;
}