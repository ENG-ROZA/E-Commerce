import 'package:e_commerce/data/models/dependancy_injection/dependancy_injection.dart';
import 'package:e_commerce/ui/screens/auth/login/login.dart';
import 'package:e_commerce/ui/screens/auth/signup/signUp.dart';
import 'package:e_commerce/ui/screens/main/main_screen.dart';
import 'package:e_commerce/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MainScreen.routeName,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        LoginScreen.routeName: (_) =>  LoginScreen(),
        SignupScreen.routeName: (_) =>  SignupScreen(),
        MainScreen.routeName :(_)=>  MainScreen(),
      },
    );
  }
}
