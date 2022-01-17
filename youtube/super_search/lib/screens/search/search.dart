import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:super_search/screens/search/tile.dart';
import 'package:super_search/style.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // an optional type as this will control the three states to our search results
  // section below: default search state, 'no results', results
  List<String>? _results;
  late String _input;

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
                  style: Theme.of(context).textTheme.bodyText1,
                  onChanged: _onSearchFieldChanged,
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
                  ))),
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
  _onSearchFieldChanged(String value) async {
    _input = value;

    if (value.isEmpty) {
      setState(() => _results = null);
    }

    final results = await _searchUsers(value);

    setState(() {
      _results = results;
      if (value.isEmpty) {
        // null is a sentinal value that allows us more control the UI
        // for a better user experience. instead of showing 'No results for ''",
        // if this is null, it will just show nothing
        _results = null;
      }
    });
  }

  /// Searches our user database via the supabase_flutter package.
  ///
  /// Returns a list of user names.
  ///
  /// WARNING:
  /// - in a more realistic example, this would be moved to a "repository" instead
  ///   optionally with something like a FutureBuilder
  /// - check fluttercrashcourse.com for tutorials on these concepts
  Future<List<String>> _searchUsers(String name) async {
    // here, we leverage Supabase's (Postgres') full text search feature
    // for super fast text searching without the need for something overkill for
    // an example like this such as ElasticSearch or Algolia
    //
    // more info on Supabase's full text search here
    // https://supabase.com/docs/guides/database/full-text-search

    // WARNING: we aren't doing proper error handling here,
    // as this is an example but typically we'd handle any exceptions via the
    // callee of this function
    final result = await Supabase.instance.client
        .from('names')
        .select('fname, lname')
        .textSearch(
            'fts', "$name:*") // seaches our 'fts' (full text search column)
        // it's not very helpful to the user to have to sift through too many results.
        // this will improve the performance of the call as well.
        // normally, we'd use a proper backend search index that would provide
        // us with the most relevant results, vs simply using a wildcard match
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
    for (var v in ((result.data ?? []) as List<dynamic>)) {
      // NOTE: string formatting over many items can be a tad resource intensive
      // but since this is across a limited set of results, it should be fine.
      // alternatively, we can format this directly in the supabase query
      names.add("${v['fname']} ${v['lname']}");
    }
    return names;
  }
}
