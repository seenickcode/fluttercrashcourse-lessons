# lesson05

Wrapping up our recipe! Styling text, NetworkImage and Dart Lists.
Styling text and adding images. Working with Dart Lists.

## Lesson Goals

1. Rendering an Image from a URL
2. Controlling Content with Constraints
3. Adding Style to Text
4. Managing Style
5. Pat Yourself on the Back!

## Lesson Requirements

Ensure Flutter is [setup on your system](https://flutter.io/get-started/).

## Module Goal

This lesson is one of many that will work towards one of our course recipes as well as one of the most **basic** skills in mobile development: **developing a "Product Detail" screen**. "Product" is loosely used here, it can be really almost anything.

## 1. Rendering an Image from a URL

- Remember, we're working towards a goal!

![screenshot](lesson05-screenshot.png)

- Create a private function that renders an image, using a `Container` to keep things flexible.
- Using the `Image.network` constructor ([source](https://docs.flutter.io/flutter/widgets/Image-class.html)) without a container.
- Defining the constraints of the image using the `fit` parameter ([source](https://docs.flutter.io/flutter/painting/BoxFit-class.html))

## 2. Controlling Content with Constraints
- Yet this produces "layout thrashing" because once the image is loaded, the content below is "pushed" down.
- We can contain the image in a `Container` using it's `constraints` parameter, using `BoxConstraints` ([source](https://docs.flutter.io/flutter/rendering/BoxConstraints-class.html)). `BoxConstraints.tight*` "Creates box constraints that is respected only by the given size.", `BoxConstraints.loose*` "Creates box constraints that forbid sizes larger than the given size."
- Updating our main render function and commenting it properly.
   
## 3. Adding Style to Text

- Add a `_sectionTitle` function that just renders a title. That way we can keep code re-usable.
- Add a `_titleContainer` function. This way we can cleanly separate layout with our individual widget (our title). 
- Note that later, this can be added to a separate file if it's used in more than one place.

## 4. Mangaging Style

- We can create a separate class for managing style or things get unwieldly for real projects!
- `static`: ""static" means a member is available on the class itself instead of on instances of the class. That's all it means, and it isn't used for anything else."
- `final`: "Once assigned a value, a final variable's value cannot be changed." It is "immutable".
- `const`: a value defined at compile time. Immutable. ([Source](https://news.dartlang.org/2012/06/const-static-final-oh-my.html))

## 4. Pat Yourself on the Back!

We're done with this recipe! The screen is pretty simple but we've covered a ton of useful concepts and features of Flutter. 