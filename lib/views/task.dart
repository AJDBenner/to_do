import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  Function function;
  
  TaskScreen(Function function) {
    this.function = function;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add a new task')
      ),
      body: new TextField(
        autofocus: true,
        onSubmitted: (value) {
          function(value);
          Navigator.pop(context);
        },
        decoration: new InputDecoration(
          hintText: 'Enter a task to do',
          contentPadding: const EdgeInsets.all(16)
        ),
      ),
    );
  }
}