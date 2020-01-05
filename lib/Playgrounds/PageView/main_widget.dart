import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(color: Colors.red, child: Center(child: Text('red'))),
          Container(color: Colors.green, child: Center(child: Text('green'))),
          Container(color: Colors.blue, child: Center(child: Text('blue'))),
        ],
      ),
    );
  }
}
