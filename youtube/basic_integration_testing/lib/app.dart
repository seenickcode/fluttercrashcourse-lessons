import 'package:basic_integration_testing/repositories/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'screens/search/search.dart';
import 'style.dart';

class App extends StatelessWidget {
  final UserRepoInterface userRepo;

  const App(this.userRepo, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Search',
      home: Search(userRepo),
      theme: appTheme,
    );
  }
}
