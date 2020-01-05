import 'package:flutter/material.dart';

class ExpandedTableCell extends StatelessWidget {
  final int flex;
  final String innerText;

  ExpandedTableCell({this.flex, this.innerText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(innerText,
          style: TextStyle(fontSize: 15, color: Colors.white70)),
    );
  }
}
