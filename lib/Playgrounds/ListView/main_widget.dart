import 'package:flutter/material.dart';

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 200,
        itemBuilder: ((context, index) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Icon(Icons.ac_unit), Text('item   $index')],
            )),
      ),
    );
  }
}
