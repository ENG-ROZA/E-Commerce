// ignore_for_file: prefer_const_constructors


import 'package:e_commerce/data/models/response/auth_response.dart';
import 'package:e_commerce/data/shared_preferences/shared_preferences.dart';
import 'package:e_commerce/ui/screens/auth/login/login.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "SplashScreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () async {
      User? user = await SharedPref().getUser();
      if (user == null) {
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, MainScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/Splash Screen.png",
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
