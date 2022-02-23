import 'package:easy_dep_injection/app.dart';
import 'package:easy_dep_injection/app_config.dart';
import 'package:easy_dep_injection/repositories/user_repo_interface.dart';
import 'package:flutter/material.dart';
import 'package:easy_dep_injection/screens/search/tile.dart';
import 'package:easy_dep_injection/style.dart';

class Search extends StatefulWidget {
  static const String nameFieldKey = 'name';

  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<String>? _results;
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Users'),
        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
                key: const Key(Search.nameFieldKey),
                style: Theme.of(context).textTheme.bodyText1,
                onChanged: (val) => _onSearchFieldChanged(context, val),
                autocorrect: false,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle: placeholderTextFieldStyle,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                )),
          ),
          Expanded(
              child: (_results ?? []).isNotEmpty
                  ? GridView.count(
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(2.0),
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      children: _results!.map((r) => Tile(r)).toList())
                  : Padding(
                      padding: const EdgeInsets.only(top: 200),
                      child: _results == null
                          ? Container()
                          : Text("No results for '$_input'",
                              style: Theme.of(context).textTheme.caption))),
        ]));
  }

  /// Handles user entering text into the search field. We kick off a search for
  /// every letter typed.
  _onSearchFieldChanged(BuildContext context, String value) async {
    setState(() {
      _input = value;
      if (value.isEmpty) {
        // null is a sentinal value that allows us more control the UI
        // for a better user experience. instead of showing 'No results for ''",
        // if this is null, it will just show nothing
        _results = null;
      }
    });

    // NOTE we'd normally show an error if of() here returns null
    final results = await AppConfig.of(context)!.userRepo.searchUsers(value);

    setState(() {
      _results = results;
    });
  }
}
