import 'package:app/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  List<Transaction>? transactions;
  TransactionList({this.transactions});

  List<Widget> _buildWidgetList() {
    int index = 0;
    return transactions!.map((e) {
      index++;
      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: (index - 1) % 2 == 0 ? Colors.pink : Colors.amber,
        elevation: 10,
        child: ListTile(
          leading: const Icon(Icons.hearing),
          title: Text(
            e.content,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            '${e.amount}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          onTap: () {
            print('Tap Me');
          },
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: _buildWidgetList(),
    );
  }
}
