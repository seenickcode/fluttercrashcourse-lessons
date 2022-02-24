import 'package:easy_dep_injection/repositories/user_repo_interface.dart';
import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  final UserRepoInterface userRepo;

  // a valid inherited widget requires a `Widget child`
  const AppConfig({
    Key? key,
    required this.userRepo,
    required Widget child,
  }) : super(key: key, child: child);

  // this is a helper method we usually add to an inherited widget
  // this page has a great video explanation:
  // https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html
  static AppConfig? of(BuildContext context) =>
      // dependOnInheritedWidgetOfExactType allows the consumer to use context to
      // access the AppConfig by traversing up the widget tree. As long as our widget
      // tree has an AppConfig, a value will be returned
      context.dependOnInheritedWidgetOfExactType<AppConfig>();

  // NOTE The child widget doesn't necessarily have to be rebuilt every time its ancestor is rebuilt.
  // If the logic inside updateShouldNotify determines that the descendant widgets needs to be
  // updated, it will be notified and rebuilt.
  @override
  bool updateShouldNotify(_) => false;
}
