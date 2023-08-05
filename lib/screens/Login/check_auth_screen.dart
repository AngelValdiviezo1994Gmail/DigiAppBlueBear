

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/index.dart';
import '../index.dart';

class CheckAuthScreen extends StatelessWidget {
  static const String routerName = 'checkAuthScreen';

  const CheckAuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context,state) {
          return Center(
            child: FutureBuilder(
              future: state.readToken(), 
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

                if(!snapshot.hasData) {
                  return Image.asset(
                    "assets/loadingEnrolApp.gif",
                    height: 150.0,
                    width: 150.0,
                  );
                } else {
                  if(snapshot.data != '') {

                    if(snapshot.data == 'NI') {
                        Future.microtask(() => 
                          Navigator.of(context, rootNavigator: true).pushReplacement(
                            CupertinoPageRoute<bool>(
                              fullscreenDialog: true,
                              builder: (BuildContext context) => const ConexionInternetScreen(),
                            ),
                          )
                        );
                      } else {

                        Future.microtask(() => 
                            Navigator.of(context, rootNavigator: true).pushReplacement(
                              CupertinoPageRoute<bool>(
                                fullscreenDialog: true,
                                builder: (BuildContext context) => PrincipalScreen(),
                              ),
                            )
                          );

                        
                      }
                    
                  } else {
                    Future.microtask(() => 
                      Navigator.of(context, rootNavigator: true).pushReplacement(
                        CupertinoPageRoute<bool>(
                          fullscreenDialog: true,
                          builder: (BuildContext context) => const SplashScreen(),
                        ),
                      )
                    );
                  }
                }

                return Container();
              },
            )
          
          );
        }
      )
      
   );
    
  }
}