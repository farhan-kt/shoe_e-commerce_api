import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/user_provider.dart';
import 'package:shoe_e_commerce/view/sign_up_screen.dart';
import 'package:shoe_e_commerce/widget/bottom_bar.dart';
import 'package:shoe_e_commerce/widget/textformfield_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
                child: Lottie.asset('assets/Animation - login screen.json',
                    fit: BoxFit.cover)),
            Expanded(
                child: Container(
              height: mediaQuery.height * 0.3,
              width: mediaQuery.width * 0.5,
              padding: const EdgeInsets.only(bottom: 35),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Card(
                  elevation: 5,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            'LOGIN',
                            style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.yellow,
                                letterSpacing: 5),
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: userProvider.usernamecontroller,
                            labelText: 'enter username',
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            controller: userProvider.passwordcontroller,
                            labelText: 'enter password',
                            obscureText: true,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                              ),
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BottomBar()),
                                    (route) => false);
                                if (formKey.currentState!.validate()) {}
                              },
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800),
                              )),
                          const SizedBox(height: 15),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
