import 'dart:math';

import 'package:flutter/material.dart';

class PlayerView extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int position;
  final String nationality;
  final double marketValue;

  PlayerView(
      {this.imageUrl,
      this.name,
      this.position,
      this.nationality,
      this.marketValue})
      : super(key: Key(Random().nextInt(1000).toString()));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Image(
                  width: 50,
                  height: 50,
                  image: imageUrl == null
                      ? AssetImage('assets/images/boy.png')
                      : NetworkImage(
                          imageUrl,
                        )),
            ),
            SizedBox(width: 10),
            Expanded(
                flex: 4,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            _getPositionDescription(position),
                            style: TextStyle(
                                fontSize: 13, color: Colors.deepOrange),
                          ),
                          Text(' '),
                          Text(
                            nationality == null ? '' : nationality,
                            style: TextStyle(
                                fontSize: 13, color: Colors.deepOrange),
                          )
                        ],
                      )
                    ])),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Text(marketValue.toStringAsFixed(2) + 'M \$',
                  textAlign: TextAlign.end,
                  style: TextStyle(fontSize: 15, color: Colors.black87)),
            )
          ],
        ),
      ),
    );
  }

  String _getPositionDescription(int position) {
    switch (position) {
      case 0:
        return 'GK';
        break;
      case 1:
        return 'DF';
        break;
      case 2:
        return 'MF';
        break;
      case 3:
        return 'FW';
        break;
      default:
        return '';
    }
  }
}
