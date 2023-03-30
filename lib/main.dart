import 'package:flutter/material.dart';
import 'package:my_app/screen/add.dart';
import 'package:my_app/screen/homepage.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo Apps',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'homepage': (context) => HomePage(),
        'addtodo': (context) => AddTodo(),
      },
      initialRoute: 'homepage',
    );
  }
}
