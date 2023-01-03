import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';

class LoginButton extends StatelessWidget {
  Function onPress;
  String text;
  Color backgroundColor;
  LoginButton(this.backgroundColor, this.text, this.onPress, {super.key});
  LoginStore loginStore = GetIt.I<LoginStore>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 40,
            width: width * .4,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () async {
                await onPress();
              },
              child: Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
