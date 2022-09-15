import 'dart:io';

void main() {
  print("******************Calculator******************");

  stdout.write("Enter 1st value? ");
  int? val1 = int.parse(stdin.readLineSync()!);

  //stdout.write("Enter 2nd value? ");

  print(val1);
}
