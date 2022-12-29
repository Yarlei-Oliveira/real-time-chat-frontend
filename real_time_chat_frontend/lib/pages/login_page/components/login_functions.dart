import 'package:flutter/material.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';

class LoginFunctions {
  LoginStore loginStore;
  LoginFunctions({required this.loginStore});
  void signIn(GlobalKey<FormState> globalKey) {
    if (!globalKey.currentState!.validate()) {
      return;
    } else {
      debugPrint("passou");
    }
  }

  void saveLogin(String? value) {
    loginStore.login = value!;
  }

  void savePassWord(String? value) {
    loginStore.password = value!;
  }
}
