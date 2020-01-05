class Season {
	int id;
	String startDate;
	String endDate;
	int currentMatchday;
	Null winner;

	Season({this.id, this.startDate, this.endDate, this.currentMatchday, this.winner});

	Season.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		startDate = json['startDate'];
		endDate = json['endDate'];
		currentMatchday = json['currentMatchday'];
		winner = json['winner'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['startDate'] = this.startDate;
		data['endDate'] = this.endDate;
		data['currentMatchday'] = this.currentMatchday;
		data['winner'] = this.winner;
		return data;
	}
}

