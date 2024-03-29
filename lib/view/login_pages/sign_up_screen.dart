import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:shoe_e_commerce/controller/user_provider.dart';
import 'package:shoe_e_commerce/model/user_model.dart';
import 'package:shoe_e_commerce/widget/normal_widgets.dart';
import 'package:shoe_e_commerce/widget/textformfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);
    Size mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.yellow,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
            Lottie.asset(
              'assets/sign up.json',
              height: mediaQuery.height * 0.3,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Container(
                height: mediaQuery.height * 0.65,
                width: mediaQuery.width * 0.7,
                padding: const EdgeInsets.only(bottom: 35),
                child: Card(
                  elevation: 5,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 35, horizontal: 15),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Form(
                        key: formKey2,
                        child: Column(
                          children: [
                            Text(
                              'Sign Up',
                              style: GoogleFonts.abel(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.yellow,
                                letterSpacing: 5,
                              ),
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: nameController,
                              labelText: 'Name',
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: emailController,
                              labelText: 'E-mail',
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: usernameController,
                              labelText: 'Username',
                            ),
                            const SizedBox(height: 10),
                            CustomTextFormField(
                              controller: passwordController,
                              labelText: 'Password',
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                              ),
                              onPressed: () async {
                                if (formKey2.currentState!.validate()) {
                                  await createUser(context);
                                }
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  createUser(context) async {
    final getProvider = Provider.of<UserProvider>(context, listen: false);
    final userInfo = UserModel(
      name: getProvider.nameController.text.toString(),
      email: getProvider.emailController.text.toString(),
      username: getProvider.usernameController.text.toString(),
      password: getProvider.passwordController.text.toString(),
    );
    await getProvider.createUser(userInfo);
    if (getProvider.createdStatusCode == "201") {
      clearControllers(getProvider);
    } else {}
  }
}
