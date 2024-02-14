import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_e_commerce/view/login_pages/login_screen.dart';
import 'package:shoe_e_commerce/widget/settings_page_widget.dart';
import 'package:shoe_e_commerce/widget/text_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF202020),
          title: textAbel(data: 'SETTINGS', size: 20, weight: FontWeight.bold)),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF202020)),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/shoe.jpg'),
                    radius: 40,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Text(
                        "FARHAN",
                      ),
                      Text(
                        "farhan@gmail.com",
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            settingPageCard('ABOUT', Icons.info),
            settingPageCard('PRIVACY AND POLICY', Icons.privacy_tip_outlined),
            InkWell(
                onTap: () async {
                  final data = await SharedPreferences.getInstance();
                  data.clear();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                },
                child: settingPageCard('LOG OUT', Icons.logout_outlined))
          ],
        ),
      ),
    );
  }
}
