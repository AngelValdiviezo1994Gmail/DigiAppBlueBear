

//ignore: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pruebatecnicaav/_environments/environment.prod.dart';
import '../models/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const storagePrincipalScreen = FlutterSecureStorage();
CadenaConexion objCadConPrincipalApp = CadenaConexion();
ColoresApp objColoresAppPrincipal = ColoresApp();

//ignore: must_be_immutable
class PrincipalScreen extends StatefulWidget {
  static const String routerName = 'principalScreen';
  UsuarioType? objetoUser;

  PrincipalScreen({Key? key}) : super(key: key);

  @override
  PrincipalScreenState createState() => PrincipalScreenState();
}

class PrincipalScreenState extends State<PrincipalScreen> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: varIndexMenu);
  }

  int varIndexMenu = 0;

  final lstPages = <Widget>[
    //HomeScreen(),    
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            shadowColor: objColoresAppPrincipal.digiNaranja,
            leading: 
           
              IconButton(
                icon: const Icon(Icons.person),
                color: varIndexMenu == -1 ? objColoresAppPrincipal.digiNaranja : Colors.white,
                onPressed: () {
                  setState(() {
                    varIndexMenu = -1;
                  });
                },
              ),
          
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(
                    'assets/no-image.jpg', //"assets/loadingEnrolApp.gif",
                    height: 80.0,
                    width: 80.0,
                  ),
                  fadeInCurve: Curves.bounceIn,
                  width: 150,
                  imageUrl: '${objCadConPrincipalApp.endPointImagenes}LogoBlanco.png',
                  errorWidget: (
                    (context, error, stackTrace) {
                      return Container(
                        color: Colors.transparent,
                        child: Image.asset('assets/no-image.jpg'),
                      );
                    }
                  )
                ),
              ],
            ),
            elevation: 0,
            actions: [
              const SizedBox(width: 50),
              //Bocina
              
              IconButton(
                icon: const Icon(
                  Icons.campaign_outlined,
                  color: Colors.white, 
                ),
                color: Colors.white,
                tooltip: 'Anuncios',
                onPressed: () async {
                  
                },
              ),
            
            ],
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
              Container(
                alignment: Alignment.center,
                child: lstPages[varIndexMenu],
              ),
            ],
          ), 
        )
      ),
    );
  }
  } 