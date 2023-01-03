import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/validators/login_validators.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/widget/login_button.dart';
import 'package:real_time_chat_frontend/pages/login_page/components/widget/text_form_field.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/theme.dart';

class SignupWidget {
  BuildContext context;
  SignupWidget({required this.context});
  Widget signupWidget(dynamic result, dynamic runMutation) {
    GlobalKey<FormState> globalkey = GlobalKey<FormState>();
    LoginStore loginStore = GetIt.I<LoginStore>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width,
      height: height,
      child: Form(
        key: globalkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormFieldModel(
              hint: "Email",
              onSaved: (value) => loginStore.email = value!,
              validator: LoginValidator.emailValidator,
              icon: Icons.email,
            ),
            const SizedBox(height: 10),
            FormFieldModel(
              hint: "username",
              onSaved: (value) => loginStore.login = value!,
              validator: LoginValidator.usernameValidator,
              icon: Icons.person,
            ),
            const SizedBox(height: 10),
            FormFieldModel(
              hint: "password",
              onSaved: (value) => loginStore.password = value!,
              validator: LoginValidator.passwordValidator,
              textEditingController: loginStore.passwordTextEditingController,
              icon: Icons.lock,
              obscure: true,
            ),
            const SizedBox(height: 10),
            FormFieldModel(
              hint: "confirmPassword",
              validator: (String? text) {
                final value = text ?? "";
                // ignore: unrelated_type_equality_checks
                if (value != loginStore.passwordTextEditingController.text) {
                  return "Senhas não conferem";
                }
                return null;
              },
              icon: Icons.lock,
              obscure: true,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(30),
              child: LoginButton(
                ColorsTheme.primary_color,
                "Enviar",
                () {
                  if (!globalkey.currentState!.validate()) {
                    return;
                  }
                  globalkey.currentState!.save();
                  loginStore.passwordTextEditingController.text = "";
                  return runMutation({
                    "varSignup": {
                      "email": loginStore.email,
                      "username": loginStore.login,
                      "password": loginStore.password
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
