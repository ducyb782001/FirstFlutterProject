import 'package:app/MyAppSTFull.dart';
import 'package:flutter/material.dart';
import 'MyApp.dart';

void main() {
  runApp(MaterialApp(
    title: 'Transaction App',
    home: MyAppStatefull(
      age: 18,
      name: 'Trung Duc dep trai',
    ),
  ));
}
