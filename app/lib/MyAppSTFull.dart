import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';
import 'TransactionList.dart';

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
  final _contentController = TextEditingController();
  final _amountController = TextEditingController();
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();

  // Define states
  Transaction _transaction = Transaction(amount: 0.0, content: '');
  List<Transaction>? _transactions = List<Transaction>.empty(growable: true);

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
    return MaterialApp(
      title: 'This is stateful widget',
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        body: SafeArea(
          minimum: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  // Người dùng thay đổi giá trị thì là state
                  TextField(
                    decoration: InputDecoration(labelText: 'Content'),
                    controller: _contentController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.content = text;
                      });
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount(Money)'),
                    controller: _amountController,
                    onChanged: (text) {
                      setState(() {
                        _transaction.amount = double.tryParse(text) ?? 0;
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  ButtonTheme(
                    height: 60,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.red,
                        backgroundColor: Colors.blue,
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        // print('Content = ${_transaction.content}, money amount = ${_transaction.amount}');
                        setState(() {
                          _transactions?.add(_transaction);
                          _transaction = Transaction(amount: 0.0, content: '');
                          _amountController.text = '';
                          _contentController.text = '';
                        });
                        _messangerKey.currentState?.showSnackBar(SnackBar(
                          content: Text('Content: ${_transactions.toString()}'),
                          duration: const Duration(seconds: 4),
                        ));
                      },
                      child: const Text('Insert Transaction'),
                    ),
                  ),
                  TransactionList(
                    transactions: _transactions,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
