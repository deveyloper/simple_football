import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:simple_football/Components/expanded_table_cell.dart';
import 'package:simple_football/Utility/ApiUtility.dart';
import 'package:simple_football/models/ApiResult.dart';
import 'package:simple_football/models/Competition.dart';
import 'package:simple_football/models/TableData.dart';
class LeagueTable extends StatefulWidget {
  LeagueTable({Key key, this.competition}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Competition competition;

  @override
  _LeagueTableState createState() => _LeagueTableState(this.competition);
}

class _LeagueTableState extends State<LeagueTable> {
  Competition competition;

  _LeagueTableState(this.competition);

  List<TableData> _tableData = [];
  bool isLoading = false;

  _tableDataList() {
    var url =
        'http://api.football-data.org/v2/competitions/${competition.id}/standings';
    ApiUtility().get(url).then((result) {
      if (result.isSuccessful) {
        var dynamicData = json.decode(result.data.body);
        ApiResult apiResult = ApiResult.fromJson(dynamicData);
        setState(() {
          isLoading = false;
          _tableData = apiResult.standings[0].table;
        });
      }
    });
  }

  @override
  void initState() {
    _tableDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text('${competition.area.name} -  ${competition.name}'),
          backgroundColor: Colors.blueGrey.shade800,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.indigo[800],
              Colors.indigo[700],
              Colors.indigo[600],
              Colors.indigo[400],
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Row(children: [
                    Expanded(
                        flex: 1,
                        child: Text("",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70))),
                    Expanded(
                        flex: 3,
                        child: Text("Team",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70))),
                    Expanded(
                        flex: 1,
                        child: Text("Won",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70))),
                    Expanded(
                        flex: 1,
                        child: Text("Draw",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70))),
                    Expanded(
                        flex: 1,
                        child: Text("Lost",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70))),
                    Expanded(
                        flex: 1,
                        child: Text("Point",
                            style: TextStyle(
                                fontSize: 15, color: Colors.white70))),
                  ]),
                ),
                Expanded(
                  flex: 15,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: isLoading && _tableData.length < 1
                          ? [CircularProgressIndicator()]
                          : _tableData
                              .map<Row>((tableData) => Row(children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: (tableData.position / 5)
                                                      .floor() ==
                                                  0
                                              ? Colors.green
                                              : Colors.redAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Text(
                                              tableData.position.toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.white70)),
                                        ),
                                      ),
                                    ),
                                    ExpandedTableCell(
                                        flex: 3,
                                        innerText: tableData.team.name),
                                    ExpandedTableCell(
                                        flex: 1,
                                        innerText: tableData.won.toString()),
                                    ExpandedTableCell(
                                        flex: 1,
                                        innerText: tableData.draw.toString()),
                                    ExpandedTableCell(
                                        flex: 1,
                                        innerText: tableData.lost.toString()),
                                    ExpandedTableCell(
                                        flex: 1,
                                        innerText: tableData.points.toString())
                                  ]))
                              .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
