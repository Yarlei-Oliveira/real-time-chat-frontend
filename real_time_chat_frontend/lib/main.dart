import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:real_time_chat_frontend/pages/home/home_page.dart';
import 'package:real_time_chat_frontend/pages/login_page/login_page.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/constants.dart';

void main() async {
  GetIt.I.registerSingleton(LoginStore());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: HttpLink("http://192.168.1.109:3000/graphql"),
        cache: GraphQLCache(),
      ),
    );
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginPage(),
        routes: {
          Routes.HOME_PAGE: (context) => const HomePage(),
        },
      ),
    );
  }
}
