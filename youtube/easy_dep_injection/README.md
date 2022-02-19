# Basic Integration Testing

This is a very basic example of using Riverpod for dependency injection, which simplifies our codebase for integration testing. This is an intermediate level tutorial. For more comprehensive tutorials on this topic, check out [fluttercrashcourse.com](https://fluttercrashcourse.com). Also check out my [my YouTube channel](https://youtube.com/c/seenickcode).

## Steps Taken

These steps are a continuation of this [lesson](https://github.com/seenickcode/fluttercrashcourse-lessons/tree/master/youtube/basic_integration_testing). We will be building off of the code we wrote in that lesson by following the following steps:

1. Install Riverpod `flutter pub add flutter_riverpod`

## How to Run These Integration Tests

1. `flutter test --dart-define="ENV=test" integration_test`
2. We changed this code:

```dart
// main.dart
// ...

runApp(const App(UserRepo()));

// ...
```

with this code:

```dart
// main.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ...

runApp(const ProviderScope(child: App()));

// ...
```

3. remove dep injection
4. add service

5. run with `flutter run --dart-define="ENV=test"`
6. run tests with

## Questions?

[Tweet me](https://twitter.com/seenickcode) or reach out via my [contact form](https://fluttercrashcourse.com/sayhi).

Issues? Open a bug report [here](https://github.com/seenickcode/fluttercrashcourse-lessons/issues/new?assignees=&labels=&template=bug_report.md&title=).

![Demo](demo.gif)

## Target Audience

Flutter engineers with an intermediate skill level.

## Resources

- []()
