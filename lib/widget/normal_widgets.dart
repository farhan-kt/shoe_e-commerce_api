import 'package:shoe_e_commerce/controller/user_provider.dart';

void clearControllers(UserProvider controller) {
  controller.usernameController.clear();
  controller.emailController.clear();
  controller.passwordController.clear();
}
