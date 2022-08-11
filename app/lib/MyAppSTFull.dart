import 'package:flutter/material.dart';

// StatefulWidget: Has internal "state"
// Khi state thay đổi thì hàm build reload => giao diện reload
// Tạo từ 2 class:
// 1 public class kế thừa từ StatefulWidget
// 1 private class để vẽ giao diện (qua hàm build())
class MyAppStatefull extends StatefulWidget {
  String name;
  int age;
  MyAppStatefull({this.name = "Duc", this.age = 20});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyAppStatefull> {
  String _email = ''; // This is state
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'This is stateful widget',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Người dùng thay đổi giá trị thì là state
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: TextField(
                  // Get value from text field
                  controller: emailEditingController,
                  onChanged: (text) {
                    this.setState(() {
                      _email =
                          text; // When state change => build() rerun => reload widget
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20),
                      ),
                    ),
                    labelText: 'Enter you mail',
                  ),
                ),
              ),
              Text(
                'This is email: ${_email}',
                style: TextStyle(fontSize: 30, color: Colors.red),
              ),
              Text(
                'Line 2: Name: ${widget.name} has age ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.blueAccent),
              ),
              Text(
                'Line 3: Name: ${widget.name} has age ${widget.age}',
                style: TextStyle(fontSize: 30, color: Colors.green.shade900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
