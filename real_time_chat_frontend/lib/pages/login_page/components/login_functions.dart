import 'package:flutter/material.dart';
import 'package:real_time_chat_frontend/models/user.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/navigators.dart';

class LoginFunctions {
  LoginStore loginStore;
  LoginFunctions({required this.loginStore});
  void signIn(GlobalKey<FormState> globalKey, Function runMutation) {
    if (!globalKey.currentState!.validate()) {
      return;
    } else {
      globalKey.currentState!.save();
      runMutation({
        "varLogin": {
          "email": loginStore.login,
          "password": loginStore.password,
        }
      });
      debugPrint("passou");
    }
  }

  void loginCompleted(BuildContext context, dynamic data) {
    if (data == null) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title: const Text("Erro"),
                content: const Text("Usuario não existe"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("ok"))
                ],
              ));
    } else {
      loginStore.userLogin = UserLogin.fromJson(data);
      Navigation(context: context).goHome();
    }
  }

  void saveLogin(String? value) {
    loginStore.login = value!;
  }

  void savePassWord(String? value) {
    loginStore.password = value!;
  }
}
