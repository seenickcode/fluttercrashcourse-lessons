# lesson04

Using models and mock data to populate your page.

## Lesson Goals

1. Review our recipe goal. Discuss architecture.
2. Create a model with instance variables.
3. Create a "mock" model, returning fake data.
4. Update our `LocationDetail` widget to take in a location.

## Lesson Requirements

Ensure Flutter is [setup on your system](https://flutter.io/get-started/).

## Module Goal

This lesson is one of many that will work towards one of our course recipes as well as one of the most **basic** skills in mobile development: **developing a "Product Detail" screen**. "Product" is loosely used here, it can be really almost anything.

## 1. Review our recipe goal
   
Remember, we're working towards a goal!

![screenshot](lesson05-screenshot.png)

- What kind of data do we need for this? How do we organize it?
- Models are classes that represent a "thing" in your code.
- One can "instantiate" a model "instance" and assign data to it.
- Models can also be used to perform actions, such as fetching some data.

## 2. Create a model with instance variables

- We'll keep our models in the 'models' directory.
- Create some "instance variables" for `Location` and `LocationFact`
- Create a constructor. A constructor is a special method that can be used to "instantiate" an instance of an object (i.e. our model). 
- Dart's "{}" syntax makes arguments optional. 

## 3. Create a "mock" model, returning fake data

- "Mocks" are typically used by tests, to simulate something returned by a web service API.
- We can also use mocks to populate our screen.

## 4. Update `LocationDetail` to take in a location

- We can update our `LocationDetail` widget to hold a location instance as well as create a constructor.
- We can now refer to our widget's `location` instance variable, either by `this.location` or just `location`.
- We can now fake fetching a location in our `main.dart` file.