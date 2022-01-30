import 'package:basic_integration_testing/repositories/user_repo_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepo implements UserRepoInterface {
  const UserRepo() : super();

  /// Searches our user database via the supabase_flutter package.
  ///
  /// Returns a list of user names.
  ///
  /// WARNING:
  /// - in a more realistic example, this would be moved to a "repository" instead
  ///   optionally with something like a FutureBuilder
  /// - check fluttercrashcourse.com for tutorials on these concepts
  @override
  Future<List<String>> searchUsers(String name) async {
    // here, we leverage Supabase's (Postgres') full text search feature
    // for super fast text searching without the need for something overkill for
    // an example like this such as ElasticSearch or Algolia
    //
    // more info on Supabase's full text search here
    // https://supabase.com/docs/guides/database/full-text-search

    // WARNING: we aren't doing proper error handling here,
    // as this is an example but typically we'd handle any exceptions via the
    // callee of this function
    // NOTE: this seaches our 'fts' (full text search column)
    // NOTE: 'limit()' will improve the performance of the call as well.
    // normally, we'd use a proper backend search index that would provide
    // us with the most relevant results, vs simply using a wildcard match
    final result = await Supabase.instance.client
        .from('names')
        .select('fname, lname')
        .textSearch('fts', "$name:*")
        .limit(100)
        .execute();

    // WARNING: we aren't doing proper response error code handling here.
    // normally, we're present some kind of feedback to the user if this fails
    // and optionally report it to an external tracking system such as Sentry,
    // Rollbar, etc
    if (result.error != null) {
      print('error: ${result.error.toString()}');
      return [];
    }

    final List<String> names = [];

    // convert results into a list here
    // 'result.data' is a list of Maps, where each map represents a returned
    // row in our database. each key of the map represents a table column
    for (var v in ((result.data ?? []) as List<dynamic>)) {
      // NOTE: string formatting over many items can be a tad resource intensive
      // but since this is across a limited set of results, it should be fine.
      // alternatively, we can format this directly in the supabase query
      names.add("${v['fname']} ${v['lname']}");
    }
    return names;
  }
}
