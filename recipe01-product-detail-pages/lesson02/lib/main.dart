import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
      title: "Beautiful Locations",
      home: Scaffold(
        appBar: AppBar(title: Text("Kyoto, Japan")),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text("One")),
              Container(
                  decoration: BoxDecoration(color: Colors.green),
                  child: Text("Two")),
              Container(
                  decoration: BoxDecoration(color: Colors.blue),
                  child: Text("Three")),
            ]),
      )));
}
