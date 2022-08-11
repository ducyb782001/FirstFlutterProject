import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

class _MyAppState extends State<MyAppStatefull> with WidgetsBindingObserver {
  // When a widget is created and running, there are 3 functions that we may concern
  // 1. init state
  // 2. build() is trigger when we use setState()
  // 3. dispose() is called when state/ widget object is removed
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Run Init state');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Run dispose ');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print('App is in background mode');
    } else if (state == AppLifecycleState.resumed) {
      print('App is in foreground mode');
    }
  }

  String _email = ''; // This is state
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('Run build()');
    DateTime now = new DateTime.now();
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
                DateFormat('yyyy/MM/dd').format(now),
                style: TextStyle(fontSize: 30, color: Colors.green.shade900),
              )
            ],
          ),
        ),
      ),
    );
  }
}
