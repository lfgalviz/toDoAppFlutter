import 'package:f_202010_todo_class/model/todo.dart';
import 'package:flutter/material.dart';
import 'package:f_202010_todo_class/model/newTodoDialog.dart';

class HomePageTodo extends StatefulWidget {
  @override
  _HomePageTodoState createState() => _HomePageTodoState();
}

class _HomePageTodoState extends State<HomePageTodo> {
  List<Todo> todos = new List<Todo>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _addTodo, tooltip: 'Add task', child: new Icon(Icons.add)),
    );
  }

  Widget _list() {
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, posicion) {
          var element = todos[posicion];
          String key=todos[posicion].title;
          return Dismissible(
            key: Key(key),
            child: Card(
              child: ListTile(
                title: Text(element.title),
                subtitle: Text(element.body),
                isThreeLine: true,
              ),
              color:
                  element.completed == 1 ? Colors.blueGrey : Colors.yellow[200],
            ),
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                todos.removeAt(posicion);
              });

              
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text("$key task dismissed")));
            },
            background: Container(color: Colors.red), 
          );
        });
  }

  _addTodo() async {
    final todo = await showDialog<Todo>(
      context: context,
      builder: (BuildContext context) {
        return NewTodoDialog();
      },
    );
    print(todo);
    if (todo != null) {
      setState(() {
        this.todos.add(todo);
      });
    }
  }
}
