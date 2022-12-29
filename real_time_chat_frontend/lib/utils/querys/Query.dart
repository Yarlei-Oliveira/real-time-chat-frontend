class QueryRepository {
  static const singupQuery = """
    mutation singup(\$varSignup: LoginUserInput!) {
	singup(loginUserInput: \$varSignup) {
    username
    id
  }
}
 """;
}
