import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: const Center(
            child: Text("I Am Rich"),
          ),
          backgroundColor: Colors.red[900],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/images/hn-bbqCoal.jpg'),
          ),
        ),
      ),
    ),
  );
}
