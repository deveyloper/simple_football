import 'package:flutter/material.dart';
import 'dart:math';

class MoneyTransferWidget extends StatelessWidget {
  final String from;
  final String fromTitle;
  final String to;
  final String amountSign;
  final bool sendStatus;

  MoneyTransferWidget(
      {this.from, this.fromTitle, this.to, this.amountSign, this.sendStatus});

  @override
  Widget build(BuildContext context) {
    String str = '';
    for (final names in this.from.split(' ')) {
      str = str + names[0].toUpperCase();
    }

    String _fromShortName = str;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xFFE3E6F9), shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  _fromShortName,
                  style: TextStyle(fontSize: 20),
                ))),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  from,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  'X Bankası',
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
                Text(
                  fromTitle,
                  style: TextStyle(color: Colors.black54, fontSize: 13),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(
              Icons.arrow_forward,
              size: 30,
              color: Colors.black54,
            ),
          ),
          Expanded(
            flex: 1,
            child: Opacity(
              opacity: 0.50,
              child: Icon(
                sendStatus ? Icons.check_circle : Icons.cancel,
                color: sendStatus ? Colors.green : Colors.red,
                size: 50,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  to,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                Text(
                  'Y Bankası',
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
                RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(children: [
                    TextSpan(
                      text: amountSign,
                      style: TextStyle(color: Colors.black45, fontSize: 13),
                    ),
                    TextSpan(
                      text: Random().nextInt(10000).toString(),
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    )
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
