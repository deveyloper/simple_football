import 'Competition.dart';
import 'Season.dart';
import 'Standings.dart';

class ApiResult {
  Competition competition;
  Season season;
  List<Standings> standings;

  ApiResult({this.competition, this.season, this.standings});

  ApiResult.fromJson(Map<String, dynamic> json) {
    competition = json['competition'] != null
        ? new Competition.fromJson(json['competition'])
        : null;
    season =
        json['season'] != null ? new Season.fromJson(json['season']) : null;
    if (json['standings'] != null) {
      standings = new List<Standings>();
      json['standings'].forEach((v) {
        standings.add(new Standings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.competition != null) {
      data['competition'] = this.competition.toJson();
    }
    if (this.season != null) {
      data['season'] = this.season.toJson();
    }
    if (this.standings != null) {
      data['standings'] = this.standings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
