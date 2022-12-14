import 'package:flutter/material.dart';

void main() {
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red[50],
        appBar: AppBar(
          title: const Center(child: Text("I Am Photographer")),
          backgroundColor: Colors.red[900],
        ),
        body: const Center(
          child: Image(
            image: AssetImage('assets/images/hn_bbqCoal.jpg'),
          ),
        ),
      ),
    );
  }
}
