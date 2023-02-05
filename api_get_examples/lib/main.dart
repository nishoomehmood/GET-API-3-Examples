import 'package:flutter/material.dart';

import 'example_1.dart';
import 'example_2.dart';
import 'example_3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'REST API GET EXAMPLES',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SafeArea(child: Scaffold(
        appBar: AppBar(
          title: const Text("REST API GET EXAMPLES"),
        ),
        body: const Example3(),
      ),),
    );
  }
}

