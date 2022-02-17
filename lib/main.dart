import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.orange,
        accentColor: Colors.black,
      )),
      home: HomePage(),
    );
  }
}

//TODO modalBottomSheet
