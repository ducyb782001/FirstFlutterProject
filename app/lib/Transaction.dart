class Transaction {
  String content;
  double amount;

  Transaction({required this.amount, required this.content});
  @override
  String toString() {
    // TODO: implement toString
    return 'Content: ${content} and Amount: ${amount}\n';
  }
}
