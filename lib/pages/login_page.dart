import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttersharedprefs/pages/home_page.dart';
import 'package:fluttersharedprefs/pages/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();

  final passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 50),

          // Logo
          // Icons(AssetImage("lib/images/flutterlogo.png"),
          // size: 100,
          // ),

          const Icon(Icons.person_rounded, size: 150,),

          const SizedBox(height: 30),

          //Welcome Back Screen
          Text(
            "Welcome back! Glad to see you, pal!",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
              ),
      ),

          const SizedBox(height: 30),

          //Username Textfield
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
          ),

          const SizedBox(height: 10),

          //Password Textfield
          MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
          ),

          const SizedBox(height: 40),

          //Forgot Password

          //Sign in button
           MyButton(
            text: "Sign In",
            onTap: () async {
              
              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(SplashScreenState.LOGINKEY, true);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              
              }
          ),
          
          const SizedBox(height: 50),

            ],
          ),
        ),
      ),
      )
    );
  }
}