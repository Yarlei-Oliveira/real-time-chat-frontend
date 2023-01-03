import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Graphql {
  query(
      {required String repository,
      required Widget Function(QueryResult result) widget,
      Map<String, dynamic>? variables}) {
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

  Widget mutation(
      {required String repository,
      required Function(dynamic) onCompleted,
      required Function(OperationException?)? onError,
      required Widget Function(dynamic, dynamic) widget}) {
    return Mutation(
        options: MutationOptions(
          document: gql(repository),
          onCompleted: onCompleted,
          onError: onError,
        ),
        builder: (runMutation, result) => widget(result!, runMutation));
  }

  Widget subscription(
      {required String query, required Widget Function(QueryResult) widget}) {
    return Subscription(
      options: SubscriptionOptions(document: gql(query)),
      builder: (QueryResult result) {
        if (result.isLoading) {
          return const CircularProgressIndicator();
        }
        return widget(result);
      },
    );
  }
}
