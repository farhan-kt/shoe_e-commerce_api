import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoe_e_commerce/view/login_pages/login_screen.dart';
import 'package:shoe_e_commerce/widget/bottom_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: Column(
        children: <Widget>[
          Expanded(
              child:
                  Lottie.asset('assets/splash screen.json', fit: BoxFit.cover)),
          Expanded(
              child: Column(
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: ' SHOE RACK\n',
                    style: GoogleFonts.aBeeZee(
                        color: Colors.yellow,
                        letterSpacing: .5,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
                const WidgetSpan(
                  child: SizedBox(height: 10),
                ),
                TextSpan(
                    text: 'Bring power to Your Steps...',
                    style: GoogleFonts.abel(color: Colors.white, fontSize: 17))
              ])),
              const SizedBox(height: 60),
              SizedBox(
                height: mediaQuery.height * 0.1,
                width: mediaQuery.width * 0.8,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                    ),
                    onPressed: () {
                      checkUserLoggedIn(context);
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'GET STARTED',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )
                      ],
                    )),
              )
            ],
          ))
        ],
      ),
    ));
  }

  checkUserLoggedIn(context) async {
    final sharedPrfs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedPrfs.getBool('savekey');
    if (userLoggedIn == null || userLoggedIn == false) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => BottomBar(),
      ));
    }
  }
}
