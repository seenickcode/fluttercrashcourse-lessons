# lesson06

Wrapping up our recipe! Styling text, NetworkImage and Dart Lists.
Styling text and adding images. Working with Dart Lists.

## Lesson Goals

1. Managing Style
2. Adding a Font
3. A Note on Code Readability
4. Pat Yourself on the Back!

## Lesson Requirements

Ensure Flutter is [setup on your system](https://flutter.io/get-started/).

## Module Goal

This lesson is one of many that will work towards one of our course recipes as well as one of the most **basic** skills in mobile development: **developing a "Product Detail" screen**. "Product" is loosely used here, it can be really almost anything.

## 1. Mangaging Style

- We can create a separate class for managing style or things get unwieldly for real projects!
- `static`: ""static" means a member is available on the class itself instead of on instances of the class. That's all it means, and it isn't used for anything else."
- `final`: "Once assigned a value, a final variable's value cannot be changed." It is "immutable".
- `const`: a value defined at compile time. Immutable. ([Source](https://news.dartlang.org/2012/06/const-static-final-oh-my.html))

## 2. Adding a Font

- Create an `assets` directory, with a `fonts` sub-directory.
- Add the font to `pubspec.yml`. 
- What is `pubspec.yml`, anyway?
- Add the font name to `styles.dart`

## 3. A Note on Code Readability

- Having a naming convention for functions, not only style is important. It makes your code easier to read and organize.
- Major areas of the screen are prefixed by `_render*`
- Individual components are at the bottom of the class definition (i.e. `_sectionTitle`).
- Individual components that have something in common should be prefixed by some consistent terminology (i.e. `_section*`).

## 4. Pat Yourself on the Back!

We're done with this recipe! The screen is pretty simple but we've covered a ton of useful concepts and features of Flutter. 