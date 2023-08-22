import 'package:flutter/material.dart';
import 'package:test1/someWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Center(child: Builder(
            builder: (context) {
              return ElevatedButton(
                onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const SomeWidget(),));},
                child: const Text("press"));
            }
          )),
        ),
      ),
    );
  }
}
