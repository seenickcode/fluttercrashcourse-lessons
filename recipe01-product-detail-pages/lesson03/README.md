# lesson03

Code organization, functions and creating your own StatelessWidgets. Shows a nav bar and three colored bars, representing a simple, column based layout.

## Lesson Goals

1. Implement a function.
2. Refactor our code and create our own `StatelessWidget`

## Lesson Requirements

Ensure Flutter is [setup on your system](https://flutter.io/get-started/).

## Module Goal

This lesson is one of many that will work towards one of our course recipes as well as one of the most **basic** skills in mobile development: **developing a "Product Detail" screen**. "Product" is loosely used here, it can be really almost anything.

## 1. Clean Code

- Cleaning up our code by implementing a function.

## 2. Creating a StatelessWidget 

- Separating our screen into its own file.
- Widgets that do not need to keep track of any data can be StatelessWidgets.

"When writing an app, you’ll commonly author new widgets that are subclasses of either StatelessWidget or StatefulWidget, depending on whether your widget manages any state. A widget’s main job is to implement a build function, which describes the widget in terms of other, lower-level widgets."
([source](https://flutter.io/widgets-intro/#basic-widgets))

"Stateless widget are useful when the part of the user interface you are describing does not depend on anything other than the configuration information in the object itself and the BuildContext in which the widget is inflated. For compositions that can change dynamically, e.g. due to having an internal clock-driven state, or depending on some system state, consider using StatefulWidget."
([source](https://docs.flutter.io/flutter/widgets/StatelessWidget-class.html))


Here's how you do this:

```
class MyWidgetName extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SomeKindOfWidget();
  }
}
```

Let's break this down:

First of all, we've created a new class that represents our Widget. We are **extending** the `StatelessWidget` class, which will take on all the properties and abilities of `StatelessWidget`, yet will allow us to **add** our own properties and abilities.

Each Widget has a `build` function, which "describes the part of the user interface represented by this widget." ([source](https://docs.flutter.io/flutter/widgets/StatelessWidget/build.html)). We're going to **override** `StatefulWidget`'s `build` function with our own logic.

In addition, we have an `@override` annotation. An annotation in Dart is something that simply provides the compiler a bit more information as how to treat a given function or method. [Source](https://api.dartlang.org/stable/2.0.0/dart-core/override-constant.html)So this will "override" the parent `StatelessWidget`'s `build` method.

Next, we have the `context` paramter for `build`. You'll be seeing this a lot in Flutter. "The framework calls this method when this widget is inserted into the tree..." ([source](https://docs.flutter.io/flutter/widgets/StatelessWidget/build.html)) 

What do we mean by "tree"? Simply put, any given screen in Flutter is composed by Widgets that are represented by an upside down "tree" like structure, where each node of the tree is a Widget. For example, the root node of the tree can be the screen's canvas, its child is maybe the main container such as a `Column`, and that `Column` node has multiple tree branches or "child" nodes, such as a number of `Container` Widgets.

Now, what does the `context` parameter have to do with this? Well, when Widgets in the tree are rendered, a `BuildContext` is required which is essentially "a handle to the location of a widget in the widget tree." [Source](https://docs.flutter.io/flutter/widgets/BuildContext-class.html)). Don't worry about this too much for now, just understand that `context` is what is says: required "context" for your Widget - remember, this is a "crash course"!

**It's important to note that `build` can be called multiple times at any point when the app is running.**, as parts of the widget "tree" are rebuilt as needed. For example, if data is changed in one part of the tree, maybe based on some user interaction or something is fetched from a server somewhere, and that data needs to be reflected in a given Widget and any sub-Widgets, the `build` function is invoked to re-render.

- Finish refactoring our code. 
