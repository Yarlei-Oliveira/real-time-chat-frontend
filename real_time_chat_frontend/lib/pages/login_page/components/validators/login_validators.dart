class LoginValidator {
  static String? emailValidator(String? text) {
    final value = text ?? "";
    if (value.isEmpty) {
      return "Preencha o campo email";
    }
    if (!value.contains("@") || !value.contains(".com")) {
      return "digite um email valido";
    }
    return null;
  }

  static String? passwordValidator(String? text) {
    final value = text ?? "";
    if (value.isEmpty) {
      return "Preencha o campo senha";
    }
    return null;
  }
}
