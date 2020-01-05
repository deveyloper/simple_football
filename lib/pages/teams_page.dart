import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_football/Helpers/firestore_helper.dart';
import 'package:simple_football/pages/team_page.dart';

class TeamsPage extends StatefulWidget {
  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 120,
            pinned: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Image.asset('assets/images/ball.png'),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: 'Simple FOOTBALL',
                                  style: TextStyle(
                                      color: Color(0xFF2E396A),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder(
            stream: FirestoreHelper().getCollectionStream('teamsv2'),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => SizedBox(
                            height: 50,
                            child: FireStoreTeamWidget(
                              snapshotData: snapshot.data.documents[index].data,
                            ),
                          ),
                      childCount: snapshot.data.documents.length),
                );
              } else {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                      (context, index) => Text('Loading'),
                      childCount: 1),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class FireStoreTeamWidget extends StatelessWidget {
  const FireStoreTeamWidget({
    Key key,
    this.snapshotData,
  }) : super(key: key);
  final dynamic snapshotData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TeamPage(
                      teamName: snapshotData['Name'],
                      primaryColor: int.parse(snapshotData['PrimaryColor']),
                      secondaryColor: int.parse(snapshotData['SecondaryColor']),
                      players: snapshotData['players'],
                    )));
      },
      child: Container(
        decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 20,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25)),
                      color: Color(int.parse(snapshotData['PrimaryColor']))),
                ),
                Container(
                  width: 20,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25)),
                      color: Color(int.parse(snapshotData['SecondaryColor']))),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: snapshotData["Name"],
                    children: [TextSpan(text: ' United')],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  final Player player;
  PlayerWidget({this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.colorBurn,
          color: Colors.white30,
        ),
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Image(
                image: NetworkImage(player.playerImagePath),
                width: 100,
                height: 100,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                          text: player.name,
                          style: TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                    RichText(
                      text: TextSpan(
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                          text: player.number.toString() +
                              ' ' +
                              player.position +
                              ' ' +
                              player.age.toString() +
                              ' ' +
                              'yaş'),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                    text: player.marketValue.toStringAsFixed(2) + 'M \$',
                    style: TextStyle(color: Colors.orange, fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Player {
  final String name;
  final int number;
  final int age;
  final String position;
  final String playerImagePath;
  final double marketValue;

  Player(
      {this.name,
      this.age,
      this.number,
      this.position,
      this.playerImagePath,
      this.marketValue});
}
