import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/bottom_bar_provider.dart';
import 'package:shoe_e_commerce/controller/home_provider.dart';
import 'package:shoe_e_commerce/controller/user_provider.dart';
import 'package:shoe_e_commerce/view/welcome_screen.dart';

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
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => HomeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFFFFBD73),
            scaffoldBackgroundColor: const Color(0xFF202020)),
        home: const SplashScreen(),
        // home: BottomBar(),
      ),
    );
  }
}
