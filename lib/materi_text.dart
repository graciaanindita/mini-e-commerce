import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}
class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My First Application',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First Application'),
        ),
        body: const Center(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}