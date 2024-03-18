// ignore_for_file: avoid_print

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:taskifie/shared/gql-docs/user.gql.dart';
import 'package:taskifie/shared/interfaces/user.interface.dart';
import 'package:taskifie/shared/services/general.service.dart';

Future<List<UserDetails>> getUserDetailsQuery({
  List<String>? userIds,
  List<String>? emails,
}) async {
  try {
    final QueryOptions options =
        fetchUserDetailsGQL(userIds: userIds, emails: emails);

    print('@@ trying to fetch');

    final QueryResult result = await GeneralService.o.qlClient.query(options);

    if (result.hasException) {
      throw result.exception!;
    }

    List<UserDetails> listOfItems = [];

    if (result.data?['getUser']?['status']) {
      var resultBody = result.data?['getUser']?['payload'] as List;
      listOfItems = resultBody.map((e) => UserDetails.fromJson(e)).toList();
    }

    return listOfItems;
  } catch (err) {
    print('getUserDetailsQuery [ERR] : $err');
    return [];
  }
}

Future<List<UserDetails>> updateUserDetailsMutation({
  required String userId,
  required UserDetails newUserDetails,
}) async {
  try {
    final MutationOptions options =
        updateUserDetailsGQL(userId: userId, input: newUserDetails);

    final QueryResult result = await GeneralService.o.qlClient.mutate(options);

    if (result.hasException) {
      throw result.exception!;
    }

    List<UserDetails> listOfItems = [];

    if (result.data?['getUser']?['status']) {
      var resultBody = result.data?['getUser']?['payload'] as List;
      listOfItems = resultBody.map((e) => UserDetails.fromJson(e)).toList();
    }

    return listOfItems;
  } catch (err) {
    print('updateUserDetailsMutation [ERR] : $err');
    return [];
  }
}
