# Basic Integration Testing

This is a very basic example of using Riverpod for dependency injection, which simplifies our codebase for integration testing. This is an intermediate level tutorial. For more comprehensive tutorials on this topic, check out [fluttercrashcourse.com](https://fluttercrashcourse.com). Also check out my [my YouTube channel](https://youtube.com/c/seenickcode).

## Steps Taken

These steps are a continuation of this [lesson](https://github.com/seenickcode/fluttercrashcourse-lessons/tree/master/youtube/basic_integration_testing). We will be building off of the code we wrote in that lesson by following the following steps:

1. Explaining how dependency injection affects the complexity of our code. If we have many nested widgets, we have to ensure each constructor is updated.

2. What we can do, is lift dependency inject 'up' by using an InheritedWidget. We created an AppConfig class which is an inherited widget, and then we can customize it with what dependencies we want to inject.

3. Next, any widget in the tree can access it when we wrap App with it. Making our code much simpler.

4. Bonus: why we need this. See talking points below.

### Talking Points

1. Dependency injection is a critical skill when testing Flutter apps.
   a. Apps typically rely on some external state.
   b. Tests should be predictible.
   c. We sometimes want to control state in our tests, typically using test fixtures.
   d. Dependency injection allows us to cover these needs. We mock our external dependencies and use these mocks to override functionality in our app.
   i. For example, if we have a class that calls something external, we create a mock of that class, with something hardcoded returned instead.
2. To implement dependency injection, we instantiate our mocks and pass them down the widget tree.
   a. This is cumersome and makes our code difficult to maintain.
3. InheritedWidget gives as a way to make this easier.

## How to Run These Integration Tests

1. `flutter test integration_test`

## Questions?

[Tweet me](https://twitter.com/seenickcode) or reach out via my [contact form](https://fluttercrashcourse.com/sayhi).

Issues? Open a bug report [here](https://github.com/seenickcode/fluttercrashcourse-lessons/issues/new?assignees=&labels=&template=bug_report.md&title=).

![Demo](demo.gif)

## Target Audience

Flutter engineers with an intermediate skill level.

## Resources
