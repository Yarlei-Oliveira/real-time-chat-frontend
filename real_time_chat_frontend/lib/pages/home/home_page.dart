import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:real_time_chat_frontend/API/API.dart';
import 'package:real_time_chat_frontend/pages/home/components/main_page.dart';
import 'package:real_time_chat_frontend/stores/login.store.dart';
import 'package:real_time_chat_frontend/utils/querys/Query.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginStore loginStore = GetIt.I<LoginStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Graphql().subscription(
        query: QueryRepository.getUsers,
        widget: MainPage(context: context).mainPage,
      ),
    );
  }
}
