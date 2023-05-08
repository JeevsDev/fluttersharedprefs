import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttersharedprefs/components/my_button.dart';
import 'package:fluttersharedprefs/pages/login_page.dart';
import 'package:fluttersharedprefs/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static Timer? _timer;
  static const autoLogoutTimer = 15;

  @override
  void initState() {
    super.initState();
    startNewTimer();
  }


  Future<void> timedOut() async {
    stopTimer();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }


  void startNewTimer() {
    stopTimer();

    _timer = Timer(const Duration(seconds: autoLogoutTimer), timedOut);
    
  }


  void stopTimer() {
    if (_timer != null || (_timer?.isActive != null && _timer!.isActive)) {
      _timer?.cancel();
  }


  }


  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      behavior: HitTestBehavior.deferToChild,
      onTap: () => startNewTimer(),
      child: Scaffold(
        appBar: AppBar(
        title: const Text('Home'), 
        backgroundColor: Colors.black,
        ),
        body: Container(
          color: Colors.grey[100],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Center(
                child: Icon(Icons.home, color: Colors.black.withOpacity(0.5), size: 60),
                
              ),

              const SizedBox(height: 50),

              Center(
                child: MyButton(onTap: () async {
                  
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(SplashScreenState.LOGINKEY, false);
                  
                  
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));}, 

                  text: "Log Out"),
              ),
                
              
            ],
          ),
        ),
      ),
    );
  }
}