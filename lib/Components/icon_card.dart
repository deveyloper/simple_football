import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final int rate;
  final IconData iconData;
  final String title;
  final String subTitle;
  final Color color;

  IconCard({this.title, this.subTitle, this.rate, this.iconData, this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 3 / 4,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          subTitle,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: generateIcon(rate, 5)),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print("onPressed");
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                'Read More',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/boy.png',
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  List<Icon> generateIcon(int rate, int max) {
    var rated = List.generate(rate, (index) => Icon(Icons.star));
    rated.addAll(List.generate(max - rate, (index) => Icon(Icons.star_border)));
    return rated;
  }
}
