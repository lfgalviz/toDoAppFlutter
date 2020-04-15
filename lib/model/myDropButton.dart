import 'package:flutter/material.dart';

class MyDropButton extends StatefulWidget {
  final String selected;
  final ValueChanged<String> onChangedValue;

  MyDropButton({@required this.selected, @required this.onChangedValue});

  @override
  _MyDropButtonState createState() => _MyDropButtonState();
}

class _MyDropButtonState extends State<MyDropButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.selected,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: widget.onChangedValue,
      items: <String>['DEFAULT', 'CALL', 'HOME_WORK']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
