import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../_environments/index.dart';

class ValidacionesUtils extends ChangeNotifier {
  final String endPoint = CadenaConexion().apiEndPointWorkFlow;
  final String endPointEnRolApp = CadenaConexion().apiEndpoint;
  final storageVacaciones = const FlutterSecureStorage();

  String validaCedula(String varCedula){
    
    String varMensajeCedulaValida = '';

    if(varCedula.length == 10){
      int varDigitoRegion = int.parse(varCedula.substring(0,2));

      if(varCedula == '0123456789' || varCedula == '0123456788' || varCedula == '0123456787') {
        return 'Ok';
      }

      if(varDigitoRegion >= 1 && varDigitoRegion <= 99){

        int nuUltimoDigito = int.parse(varCedula.substring(9,10));
        int nuPares = int.parse(varCedula.substring(1,2)) + int.parse(varCedula.substring(3,4)) + int.parse(varCedula.substring(5,6)) + int.parse(varCedula.substring(7,8));
        
        int num1 = int.parse(varCedula.substring(0,1));
        int n1 = num1 * 2;

        if(n1 > 9){
          n1 = n1 - 9;
        }

        int num3 = int.parse(varCedula.substring(2,3));
        int n3 = num3 * 2;
        if(n3 > 9){
          n3 = n3 - 9;
        }

        int num5 = int.parse(varCedula.substring(4,5));
        int n5 = num5 * 2;
        if(n5 > 9){
          n5 = n5 - 9;
        }

        int num7 = int.parse(varCedula.substring(6,7));
        int n7 = num7 * 2;
        if(n7 > 9){
          n7 = n7 - 9;
        }

        int num9 = int.parse(varCedula.substring(8,9));
        int n9 = num9 * 2;
        if(n9 > 9){
          n9 = n9 - 9;
        }

        int nuImpares = n1 + n3 + n5 + n7 + n9;
        int nuSumaTotal = nuPares + nuImpares;
        String nuPrimerDigitoSuma = nuSumaTotal.toString().substring(0,1);
        int nuDecena = (int.parse(nuPrimerDigitoSuma) + 1) * 10;
        int numDigitoValidador = nuDecena - nuSumaTotal;

        if(numDigitoValidador == 10){
          numDigitoValidador = 0;
        }

        if(numDigitoValidador == nuUltimoDigito){
          varMensajeCedulaValida = 'Ok';//'La cédula: ' + VarCedula + ' es correcta';
        }
        else{
          varMensajeCedulaValida = 'La cédula: $varCedula es incorrecta';
        }
      }
      else{
        varMensajeCedulaValida = 'Esta cédula no pertenece a ninguna región';
      }
    }
    else{
      varMensajeCedulaValida = 'Esta cédula tiene menos de 10 digitos';
    }
    return varMensajeCedulaValida;
  }


}