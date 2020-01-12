import 'package:flutter/material.dart';
import './views/task.dart';

class ToDoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ListState();
}

class ListState extends State<ToDoList> {
  List<String> _items = [];

  void _addItem(String task) {
    if (task.length > 0) {
      setState(() {
        _items.add(task);
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  Widget _buildList() {
    return new ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index < _items.length) {
          return _buildItem(_items[index], index);
        }
      },
    );
  }

  Widget _buildItem(String text, int index) {
    return new ListTile(
      title: new Text(text),
      onTap: () => _promptRemove(index),
    );
  }

  void _addItemScreen() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TaskScreen(_addItem);
        }
      )
    );
  }

  void _promptRemove(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Mark "${_items[index]}" as done?'),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            new FlatButton(
              child: new Text('Mark as Complete'),
              onPressed: () {
                _removeItem(index);
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('To Do List')
      ),
      body: _buildList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _addItemScreen,
        tooltip: 'Add Task',
        child: new Icon(Icons.add),
      ),
    );
  }
}