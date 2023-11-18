import 'package:devfestdemo2023/ui/cats_home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevFest Demo 2023',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const CatsHomePage(),
    );
  }
}

