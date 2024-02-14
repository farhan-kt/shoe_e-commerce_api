import 'package:flutter/material.dart';
import 'package:shoe_e_commerce/model/user_model.dart';
import 'package:shoe_e_commerce/service/store_service.dart';
import 'package:shoe_e_commerce/service/user_service.dart';

class UserProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final UserService _userService = UserService();
  final StoreService _storeService = StoreService();

  String? userStatusCode;
  String? createdStatusCode;

  String username = '';
  String password = '';

  createUser(UserModel userInfo) async {
    await _userService.createUser(userInfo);
    createdStatusCode = _userService.createdStatusCode;
    notifyListeners();
  }

  userLogin(UserModel userInfo) async {
    await _userService.userLogin(userInfo);
    userStatusCode = _userService.userStatusCode;
    notifyListeners();
  }

  setUserData() async {
    username = await _storeService.getValues('username') ?? '';
    password = await _storeService.getValues('password') ?? '';
    notifyListeners();
  }
}
