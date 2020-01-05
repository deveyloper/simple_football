import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_football/Components/player_view.dart';
import 'package:http/http.dart' as httpOperations;

class TeamPage extends StatefulWidget {
  final String teamName;
  final int primaryColor;
  final int secondaryColor;
  final List<dynamic> players;

  TeamPage(
      {this.teamName, this.primaryColor, this.secondaryColor, this.players}) {
    this.players.sort((a, b) => int.parse(a['Position'].toString())
        .compareTo(int.parse(b['Position'].toString())));
  }

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  getPlayers() async {
    var headers = Map<String, String>();
    headers.putIfAbsent('x-rapidapi-key',
        () => '8fb5275f5dmsh169265ecb90051ap129bf0jsn0e4367461878');
    print('calling');
    httpOperations.Response resp = await httpOperations.get(
        'https://thesportsdb.p.rapidapi.com/1/searchplayers.php?t=besiktas',
        headers: headers);
    print(resp.body);
    print(json.decode(resp.body));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFE9F6FF)),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 120,
            flexibleSpace: Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:
                            BoxDecoration(color: Color(widget.primaryColor)),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: (Color(widget.secondaryColor))),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Text(
                    widget.teamName,
                    style: TextStyle(color: Colors.black45, fontSize: 40),
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => PlayerView(
                      name: widget.players[index]['Name'],
                      nationality: widget.players[index]['Nationality'],
                      position: widget.players[index]['Position'],
                      marketValue: widget.players[index]['MarketValue'],
                      imageUrl: null,
                    ),
                childCount: widget.players.length),
          )
        ]),
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
