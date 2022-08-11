import 'package:flutter/material.dart';

// You can define your own widget
// StatelessWidget: State thay đổi => hàm build() được gọi lại, giao diện được reload lại
// Widget không có state, không chấp nhận sự thay đổi bên trong nó, thụ động thay đổi theo bên ngoài
class MyApp extends StatelessWidget {
  // Let's define a constructor here
  String name;
  int age;
  MyApp({this.name = 'Duc', this.age = 21});

  @override
  Widget build(BuildContext context) {
    // TODO: The material app chuan design
    return MaterialApp(
        title: "The material app chuan design",
        home: Scaffold(
          body: Center(
              child: Text(
            'Hello Mr.${name}, you are handsome with age ${age}',
            style: TextStyle(
                fontSize: 30, // font size
                fontWeight: FontWeight.bold,
                color: Colors.red.shade400),
            textDirection: TextDirection.ltr,
          )),
        ));
  }
}
