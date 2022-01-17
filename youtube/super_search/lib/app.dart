import 'package:flutter/material.dart';
import 'screens/search/search.dart';
import 'style.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super Search',
      home: const Search(),
      theme: appTheme,
    );
  }
}
