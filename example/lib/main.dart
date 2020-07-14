import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

/// A simple app with scollable ListView.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple Scroll')),
        body: ListView(
          children: <Widget>[
            for (int n = 0; n < 200; n++)
              Container(height: 40.0, child: Text('$n')),
          ],
        ),
      ),
    );
  }
}
