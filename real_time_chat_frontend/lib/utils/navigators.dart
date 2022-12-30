import 'package:flutter/material.dart';
import 'package:real_time_chat_frontend/utils/constants.dart';

class Navigation {
  BuildContext context;
  Navigation({required this.context});

  void goHome() => Navigator.pushReplacementNamed(context, Routes.HOME_PAGE);
}
