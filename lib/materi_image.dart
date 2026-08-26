import 'package:flutter/material.dart';

void main() {
  runApp(const MyImageWidget());
}

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Image.asset('assets/snupi.jpg'),
    );
  }
}