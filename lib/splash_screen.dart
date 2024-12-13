

import 'dart:async';

import 'package:flutter/material.dart';
import '../ui/auth/auth.dart';
import '../ui/root.dart';

import 'data/repo/auth_repository.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget initialFuntion() {
    // return Hive.box('settings').get('TOKEN') != null
    return AuthRepository.authChangeNotifier.value != null
    // ? HomePage(pageController: _pageController,)
        ? RootScreen()
        : AuthScreen();
    // return HomePage();
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 1000), () { // set your desired delay time here
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
              builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                // child: initialFuntion()
                child: initialFuntion(),
              )
          )
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Image.asset("images/food.png",
            width: MediaQuery.of(context).size.width / 1.5,
            fit: BoxFit.scaleDown),
      ),
    );
  }
}