import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:real_time_chat_frontend/API/API.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/widget/signup_widget.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/navigators.dart';
import 'package:real_time_chat_frontend/utils/querys/Query.dart';
import 'package:real_time_chat_frontend/utils/theme.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  GlobalKey<FormState> globalkey = GlobalKey<FormState>();

  LoginStore loginStore = GetIt.I<LoginStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: ColorsTheme.primary_color,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Graphql().mutation(
          repository: QueryRepository.signUp,
          onError: (error) {
            for (var error in error!.graphqlErrors) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.message),
                  action: SnackBarAction(label: "Ok", onPressed: () {}),
                ),
              );
            }
          },
          onCompleted: (dynamic data) async {
            if (data == null) {
              return;
            }
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Usuario criado com sucesso"),
              ),
            );
            Navigation(context: context).goLogin();
          },
          widget: SignupWidget(context: context).signupWidget,
        ));
  }
}
