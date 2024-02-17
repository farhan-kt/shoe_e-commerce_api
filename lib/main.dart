import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/bottom_bar_provider.dart';
import 'package:shoe_e_commerce/controller/product_provider.dart';
import 'package:shoe_e_commerce/controller/search_provider.dart';
import 'package:shoe_e_commerce/controller/store_provider.dart';
import 'package:shoe_e_commerce/controller/user_provider.dart';
import 'package:shoe_e_commerce/controller/wishlist_provider.dart';
import 'package:shoe_e_commerce/view/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

const key = "savekey";

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StoreProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: const Color(0xFFFFBD73),
            scaffoldBackgroundColor: const Color(0xFF202020)),
        home: WelcomeScreen(),
      ),
    );
  }
}
