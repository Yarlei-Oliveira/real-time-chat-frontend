import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class MainPage {
  BuildContext context;
  MainPage({required this.context});
  Widget mainPage(QueryResult result) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: result.data == null
            ? const Center(
                child: Text("Sem pessoas cadastradas"),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: result.data!["users"].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(result.data!["users"][index]["username"]),
                  );
                }),
      ),
    );
  }
}
