import 'package:app/Transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {
  List<Transaction>? transactions;
  TransactionList({this.transactions});

  // List<Widget> _buildWidgetList() {
  //   int index = 0;
  //   return transactions!.map((e) {
  //     index++;
  //     return Card(
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(20),
  //       ),
  //       color: (index - 1) % 2 == 0 ? Colors.pink : Colors.amber,
  //       elevation: 10,
  //       child: ListTile(
  //         leading: const Icon(Icons.hearing),
  //         title: Text(
  //           e.content,
  //           style: const TextStyle(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 18,
  //             color: Colors.white,
  //           ),
  //         ),
  //         subtitle: Text(
  //           '${e.amount}',
  //           style: const TextStyle(
  //             color: Colors.white,
  //           ),
  //         ),
  //         onTap: () {
  //           print('Tap Me');
  //         },
  //       ),
  //     );
  //   }).toList();
  // }
  ListView _buildListView() {
    int index = 0;
    return ListView.builder(
        itemCount: transactions?.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: (index - 1) % 2 == 0 ? Colors.pink : Colors.amber,
            elevation: 10,
            child: ListTile(
              leading: const Icon(Icons.hearing),
              title: Text(
                transactions![index].content,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '${transactions![index].amount}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              onTap: () {
                print('Tap Me');
              },
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // Make this scrollable using ListView
    // 1. ListView(children: <Widget>[]) => Load all children at the same time
    // 2. ListView(itemBuilder:...) => Load only visible items
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 600,
      // child: ListView(
      //   children: this._buildWidgetList(),
      // ),
      child: _buildListView(),
    );
  }
}
