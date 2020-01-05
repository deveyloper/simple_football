import 'Team.dart';

class TableData {
	int position;
	Team team;
	int playedGames;
	int won;
	int draw;
	int lost;
	int points;
	int goalsFor;
	int goalsAgainst;
	int goalDifference;

	TableData({this.position, this.team, this.playedGames, this.won, this.draw, this.lost, this.points, this.goalsFor, this.goalsAgainst, this.goalDifference});

	TableData.fromJson(Map<String, dynamic> json) {
		position = json['position'];
		team = json['team'] != null ? new Team.fromJson(json['team']) : null;
		playedGames = json['playedGames'];
		won = json['won'];
		draw = json['draw'];
		lost = json['lost'];
		points = json['points'];
		goalsFor = json['goalsFor'];
		goalsAgainst = json['goalsAgainst'];
		goalDifference = json['goalDifference'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['position'] = this.position;
		if (this.team != null) {
      data['team'] = this.team.toJson();
    }
		data['playedGames'] = this.playedGames;
		data['won'] = this.won;
		data['draw'] = this.draw;
		data['lost'] = this.lost;
		data['points'] = this.points;
		data['goalsFor'] = this.goalsFor;
		data['goalsAgainst'] = this.goalsAgainst;
		data['goalDifference'] = this.goalDifference;
		return data;
	}
}