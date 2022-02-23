import 'package:easy_dep_injection/repositories/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'app_config.dart';
import 'screens/search/search.dart';
import 'style.dart';

class App extends StatelessWidget {
  // cite the customizeable variables here
  final UserRepoInterface userRepo;

  const App({Key? key, required this.userRepo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppConfig(
        userRepo: userRepo,
        child: MaterialApp(
          title: 'Super Search',
          home: const Search(),
          theme: appTheme,
        ));
  }
}
