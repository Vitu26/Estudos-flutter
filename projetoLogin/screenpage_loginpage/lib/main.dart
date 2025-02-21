import 'package:flutter/material.dart';
import 'package:screenpage_loginpage/pages/details_page.dart';
import 'package:screenpage_loginpage/pages/home_page.dart';
import 'package:screenpage_loginpage/pages/login_page.dart';
import 'package:screenpage_loginpage/pages/splash_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //CRIANDO NOSSAS ROTAS
      initialRoute: '/splash',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) =>  LoginPage(),
        '/home': (_) => const HomePage(),
        '/details': (_) => const DetailsPage(),
      },
    );
  }
}

