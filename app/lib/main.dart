// Bước 1: import thư viện material vào, thư viện này sẽ cung cấp widget để code
import 'package:flutter/material.dart';
import 'calculation.dart';
import 'car.dart';

String s1 = 'How are you \n';
String s2 = 'I\'m fine';
var s3 = '$s1 - $s2'; // String concat
int x = 10;
List<int> numbers = [1, 2, 4, 6, 3, 5];

List<String> stringNumbers = numbers.map((number) {
  return 'value = $number';
}).toList();

List<String> numberTest = numbers.map((e) => 'value = $e').toList();

void main() {
  // for (int i = 0; i < numbers.length; i++) {
  //   print(numbers[i]);
  // }
  // numbers.forEach((number) {
  //   print(number)
  // });
  // var myCar = Car('Name', 2020);

  // var myCar = Car(name: 'name', yearOrProduct: 2020);
  // myCar.doSomeThing();

  // List of cars
  List<Car> cars = <Car>[]; // A blank list
  cars.add(Car(name: 'BMW', yearOrProduct: 2019));
  cars.add(Car(name: 'BMW'));
  cars.add(Car(name: 'BMW', yearOrProduct: 2022));
  print('Haha');

  runApp(Center(
      child: Text('$s3 - $x',
          style: TextStyle(fontSize: 30), // Style
          textDirection: TextDirection.ltr) // left-to-right
      ));
}
