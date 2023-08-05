// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../_environments/index.dart';
import '../../models/index.dart';
import '../../services/index.dart';
import '../../ui/index.dart';
import '../index.dart';

String numIdVal = '';
bool cargandoPagina = false;
ResponseValidation objResponseValidation = ResponseValidation();
bool esEnConstruccion = false;
FeatureApp objFeatureAppClave = FeatureApp();
ColoresApp objColorsAppContrasenia = ColoresApp();

//ignore: must_be_immutable
class ContraseniaScreen extends StatefulWidget {
  String numIdentificacion = '';

  ContraseniaScreen({Key? key, required numIdentificacion}) : super(key: key) {
    numIdVal = numIdentificacion;
  }

  static const String routerName = 'contraseniaScreen';
  @override
  ContraseniaScreenLoginState createState() => ContraseniaScreenLoginState();
}

class ContraseniaScreenLoginState extends State<ContraseniaScreen> {

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            width: sizeScreen.width,
            height: sizeScreen.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PassWord.png'),
                fit: BoxFit.cover,
                
              ),
              color: Colors.transparent),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Center(
                  child: ChangeNotifierProvider(
                    create: (_) => AutenticacionService(),
                    child: const PaswordEvntLog(),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PaswordEvntLog extends StatelessWidget {

  const PaswordEvntLog({Key? key}) : super(key: key);

  //bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<AutenticacionService>(context);
    final sizeScreenPassWord = MediaQuery.of(context).size;

    return Container(
      color: Colors.transparent,
      height: sizeScreenPassWord.height * 0.97,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            color: Colors.transparent,
            height: sizeScreenPassWord.height * 0.2,
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
                  onPressed: () => Navigator.of(context, rootNavigator: true).pop(context),
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
            width: sizeScreenPassWord.width * 0.53,//0.68
            height: sizeScreenPassWord.height * 0.17,//* 0.15,
            child: const Center(
              child: Text(
              'Mi contraseña de acceso es',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Monserrat',
              ),
              textAlign: TextAlign.center,
            )),
          ),

          Container(
            color: Colors.transparent,
            width: sizeScreenPassWord.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 60,
                  width: sizeScreenPassWord.width * 0.82, //SizeScreen.width -70,//330,//360,
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white), //Theme.of(context).textTheme.headline6,
                    autocorrect: false,
                    obscureText: loginForm.varIsOscured,
                    keyboardType: !loginForm.varIsOscured
                      ? TextInputType.text
                      : TextInputType.emailAddress, //tipo de imput -> correo
                    textInputAction: TextInputAction.done,
                    decoration: InputDecorations.authInputDecoration(
                      esEdicion: false,
                      varTamanioIcono: 20,
                      varEsContrasenia: true,
                      hintText: '',
                      labelText: 'Contraseña',
                      prefxIcon: Icons.lock_outline,
                      colorBordes: Colors.white,
                      colorTexto: Colors.white,
                      sufixIcon: !loginForm.varIsOscured
                        ? Icons.visibility_off
                        : Icons.visibility,
                      varOnPress: () {
                        loginForm.varIsOscured = !loginForm.varIsOscured;
                      },
                    ),
                    onChanged: (value) => loginForm.passWord = value,
                    validator: (value) {
                      if (value != null) {
                        return null;
                      }
                      return 'Ingrese contraseña';
                    },
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: sizeScreenPassWord.height * 0.04,
                  width: sizeScreenPassWord.width * 0.82,
                  child: const Text(
                    'Considerar mayúsculas y minúsculas',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
          
          Container(
            color: Colors.transparent,
            width: sizeScreenPassWord.width * 0.82, // ancho para el botón
            height: sizeScreenPassWord.height * 0.07, // alto para el botón
            child: MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 10,
              color: objColorsAppContrasenia.digiNaranja,
              onPressed: () async {
                if (!loginForm.varIsLoading) {
                  FocusScope.of(context).unfocus();
                  loginForm.varIsLoading = true;
                  if (loginForm.passWord == '') {
                    loginForm.varIsLoading = false;
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => AutenticacionErrorScreen(null,'Ingresa tu contraseña por favor.', '','claveVacia.png',false,false,'','')),
                    );
                    return;
                  }
                  await loginForm.autenticacion(numIdVal, loginForm.passWord);

                  await Future.delayed(const Duration(seconds: 2));
                  
                  if (loginForm.objRspInicioSesion!.statusCode == objResponseValidation.responseNoRegistraPost || loginForm.objRspInicioSesion!.statusCode == objResponseValidation.responseErrorRegistroPost) {
                    if(loginForm.objRspInicioSesion!.message.toLowerCase().contains('activ')) {
                      
                      await loginForm.getClienteUser(numIdVal);
                      
                      loginForm.varIsLoading = false;

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => 
                              AutenticacionErrorScreen(null,loginForm.objRspInicioSesion?.message ?? 'Recuerda que para iniciar sesión debes estar suscrito','','activaServicio.png',false, !loginForm.objRspInicioSesion!.message.toLowerCase().contains('activar') ? true : false,loginForm.objRspInicioSesion!.message.toLowerCase().contains('activ') ? numIdVal : '','')
                          ),
                        );
                    
                    } else {
                      loginForm.varIsLoading = false;
                      Navigator.push(
                      context,
                        CupertinoPageRoute(
                            builder: (context) => AutenticacionErrorScreen(null,
                                loginForm.objRspInicioSesion?.message ??
                                    'Error al iniciar sesión',
                                '','claveIncorrecta.png',false,false,'','')),
                      );
                    }
                  } else {
                    if (loginForm.objRspUsuarioDatos == null || !loginForm.objRspUsuarioDatos!.succeeded || loginForm.objRspUsuario == null) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => 
                            AutenticacionErrorScreen(null,loginForm.objRspUsuarioDatos?.message ?? '','','claveIncorrecta.png',false,false,'','') 
                        ),
                      );
                    } else {

                      Future.microtask(() => Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => PrincipalScreen(),
                            transitionDuration: const Duration(seconds: 0),
                          )
                        )
                      );
                    }
                  }
                  loginForm.varIsLoading = false;
                  FocusScope.of(context).unfocus(); //para cerrar teclado del celular
                }
              },
              enableFeedback: !loginForm.varIsLoading,
              child: Container(
                color: Colors.transparent,
                child: !loginForm.varIsLoading
                  ? const Text('Quiero iniciar sesión', style: TextStyle(color: Colors.white, fontSize: 18))
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
            ),
          ),
        
        ],
      ),
    );
  }
}
