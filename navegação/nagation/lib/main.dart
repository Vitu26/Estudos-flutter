import 'package:flutter/material.dart';
import 'package:nagation/page_one.dart';
import 'package:nagation/page_two.dart';

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
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const OnePage(),
        '/twopage': (_) => const TwoPage(),
      },
    );
  }
}

