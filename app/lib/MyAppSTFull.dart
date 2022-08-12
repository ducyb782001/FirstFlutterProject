import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Transaction.dart';
import 'TransactionList.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

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

  void _insertTransaction() {
    if (_transaction.content.isEmpty ||
        _transaction.amount == 0.0 ||
        _transaction.amount.isNaN) {
      return;
    }
    _transactions?.add(_transaction);
    _transaction = Transaction(amount: 0.0, content: '');
    _amountController.text = '';
    _contentController.text = '';
  }

  void _onButtonShowModalSheet() {
    showModalBottomSheet(
        context: this.context,
        builder: (context) {
          return Column(
            children: <Widget>[
              TextField(
                  decoration: InputDecoration(labelText: 'Content'),
                  controller: _contentController,
                  onChanged: (text) {
                    setState(() {
                      _transaction.content = text;
                    });
                  }),
              TextField(
                decoration: InputDecoration(labelText: 'Amount(money)'),
                controller: _amountController,
                onChanged: (text) {
                  setState(() {
                    _transaction.amount = double.tryParse(text) ?? 0;
                  });
                },
              ),
            ],
          );
        });
  }

  String _email = ''; // This is state
  final emailEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'This is stateful widget',
      scaffoldMessengerKey: _messangerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transaction manager'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _insertTransaction();
                });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add transaction',
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _insertTransaction();
            });
          },
        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: SizedBox(
                          child: ButtonTheme(
                            height: 60,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.red,
                                backgroundColor: Colors.blue,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                // print('Content = ${_transaction.content}, money amount = ${_transaction.amount}');
                                // _onButtonShowModalSheet();
                                setState(() {
                                  _insertTransaction();
                                });
                                _messangerKey.currentState
                                    ?.showSnackBar(SnackBar(
                                  content: Text(
                                      'Content: ${_transactions.toString()}'),
                                  duration: const Duration(seconds: 4),
                                ));
                              },
                              child: const Text('Insert Transaction'),
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Expanded(
                        child: SizedBox(
                          child: ButtonTheme(
                            height: 60,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                primary: Colors.red,
                                backgroundColor: Colors.blue,
                                textStyle: const TextStyle(fontSize: 20),
                              ),
                              onPressed: () {
                                // TODO: Open modal bottom sheet
                                showCupertinoModalBottomSheet(
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                    controller:
                                        ModalScrollController.of(context),
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Text('data'),
                                          Text('data'),
                                          Text('data'),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Open Modal bottom sheet'),
                            ),
                          ),
                        ),
                      ),
                    ],
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
