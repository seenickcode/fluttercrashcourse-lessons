import 'package:easy_dep_injection/repositories/user_repo_interface.dart';
import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  final UserRepoInterface userRepo;

  const AppConfig({
    Key? key,
    required this.userRepo,
    required Widget child,
  }) : super(key: key, child: child);

  static AppConfig? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppConfig>();

  // NOTE The child widget doesn't necessarily have to be rebuilt every time its ancestor is rebuilt.
  // If the logic inside updateShouldNotify determines that the descendant widgets needs to be
  // updated, it will be notified and rebuilt.
  @override
  bool updateShouldNotify(_) => false;
}
