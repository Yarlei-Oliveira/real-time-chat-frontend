import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/login_functions.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/theme.dart';

class LoginButton extends StatelessWidget {
  LoginFunctions loginFunctions;
  GlobalKey<FormState> globalKey;
  MultiSourceResult Function(Map<String, dynamic>, {Object? optimisticResult})
      runMutation;
  LoginButton(this.globalKey, this.loginFunctions, this.runMutation,
      {super.key});
  LoginStore loginStore = GetIt.I<LoginStore>();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            height: 40,
            width: width * .2,
            decoration: BoxDecoration(
                color: ColorsTheme.primary_color,
                borderRadius: BorderRadius.circular(10)),
            child: TextButton(
              onPressed: () => loginFunctions.signIn(globalKey, runMutation),
              child: const Text(
                "Entrar",
                style: TextStyle(color: Colors.white),
              ),
            ))
      ],
    );
  }
}
