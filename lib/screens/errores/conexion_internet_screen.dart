
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebatecnicaav/models/index.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../index.dart';

ColoresApp objColoresAppConexionInternet = ColoresApp();

class ConexionInternetScreen extends StatefulWidget {

  static const String routerName = 'ConexionInternetScreen';

  const ConexionInternetScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConexionInternetScreenState createState() => ConexionInternetScreenState();

}

class ConexionInternetScreenState extends State<ConexionInternetScreen>{

  @override
  void initState(){
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return  MaterialApp(
        
      debugShowCheckedModeBanner: false,
      
      home: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(254, 254, 254, 254),
          body: Center(
            child: Container(
              color: Colors.transparent, 
              width: size.width * 0.85,
              height: size.height * 0.45,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    
                    decoration: const BoxDecoration( 
                                  image: DecorationImage(
                                    image: AssetImage('assets/NoConexion.gif'),//rutaFoto != '' ? NetworkImage(rutaFoto) : const AssetImage('assets/enRolitoInhabilitado.png'),
                                    fit: BoxFit.contain
                                  ),
                                ), 
                    //color: Colors.green, 
                    width: size.width * 0.95,
                    height: size.height * 0.25,
                    //child: Image(width: size.width * 0.3, height: size.height * 0.02, image: const AssetImage('assets/NoConexion.gif'),),
                  ),
                  
                  Container(
                    color: Colors.transparent, 
                    width: size.width * 0.65,
                    height: size.height * 0.05,
                    alignment: Alignment.bottomCenter,
                    child: const AutoSizeText('No hay conexión a Internet', maxLines: 1, presetFontSizes: [24,22,20,18,16,14,12,10], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black), textAlign: TextAlign.center,),
                  ),
                  
                  Container(
                    color: Colors.transparent, 
                    width: size.width * 0.65,
                    height: size.height * 0.05,
                    alignment: Alignment.center,
                    child: const AutoSizeText('Comprueba tu conexión y actualiza la página', maxLines: 2, presetFontSizes: [18,16,14,12,10], style: TextStyle( color: Colors.black,), textAlign: TextAlign.center,),
                  ),
                  
                  SizedBox(height: size.height * 0.01,),
                  
                  Center(
                    child: Container(
                      color: Colors.transparent,
                        width: size.width * 0.91,//- 118, // ancho para el botón
                        height: size.height * 0.07,//55, // alto para el botón
                        alignment: Alignment.center,
                        child: 
                          MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  disabledColor: Colors.grey,
                                  elevation: 10,
                                  color: objColoresAppConexionInternet.digiNaranja,
                                  child: Container(
                                    color: Colors.transparent,
                                    child: const
                                    Center(
                                        child: AutoSizeText('Actualizar', maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white), presetFontSizes: [18,16,14,12,10,8,6,4],)
                                      ),
                                      
                                  ),
                                  onPressed: () async { 
                                    Future.microtask(() => 
                                      Navigator.of(context, rootNavigator: true).pushReplacement(
                                        CupertinoPageRoute<bool>(
                                          fullscreenDialog: true,
                                          builder: (BuildContext context) => const CheckAuthScreen(),
                                        ),
                                      )
                                    );
                                  },  
                        
                                ),
                            
                            ),
                          
                  ),
                
                ],
              ),
              
            ),
          ),
        
        ),
      )
    );
     
  }


}