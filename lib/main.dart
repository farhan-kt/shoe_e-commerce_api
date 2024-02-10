import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: const Color(0xFFFFBD73),
          scaffoldBackgroundColor: const Color(0xFF202020)),
      home: const SplashScreen(),
    );
  }
}
