import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

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
                    text: 'Bring power to Your Steps...',
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        letterSpacing: .5,
                        fontSize: 23,
                        fontWeight: FontWeight.bold))
              ]))
            ],
          ))
        ],
      ),
    ));
  }
}
