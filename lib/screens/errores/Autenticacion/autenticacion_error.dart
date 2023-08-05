
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../index.dart';

 String correoProspecto = '';
 String varMsmError1 = '';
 String varMsmError2 = '';
 String varImgFondo = '';
 String numeroIdentificacionAuthError = '';
 bool navegaAlLogin = false;
 bool errorActivacion = false;

class AutenticacionErrorScreen extends StatefulWidget {

  static const String routerName = 'autenticacionerror';
 

  AutenticacionErrorScreen(Key? key, String msmError1, String msmError2, String imgFondo, bool navegaLogin, bool errorAct, String numIdent, String varCorreo) : super (key: key){
    varMsmError1 = msmError1;
    varMsmError2 = msmError2;
    varImgFondo = imgFondo;
    navegaAlLogin = navegaLogin;
    errorActivacion = errorAct;
    numeroIdentificacionAuthError = numIdent;
    correoProspecto = varCorreo;
  }

  @override
  AutenticacionErrorScreenState createState() => AutenticacionErrorScreenState();

}

class AutenticacionErrorScreenState extends State<AutenticacionErrorScreen>{

  @override
  void initState(){
    Future.delayed(
      const Duration(milliseconds: 4500), 
      () {
        if(!navegaAlLogin)
        {
          Navigator.pop(context);
        } else {
          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => const AuthenticationScreen()),
          );
        }
      }
    );
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return 
      MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$varImgFondo'),
                fit: BoxFit.cover
              ),
            ),
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
            
                      const SizedBox(height: 50,),
                      
                      const Expanded(
                        child: Row(
                        
                        ),
                      ),

                      const Expanded(
                        child: 
                          Row(
                        
                          ),
                      ),

                      const Expanded(
                        child: 
                          Row(
                          
                          ),
                      ),
                      
                      Expanded(
                        child: 
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: 
                            [
                              const Text('',style: TextStyle(color: Colors.red, fontSize: 20),),

                              Column(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    width: sizeScreen.width,
                                    height: 90,
                                    child: Center(
                                      child: AutoSizeText (
                                        varMsmError1,
                                        style: const TextStyle(color: Colors.black54, decorationStyle: TextDecorationStyle.solid, fontWeight: FontWeight.bold),
                                        presetFontSizes: const [30,26,28,24,22,20,18],
                                        textAlign: TextAlign.center,
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                  
                                  Container(
                                    color: Colors.transparent,
                                    width: sizeScreen.width,
                                    height: 90,
                                    child: Center(
                                      child: AutoSizeText (
                                        varMsmError2,
                                        style: const TextStyle(color: Colors.black54, decorationStyle: TextDecorationStyle.solid),
                                        presetFontSizes: const [24,22,20,18],
                                        maxLines: 3,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              
                              const Text('',style: TextStyle(color: Colors.red, fontSize: 20),),
                            ],
                        
                        ),
                      ),




                    ]
                  )
                )
      
              ),
            
          ),
              
        ),
      ),
    );
     
  }
}