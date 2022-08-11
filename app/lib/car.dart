class Car {
  String name;
  int yearOrProduct;

  // New way of constructors
  // Car(this.name, this.yearOrProduct);

  // Another way
  Car({
    required this.name,
    this.yearOrProduct = 2020,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$name - $yearOrProduct';
  }

  void doSomeThing() {
    print('I\'m doing something');
  }

  // Function as a variable
}
