import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Graphql {
  query(String repository, Widget Function(QueryResult result) widget,
      {Map<String, dynamic>? variables}) {
    Query(
        options: QueryOptions(
          document: gql(repository),
          variables: variables ?? {},
          pollInterval: const Duration(seconds: 10),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const CircularProgressIndicator();
          }

          List? repositories =
              result.data?['viewer']?['repositories']?['nodes'];

          if (repositories == null) {
            return const Text('No repositories');
          }
          return widget(result);
        });
  }

  mutation(
      String repository,
      Widget Function(
              QueryResult result,
              MultiSourceResult Function(Map<String, dynamic>,
                      {Object? optimisticResult})
                  runMutation)
          widget) {
    Mutation(
        options: MutationOptions(
          document: gql(repository),
          onCompleted: (dynamic resultData) {
            print(resultData);
          },
        ),
        builder: (runMutation, result) => widget(result!, runMutation));
  }
}
