

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pruebatecnicaav/services/index.dart';
import 'package:pruebatecnicaav/ui/index.dart';

import '../../_environments/index.dart';
import '../../models/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../utils/index.dart';
import '../index.dart';


String numIdentAut = '';
MensajesAlertas objMensajesAutenticacion = MensajesAlertas();
bool esIdentificacionInvalida = false;
ColoresApp objColoresLog = ColoresApp();
const storageAutenticacion = FlutterSecureStorage();


class AuthenticationScreen extends StatefulWidget {
  static const String routerName = 'autentificacionScreen';


  const AuthenticationScreen({
    Key? key,
  }) : super(key: key);

  @override
  AuthenticationScreenState createState() => AuthenticationScreenState();
}

class AuthenticationScreenState extends State<AuthenticationScreen> {
  TextEditingController? varControllerState;

  @override
  void initState() {
    storageAutenticacion.write(key: 'tipoCliente', value: 'C');
    varControllerState = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          width: sizeScreen.width,
          height: sizeScreen.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/InicioSesion.png'),
                fit: BoxFit.cover,
              ),
              color: Colors.transparent),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Center(
                child: ChangeNotifierProvider(
                  create: (_) => AutenticacionService(),
                  child: TipoIdentEvntLog(null,varControllerState!),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//ignore: must_be_immutable
class TipoIdentEvntLog extends StatelessWidget {
  TextEditingController? varControllerState2;

  TipoIdentEvntLog(Key? key, TextEditingController contValida) : super (key: key) {
    varControllerState2 = contValida;
  }

  @override
  Widget build(BuildContext context) {
    final tipoIdentificacion = Provider.of<AutenticacionService>(context);
    final sizeScreenAutenticacion = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      height: sizeScreenAutenticacion.height * 0.97,
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: sizeScreenAutenticacion.height * 0.12,
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  shape: const CircleBorder(),
                  disabledColor: Colors.white,
                  elevation: 0,
                  color: Colors.transparent,
                  child: Container(
                    color: Colors.transparent,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(builder: (context) => const SplashScreen()),
                    );
                  }
                ),
                MaterialButton(
                  shape: const CircleBorder(),
                  disabledColor: Colors.white,
                  elevation: 0,
                  color: Colors.transparent,
                  child: Container(
                    color: Colors.transparent,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onPressed: () => exit(0),
                ),
              ],
            ),
          ),
          
          Container(
            color: Colors.transparent,
            width: sizeScreenAutenticacion.width * 0.89,
            height: sizeScreenAutenticacion.height * 0.58,
            child: Column(
              children: [
                Container(
                  width: sizeScreenAutenticacion.width * 0.9,
                  height: sizeScreenAutenticacion.height * 0.22,
                  color: Colors.transparent,
                  child: Image(
                    image: const AssetImage(
                      'assets/IcInicioSesion.png',
                    ),
                    width: sizeScreenAutenticacion.width,
                    height: sizeScreenAutenticacion.height * 0.28,
                  ),
                ),
                
                Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.transparent,
                  child: const Text(
                    ' con mi',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )
                ),

                Container(
                  color: Colors.transparent,
                  width: sizeScreenAutenticacion.width * 0.92,
                  height: sizeScreenAutenticacion.height * 0.18,
                  child: Row(
                    children: [
                      Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Container(
                              height: sizeScreenAutenticacion.height * 0.07,
                              width: sizeScreenAutenticacion.width * 0.17,
                              color: Colors.transparent,
                              alignment: Alignment.bottomCenter,
                              child: GestureDetector(
                                onTap: () {
                                  tipoIdentificacion.varCedulaSelect = 'assets/BtnCedula_Gris.png';
                                  tipoIdentificacion.varPasaporteSelect = 'assets/BtnPasaporte_Blanco.png';
                                  tipoIdentificacion.varIsPasaporte = false;
                                  varControllerState2!.clear();
                                  FocusScope.of(context).unfocus();
                                },
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: sizeScreenAutenticacion.height * 0.068,
                                    width: sizeScreenAutenticacion.width * 0.17,
                                    color: Colors.transparent,
                                    child: Image(
                                      image: AssetImage(tipoIdentificacion.varCedulaSelect),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: sizeScreenAutenticacion.height * 0.09,
                              width: sizeScreenAutenticacion.width * 0.17,
                              color: Colors.transparent,
                              alignment: Alignment.topCenter,
                              child: GestureDetector(
                                onTap: () {
                                  tipoIdentificacion.varCedulaSelect = 'assets/BtnCedula_Blanco.png';
                                  tipoIdentificacion.varPasaporteSelect = 'assets/BtnPasaporte_Gris.png';
                                  tipoIdentificacion.varIsPasaporte = true;
                                  varControllerState2!.clear();
                                  FocusScope.of(context).unfocus();
                                },
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: sizeScreenAutenticacion.height * 0.07,
                                    width: sizeScreenAutenticacion.width * 0.17,
                                    color: Colors.transparent,
                                    child: Image(
                                      image: AssetImage(tipoIdentificacion.varPasaporteSelect),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        width: sizeScreenAutenticacion.width * 0.7, //- 171,//360,
                        height: sizeScreenAutenticacion.height * 0.15,
                        alignment: Alignment.topCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              color: Colors.transparent,
                              width: sizeScreenAutenticacion.width * 0.7,
                              height: sizeScreenAutenticacion.height * 0.008,
                              alignment: Alignment.bottomCenter,
                            ),
                            Container(
                              color: Colors.transparent,
                              width: sizeScreenAutenticacion.width * 0.7, 
                              height: sizeScreenAutenticacion.height * 0.11,
                              alignment: Alignment.topCenter,
                              child: ValidacionAuthenticationForm(null,tipoIdentificacion.varIsPasaporte, varControllerState2!),
                            ),
                            Container(
                              color: Colors.transparent,
                              width: sizeScreenAutenticacion.width * 0.7, 
                              height: sizeScreenAutenticacion.height * 0.024,//0.027
                              alignment: Alignment.bottomCenter,
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              
              ],
            ),
          ),

          Container(
            color: Colors.transparent,
            width: sizeScreenAutenticacion.width * 0.84,
            height: sizeScreenAutenticacion.height * 0.07,
            child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 10,
                color: objColoresLog.digiNaranja,
                child: Container(
                  color: Colors.transparent,
                  child: !tipoIdentificacion.varIsLoading
                  ? const Text(
                      'Continuar',
                      style: TextStyle(color: Colors.white, fontSize: 20)
                    )
                  : SpinKitFadingCircle(
                      itemBuilder: (BuildContext context, int index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: index.isEven
                            ? Colors.black12
                            : Colors.white,
                          ),
                        );
                      },
                    )
                  ),
                onPressed: () async {
                      
                  if(!tipoIdentificacion.varIsLoading) {
                    if((tipoIdentificacion.varCedula == '' && !tipoIdentificacion.varIsPasaporte) || (tipoIdentificacion.varPasaporte == '' && tipoIdentificacion.varIsPasaporte)) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => 
                            AutenticacionErrorScreen(null,'Ingresa tu número de identificación.','','numIdentVacia.png',false,false,'','')
                        ),
                      );
                      return;
                    }

                    if(!tipoIdentificacion.varIsPasaporte && tipoIdentificacion.varCedula.length < 10) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => 
                            AutenticacionErrorScreen(null,'Número de identificación inválida.','','numIdentInvalida.png',false,false,'','')
                        ),
                      );
                      return;
                    }

                    if(tipoIdentificacion.varIsPasaporte && tipoIdentificacion.varPasaporte.length < 19) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => 
                            AutenticacionErrorScreen(null,'Número de identificación inválida, debe tener 19 caracteres.','','numIdentInvalida.png',false,false,'','')
                        ),
                      );
                      return;
                    }

                    if(esIdentificacionInvalida) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => 
                            AutenticacionErrorScreen(null,'Número de identificación inválida.','','numIdentInvalida.png',false,false,'','')
                        ),
                      );
                      return;
                    }

                    FocusScope.of(context).unfocus();
                    tipoIdentificacion.varIsLoading = true;
                    
                    String respt = ValidacionesUtils().validaCedula(tipoIdentificacion.varCedula);

                    if(respt.toLowerCase() != 'ok') {
                      Fluttertoast.showToast(
                        msg: "Número de identificación inválido.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                      );
                      return;
                    }

                    if(!tipoIdentificacion.varIsPasaporte && tipoIdentificacion.varCedula.length == 10) {
                      await tipoIdentificacion.getClienteUser(tipoIdentificacion.varCedula);
                    }

                    tipoIdentificacion.varIsLoading = false;

                    if(tipoIdentificacion.objClienteValido == null) {
                      Fluttertoast.showToast(
                        msg: "La consulta de datos del usuario no trae datos.",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 5,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                      );
                      return;
                    }

                    if(tipoIdentificacion.objClienteValido!.data == null) {
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => 
                            AutenticacionErrorScreen(null,tipoIdentificacion.objClienteValido?.message ?? 'Recuerda que para iniciar sesión debes estar suscrito','','cedulaIncorrecta.png',false, tipoIdentificacion.objClienteValido!.message.toLowerCase().contains('activar') ? true : false,tipoIdentificacion.objClienteValido!.message.toLowerCase().contains('activar') ? tipoIdentificacion.varCedula : '','')
                        ),
                      );
                      return;
                    }

                    if(tipoIdentificacion.objClienteValido != null && tipoIdentificacion.objClienteValido!.message.toLowerCase().contains('activar')) {
                      
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => ContraseniaScreen(numIdentificacion: tipoIdentificacion.varCedula)),
                      );
                      return;
                    }

                    if (respt.toLowerCase() == 'ok' && tipoIdentificacion.objClienteValido!.succeeded) {
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(builder: (context) => ContraseniaScreen(numIdentificacion: tipoIdentificacion.varCedula)),
                      );
                    } else {
                      if(!tipoIdentificacion.objClienteValido!.succeeded) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => 
                              AutenticacionErrorScreen(null,objMensajesAutenticacion.mensajeErrorInicioSesion,'','numIdentValido.png',false,false,'','')
                          ),
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => 
                              AutenticacionErrorScreen(null,objMensajesAutenticacion.mensajeErrorIdentificacion,'','numIdentValido.png',false,false,'','')
                          ),
                        );
                      }
                    }
                  } 
                }
              ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            color: Colors.transparent,
            width: sizeScreenAutenticacion.width * 0.8,
            height: sizeScreenAutenticacion.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      //height: 62,
                      width: sizeScreenAutenticacion.width * 0.3, //125,
                      height: sizeScreenAutenticacion.height * 0.27,
                      color: Colors.transparent,
                      child: const Image(
                        image: AssetImage('assets/PrimeraVez.png'),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  width: sizeScreenAutenticacion.width * 0.33, //160, // alto para el botón
                  //height: sizeScreenAutenticacion.height * 0.2,
                  child: MaterialButton(
                    child: Container(
                      color: Colors.transparent,
                      child: AutoSizeText(
                        'Sí, quiero suscribirme',
                        style: TextStyle(color: objColoresLog.digiNaranja),
                        maxLines: 2,
                        presetFontSizes: const [15, 13, 11, 9],
                      )
                    ),
                    onPressed: () {
                      /*
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) => const TipoSuscriptorScreen(),
                        ),
                      );
                      */
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//ignore: must_be_immutable
class ValidacionAuthenticationForm extends StatelessWidget {
  TextEditingController? varControllerValidarPrinc;
  bool varEsPasaporte = false;

  ValidacionAuthenticationForm(Key? key, bool esPasaporte, TextEditingController varControllerValidar) : super (key: key) {
    varEsPasaporte = esPasaporte;
    varControllerValidarPrinc = varControllerValidar;
  }

  @override
  Widget build(BuildContext context) {
    final tipoIdentificacion = Provider.of<AutenticacionService>(context);

    return Container(
      color: Colors.transparent,
      child: Form(
        key: tipoIdentificacion.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: varEsPasaporte
        ? TextFormField(
            controller: varControllerValidarPrinc,
            style: const TextStyle(
              color: Colors.white,
            ),
            autocorrect: false,
            keyboardType: TextInputType.text,
            onChanged: (value) {
              tipoIdentificacion.varPasaporte = value;
              numIdentAut = value;
            },
            maxLength: 19,
            decoration: InputDecorations.authInputDecoration(
              esEdicion: false,
              colorTexto: Colors.white,
              varTamanioIcono: 20,
              varEsContrasenia: false,
              hintText: '',
              colorBordes: Colors.white,
              labelText: 'Pasaporte',
              prefxIcon: null,
              varOnPress: () {}
            ),
          )
        : TextFormField(
                controller: varControllerValidarPrinc,
                style: const TextStyle(color: Colors.white),
                maxLength: 10,
                autocorrect: false,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  tipoIdentificacion.varCedula = value;
                  numIdentAut = value;
                },
                validator: (value) {
                  String respt = 'Ok';
                  if (value != null && value != '' && value.length > 9) {
                    respt = ValidacionesUtils().validaCedula(value.toString());
                  }

                  if(respt != 'Ok') {
                    esIdentificacionInvalida = true;
                  } else {
                    esIdentificacionInvalida = false;
                  }

                  return respt == 'Ok' ? null : 'Cédula inválida.';
                },
                decoration: InputDecorations.authInputDecoration(
                  esEdicion: false,
                  colorTexto: Colors.white,
                  varTamanioIcono: 20,
                  varEsContrasenia: false,
                  hintText: '',
                  colorBordes: Colors.white,
                  labelText: 'Cédula',
                  prefxIcon: null,
                  varOnPress: () {}
                ),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
      ),
    );
  }
}
