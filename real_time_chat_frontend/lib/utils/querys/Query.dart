class QueryRepository {
  static const singinQuery = """
    mutation login(\$varLogin: LoginUserInput!){
  login(loginUserInput: \$varLogin){
    user{
      username
    }
    acess_token
  }
}
 """;
  static const signUp = """
  mutation signup(\$varSignup: LoginUserInput!){
  signup(loginUserInput: \$varSignup){
    email
    username
  }
}

 """;
  static const getUsers = """
    {
  users {
    username
    id
  }
}
 """;
}
