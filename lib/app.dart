import 'package:flutter/material.dart';
import './list.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'To Do',
      home: new ToDoList(),
    );
  }
}