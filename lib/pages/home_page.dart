import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttersharedprefs/pages/login_page.dart';
import 'package:fluttersharedprefs/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeTimer();
  }

  void _initializeTimer() {
    if (_timer != null) {
      _timer?.cancel;
    }

    _timer = Timer(const Duration(seconds: 15), () => _handleInactivity());
  }

  void _handleInactivity() {
    _timer?.cancel();
    _timer = null;
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }


  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _initializeTimer(),
      child: Scaffold(
        appBar: AppBar(
        title: const Text('Home'), 
        backgroundColor: Colors.black, 
        leading: GestureDetector(
          onTap: () async {
                
                var sharedPref = await SharedPreferences.getInstance();
                sharedPref.setBool(SplashScreenState.LOGINKEY, false);
                
                
                // ignore: use_build_context_synchronously
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));},
                
          child: const Icon(Icons.logout)),
          
        ),
        body: Container(
          color: Colors.grey[100],
          child: Center(
            child: Icon(Icons.home, color: Colors.black.withOpacity(0.5), size: 60),
          ),
        ),
      ),
    );
  }
}