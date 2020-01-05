import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TeamHeader implements SliverPersistentHeaderDelegate {
  TeamHeader({
    this.minExtent,
    this.maxExtent,
  });

  double maxExtent;
  double minExtent;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Row(children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.yellow),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.red),
            ),
          )
        ]),
        Image.network(
          'https://seeklogo.com/images/G/galatasaray-4-star-logo-E31C4CB9E4-seeklogo.com.png',
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
                pinned: true,
                delegate: TeamHeader(maxExtent: 200, minExtent: 100)),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0,
                mainAxisSpacing: 0.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.yellow, shape: BoxShape.circle),
                    child: Center(
                        child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 'item$index',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20)))));
              }, childCount: 100),
            ),
            SliverFixedExtentList(
              itemExtent: 50,
              delegate: SliverChildBuilderDelegate(
                (context, index) => Text('item$index'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
