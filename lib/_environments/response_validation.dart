class ResponseValidation {

  final String responseExitoGet = '000';
  final String responseNoDatosGet = '001';
  final String responseErrorConsultaGet = '002';
  final String responseErrorGet = '003';

  final String responseExitoPost = '100';
  final String responseNoRegistraPost = '101';
  final String responseErrorRegistroPost = '102';

  final String responseExitoPut = '200';
  final String responseNoRegistraPut = '201';

  final String responseExitoDelete = '300';
  final String responseNoRegistraDelete = '301';

  final String responseAtrasoInjustificado = 'AI';
  final String responseFaltaInjustificada = 'FI';
  final String responseSalidaInjustificada = 'SI';
  final String responseExcesoReceso = 'ER';
  final String responseDiaLibre = 'LV';

  final int diaFinalPeriodo = 26;

  final String responseCodTurnoLibre = 'L-00';
  final String responseCodTurnoFeriado = 'F-00';
  final String responseCodTurnoVacacion = 'VC-00';
  

}
