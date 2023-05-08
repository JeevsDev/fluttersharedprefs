import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttersharedprefs/pages/home_page.dart';
import 'package:fluttersharedprefs/pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  static const String LOGINKEY = "login";

  @override
  void initState() {
    super.initState();

    GoTo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: const Center(
          child: Icon(Icons.flutter_dash, size: 150,)
            ),
        ),
      );
    }
}

    void GoTo(context) async {

    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(SplashScreenState.LOGINKEY);
    

    Timer(const Duration(seconds: 3), () {

      if(isLoggedIn!=null) {
        if(isLoggedIn) {
          Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => const HomePage(),
        ));
        } else {
            Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LoginPage(),
        ));
      } 
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => LoginPage(),
        ));
      }

      

    });

  
}