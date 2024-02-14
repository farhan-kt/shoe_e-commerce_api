// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/bottom_bar_provider.dart';
import 'package:shoe_e_commerce/view/tabs/wishlist_screen.dart';
import 'package:shoe_e_commerce/view/tabs/home_screen.dart';
import 'package:shoe_e_commerce/view/tabs/setting_screen.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  List screens = [
    const HomeScreen(),
    const WishListScreen(),
    const SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BottomProvider>(
          builder: (context, value, child) => screens[value.currentIndex]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(22.10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Consumer<BottomProvider>(
            builder: (context, value, child) => BottomNavigationBar(
              unselectedFontSize: 0,
              type: BottomNavigationBarType.fixed,
              onTap: value.onTap,
              backgroundColor: const Color.fromARGB(24, 7, 100, 95),
              currentIndex: value.currentIndex,
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 25,
                  ),
                  label: 'ᴴᵒᵐᵉ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_outlined,
                    size: 25,
                  ),
                  label: 'ʷᶦˢʰˡᶦˢᵗ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    size: 25,
                  ),
                  label: 'ˢᵉᵗᵗᶦⁿᵍˢ',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
