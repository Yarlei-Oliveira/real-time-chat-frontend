// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on _LoginStoreBase, Store {
  late final _$loginAtom =
      Atom(name: '_LoginStoreBase.login', context: context);

  @override
  String get login {
    _$loginAtom.reportRead();
    return super.login;
  }

  @override
  set login(String value) {
    _$loginAtom.reportWrite(value, super.login, () {
      super.login = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_LoginStoreBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$acessTokenAtom =
      Atom(name: '_LoginStoreBase.acessToken', context: context);

  @override
  String get acessToken {
    _$acessTokenAtom.reportRead();
    return super.acessToken;
  }

  @override
  set acessToken(String value) {
    _$acessTokenAtom.reportWrite(value, super.acessToken, () {
      super.acessToken = value;
    });
  }

  @override
  String toString() {
    return '''
login: ${login},
password: ${password},
acessToken: ${acessToken}
    ''';
  }
}
