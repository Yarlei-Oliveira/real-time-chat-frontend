import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  @observable
  String login = "";
  @observable
  String password = "";
  @observable
  String acessToken = "";
}
