import 'package:flutter/material.dart';
import 'package:widgets_example/examples/oneboarding/onboarding.dart';
import 'package:widgets_example/widgets/expandable_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExpandableWidget(),
    );
  }
}
