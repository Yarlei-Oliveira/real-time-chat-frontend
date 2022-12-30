class QueryRepository {
  static const singupQuery = """
    mutation login(\$varLogin: LoginUserInput!){
  login(loginUserInput: \$varLogin){
    user{
      username
    }
    acess_token
  }
}
 """;
}
