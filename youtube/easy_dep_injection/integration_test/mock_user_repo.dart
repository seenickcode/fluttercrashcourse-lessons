import 'package:easy_dep_injection/repositories/user_repo_interface.dart';

class MockUserRepo implements UserRepoInterface {
  final _mockUsers = ['jane', 'jim', 'joe'];

  MockUserRepo() : super();

  @override
  Future<List<String>> searchUsers(String name) async {
    return _mockUsers
        .where((element) => element.toLowerCase().contains(name.toLowerCase()))
        .toList();
  }
}
