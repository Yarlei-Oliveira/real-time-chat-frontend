import 'package:flutter/material.dart';
import 'package:real_time_chat_frontend/utils/constants.dart';

class Navigation {
  BuildContext context;
  Navigation({required this.context});

  void goHome() async {
    await Navigator.pushReplacementNamed(context, Routes.HOME_PAGE);
  }

  void goSignup() async {
    await Navigator.pushNamed(context, Routes.SIGNUP_PAGE);
  }

  void goLogin() async {
    await Navigator.pushNamed(context, Routes.LOGIN_PAGE);
  }
}
