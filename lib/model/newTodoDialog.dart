import 'package:flutter/material.dart';
import 'todo.dart';
class NewTodoDialog extends StatefulWidget {
  @override
  _NewTodoDialogState createState() => _NewTodoDialogState();
}

class _NewTodoDialogState extends State<NewTodoDialog> {
  final controllerTitle = new TextEditingController();
  final controllerBody = new TextEditingController();
  String dropdownValue = 'DEFAULT';
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
      elevation: 20.0,
      backgroundColor: Colors.yellow[200],
      title: Text(
        'New To Do',
        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Title',
            ),
            controller: controllerTitle,
          ),
          SizedBox(
            height: 10.0,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Body',
            ),
            controller: controllerBody,
          ),
          Center(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  print(dropdownValue);
                });
              },
              items: <String>['DEFAULT', 'CALL', 'HOME_WORK']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text('Add'),
          onPressed: () {
            try {
              final todo = new Todo(
                  title: controllerTitle.value.text,
                  body: controllerBody.value.text,
                  completed: 0,
                  icon: dropdownValue);
              controllerTitle.clear();
              controllerBody.clear();
              //Navigator of .pop nos devuelve a la vista anterior
              Navigator.of(context).pop(todo);
            } catch (e) {
              print(e);
            }
          },
        ),
      ],
    );
  }
}
