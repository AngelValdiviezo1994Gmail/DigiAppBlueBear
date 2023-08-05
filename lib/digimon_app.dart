import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebatecnicaav/screens/index.dart';

import 'widgets/index.dart';

class DigimonApp extends StatefulWidget {
  
  const DigimonApp({Key? key}) : super (key: key);

  @override
  State<DigimonApp> createState() => DigimonAppState();
}

class DigimonAppState extends State<DigimonApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (varContext, varChild) {
          return MaxScaleTextWidget(
            max: 1.0,
            child: varChild,
          );
        },
        debugShowCheckedModeBanner: false,
        title: '',
        initialRoute: CheckAuthScreen.routerName,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: messengerKey,
        home: PrincipalScreen(),
        theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          ),
        ),
        routes: {
          AuthenticationScreen.routerName: (_) => const AuthenticationScreen(),
          AutenticacionErrorScreen.routerName: (_) => AutenticacionErrorScreen(null,'', '','',false,false,'',''),
          CheckAuthScreen.routerName: (_) => const CheckAuthScreen(),
          ContraseniaScreen.routerName: (_) => ContraseniaScreen(numIdentificacion: ''),
        }
    );
  }
}