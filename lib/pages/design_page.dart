import 'package:flutter/material.dart';

class DesignPage extends StatefulWidget {
  @override
  _DesignPageState createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  static const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = [];
    for (var i = 0; i < 7; i++) {
      var dt = DateTime.now();
      dt = dt.add(Duration(days: -(6 - i)));
      print(dt);
      dates.add(dt);
    }

    return Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                    children: dates
                        .map((dt) => Expanded(
                                child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFF4F4F4)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(dt.day.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                    Text(days[dt.weekday - 1],
                                        style: TextStyle(fontSize: 20)),
                                  ],
                                ),
                              ),
                            )))
                        .toList()),
                SizedBox(
                  height: 300,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Image.asset('assets/images/ball.png'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    text: 'FOOTBALL',
                                    style: TextStyle(
                                        color: Color(0xFF2E396A),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                              ),
                              RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    text: 'market',
                                    style: TextStyle(
                                        color: Color(0xFF2E396A),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add_comment),
              onPressed: () {
                _showFancyDialog(context);
              },
            ),
          ],
        ));
  }
}

void _showFancyDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            height: 300,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [Color(0xFFD8E8A7), Colors.white],
                    tileMode: TileMode.clamp,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.all(10),
                  color: Color(0xFFD8E8A7),
                  textColor: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        );
      });
}
