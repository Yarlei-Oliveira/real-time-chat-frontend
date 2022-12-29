import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:real_time_chat_frontend/API/API.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/login_functions.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/querys/Query.dart';

class LoginButton extends StatelessWidget {
  LoginFunctions loginFunctions;
  GlobalKey<FormState> globalKey;
  LoginButton(this.globalKey, this.loginFunctions, {super.key});
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
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)),
            child: Mutation(
              options: MutationOptions(
                document: gql(QueryRepository.singupQuery),
                onCompleted: (dynamic resultData) {
                  debugPrint("resul data: ${resultData.toString()}");
                },
              ),
              builder: (runMutation, result) => TextButton(
                onPressed: () async {
                  runMutation(
                      {"username": "teste@teste.com", "password": "secret"});
                },
                child: const Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ))
      ],
    );
  }
}
