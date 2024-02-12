import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/bottom_bar_provider.dart';
import 'package:shoe_e_commerce/controller/login_provider.dart';
import 'package:shoe_e_commerce/view/home_screen.dart';
import 'package:shoe_e_commerce/view/splash_screen.dart';
import 'package:shoe_e_commerce/widget/bottom_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => BottomProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFFFFBD73),
            scaffoldBackgroundColor: const Color(0xFF202020)),
        // home: const SplashScreen(),
        home: BottomBar(),
      ),
    );
  }
}
