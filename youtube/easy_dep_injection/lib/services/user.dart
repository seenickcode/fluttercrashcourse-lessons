import 'package:easy_dep_injection/repositories/mock_user_repo.dart';
import 'package:easy_dep_injection/repositories/user_repo_interface.dart';
import '../repositories/user_repo.dart';

class UserService {
  static UserService? _instance;

  UserService._();

  static UserService get instance => _instance ??= UserService._();

  final UserRepoInterface _repo = const String.fromEnvironment('ENV') == 'test'
      ? MockUserRepo()
      : const UserRepo();

  UserRepoInterface get repo => _repo;
}
