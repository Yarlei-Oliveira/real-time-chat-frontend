import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:real_time_chat_frontend/models/user.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String login = "";
  @observable
  String password = "";
  @observable
  TextEditingController passwordTextEditingController = TextEditingController();
  @observable
  String acessToken = "";
  @observable
  String email = "";
  @observable
  UserLogin userLogin = UserLogin();
//flutter packages pub run build_runner build --delete-conflicting-outputs

}
