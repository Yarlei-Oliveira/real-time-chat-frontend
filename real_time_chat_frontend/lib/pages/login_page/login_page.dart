import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/login_functions.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/validators/login_validators.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/widget/login_button.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/widget/text_form_field.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/constants.dart';
import 'package:real_time_chat_frontend/utils/querys/Query.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  LoginStore loginStore = GetIt.I<LoginStore>();
  @override
  Widget build(BuildContext context) {
    LoginFunctions loginFunctions = LoginFunctions(loginStore: loginStore);
    return Mutation(
      options: MutationOptions(
        document: gql(QueryRepository.singupQuery),
        onCompleted: (data) {
          loginFunctions.loginCompleted(context, data);
        },
      ),
      builder: (runMutation, result) => Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(children: const [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
                const SizedBox(height: 20),
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        FormFieldModel(
                            hint: "Email",
                            onSaved: loginFunctions.saveLogin,
                            validator: LoginValidator.emailValidator,
                            icon: Icons.email),
                        const SizedBox(height: 15),
                        FormFieldModel(
                          obscure: true,
                          hint: "Senha",
                          validator: LoginValidator.passwordValidator,
                          onSaved: loginFunctions.savePassWord,
                          icon: Icons.lock,
                        ),
                        const SizedBox(height: 10),
                        LoginButton(formkey, loginFunctions, runMutation)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
