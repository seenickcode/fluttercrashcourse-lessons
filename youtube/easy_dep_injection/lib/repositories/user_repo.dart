import 'package:easy_dep_injection/repositories/user_repo_interface.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepo implements UserRepoInterface {
  const UserRepo() : super();

  @override
  Future<List<String>> searchUsers(String name) async {
    final result = await Supabase.instance.client
        .from('names')
        .select('fname, lname')
        .textSearch('fts', "$name:*")
        .limit(100)
        .execute();

    if (result.error != null) {
      print('error: ${result.error.toString()}');
      return [];
    }

    final List<String> names = [];

    for (var v in ((result.data ?? []) as List<dynamic>)) {
      names.add("${v['fname']} ${v['lname']}");
    }
    return names;
  }
}
